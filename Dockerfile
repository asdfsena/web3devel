# development environment

# Base Image
FROM ubuntu:latest as base

RUN apt-get update -y && \
  apt-get install -y \
  build-essential \
  curl \
  git \
  pkg-config \
  libudev-dev \
  llvm \
  libclang-dev \
  protobuf-compiler \
  libssl-dev && \
  rm -rf /var/lib/apt/lists/*


# Ethereum Target
FROM base as ethereum
WORKDIR /workspace

LABEL org.opencontainers.image.title="Web3 Development Environment - Ethereum"
LABEL org.opencontainers.image.description="Ethereum development environment with Foundry"
LABEL org.opencontainers.image.vendor="Aryasena Putra"
LABEL org.opencontainers.image.authors="Aryasena Putra <sena@lichtlabs.org>"
LABEL org.opencontainers.image.source="https://github.com/asdfsena/web3devel"
LABEL org.opencontainers.image.licenses="MIT"

RUN /bin/bash -o pipefail -c "curl -L https://foundry.paradigm.xyz | bash"

CMD [ "foundryup" ]

# Solana Target
FROM base as solana
WORKDIR /workspace

LABEL org.opencontainers.image.title="Web3 Development Environment - Solana"
LABEL org.opencontainers.image.description="Solana development environment with Rust, Anchor, Solana CLI"
LABEL org.opencontainers.image.vendor="Aryasena Putra"
LABEL org.opencontainers.image.authors="Aryasena Putra <sena@lichtlabs.org>"
LABEL org.opencontainers.image.source="https://github.com/asdfsena/web3devel"
LABEL org.opencontainers.image.licenses="MIT"

RUN /bin/bash -o pipefail -c "curl --proto '=https' --tlsv1.2 -sSfL https://solana-install.solana.workers.dev | bash"

CMD [ "/bin/bash", "-c", "'rustc --version && solana --version && anchor --version && surfpool --version && node --version && yarn --version'" ]
