# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=shellharden
PKG_VERSION:=4.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/anordal/shellharden/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=d17bf55bae4ed6aed9f0d5cea8efd11026623a47b6d840b826513ab5b48db3eb

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/shellharden
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The corrective bash syntax highlighter
  URL:=https://github.com/anordal/shellharden
endef

define Package/shellharden/description
  shellharden is a syntax highlighter and a tool to semi-automate the rewriting
  of scripts to ShellCheck conformance, mainly focused on quoting.
endef

define Package/shellharden/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/shellharden $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,shellharden))
