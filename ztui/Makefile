# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# aarch64/arm:
#	error[E0308]: mismatched types
#	error: could not compile `sys_metrics` (lib) due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=ztui
PKG_VERSION:=0.1.7
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/erikh/ztui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=6210c7e37b492490b6584b4360aff063d4e0f0896da2c1c25e764ba710710b02

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 sys-metrics-026

define Package/ztui
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=A terminal UI for ZeroTier
  URL:=https://github.com/erikh/ztui
  DEPENDS:=+libopenssl
  EXTRA_DEPENDS:=zerotier
endef

define Package/ztui/description
  ztui aims to be a frontend for all interactions with ZeroTier
  in an attempt to transform how people work with it.
endef

# error: failed to run custom build command for `openssl-sys v0.9.87`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

# X86_64: error while loading shared libraries: \
#	  libssl.so.3: cannot open shared object file: \
#	  No such file or directory
ifeq ($(CONFIG_x86_64),y)
RUSTC_VARS += \
	X86_64_UNKNOWN_LINUX_GNU_OPENSSL_STATIC=true \
	X86_64_UNKNOWN_LINUX_GNU_OPENSSL_INCLUDE_DIR="$(STAGING_DIR_HOST)/include" \
	X86_64_UNKNOWN_LINUX_GNU_OPENSSL_LIB_DIR="$(STAGING_DIR_HOST)/lib"
endif

define Package/ztui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ztui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,ztui))
