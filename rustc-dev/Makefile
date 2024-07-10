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

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)-dev-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-dev-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

HOST_BUILD_DEPENDS:=libiconv-full/host python3/host
HOST_BUILD_PARALLEL:=1

PKG_BUILD_DEPENDS:=rustc-dev/host
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/cmake.mk

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
HOST_STAMP_INSTALLED:=$(STAGING_DIR)/host/stamp/.$(PKG_DIR_NAME)_installed
RUSTC_HOST_ARCH:=$(HOST_ARCH)-unknown-linux-gnu

### target
ifeq ($(CONFIG_TARGET_armv7_3_2),y)
  RUSTC_TARGET_ARCH:=$(subst arm,armv7,$(REAL_GNU_TARGET_NAME))
else
  RUSTC_TARGET_ARCH:=$(REAL_GNU_TARGET_NAME)
endif

define Host/Configure
	( \
		echo 'change-id = 126219'; \
		echo '[llvm]'; \
		echo 'targets = "AArch64;ARM;Mips;X86"'; \
		echo 'experimental-targets = ""'; \
		echo 'link-shared = false'; \
		echo 'cflags = "-pthread"'; \
		echo 'cxxflags = "-pthread"'; \
		echo 'ldflags = "-lpthread -ldl"'; \
		echo 'build-config = \
		{ \
			LLVM_ENABLE_BINDINGS="OFF", \
			LLVM_ENABLE_OCAMLDOC="OFF", \
			LLVM_INCLUDE_BENCHMARKS="OFF", \
			LLVM_INCLUDE_DOCS="OFF", \
			LLVM_INCLUDE_EXAMPLES="OFF", \
			LLVM_INCLUDE_TESTS="OFF" \
		}'; \
		echo '[build]'; \
		echo 'test-stage = 0'; \
		echo 'dist-stage = 0'; \
		echo 'bench-stage = 0'; \
		echo 'target = ["$(RUSTC_HOST_ARCH)"]'; \
		echo 'docs = false'; \
		echo 'compiler-docs = false'; \
		echo 'submodules = false'; \
		echo 'python = "$(STAGING_DIR_HOSTPKG)/bin/python3"'; \
		echo 'vendor = true'; \
		echo 'extended = true'; \
		echo 'tools = ["cargo", "clippy", "rustdoc", "rustfmt",]'; \
		echo 'verbose = 0'; \
		echo '[install]'; \
		echo 'prefix = "/"'; \
		echo 'sysconfdir = "/etc"'; \
		echo 'bindir = "/bin"'; \
		echo 'libdir = "/lib"'; \
		echo 'datadir = "/share"'; \
		echo '[rust]'; \
		echo 'backtrace = false'; \
		echo 'incremental = true'; \
		echo 'channel = "nightly"'; \
		echo 'codegen-tests = false'; \
		echo 'dist-src = false'; \
		echo '[target.$(RUSTC_HOST_ARCH)]'; \
		echo 'cc = "$(HOSTCC_NOCACHE)"'; \
		echo 'cxx = "$(HOSTCXX_NOCACHE)"'; \
		echo 'ar = "ar"'; \
		echo 'ranlib = "ranlib"'; \
		echo 'linker = "$(HOSTCC_NOCACHE)"'; \
		echo '[dist]'; \
		echo 'src-tarball = false'; \
		echo 'compression-formats = ["gz"]'; \
	) > $(HOST_BUILD_DIR)/config.toml
endef

Host/Compile:=:

define Host/Install
	( cd $(HOST_BUILD_DIR); \
		CARGO_HOME="$(STAGING_DIR)/host/share/cargo.dev" \
		DESTDIR=$(HOST_BUILD_DIR)/install \
		$(STAGING_DIR_HOSTPKG)/bin/python3 x.py install \
	)
endef

define Host/Clean
	$(call Host/Clean/Default)
	rm -f $(STAGING_DIR)/host/bin/{cargo,clippy,rust}*
	rm -rf $(STAGING_DIR)/host/lib/rustlib/$(RUSTC_HOST_ARCH)
	rm -f $(STAGING_DIR)/host/lib/lib{rust,std,test}*.so
endef

define Build/Configure
	( \
		echo 'change-id = 126219'; \
		echo 'profile = "library"'; \
		echo '[llvm]'; \
		echo 'download-ci-llvm = false'; \
		echo 'allow-old-toolchain = true'; \
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
		echo 'extended = false'; \
		echo 'tools = ["",]'; \
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
	$(INSTALL_DIR) $(STAGING_DIR)/host/bin $(STAGING_DIR)/host/lib/rustlib
	$(CP) $(HOST_BUILD_DIR)/install/bin/cargo $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/bin/cargo-clippy $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/bin/cargo-fmt $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/bin/clippy-driver $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/bin/rust{c,doc,fmt} $(STAGING_DIR)/host/bin
	$(CP) $(HOST_BUILD_DIR)/install/lib/lib*.so $(STAGING_DIR)/host/lib
	$(CP) $(HOST_BUILD_DIR)/install/lib/rustlib/$(RUSTC_HOST_ARCH) \
		 $(STAGING_DIR)/host/lib/rustlib
endef

Hooks/Compile/Post += FixPreInstall

define Build/Install
	( cd $(PKG_BUILD_DIR); \
		CARGO_HOME="$(STAGING_DIR)/host/share/cargo.dev" \
		HOST_PKG_CONFIG_PATH="$(STAGING_DIR_HOST)/lib/pkgconfig:$(STAGING_DIR_HOSTPKG)/lib/pkgconfig" \
		PKG_CONFIG_ALLOW_CROSS=1 \
		DESTDIR=$(PKG_INSTALL_DIR) \
		$(STAGING_DIR_HOSTPKG)/bin/python3 x.py install \
		library/std --stage 1; \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/include $(2)/lib/rustlib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/rustlib/$(RUSTC_TARGET_ARCH) \
		 $(2)/lib/rustlib
	$(INSTALL_DIR) $(2)/share/cargo
	( \
		echo '### host'; \
		echo '[target.$(RUSTC_HOST_ARCH)]'; \
		echo 'linker = "$(HOSTCC_NOCACHE)"'; \
		echo ''; \
		echo '### target'; \
		echo '[target.$(RUSTC_TARGET_ARCH)]'; \
		echo 'linker = "$(TARGET_CROSS)gcc"'; \
		echo ''; \
		echo '### Custom profiles:'; \
		echo '### strip'; \
		echo '[profile.strip]'; \
		echo 'inherits = "release"'; \
		echo 'opt-level = "z"'; \
		echo 'debug = false'; \
		echo 'split-debuginfo = "off"'; \
		echo 'debug-assertions = false'; \
		echo 'overflow-checks = false'; \
		echo 'lto = "thin"'; \
		echo 'panic = "abort"'; \
		echo 'incremental = false'; \
		echo 'codegen-units = 1'; \
		echo 'rpath = false'; \
		echo 'strip = true'; \
		echo ''; \
		echo '### s(uper)strip'; \
		echo '[profile.sstrip]'; \
		echo 'inherits = "release"'; \
		echo 'opt-level = "z"'; \
		echo 'debug = false'; \
		echo 'split-debuginfo = "off"'; \
		echo 'debug-assertions = false'; \
		echo 'overflow-checks = false'; \
		echo 'lto = "fat"'; \
		echo 'panic = "abort"'; \
		echo 'incremental = false'; \
		echo 'codegen-units = 1'; \
		echo 'rpath = false'; \
		echo 'strip = "symbols"'; \
		echo ''; \
		echo '### Overrides build-script settings:'; \
		echo '### Only for build scripts, proc macros, and their dependencies'; \
		echo '[profile.release.build-override]'; \
		echo 'opt-level = "z"'; \
		echo 'debug = false'; \
		echo 'split-debuginfo = "off"'; \
		echo 'debug-assertions = false'; \
		echo 'overflow-checks = false'; \
		echo 'incremental = false'; \
		echo 'codegen-units = 1'; \
		echo 'strip = true'; \
		echo ''; \
		echo '### For any non-workspace member'; \
		echo '[profile.release.package."*"]'; \
		echo 'opt-level = "z"'; \
		echo 'debug = false'; \
		echo 'split-debuginfo = "off"'; \
		echo 'debug-assertions = false'; \
		echo 'overflow-checks = false'; \
		echo 'incremental = false'; \
		echo 'codegen-units = 1'; \
		echo 'strip = true'; \
		echo ''; \
	) > $(2)/share/cargo/config.toml
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,rustc-dev))
