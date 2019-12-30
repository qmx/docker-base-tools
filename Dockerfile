FROM qmxme/rust-builder:0.1.0 as rust_builderz

FROM rust_builderz as tools_cpubars
ENV CARGO_INSTALL_ROOT /opt/rust-tools
RUN cargo install cpubars

FROM rust_builderz as tools_wk
ENV CARGO_INSTALL_ROOT /opt/rust-tools
RUN cargo install wk

FROM rust_builderz as tools_starship
ENV CARGO_INSTALL_ROOT /opt/rust-tools
RUN cargo install starship

FROM scratch
COPY --from=tools_cpubars /opt/rust-tools/bin/* /usr/local/bin/
COPY --from=tools_wk /opt/rust-tools/bin/* /usr/local/bin/
COPY --from=tools_starship /opt/rust-tools/bin/* /usr/local/bin/
