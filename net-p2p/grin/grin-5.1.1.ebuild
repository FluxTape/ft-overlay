# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License-2

EAPI=8

CRATES="
	addr2line-0.12.1
	adler32-1.0.4
	ahash-0.6.3
	aho-corasick-0.7.10
	ansi_term-0.11.0
	arc-swap-0.4.7
	array-macro-1.0.5
	arrayref-0.3.6
	arrayvec-0.3.25
	arrayvec-0.4.12
	arrayvec-0.5.1
	atty-0.2.14
	autocfg-0.1.7
	autocfg-1.0.0
	backtrace-0.3.48
	base64-0.9.3
	base64-0.11.0
	base64-0.12.1
	bindgen-0.56.0
	bit-vec-0.6.2
	bitflags-0.9.1
	bitflags-1.2.1
	blake2-rfc-0.2.18
	blake2b_simd-0.5.10
	block-buffer-0.3.3
	built-0.4.2
	bumpalo-3.4.0
	byte-tools-0.2.0
	byteorder-1.3.4
	bytes-0.5.4
	cargo-lock-4.0.1
	cc-1.0.67
	cexpr-0.4.0
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.11
	clang-sys-1.1.1
	clap-2.33.1
	cloudabi-0.0.3
	constant_time_eq-0.1.5
	core-foundation-0.7.0
	core-foundation-sys-0.7.0
	crc32fast-1.2.0
	croaring-0.4.6
	croaring-sys-0.4.6
	crossbeam-channel-0.5.0
	crossbeam-utils-0.7.2
	crossbeam-utils-0.8.1
	crypto-mac-0.6.2
	ct-logs-0.6.0
	ctor-0.1.15
	ctrlc-3.1.4
	cursive-0.16.3
	cursive_core-0.2.2
	cursive_table_view-0.13.2
	darling-0.10.2
	darling_core-0.10.2
	darling_macro-0.10.2
	difference-2.0.0
	digest-0.7.6
	dirs-2.0.2
	dirs-sys-0.3.5
	dtoa-0.4.5
	easy-jsonrpc-mw-0.5.4
	easy-jsonrpc-proc-macro-mw-0.5.1
	enum-map-0.6.2
	enum-map-derive-0.4.3
	enum_primitive-0.1.1
	env_logger-0.7.1
	env_logger-0.8.3
	failure-0.1.8
	failure_derive-0.1.8
	fake-simd-0.1.2
	filetime-0.2.10
	flate2-1.0.14
	fnv-1.0.7
	fs2-0.4.3
	fuchsia-cprng-0.1.1
	fuchsia-zircon-0.3.3
	fuchsia-zircon-sys-0.3.3
	futures-0.1.29
	futures-0.3.5
	futures-channel-0.3.5
	futures-core-0.3.5
	futures-executor-0.3.5
	futures-io-0.3.5
	futures-macro-0.3.5
	futures-sink-0.3.5
	futures-task-0.3.5
	futures-util-0.3.5
	gcc-0.3.55
	generic-array-0.9.0
	getrandom-0.1.14
	getrandom-0.2.2
	gimli-0.21.0
	git2-0.13.6
	glob-0.3.0
	grin_secp256k1zkp-0.7.10
	h2-0.2.5
	heck-0.3.1
	hermit-abi-0.1.13
	hmac-0.6.3
	http-0.2.1
	http-body-0.3.1
	httparse-1.3.4
	httpdate-0.3.2
	humansize-1.1.0
	humantime-1.3.0
	humantime-2.1.0
	hyper-0.13.9
	hyper-rustls-0.20.0
	hyper-timeout-0.3.1
	ident_case-1.0.1
	idna-0.2.0
	indexmap-1.4.0
	iovec-0.1.4
	itoa-0.4.5
	jobserver-0.1.21
	js-sys-0.3.40
	jsonrpc-core-10.1.0
	kernel32-sys-0.2.2
	lazy_static-1.4.0
	lazycell-1.2.1
	libc-0.2.71
	libgit2-sys-0.12.7+1.0.0
	liblmdb-sys-0.2.2
	libloading-0.7.0
	libz-sys-1.0.25
	linked-hash-map-0.5.3
	lmdb-zero-0.4.4
	lock_api-0.3.4
	log-0.4.8
	log-mdc-0.1.0
	log4rs-0.12.0
	lru-cache-0.1.2
	maplit-1.0.2
	matches-0.1.8
	memchr-2.3.3
	memmap-0.7.0
	miniz_oxide-0.3.7
	mio-0.6.22
	mio-named-pipes-0.1.6
	mio-uds-0.6.8
	miow-0.2.1
	miow-0.3.5
	ncurses-5.99.0
	net2-0.2.34
	nix-0.17.0
	nodrop-0.1.14
	nom-5.1.2
	num-0.2.1
	num-0.3.1
	num-bigint-0.2.6
	num-complex-0.2.4
	num-complex-0.3.1
	num-integer-0.1.44
	num-iter-0.1.42
	num-rational-0.2.4
	num-rational-0.3.2
	num-traits-0.1.43
	num-traits-0.2.14
	num_cpus-1.13.0
	object-0.19.0
	odds-0.2.26
	once_cell-1.5.2
	openssl-probe-0.1.2
	ordered-float-1.0.2
	output_vt100-0.1.2
	owning_ref-0.4.1
	pancurses-0.16.1
	parking_lot-0.10.2
	parking_lot_core-0.7.2
	pbkdf2-0.2.3
	pdcurses-sys-0.7.1
	peeking_take_while-0.1.2
	percent-encoding-2.1.0
	pin-project-0.4.20
	pin-project-1.0.2
	pin-project-internal-0.4.20
	pin-project-internal-1.0.2
	pin-project-lite-0.1.7
	pin-project-lite-0.2.0
	pin-utils-0.1.0
	pkg-config-0.3.17
	ppv-lite86-0.2.8
	pretty_assertions-0.6.1
	proc-macro-hack-0.5.16
	proc-macro-nested-0.1.5
	proc-macro2-0.4.30
	proc-macro2-1.0.24
	quick-error-1.2.3
	quote-0.6.13
	quote-1.0.7
	rand-0.5.6
	rand-0.6.5
	rand-0.7.3
	rand_chacha-0.1.1
	rand_chacha-0.2.2
	rand_core-0.3.1
	rand_core-0.4.2
	rand_core-0.5.1
	rand_hc-0.1.0
	rand_hc-0.2.0
	rand_isaac-0.1.1
	rand_jitter-0.1.4
	rand_os-0.1.3
	rand_pcg-0.1.2
	rand_xorshift-0.1.1
	rdrand-0.4.0
	redox_syscall-0.1.56
	redox_users-0.3.4
	regex-1.3.9
	regex-syntax-0.6.18
	remove_dir_all-0.5.2
	ring-0.16.20
	ripemd160-0.7.0
	rust-argon2-0.7.0
	rustc-demangle-0.1.16
	rustc-hash-1.1.0
	rustc-serialize-0.3.24
	rustls-0.17.0
	rustls-native-certs-0.3.0
	ryu-1.0.5
	safemem-0.3.3
	same-file-1.0.6
	schannel-0.1.19
	scopeguard-1.1.0
	sct-0.6.0
	security-framework-0.4.4
	security-framework-sys-0.4.3
	semver-0.9.0
	semver-parser-0.7.0
	serde-1.0.123
	serde-value-0.6.0
	serde_derive-1.0.123
	serde_json-1.0.55
	serde_yaml-0.8.13
	sha2-0.7.1
	shlex-0.1.1
	signal-hook-0.3.4
	signal-hook-registry-1.3.0
	siphasher-0.3.3
	slab-0.4.2
	smallvec-1.4.0
	socket2-0.3.12
	spin-0.5.2
	stable_deref_trait-1.1.1
	strsim-0.8.0
	strsim-0.9.3
	supercow-0.1.0
	syn-0.15.44
	syn-1.0.60
	synstructure-0.10.2
	synstructure-0.12.4
	tempfile-3.1.0
	term-0.6.1
	term_size-0.3.2
	termcolor-1.1.0
	textwrap-0.11.0
	thiserror-1.0.24
	thiserror-impl-1.0.24
	thread-id-3.3.0
	thread_local-1.0.1
	time-0.1.43
	tokio-0.2.23
	tokio-io-timeout-0.4.0
	tokio-macros-0.2.6
	tokio-rustls-0.13.1
	tokio-util-0.2.0
	tokio-util-0.3.1
	toml-0.5.6
	tower-service-0.3.0
	tracing-0.1.22
	tracing-core-0.1.17
	traitobject-0.1.0
	try-lock-0.2.2
	typemap-0.3.3
	typenum-1.12.0
	unicode-bidi-0.3.4
	unicode-normalization-0.1.12
	unicode-segmentation-1.6.0
	unicode-width-0.1.7
	unicode-xid-0.1.0
	unicode-xid-0.2.0
	unsafe-any-0.4.2
	untrusted-0.7.1
	url-2.1.1
	vcpkg-0.2.10
	vec_map-0.8.2
	version_check-0.9.2
	void-1.0.2
	walkdir-2.3.1
	want-0.3.0
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.1+wasi-snapshot-preview1
	wasm-bindgen-0.2.63
	wasm-bindgen-backend-0.2.63
	wasm-bindgen-macro-0.2.63
	wasm-bindgen-macro-support-0.2.63
	wasm-bindgen-shared-0.2.63
	wasmer_enumset-1.0.1
	wasmer_enumset_derive-0.5.0
	web-sys-0.3.40
	webpki-0.21.3
	which-3.1.1
	winapi-0.2.8
	winapi-0.3.8
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	winreg-0.5.1
	ws2_32-sys-0.2.1
	xi-unicode-0.3.0
	yaml-rust-0.3.5
	yaml-rust-0.4.4
	zeroize-0.9.3
	zeroize-1.1.0
	zeroize_derive-0.9.3
	zeroize_derive-1.0.0
	zip-0.5.11
"

inherit cargo

DESCRIPTION="Simple, private and scalable cryptocurrency implementation based on the Mimblewimble chain format."
HOMEPAGE="https://github.com/mimblewimble/grin"

SRC_URI="https://github.com/mimblewimble/grin/archive/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 ISC MIT Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
    sys-libs/zlib
	sys-libs/ncurses:0
    dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND="
    dev-util/cmake
    sys-kernel/linux-headers
	>=virtual/rust-1.55.0
"


src_unpack() {
	cargo_src_unpack
}

src_compile() {
	cargo_src_compile
}

src_install() {
    cargo_src_install 
}

src_test() {
	cargo_src_test
}

