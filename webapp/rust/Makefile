run:
	/home/isucon/.cargo/bin/cargo run --release
build:
	/home/isucon/.cargo/bin/cargo build --locked --release

rundev:
	# systemfd and cargo-watch is required for autoloading
	# % cargo systemfd cargo-watch
	# RUST_LOG=info cargo watch -x run
	# systemfdの利点が分かってない by dekokun
	RUST_LOG=info systemfd --no-pid --socket http::0.0.0.0:1323 -- cargo watch -x run
