# CSE 130 Docker dev environment

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed and running.


## Start here

```bash
chmod +x build.sh run.sh restart.sh
./build.sh
./run.sh
```

- First time: run the 3 commands above.
- Next time: run `./restart.sh`.
- To leave: run `exit`.

Lightweight Docker setup for **UCSC CSE 130** (or similar C projects): Ubuntu 24.04 with common systems tooling like `clang`, `make`, `valgrind`, `git`, `vim`, `curl`, `clang-format`, and `clang-tools`.

Your code stays on your host machine through a bind mount to `/workspace`, so files persist after the container exits.

## Scripts

- `build.sh`: builds image `cse130-dev`
- `run.sh`: starts a new interactive container
- `restart.sh`: starts and attaches to an existing container

Make them executable once:

```bash
chmod +x build.sh run.sh restart.sh
```

If you prefer, run them with `bash` instead of `chmod` (for example, `bash build.sh`).

## SSH
- The container mounts your local ssh keys so you can just use the ssh keys already on your local computer.

## Build image

Run this after cloning, after pulling `Dockerfile` changes, or whenever you need a rebuild:

```bash
./build.sh
```

## Create and enter a container

Default behavior:

```bash
./run.sh
```

- Creates container `cse130` if it does not already exist.
- Attaches an interactive shell.
- `exit` stops the container, but files in mounted host paths remain.

### When `cse130` already exists

`run.sh` now protects you from accidental duplicates:

```bash
./run.sh
```

returns an error if `cse130` already exists.

To intentionally create an additional container:

```bash
./run.sh --force
```

or:

```bash
./run.sh -f
```

This auto-selects the next free name (`cse130-2`, `cse130-3`, ...).

## Restart an existing container

Restart and attach to `cse130`:

```bash
./restart.sh
```

Restart and attach to a specific container:

```bash
./restart.sh --name cse130-2
```

Equivalent Docker command:

```bash
docker start -ai <container-name>
```

## Quick reference

| Step | Command |
|---|---|
| Build image | `./build.sh` |
| New container (default name) | `./run.sh` |
| New container (auto-suffixed name) | `./run.sh -f` |
| Restart default container | `./restart.sh` |
| Restart named container | `./restart.sh --name cse130-2` |

## Important Docker Commands
- If you wish to clear all the containers do `docker container prune`
- If you wish to list active containers do `docker ps -a`
- There are many other commands that do useful things. You can find them online quite easily.

## Image details

- Image name: `cse130-dev`
- Working directory: `/workspace`
- Default command: `/bin/bash`

## Troubleshooting

- Ensure Docker is running.
- Ensure host paths in `run.sh` actually exist.
- If startup fails, verify image exists with `docker images | rg cse130-dev`.
