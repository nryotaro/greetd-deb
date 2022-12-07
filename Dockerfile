FROM ubuntu:22.04
WORKDIR /root
RUN apt update && \
    apt install -y git curl build-essential libpam0g-dev meson ninja-build cmake pkg-config libgtk-3-dev libjson-c-dev libgtk-layer-shell-dev && \
    curl -o rust-install.sh --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs && \
    bash rust-install.sh -y && \
    rm ./rust-install.sh && \
    git clone https://git.sr.ht/~kennylevinsen/greetd && \
    cd greetd && \
    git checkout 0.8.0 && \
    ~/.cargo/bin/cargo build --release && \
    cd .. && \
    git clone https://git.sr.ht/~kennylevinsen/gtkgreet && \
    cd gtkgreet && \
    git checkout 0.7 && \
    meson build && \
    ninja -C build && \
    cd .. && \
    mkdir -p greetd-gtk/usr/local/bin && \
    cp gtkgreet/build/gtkgreet/gtkgreet greetd-gtk/usr/local/bin && \
    cp greetd/target/release/greetd greetd/target/release/agreety greetd-gtk/usr/local/bin && \
    mkdir -p greetd-gtk/etc/systemd/system && \
    cp greetd/greetd.service greetd-gtk/etc/systemd/system/greetd.service && \
    mkdir -p greetd-gtk/etc/greetd && \
    cp greetd/config.toml greetd-gtk/etc/greetd/config.toml
