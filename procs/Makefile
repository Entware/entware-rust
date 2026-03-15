# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=procs
PKG_VERSION:=0.14.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dalance/procs/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=3d6b3561ce05362a092ea8488458f552d6636d3a280290e21f841c432cadf91a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0444 getrandom-0217 iana-time-zone-0164

define Package/procs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A modern replacement for ps
  URL:=https://github.com/dalance/procs
  EXTRA_DEPENDS:=less
endef

define Package/procs/description
  procs is a replacement for ps written in Rust.
endef

define Package/procs/conffiles
/opt/etc/procs/procs.toml
endef

# features docker
CARGO_ARGS += --no-default-features

define Package/procs/install
	$(INSTALL_DIR) $(1)/opt/etc/procs
	$(CP) $(PKG_BUILD_DIR)/config/large.toml $(1)/opt/etc/procs/procs.toml
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/procs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,procs))
