# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=diskus
PKG_VERSION:=0.7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sharkdp/diskus/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=64b1b2e397ef4de81ea20274f98ec418b0fe19b025860e33beaba5494d3b8bd1

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/diskus
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=a minimal, fast alternative to du -sh
  URL:=https://github.com/sharkdp/diskus
endef

define Package/diskus/description
  A minimal, fast alternative to 'du -sh'.
  diskus is a very simple program that computes the total size of
  the current directory. It is a parallelized version of 'du -sh'.
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/diskus/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/diskus $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,diskus))
