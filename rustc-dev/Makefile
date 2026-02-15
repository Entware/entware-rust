# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rustc
PKG_VERSION:=1.92.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=https://static.rust-lang.org/dist
PKG_HASH:=9e0d2ca75c7e275fdc758255bf4b03afb3d65d1543602746907c933b6901c3b8

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)-dev-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-dev-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

PKG_BUILD_DEPENDS:=rustc-dev/host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

HOST_UNPACK += --strip-components=1 -C $(HOST_BUILD_DIR)
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/rustc-dev
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Rust
  URL:=https://www.rust-lang.org
  BUILDONLY:=1
endef

define Package/rustc-dev/description
  The Rust Programming Language.
endef

### host
HOST_PKG_CONFIG_PATH:="$(STAGING_DIR_HOST)/lib/pkgconfig:$(STAGING_DIR_HOSTPKG)/lib/pkgconfig"
HOST_STAMP_INSTALLED:=$(STAGING_DIR)/host/stamp/.$(PKG_DIR_NAME)_installed
RUSTC_HOST_ARCH:=$(HOST_ARCH)-unknown-linux-gnu

### target
ifeq ($(CONFIG_TARGET_armv7_3_2),y)
  RUSTC_TARGET_ARCH:=$(subst arm,armv7,$(REAL_GNU_TARGET_NAME))
else
  RUSTC_TARGET_ARCH:=$(REAL_GNU_TARGET_NAME)
endif

PRE_BUILD_VERSION:=$(PKG_VERSION)
PRE_BUILD_FILE:=rust-dev-$(PRE_BUILD_VERSION)-$(RUSTC_HOST_ARCH).tar.xz
PRE_COMMIT_HASH:=ded5c06cf21d2b93bffd5d884aa6e96934ee4234
DL_LLVM_DIR:=llvm-$(PRE_COMMIT_HASH)-false

define Download/rust-dev
  FILE:=$(PRE_BUILD_FILE)
  URL:= \
	https://ci-artifacts.rust-lang.org/rustc-builds/$(PRE_COMMIT_HASH) \
	https://src.entware.net
  HASH:=ee96e87db5432c6985722a1912aa222d295522cf7f48c7965d32cf84da079c17
endef

define Host/Prepare
	$(INSTALL_DIR) $(DL_DIR)/$(PKG_NAME)/$(DL_LLVM_DIR)
	$(CP) $(DL_DIR)/$(PRE_BUILD_FILE) $(DL_DIR)/$(PKG_NAME)/$(DL_LLVM_DIR)
	$(call Host/Prepare/Default)
endef

define Host/Configure
	( \
		echo 'change-id = 149758'; \
		echo '[llvm]'; \
		echo 'download-ci-llvm = true'; \
		echo '[build]'; \
		echo 'bench-stage = 0'; \
		echo 'dist-stage = 0'; \
		echo 'test-stage = 0'; \
		echo 'target = ["$(RUSTC_HOST_ARCH)"]'; \
		echo 'bootstrap-cache-path = "$(DL_DIR)/rustc"'; \
		echo 'python = "$(STAGING_DIR_HOST)/bin/python3"'; \
		echo 'cargo-native-static = true'; \
		echo 'compiler-docs = false'; \
		echo 'compiletest-use-stage0-libtest = false'; \
		echo 'docs = false'; \
		echo 'extended = true'; \
		echo 'submodules = false'; \
		echo 'tools = ["cargo", "clippy", "rustdoc", "rustfmt",]'; \
		echo 'vendor = true'; \
		echo 'verbose = $(if $(findstring s,$(OPENWRT_VERBOSE)),1,0)'; \
		echo '[install]'; \
		echo 'prefix = "/"'; \
		echo 'sysconfdir = "/etc"'; \
		echo 'bindir = "/bin"'; \
		echo 'libdir = "/lib"'; \
		echo 'datadir = "/share"'; \
		echo '[rust]'; \
		echo 'backtrace = false'; \
		echo 'channel = "nightly"'; \
		echo 'codegen-tests = false'; \
		echo 'dist-src = false'; \
		echo 'download-rustc = false'; \
		echo 'incremental = false'; \
		echo 'rpath = true'; \
		echo 'parallel-frontend-threads = $(if $(findstring s,$(OPENWRT_VERBOSE)),1,0)'; \
		echo '[target.$(RUSTC_HOST_ARCH)]'; \
		echo 'ar = "ar"'; \
		echo 'cc = "$(HOSTCC_NOCACHE)"'; \
		echo 'cxx = "$(HOSTCXX_NOCACHE)"'; \
		echo 'linker = "$(HOSTCC_NOCACHE)"'; \
		echo 'ranlib = "ranlib"'; \
		echo 'default-linker-linux-override = "off"'; \
		echo '[dist]'; \
		echo 'src-tarball = false'; \
		echo 'compression-formats = ["gz"]'; \
	) > $(HOST_BUILD_DIR)/bootstrap.toml

	$(FIND) $(HOST_BUILD_DIR)/vendor -type f -name ".cargo-checksum.json" -exec \
		$(SED) 's/\("files":{\)[^}]*/\1/' {} +
endef

define Host/Compile
	( cd $(HOST_BUILD_DIR); \
		CARGO_HOME="$(STAGING_DIR)/host/share/cargo.dev" \
		DESTDIR=$(HOST_BUILD_DIR)/install \
		$(STAGING_DIR_HOST)/bin/python3 x.py install; \
	)
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/bin/cargo $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/bin/cargo-clippy $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/bin/cargo-fmt $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/bin/clippy-driver $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/bin/rust{c,doc,fmt} $(STAGING_DIR)/host/bin
	$(INSTALL_DIR) $(STAGING_DIR)/host/lib/rustlib
	$(CP) $(HOST_BUILD_DIR)/install/lib/lib*.so* $(STAGING_DIR)/host/lib
	$(CP) $(HOST_BUILD_DIR)/install/lib/rustlib/$(RUSTC_HOST_ARCH) \
		 $(STAGING_DIR)/host/lib/rustlib
	@( \
		$(INSTALL_DIR) $(DL_DIR)/cargo; \
		$(STAGING_DIR_HOST)/bin/sed \
			-e "s,@RUSTC_HOST_ARCH@,$(RUSTC_HOST_ARCH)," \
			-e "s,@HOST_CC@,$(HOSTCC_NOCACHE)," \
			< files/cargo-config.toml \
			> $(DL_DIR)/cargo/config.toml; \
	)
endef

define Host/Clean
	$(call Host/Clean/Default)
	rm -f $(STAGING_DIR)/host/bin/{cargo,clippy,rust}*
	rm -f $(STAGING_DIR)/host/lib/lib*.so*
	rm -rf $(STAGING_DIR)/host/lib/rustlib/$(RUSTC_HOST_ARCH)
endef

define Build/Configure
	( \
		echo 'change-id = 149758'; \
		echo 'profile = "library"'; \
		echo '[llvm]'; \
		echo 'download-ci-llvm = true'; \
		echo '[build]'; \
		echo 'host = ["$(RUSTC_TARGET_ARCH)"]'; \
		echo 'target = ["$(RUSTC_TARGET_ARCH)"]'; \
		echo 'bootstrap-cache-path = "$(DL_DIR)/rustc"'; \
		echo 'cargo = "$(STAGING_DIR)/host/bin/cargo"'; \
		echo 'cargo-clippy = "$(STAGING_DIR)/host/bin/cargo-clippy"'; \
		echo 'python = "$(STAGING_DIR_HOST)/bin/python3"'; \
		echo 'rustc = "$(STAGING_DIR)/host/bin/rustc"'; \
		echo 'rustfmt = "$(STAGING_DIR)/host/bin/rustfmt"'; \
		echo 'compiler-docs = false'; \
		echo 'compiletest-use-stage0-libtest = false'; \
		echo 'docs = false'; \
		echo 'extended = false'; \
		echo 'full-bootstrap = false'; \
		echo 'local-rebuild = false'; \
		echo 'submodules = false'; \
		echo 'tools = ["",]'; \
		echo 'vendor = true'; \
		echo 'verbose = $(if $(findstring s,$(OPENWRT_VERBOSE)),1,0)'; \
		echo '[install]'; \
		echo 'prefix = "/opt"'; \
		echo 'sysconfdir = "/opt/etc"'; \
		echo 'bindir = "/opt/bin"'; \
		echo 'libdir = "/opt/lib"'; \
		echo 'datadir = "/opt/share"'; \
		echo '[rust]'; \
		echo 'channel = "nightly"'; \
		echo 'codegen-tests = false'; \
		echo 'dist-src = false'; \
		echo 'download-rustc = false'; \
		echo 'incremental = false'; \
		echo 'rpath = false'; \
		echo 'parallel-frontend-threads = $(if $(findstring s,$(OPENWRT_VERBOSE)),1,0)'; \
		echo '[target.$(RUSTC_TARGET_ARCH)]'; \
		echo 'ar = "$(TARGET_CROSS)ar"'; \
		echo 'cc = "$(TARGET_CROSS)gcc"'; \
		echo 'cxx = "$(TARGET_CROSS)g++"'; \
		echo 'linker = "$(TARGET_CROSS)gcc"'; \
		echo 'ranlib = "$(TARGET_CROSS)ranlib"'; \
		echo 'default-linker-linux-override = "off"'; \
		echo '[dist]'; \
		echo 'src-tarball = false'; \
		echo 'compression-formats = ["gz"]'; \
	) > $(PKG_BUILD_DIR)/bootstrap.toml

	$(FIND) $(PKG_BUILD_DIR)/vendor -type f -name ".cargo-checksum.json" -exec \
		$(SED) 's/\("files":{\)[^}]*/\1/' {} +
endef

define Build/Compile
	( cd $(PKG_BUILD_DIR); \
		CARGO_HOME="$(STAGING_DIR)/host/share/cargo.dev" \
		DESTDIR=$(PKG_INSTALL_DIR) \
		HOST_PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" \
		PKG_CONFIG_ALLOW_CROSS=1 \
		$(STAGING_DIR_HOST)/bin/python3 x.py install library/std; \
	)
endef

Build/Install:=:

define Build/InstallDev
	$(INSTALL_DIR) $(2)/include $(2)/lib/rustlib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/rustlib/$(RUSTC_TARGET_ARCH) \
		 $(2)/lib/rustlib
endef

#define Build/Clean
#	rm -rf $(STAGING_DIR)/host/share/cargo.dev
#endef

$(eval $(call Download,rust-dev))
$(eval $(call HostBuild))
$(eval $(call BuildPackage,rustc-dev))
