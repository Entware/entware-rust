# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX armv5/mips(el) (trippy)

include $(TOPDIR)/rules.mk

PKG_NAME:=tracing-chrome
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/thoren-d/tracing-chrome/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=d8a3d21bc2e85732f26f897f892e8286bfac34c4dbd2580c2e1c58d0baf03cb3

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/tracing-chrome-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=A library for generating chrome://tracing traces in Rust
  URL:=https://github.com/thoren-d/tracing-chrome
  BUILDONLY:=1
endef

define Package/tracing-chrome-$(PKG_VERSION)/description
  A Layer for tracing-subscriber that outputs Chrome-style traces.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,tracing-chrome-$(PKG_VERSION)))
