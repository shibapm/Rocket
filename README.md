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
