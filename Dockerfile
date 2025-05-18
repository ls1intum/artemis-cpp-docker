FROM rust:1.85 AS clang-tidy-sarif-builder

RUN cargo install --root /usr/local clang-tidy-sarif@0.8.0

FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
  catch2 \
  clang \
  clang-format \
  clang-tidy \
  cmake \
  g++ \
  gcc \
  libclang-rt-dev \
  make \
  python3 \
  python3-pip \
  python3-venv \
  && apt-get dist-clean

RUN useradd -m artemis_user

# clang-tidy output to SARIF converter with ruleId patch
COPY --from=clang-tidy-sarif-builder /usr/local/bin/clang-tidy-sarif /usr/local/bin/clang-tidy-sarif

# drop privileges to artemis_user after setup
USER root
