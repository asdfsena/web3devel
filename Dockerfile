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

RUN /bin/bash -o pipefail -c "curl -L https://foundry.paradigm.xyz | bash"

CMD [ "foundryup" ]

# Solana Target
FROM base as solana
WORKDIR /workspace

RUN /bin/bash -o pipefail -c "curl --proto '=https' --tlsv1.2 -sSfL https://solana-install.solana.workers.dev | bash"

CMD [ "/bin/bash", "-c", "'rustc --version && solana --version && anchor --version && surfpool --version && node --version && yarn --version'" ]
