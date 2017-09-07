# Anago Proposal

## SPLITTING RELEASES for GCB

Split anago run into sections so build portion can run through
GCB using just the kube-cross
- generally useful for desktop releases too.

Always run with same command-line with one additional switch
Maybe always display session values to confirm at each step

1. --bootstrap - Initial check to verify prereqs/auths
1.5 --find_build ?
2. --prepare_and_build - do the main build
3. --check-final-push-access
4. --generate release notes
5. --stage --stage everything on GCS and GCR for "link" switch later
   - GCS can do a in-the-cloud copy (including text version pointers)
   - GCR can just tag uploaded containers

When all is good

6. --push_prelim - push objects, update github, notify
7. --set_uploaded_to_version - label GCR containers, flip "link" on GCS



## STAGING RELEASES

### General

* Stage repo changes directly to the public server under another branch
  like:
  - Master builds: anago-staging-master
  - Branch builds: anago-staging-1.N and anago-staging-1.N-master to hold 
    master branch changes for branch releases.
  - managing the rebasing and pushing needs TLC
* Stage all artifacts as close to targets as possible.
  - Can we 'stage' containers on google_containers without a label?
    - Jeff's release::docker::release_from_tarfiles().;w

  - stage GCS artifacts at new gs://kubernetes-relesae-stage bucket -OR-
    at gs:/kubernetes-release/v1.N.N-stage, whichever is fastest to "flip"


### Modes
1. Master builds
* Keep last N builds staged and ready to go?

2. Branch builds
* --official
* Don't have to use find_green_build. Just build at HEAD every day
* Build daily at a time conducive to pick up max changes
* Activate "beta" staging builds as needed, but almost never


3. Branching
* Kind of a one-off and maybe hard to stage?
* Builds both master 1.N+1.alpha and branch 1.N.0-beta.0


Artifacts
1. `Master` branch objects (tags and files)
2. `release-*` branch objects (tags and files)
3. GCS contents
4. GCR contents
5. Release Notes
