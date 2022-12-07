FROM ubuntu:22.04
WORKDIR /root
RUN apt update && \
    apt install -y git curl build-essential libpam0g-dev && \
    curl -o rust-install.sh --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs && \
    bash rust-install.sh -y && \
    rm ./rust-install.sh && \
    git clone https://git.sr.ht/~kennylevinsen/greetd && \
    cd greetd && \
    git checkout 0.8.0 && \
    ~/.cargo/bin/cargo build --release
