# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX (xplr)

include $(TOPDIR)/rules.mk

PKG_NAME:=ratatui
PKG_VERSION:=0.22.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ratatui-org/ratatui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=7153f20f18d5855a03a15fa5d5bf1a91ab2208fab793bda2f33ba80f8b29ca90

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/ratatui-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=A library that's all about cooking up terminal user interfaces
  URL:=https://ratatui.rs
  BUILDONLY:=1
endef

define Package/ratatui-$(PKG_VERSION)/description
  Rust library that's all about cooking up
  terminal user interfaces (TUIs).
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,ratatui-$(PKG_VERSION)))
