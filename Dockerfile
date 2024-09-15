FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
  catch2 \
  clang \
  clang-format \
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

# drop privileges to artemis_user after setup
USER root
