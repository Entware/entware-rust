# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=igrep
PKG_VERSION:=1.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/konradsz/igrep/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=c4ccd55082f2957dab3766b4c7229c3f804d578a8214ef2ce23f13029bdd2296

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/igrep
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Interactive Grep
  URL:=https://github.com/konradsz/igrep
endef

define Package/igrep/description
  igrep - Interactive Grep.
endef

define Package/igrep/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ig $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,igrep))
