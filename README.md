# Rocket 🚀

Swift CLI release tool for Git repos and swift 

## Installation
You can install Rocket with SPM

1. Add or amend a Package.swift
2. Add this dependency `.package(url: "https://github.com/f-meloni/Rocket", from: "0.1.0")`
3. Then you can just run `swift run rocket 1.0.0` where `1.0.0` is the version that you want to release

## Setup the release steps

#### With YAML
Create a file called `.rocket.yml` with your steps inside

```yaml
---
steps: 
  - script: 
      content: ruby Scripts/update_changelog.rb
  - git_add:
        paths:
            - CHANGELOG.md
  - commit
  - tag
  - push
```

#### With PackageConfig
With PackageConfig (https://github.com/orta/PackageConfig) you can just put the configuration at the end of your `Package.swift`

```swift
#if canImport(PackageConfig)
    import PackageConfig
    
    let config = PackageConfig([
        "rocket": ["steps":
            [
                ["script": ["content": "ruby Scripts/update_changelog.rb"]]
                ["git_add": ["paths": ["CHANGELOG.md"]]],
                "commit",
                "tag",
                "push"
            ]
        ]
    ])
```

## Supported Steps

### script
Runs a command line script

**Parameters:**

**content**: `String` (required): the script content

### git_add
Adds the files to the git's staging area

**Parameters:**

**paths**: `[String]` (optional): The paths you want to add to the staging area - **default**: `[.]`

### commit
Commits on git

**Parameters:**

**message**: `String` (optional): The commit message - **default**: `"Version $VERSION"`

### tag
Tags the current version

### push
Pushes the current changes

**Parameters:**

**remote**: `String` (optional): The name of the remote you want to push to - **default**: `"origin"`

**branch**: `String` (optional): The name of the branch you want to push - **default**: `"master"`

## $VERSION

You can use the variable `$VERSION` to refer to the version you are releasing

## Next steps

- [ ] Show the scripts output on the stdout
- [ ] Add a step to execute script files written in swift
- [ ] Add a step to execute ruby code
- [ ] Add a step to comment the dev dependencies on the `Package.swift`
- [ ] Add a step to create Github releases
