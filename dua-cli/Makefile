# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=dua-cli
PKG_VERSION:=2.34.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Byron/dua-cli/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=eaa924f50efb425302c124f170644e95a08f8dad1f627b86f50d033ca5feb0c1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442 getrandom-0217 iana-time-zone-0164

define Package/dua-cli
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=Disk Usage Analyzer
  URL:=https://github.com/Byron/dua-cli
endef

define Package/dua-cli/description
  dua (-> Disk Usage Analyzer) is a tool to conveniently learn
  about the usage of disk space of a given directory.
endef

define Package/dua-cli/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dua $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dua-cli))
