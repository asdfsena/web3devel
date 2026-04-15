# Web3 Development Environment

Docker-based development environments for blockchain development.

## Available Images

| Image | Description |
|-------|-------------|
| `web3devel:ethereum` | Ethereum development with Foundry |
| `web3devel:solana` | Solana development with Rust, Anchor, Solana CLI |

## Supported Architectures

- `amd64` (x86_64)
- `arm64` (ARM 64-bit)

## Quick Start

### Pull Images

```bash
# Ethereum
docker pull ghcr.io/asdfsena/web3devel:ethereum-amd64

# Solana
docker pull ghcr.io/asdfsena/web3devel:solana-amd64
```

### Run Interactive Shell

```bash
# Ethereum
docker run -it ghcr.io/asdfsena/web3devel:ethereum-amd64 /bin/bash

# Solana
docker run -it ghcr.io/asdfsena/web3devel:solana-amd64 /bin/bash
```

### Run Specific Command

```bash
docker run --rm ghcr.io/asdfsena/web3devel:ethereum-amd64 forge --version
```

## Docker Compose Example

```yaml
services:
  ethereum:
    image: ghcr.io/asdfsena/web3devel:ethereum-amd64
    volumes:
      - ./project:/workspace
    working_dir: /workspace
    stdin_open: true
    tty: true
```

## Architecture

This repository uses Docker multi-stage builds:

- `base` - Common tools (build-essential, curl, git, llvm, etc.)
- `ethereum` - Ethereum tooling (Foundry)
- `solana` - Solana tooling (Solana CLI, Anchor, Rust)

## CI/CD

Images are automatically built and pushed to GitHub Container Registry on every push to `main`.

Build matrix:
- 2 targets (ethereum, solana)
- 2 architectures (amd64, arm64)
- Total: 4 images built per push

## Security

Vulnerability scanning is enabled via GitHub Container Registry's built-in security features. View scan results in the repository's Security tab under "Container registry" vulnerabilities.
