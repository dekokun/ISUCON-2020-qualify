run:
	/home/isucon/.cargo/bin/cargo run --release
build:
	/home/isucon/.cargo/bin/cargo build --locked --release

rundev:
	# systemfd and cargo-watch is required for autoloading
	# % cargo systemfd cargo-watch
	RUST_LOG=info cargo watch -x run
