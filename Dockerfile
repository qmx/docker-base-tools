FROM qmxme/rust-builder:0.4.0 as rust_builderz

ADD ./Makefile .
ENV CARGO_INSTALL_ROOT /opt/rust-tools
ARG CRATE
RUN make $CRATE

FROM busybox
COPY --from=rust_builderz /opt/rust-tools/bin/* /opt/rust-tools/bin/
