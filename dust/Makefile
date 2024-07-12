# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX since 0.8.4:
# mips(el):
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `du-dust` due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=dust
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bootandy/dust/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=34b72116ab6db9bdb97bc1e49dadf392a1619838204b44b0a4695539d54ffbe8

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/dust
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=A more intuitive version of du
  URL:=https://crates.io/crates/du-dust
endef

define Package/dust/description
  du + rust = dust. Like du but more intuitive.
endef

define Package/dust/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dust $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dust))
