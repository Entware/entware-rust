# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=zenith
PKG_VERSION:=0.14.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bvaisvil/zenith/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=73d704b3cbf93506c22f3a7d98ae1a75011434a27a978dd0a7b6b30c7794423b

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/zenith
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=soft of like top or htop
  URL:=https://github.com/bvaisvil/zenith
endef

define Package/zenith/description
  In terminal graphical metrics for your *nix system written in Rust.
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/zenith/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/zenith $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,zenith))
