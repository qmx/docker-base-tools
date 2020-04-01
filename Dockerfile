FROM qmxme/rust-builder:0.1.0 as rust_builderz

ENV CARGO_INSTALL_ROOT /opt/rust-tools
ARG CRATE
RUN cargo install $CRATE
