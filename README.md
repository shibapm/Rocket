# Rocket 🚀

Swift CLI release tool for Git repos and Swift Packages

## Install Rocket
You can install Rocket with SPM

1. Add or amend a Package.swift
2. Add this dependency `.package(url: "https://github.com/shibapm/Rocket", from: "0.1.0")`
3. Then you can run `swift run rocket 1.0.0` where `1.0.0` is the version that you want to release

## Set up the release steps

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
  - commit:
      message: "Releasing version $VERSION"
  - tag
  - push
```

#### With PackageConfig
With PackageConfig (https://github.com/orta/PackageConfig) you can put the configuration at the end of your `Package.swift`

```swift
#if canImport(PackageConfig)
    import PackageConfig
    
    let config = PackageConfiguration([
        "rocket": ["steps":
            [
                ["script": ["content": "ruby Scripts/update_changelog.rb"]]
                ["git_add": ["paths": ["CHANGELOG.md"]]],
                ["commit": ["message": "Releasing version $VERSION"]],
                "tag",
                "push"
            ]
        ]
    ]).write()
```

## Default steps
If there is no step definition Rocket will run the default steps:

- **hide_dev_dependencies**
- **git_add**
- **commit**
- **tag**
- **unhide_dev_dependencies**
- **git_add**
- **commit** (message: "Unhide dev dependencies")
- **push** (remote=origin branch=master)

## Before/After steps
If you use the `before` and/or `after` keys

e.g.

```yaml
---
before: 
  - script: 
      content: echo "Testing Release for $VERSION"
after:
  - script: 
      content: echo "released $VERSION"
```

Rocket will execute the default steps between the before and after steps

- `echo "Testing Release for $VERSION"`

- **hide_dev_dependencies**
- **git_add**
- **commit**
- **tag**
- **unhide_dev_dependencies**
- **git_add**
- **commit** (message: "Unhide dev dependencies")
- **push** (remote=origin branch=master)

- `echo "released $VERSION"`

## Hide dev dependencies
When you release a package you want that who adds it as dependency downloads just the dependencies that are really needed to your package.

This is why Rocket introduces the concept of dev dependency, if you have in your package some scripts e.g. swiftformat you can add them as dev dependencies (by adding `// dev` after them) and they will be commented by the `hide_dev_dependencies` step and uncommented from the `unhide_dev_dependencies`.

That is also valid for the dependencies that are used just from test targets, but in that case you will have to add the test target as dev dependency too.<br/><br/>

Some examples are:
- https://github.com/danger/swift/blob/master/Package.swift
- https://github.com/shibapm/Rocket/blob/master/Package.swift
- https://github.com/f-meloni/Logger/blob/master/Package.swift

## Steps

You can find the full steps list [here](Documentation/Steps/Steps.md)

## Variable $VERSION

You can use the variable `$VERSION` inside the steps to refer to the version you are releasing

## Next steps

- [X] Add a step to execute script files written in swift
- [X] Add a step to comment the dev dependencies on the `Package.swift`
- [ ] Add a step to create Github releases
