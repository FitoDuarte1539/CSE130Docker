# CSE 130 Docker dev environment

A small Docker setup for **UCSC CSE 130** (or anyone who wants the same toolchain): Ubuntu 24.04 with **clang**, **make**, **valgrind**, **git**, **vim**, **curl**, **clang-format**, **clang-tidy**, and related build tools. Your work lives in a **host folder** mounted at `/workspace` inside the container so it persists after the container stops.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed and running (Docker Desktop on macOS is fine).

## One-time setup

1. Clone this repo and `cd` into it.

2. **Edit `run`** before the first run:
   - Set the **left side** of the workspace mount (`-v ...:/workspace`) to a folder on *your* machine where you want assignments to live (create that folder if needed).
   - The `-v ~/.ssh:/root/.ssh:ro` line lets you use **Git over SSH** from inside the container. It lets the container see your local .ssh directory.
   Remove it if you do not use SSH keys or prefer HTTPS only.

3. **Make the scripts executable** (once):

   ```bash
   chmod +x build run
   ```

4. **Build the image** (do this after pulling changes or editing the `Dockerfile`):

   ```bash
   ./build
   ```

## Run the container

From the repo directory:

```bash
./run
```

If you prefer not to use `chmod`, you can run `bash build` and `bash run` instead.

That starts an interactive shell in a container named **`cse130`**. Type `exit` when you are done; the container stops but your files remain on the host thanks to the volume mount.

## Restart after exiting

When the container already exists but is stopped, start it again and attach to the shell:

```bash
docker start -ai cse130
```

If this repo adds a **`restart`** helper script, use `./restart` after `chmod +x restart`—it should run the same `docker start -ai cse130` (or equivalent) for you.

### If `docker run` says the name is already in use

You already have a container named `cse130`. Either **restart** it with the command above, or remove it and run `./run` again:

```bash
docker rm -f cse130
./run
```

## Quick reference

| Step    | Command        |
|---------|----------------|
| Build   | `./build`      |
| Run     | `./run`        |
| Restart | `docker start -ai cse130` (or `./restart` when you add that script) |

## Image details

- **Image name:** `cse130-dev` (set in `build`)
- **Default command:** `/bin/bash` in `/workspace`

If something fails, check that Docker is running and that paths in `run` exist on your machine.
