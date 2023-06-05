# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=rustc
PKG_VERSION:=1.70.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.xz
PKG_SOURCE_URL:=https://static.rust-lang.org/dist
PKG_HASH:=bb8e9c564566b2d3228d95de9063a9254182446a161353f1d843bfbaf5c34639

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

PKG_BUILD_DEPENDS:=rustc-dev
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/cmake.mk
include ../rust.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xJf $(DL_DIR)/$(PKG_SOURCE)

define Package/rustc
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Rust
  URL:=https://www.rust-lang.org
  DEPENDS:=+libatomic +libopenssl +libstdcpp +zlib
endef

define Package/rustc/description
  The Rust Programming Language.
endef

### host
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/rustc-dev-$(PKG_VERSION)
RUST_HOST_TRIPLE:=$(HOST_ARCH)-unknown-linux-gnu

define Build/Configure
	( \
		echo 'changelog-seen = 2'; \
		echo '[llvm]'; \
		echo 'targets = "AArch64;ARM;Mips;X86"'; \
		echo 'experimental-targets = ""'; \
		echo 'download-ci-llvm = false'; \
		echo 'allow-old-toolchain = true'; \
		echo 'link-shared = false'; \
		echo 'cflags = "-pthread"'; \
		echo 'cxxflags = "-pthread"'; \
		echo 'ldflags = "-lz -latomic -lpthread -ldl"'; \
		echo 'build-config = \
		{ \
			LLVM_ENABLE_BINDINGS="OFF", \
			LLVM_ENABLE_OCAMLDOC="OFF", \
			LLVM_INCLUDE_BENCHMARKS="OFF", \
			LLVM_INCLUDE_DOCS="OFF", \
			LLVM_INCLUDE_EXAMPLES="OFF", \
			LLVM_INCLUDE_RUNTIMES="OFF", \
			LLVM_INCLUDE_TESTS="OFF", \
			LLVM_INCLUDE_TOOLS="OFF", \
			LLVM_INCLUDE_UTILS="OFF" \
		}'; \
		echo '[build]'; \
		echo 'host = ["$(RUST_TARGET_TRIPLE)"]'; \
		echo 'target = ["$(RUST_TARGET_TRIPLE)"]'; \
		echo 'cargo = "$(STAGING_DIR)/host/bin/cargo"'; \
		echo 'rustc = "$(STAGING_DIR)/host/bin/rustc"'; \
		echo 'docs = false'; \
		echo 'compiler-docs = false'; \
		echo 'submodules = false'; \
		echo 'python = "$(STAGING_DIR_HOSTPKG)/bin/python3"'; \
		echo 'vendor = true'; \
		echo 'full-bootstrap = false'; \
		echo 'extended = true'; \
		echo 'tools = ["cargo", "clippy", "rustdoc", "rustfmt",]'; \
		echo 'cargo-native-static = true'; \
		echo 'verbose = 0'; \
		echo 'local-rebuild = false'; \
		echo '[install]'; \
		echo 'prefix = "/opt"'; \
		echo 'sysconfdir = "/opt/etc"'; \
		echo 'bindir = "/opt/bin"'; \
		echo 'libdir = "/opt/lib"'; \
		echo 'datadir = "/opt/share"'; \
		echo '[rust]'; \
		echo 'incremental = true'; \
		echo 'channel = "nightly"'; \
		echo 'rpath = false'; \
		echo 'codegen-tests = false'; \
		echo 'dist-src = false'; \
		echo '[target.$(RUST_TARGET_TRIPLE)]'; \
		echo 'ar = "$(TARGET_CROSS)ar"'; \
		echo 'cc = "$(TARGET_CROSS)gcc"'; \
		echo 'cxx = "$(TARGET_CROSS)g++"'; \
		echo 'linker = "$(TARGET_CROSS)gcc"'; \
		echo 'ranlib = "$(TARGET_CROSS)ranlib"'; \
		echo '[dist]'; \
		echo 'src-tarball = false'; \
		echo 'compression-formats = ["gz"]'; \
	) > $(PKG_BUILD_DIR)/config.toml
endef

Build/Compile:=:

define FixPreInstall
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/build/$(RUST_HOST_TRIPLE)
	$(LN) $(HOST_BUILD_DIR)/build/$(RUST_HOST_TRIPLE)/llvm \
		$(PKG_BUILD_DIR)/build/$(RUST_HOST_TRIPLE)
	$(LN) $(HOST_BUILD_DIR)/build/$(RUST_HOST_TRIPLE)/stage0-bootstrap-tools \
		$(PKG_BUILD_DIR)/build/$(RUST_HOST_TRIPLE)
endef

Hooks/Compile/Post += FixPreInstall

define Build/Install
	( cd $(PKG_BUILD_DIR); \
		CXXFLAGS='-I$(PKG_BUILD_DIR)/build/$(RUST_TARGET_TRIPLE)/llvm/include' \
		HOST_PKG_CONFIG_PATH="$(STAGING_DIR_HOST)/lib/pkgconfig:$(STAGING_DIR_HOSTPKG)/lib/pkgconfig" \
		RUSTFLAGS='-L native=$(PKG_BUILD_DIR)/build/$(RUST_TARGET_TRIPLE)/llvm/lib' \
		PKG_CONFIG_ALLOW_CROSS=1 \
		DESTDIR=$(PKG_INSTALL_DIR) \
		$(STAGING_DIR_HOSTPKG)/bin/python3 x.py install; \
	)
endef

define Package/rustc/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/cargo{,-clippy,-fmt} $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clippy-driver $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rust{c,doc,fmt} $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/lib/rustlib/$(RUST_TARGET_TRIPLE)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib*.so $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/rustlib/$(RUST_TARGET_TRIPLE)/lib \
		$(1)/opt/lib/rustlib/$(RUST_TARGET_TRIPLE)
	$(INSTALL_DIR) $(1)/opt/libexec
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/libexec/cargo-credential-1password \
		$(1)/opt/libexec
endef

define Package/rustc/postinst
#!/bin/sh

/opt/sbin/ldconfig > /dev/null 2>&1

if ! grep -q "TMPDIR" /opt/etc/profile; then
  echo -e "\n# set temp dir for cargo/rustc" >> /opt/etc/profile
  echo 'export TMPDIR="/opt/tmp"' >> /opt/etc/profile
fi
endef

$(eval $(call BuildPackage,rustc))
