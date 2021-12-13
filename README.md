# Shapeshifter

## Releasing

### To release to my "private" OPAM repository

1. Add a new entry to the top of the `CHANGES.md` file.

2. Run the following commands.

    ```
    dune-release tag
    dune-release --opam-repo=ZachBray/opam-repository
    ```
