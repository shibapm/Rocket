/// Creates a series of default steps which work well with existing tools and frameworks

//
// 1. Exec before steps
// 2. Detect any "// dev" comments, if so, hide
// 3. If there are changes to git during this time period, commit them .
//    Check for .git/hooks to see if there are some, if so, use --no-verify
// 4. Create a tag with the version
// 5. Unhide any "// devs" if they were there
// 6. Run any exec after steps
//

