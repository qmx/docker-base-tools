FROM qmxme/rust-builder:0.3.0 as rust_builderz

ENV CARGO_INSTALL_ROOT /opt/rust-tools
ARG CRATE
RUN cargo install $CRATE

FROM debian:buster-slim
COPY --from=rust_builderz /opt/rust-tools/bin/* /opt/rust-tools/bin/
