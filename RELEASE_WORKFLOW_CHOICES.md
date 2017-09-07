# Kubernetes Release Process

## Desktop

### Let the test analysis tool find a build in-line

```
# Build a new alpha on master in interactive and mock mode
$ anago master
# -OR-
# Build a new alpha on master in non-interactive and mock mode
$ anago --yes master
```

### Point to a fixed hash

```
# Build a new alpha on master in mock mode
$ anago master --buildversion=v1.9.0-alpha.0.798+3f447dd089998c
```

## Google Container Builder

### Let the test analysis tool find a build in-line

Retry a recent build here:
https://pantheon.corp.google.com/gcr/builds?project=kubernetes-release-test

### Point to a fixed hash
```
# Check man page for usage
find_green_build -man
# Find a --buildversion in the test analysis output
find_green_build
# Build a new alpha on master in mock mode
$ anargo --buildversion=something
```
