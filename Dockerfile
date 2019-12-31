FROM qmxme/rust-builder:0.1.0 as rust_builderz

FROM rust_builderz as tools_starship
ENV CARGO_INSTALL_ROOT /opt/rust-tools
RUN cargo install starship

FROM scratch
COPY --from=tools_starship /opt/rust-tools/bin/* /usr/local/bin/
