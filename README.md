===================================
Customer Web Portal Build Script
===================================

This Bash script automates the build process for the Customer Web Portal project. It performs tasks such as cloning the project repository, compiling the application, generating release notes, and packaging the build.

Usage
-----
1. Clone this repository:
```https://github.com/Sreyeesh/Building-a-Web-Application-Deployment-Script```


2. Make the script executable:
```chmod +x build-script.sh```


3. Run the script:

```./build-script.sh```


Folder Structure
----------------
After running the script, the following folders and files will be created:
- `build`: Build output directory.
- `customer-web-portal`: Git repository containing the Customer Web Portal project.
- `release-notes.txt`: Release notes file.
- `build-info.txt`: Build information file.

Features
--------
- Clones the Customer Web Portal project.
- Compiles the C++ web application.
- Copies CSS and JavaScript files to the build directory.
- Tests the application for expected output.
- Generates a new Git tag for each release.
- Retrieves and appends changes since the last Git tag to release notes.
- Packages the build into a tar.gz archive for deployment.

Prerequisites
-------------
- Git: Version control system (https://git-scm.com/).
- g++: C++ compiler for compiling the web application.


