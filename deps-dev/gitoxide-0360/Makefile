# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (helix)

include $(TOPDIR)/rules.mk

PKG_NAME:=gitoxide
PKG_VERSION:=0.36.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Byron/gitoxide/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=36142c7388c68732a953fcfd9dcd609241b1d9a5d2fdb2e796e987b6b6872fa7

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/gitoxide-$(PKG_VERSION)
#  SECTION:=net
#  CATEGORY:=Network
#  SUBMENU:=Version Control Systems
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=a CLI application for interacting with git repositories
  URL:=https://github.com/Byron/gitoxide
#  DEPENDS:=+libcurl
  BUILDONLY:=1
endef

define Package/gitoxide-$(PKG_VERSION)/description
  An idiomatic, lean, fast & safe pure Rust implementation of Git.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,gitoxide-$(PKG_VERSION)))
