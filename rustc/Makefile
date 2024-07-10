# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rustc
PKG_VERSION:=1.79.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=https://static.rust-lang.org/dist
PKG_HASH:=172ecf3c7d1f9d9fb16cd2a628869782670416ded0129e524a86751f961448c0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

PKG_BUILD_DEPENDS:=rustc-dev
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/cmake.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/rustc
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Rust
  URL:=https://www.rust-lang.org
  DEPENDS:=+libatomic +libcurl +libopenssl +libstdcpp +zlib
endef

define Package/rustc/description
  The Rust Programming Language.
endef

define Package/rustc/conffiles
/opt/share/cargo/config.toml
endef

### host
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/rustc-dev-$(PKG_VERSION)
RUSTC_HOST_ARCH:=$(HOST_ARCH)-unknown-linux-gnu

### target
ifeq ($(CONFIG_TARGET_armv7_3_2),y)
  RUSTC_TARGET_ARCH:=$(subst arm,armv7,$(REAL_GNU_TARGET_NAME))
else
  RUSTC_TARGET_ARCH:=$(REAL_GNU_TARGET_NAME)
endif

define Build/Configure
	( \
		echo 'change-id = 126219'; \
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
		echo 'host = ["$(RUSTC_TARGET_ARCH)"]'; \
		echo 'target = ["$(RUSTC_TARGET_ARCH)"]'; \
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
		echo '[target.$(RUSTC_TARGET_ARCH)]'; \
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
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/build/$(RUSTC_HOST_ARCH)
	$(LN) $(HOST_BUILD_DIR)/build/$(RUSTC_HOST_ARCH)/llvm \
		$(PKG_BUILD_DIR)/build/$(RUSTC_HOST_ARCH)
	$(LN) $(HOST_BUILD_DIR)/build/$(RUSTC_HOST_ARCH)/stage0-bootstrap-tools \
		$(PKG_BUILD_DIR)/build/$(RUSTC_HOST_ARCH)
endef

Hooks/Compile/Post += FixPreInstall

define Build/Install
	( cd $(PKG_BUILD_DIR); \
		CARGO_HOME="$(STAGING_DIR)/host/share/cargo.dev" \
		CXXFLAGS='-I$(PKG_BUILD_DIR)/build/$(RUSTC_TARGET_ARCH)/llvm/include' \
		HOST_PKG_CONFIG_PATH="$(STAGING_DIR_HOST)/lib/pkgconfig:$(STAGING_DIR_HOSTPKG)/lib/pkgconfig" \
		RUSTFLAGS='-L native=$(PKG_BUILD_DIR)/build/$(RUSTC_TARGET_ARCH)/llvm/lib' \
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
	$(INSTALL_DIR) $(1)/opt/lib/rustlib/$(RUSTC_TARGET_ARCH)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib*.so $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/rustlib/$(RUSTC_TARGET_ARCH)/lib \
		$(1)/opt/lib/rustlib/$(RUSTC_TARGET_ARCH)
	$(INSTALL_DIR) $(1)/opt/share/cargo
	$(INSTALL_DATA) ./files/config.toml $(1)/opt/share/cargo
	$(SED) 's,@RUSTC_TARGET_ARCH@,$(RUSTC_TARGET_ARCH),; \
		s,@TARGET_CROSS@,$(TARGET_CROSS),' \
			$(1)/opt/share/cargo/config.toml
endef

define Package/rustc/postinst
#!/bin/sh

/opt/sbin/ldconfig > /dev/null 2>&1

if ! grep -q "CARGO_HOME" /opt/etc/profile; then
  echo -e "\n# set env CARGO_HOME" >> /opt/etc/profile
  echo 'export CARGO_HOME="/opt/share/cargo"' >> /opt/etc/profile
fi

if ! grep -q "TMPDIR" /opt/etc/profile; then
  echo -e "\n# set env TMPDIR" >> /opt/etc/profile
  echo 'export TMPDIR="/opt/tmp"' >> /opt/etc/profile
fi
endef

#define Package/rustc/postrm
##!/bin/sh
#
#sed -i '/CARGO_HOME/d' /opt/etc/profile
#sed -i '/TMPDIR/d' /opt/etc/profile
#endef

$(eval $(call BuildPackage,rustc))
