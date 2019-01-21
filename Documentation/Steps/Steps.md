# Steps

## script
Runs a command line script

**Parameters:**

_content_: `String` (required): the script content
<br/><br/>

## git_add
Adds the files to the git's staging area

**Parameters:**

_paths_: `[String]` (optional): The paths you want to add to the staging area - **default**: `[.]`
<br/><br/>

## branch
Creates a new git branch and switches to it. It fails if the branch already exists

**Parameters:**

_branchName_:`String`(required): The name of the new branch
<br/><br/>

## commit
Commits on git

**Parameters:**

_message_: `String` (optional): The commit message - **default**: `"Version $VERSION"`

_no_verify_: `Bool` (optional): bypasses the pre-commit and commit-msg hooks **default**: `false`
<br/><br/>

## tag
Tags the current version
<br/><br/>

## push
Pushes the current changes

**Parameters:**

_remote_: `String` (optional): The name of the remote you want to push to - **default**: `"origin"`

_branch_: `String` (optional): The name of the branch you want to push - **default**: `"master"`
<br/><br/>

## hide_dev_dependencies
Comment the dev dependencies on your `Package.swift` to avoid them to be shipped with your release
Dev dependencies are all the lines in the `Package.swift` file with `// dev`

**Parameters:**

_package_path_: `String` (optional): The relative path to your `Package.swift` file - **default**: `"Package.swift"`
<br/><br/>

## unhide_dev_dependencies
Uncomment the dev dependencies on your `Package.swift` after you released.

**Parameters:**

_package_path_: `String` (optional): The relative path to your `Package.swift` file - **default**: `"Package.swift"`
<br/><br/>

## swift_script
Compile and run a script file written in swift

The version is passed to the script as first parameter

**Parameters:**

_script_path_: `String` (required): The relative path to the swift script

_arguments_: `[String]` (optional): Additional arguments for the swift script
<br/><br/>
