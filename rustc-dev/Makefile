# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=rustc-dev
PKG_VERSION:=1.67.0
PKG_RELEASE:=1

PKG_SOURCE:=rustc-$(PKG_VERSION)-src.tar.xz
PKG_SOURCE_URL:=https://static.rust-lang.org/dist
PKG_HASH:=9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

HOST_BUILD_DEPENDS:=python3/host
PKG_BUILD_DEPENDS:=rustc-dev/host
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/cmake.mk

HOST_UNPACK:=$(HOST_TAR) -C $(HOST_BUILD_DIR) --strip-components=1 -xJf $(DL_DIR)/$(PKG_SOURCE)
PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xJf $(DL_DIR)/$(PKG_SOURCE)

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

# host
RUST_HOST_TRIPLE:=$(HOST_ARCH)-unknown-linux-gnu

define Host/Configure
	( \
		echo 'changelog-seen = 2'; \
		echo '[llvm]'; \
		echo 'targets = "AArch64;ARM;Mips;X86"'; \
		echo 'experimental-targets = ""'; \
		echo 'link-shared = false'; \
		echo '[build]'; \
		echo 'test-stage = 0'; \
		echo 'dist-stage = 0'; \
		echo 'bench-stage = 0'; \
		echo 'target = ["$(RUST_HOST_TRIPLE)"]'; \
		echo 'docs = false'; \
		echo 'compiler-docs = false'; \
		echo 'submodules = false'; \
		echo 'python = "$(STAGING_DIR_HOSTPKG)/bin/python3"'; \
		echo 'vendor = true'; \
		echo 'extended = true'; \
		echo 'tools = ["cargo", "clippy", "rustfmt"]'; \
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
		echo '[target.$(RUST_HOST_TRIPLE)]'; \
		echo 'cc = "$(HOSTCC)"'; \
		echo 'cxx = "$(HOSTCXX)"'; \
		echo '[dist]'; \
		echo 'src-tarball = false'; \
		echo 'compression-formats = ["gz"]'; \
	) > $(HOST_BUILD_DIR)/config.toml
endef

Host/Compile:=:

define Host/Install
	( cd $(HOST_BUILD_DIR); \
		DESTDIR=$(HOST_BUILD_DIR)/install \
		$(STAGING_DIR_HOSTPKG)/bin/python3 x.py install \
	)
endef

define Host/Clean
	$(call Host/Clean/Default)
	$(RM) $(STAGING_DIR)/host/bin/{cargo,clippy,rust}*
	$(RM) -r $(STAGING_DIR)/host/lib/rustlib/$(RUST_HOST_TRIPLE)
	$(RM) $(STAGING_DIR)/host/lib/lib{rust,std,test}*.so
endef

# target
#RUST_TARGET_TRIPLE:=

#ifeq ($(CONFIG_TARGET_armv5_3_2),y)
#RUST_TARGET_TRIPLE=armv5te-openwrt-linux-gnueabi
#else
#ifeq ($(or $(CONFIG_TARGET_armv7_2_6),$(CONFIG_TARGET_armv7_3_2)),y)
#RUST_TARGET_TRIPLE=armv7-openwrt-linux-gnueabi
#else
#ifeq ($(CONFIG_TARGET_x86_2_6),y)
#RUST_TARGET_TRIPLE=i486-openwrt-linux-gnu
#else
RUST_TARGET_TRIPLE=$(REAL_GNU_TARGET_NAME)
#endif
#endif
#endif

define Build/Configure
	( \
		echo 'changelog-seen = 2'; \
		echo 'profile = "library"'; \
		echo '[llvm]'; \
		echo 'download-ci-llvm = false'; \
		echo 'skip-rebuild = true'; \
		echo 'allow-old-toolchain = true'; \
		echo 'link-shared = false'; \
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
		echo 'extended = false'; \
		echo 'tools = [""]'; \
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
		echo 'cc = "$(TARGET_CROSS)gcc"'; \
		echo 'cxx = "$(TARGET_CROSS)g++"'; \
		echo 'ar = "$(TARGET_CROSS)ar"'; \
		echo 'ranlib = "$(TARGET_CROSS)ranlib"'; \
		echo 'linker = "$(TARGET_CROSS)gcc"'; \
		echo '[dist]'; \
		echo 'src-tarball = false'; \
		echo 'compression-formats = ["gz"]'; \
	) > $(PKG_BUILD_DIR)/config.toml
endef

Build/Compile:=:

define Build/Install
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/build/$(RUST_HOST_TRIPLE)
	$(LN) $(HOST_BUILD_DIR)/build/$(RUST_HOST_TRIPLE)/llvm \
		$(PKG_BUILD_DIR)/build/$(RUST_HOST_TRIPLE)

	$(INSTALL_DIR) $(STAGING_DIR)/host/bin $(STAGING_DIR)/host/lib/rustlib
	$(CP) $(HOST_BUILD_DIR)/install/bin/{cargo,clippy,rustc,rustd,rustf}* \
		 $(STAGING_DIR)/host/bin

	$(CP) $(HOST_BUILD_DIR)/install/lib/lib* $(STAGING_DIR)/host/lib
	$(CP) $(HOST_BUILD_DIR)/install/lib/rustlib/$(RUST_HOST_TRIPLE) \
		 $(STAGING_DIR)/host/lib/rustlib

	( cd $(PKG_BUILD_DIR); \
		HOST_PKG_CONFIG_PATH="$(STAGING_DIR_HOST)/lib/pkgconfig:$(STAGING_DIR_HOSTPKG)/lib/pkgconfig" \
		PKG_CONFIG_ALLOW_CROSS=1 \
		DESTDIR=$(PKG_INSTALL_DIR) \
		$(STAGING_DIR_HOSTPKG)/bin/python3 x.py install \
		library/std --stage 1 \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/lib/rustlib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/rustlib/$(RUST_TARGET_TRIPLE) \
		 $(2)/lib/rustlib

	$(INSTALL_DIR) $(2)/share/cargo/.cargo
	( \
		echo '[target.$(RUST_TARGET_TRIPLE)]'; \
		echo 'linker = "$(TARGET_CROSS)gcc"'; \
	) > $(2)/share/cargo/.cargo/config.toml
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,rustc-dev))
