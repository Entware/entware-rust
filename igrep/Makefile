# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=igrep
PKG_VERSION:=1.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/konradsz/igrep/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f817cf5118e93da35fcc0c1e1b6176eeeb282256c45093daa85e91f9d4cd3f49

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
