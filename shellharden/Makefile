# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=shellharden
PKG_VERSION:=4.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/anordal/shellharden/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=3a6721c3409c70449c24a5b33f83d0d05026f2318fe052db5c6d0834e2b29c6c

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
  shellharden is a syntax highlighter and a tool to semi-automate the
  rewriting of scripts to ShellCheck conformance, mainly focused on quoting.
endef

define Package/shellharden/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/shellharden $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,shellharden))
