#!/bin/bash
# Enable debug mode
set -x

# Display message and remove directories
echo "Removing existing build and customer-web-portal directories..."
rm -rf ~/code/build ~/code/customer-web-portal

# Clone the Git repository
echo "Cloning the customer-web-portal repository from GitHub..."
git clone https://github.com/vdespa/customer-web-portal ~/code/customer-web-portal

# Display message and create directory structure
echo "Creating directory structure..."
mkdir -p ~/code/build/public/{css,js}

# Create empty index.html files in public directories
touch ~/code/build/public/index.html
touch ~/code/build/public/css/index.html
touch ~/code/build/public/js/index.html

# Create build information file
echo "Creating build information file..."
echo "Created: $(date)" > ~/code/build/build-info.txt
echo "Created by: $USER" >> ~/code/build/build-info.txt

# Compile the C++ web application
echo 'Compile the application'
g++ ~/code/customer-web-portal/web-app.cpp -o ~/code/build/public/web-app.cgi

# Copy CSS and JS files to the build directory
cp -r ~/code/customer-web-portal/css/. ~/code/build/public/css
cp -r ~/code/customer-web-portal/js/. ~/code/build/public/js

# Test the application and check for the "Customer Web Portal" string
echo "Test the application"
if ~/code/build/public/web-app.cgi | grep -q "Customer Web Portal"; then
    echo "Test successful."
else
    echo "Aborting build. Test failed."
    exit 1
fi

# Generate a new Git tag by incrementing the previous one
echo "Generate a new Git tag"
cd ~/code/customer-web-portal
latest_git_tag="$(git describe --tags --abbrev=0)"
echo "Latest Git tag: $latest_git_tag"
latest_version="${latest_git_tag:1}"
echo "Latest version: $latest_version"
next_version="$((latest_version + 1))"
echo "Next version: $next_version"
git tag "v$next_version"

# Get all changes since the last Git tag and append them to release-notes.txt
echo "Getting changes since the last Git tag and updating release-notes.txt..."
git log "$latest_git_tag"..HEAD --oneline >> ~/code/build/release-notes.txt

# Create a tar.gz archive of the build directory
echo "Creating tar.gz archive of the build directory..."
tar -czvf ~/code/releases/release-"$latest_git_tag".tar.gz -C ~/code/build .

# Check the size of the archive
archive_size=$(stat -c%s ~/code/releases/release-"$latest_git_tag".tar.gz)

# Perform the size test
if ((archive_size < 50000)); then
    echo "Error: Archive size is less than 50kB. Deployment halted."
    exit 1
fi

echo "Archive created successfully: release-$latest_git_tag.tar.gz"

# Navigate back to the code directory
cd ~/code

