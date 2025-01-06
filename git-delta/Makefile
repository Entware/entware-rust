# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=delta
PKG_VERSION:=0.18.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dandavison/delta/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=64717c3b3335b44a252b8e99713e080cbf7944308b96252bc175317b10004f02

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/git-delta
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a syntax-highlighting pager for git
  URL:=https://github.com/dandavison/delta
  DEPENDS:=+zlib
  EXTRA_DEPENDS:=git, less
endef

define Package/git-delta/description
  A syntax-highlighting pager for git, diff, and grep output.
endef

define Package/git-delta/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/delta $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,git-delta))
