# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License-2

EAPI=8

inherit cargo git-r3

DESCRIPTION="Wallet for the Grin cryptocurrency"
HOMEPAGE="https://grin.mw/"

EGIT_REPO_URI="https://github.com/mimblewimble/grin-wallet"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 ISC MIT MPL-2.0 Unlicense WTFPL-2 ZLIB"
SLOT="0"

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
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile() {
	cargo_src_compile
}

src_configure() {
	cargo_src_configure
}

src_install() {
    cargo_src_install 
}

src_test() {
	cargo_src_test
}
