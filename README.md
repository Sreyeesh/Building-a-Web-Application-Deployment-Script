# Building-a-Web-Application-Deployment-Script
 Building a Web Application Deployment Script
Certainly! If you want to remove the "Contributing" and "License" sections from your README, you can simply omit those sections from the README template. Here's the modified README template without those sections:

```markdown
# Customer Web Portal Build Script

This Bash script automates the process of building and packaging the Customer Web Portal project. It performs various tasks, including cloning the project, compiling the application, running tests, generating release notes, and creating a distribution package.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Installation](#installation)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Running the Script](#running-the-script)
- [Testing](#testing)
- [Generating a New Git Tag](#generating-a-new-git-tag)
- [Updating Release Notes](#updating-release-notes)
- [Creating a Distribution Package](#creating-a-distribution-package)

## Prerequisites

Before using this script, make sure you have the following prerequisites installed on your system:

- `git`: To clone the project and work with Git repositories.
- `g++`: To compile the C++ web application.
- `wget`: To download the release document template.
- A Unix-like operating system (Linux or macOS).

## Getting Started

### Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Sreyeesh/Building-a-Web-Application-Deployment-Script
   ```

2. Navigate to the project directory:

   ```bash
   cd your-repo
   ```

3. Make the script executable:

   ```bash
   chmod +x build-script.sh
   ```

Now, you're ready to use the build script.

## Usage

### Folder Structure

- `build`: The build output directory where the compiled application and release package will be created.
- `customer-web-portal`: The Git repository for the Customer Web Portal project.
- `release-notes.txt`: The release notes file that will be generated and updated by the script.
- `build-info.txt`: The build information file that contains details about the build process.

### Running the Script

To run the build script, execute the following command:

```bash
./build-script.sh
```

The script will perform the following tasks:

- Remove existing build and project directories.
- Clone the Customer Web Portal Git repository.
- Create the necessary directory structure.
- Compile the C++ web application.
- Copy CSS and JS files to the build directory.
- Test the application.
- Generate a new Git tag.
- Update release notes with changes since the last Git tag.
- Create a distribution package.

## Testing

The script includes a basic test to ensure that the application runs successfully and contains the expected output. If the test fails, the script will abort the build.

## Generating a New Git Tag

The script automatically generates a new Git tag by incrementing the previous one. It follows the format `vVERSION_NUMBER`, where `VERSION_NUMBER` is an integer.

## Updating Release Notes

The script retrieves a list of changes made since the last Git tag and appends them to the `release-notes.txt` file. This file can be further customized as needed.

## Creating a Distribution Package

The script packages the build directory into a `tar.gz` archive and places it in the `releases` folder. The archive is named following the convention: `release-#GIT_TAG#.tar.gz`. It also performs a size check to ensure that the archive is greater than 50KB.
