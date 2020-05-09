diesel_cli:
	cargo install --no-default-features --features "postgres sqlite" diesel_cli

sccache:
	cargo install --features "redis s3"

%:
	cargo install $@
