# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (hex-patch)

include $(TOPDIR)/rules.mk

PKG_NAME:=seize
PKG_VERSION:=0.3.3
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-04-16
PKG_SOURCE_VERSION:=ae7f70611d8285d5c51d801c8fe9b108e41f3156
PKG_SOURCE_URL:=https://github.com/ibraheemdev/seize
PKG_MIRROR_HASH:=bb7d64023394c043a47414b23ceb62f8826aab394f0e5e7102e02eeb6c7e3f74

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/seize-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=memory reclamation for concurrent data structures
  URL:=https://github.com/ibraheemdev/seize
  BUILDONLY:=1
endef

define Package/seize-$(PKG_VERSION)/description
  Fast, efficient, and robust memory reclamation for concurrent data
  structures.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,seize-$(PKG_VERSION)))
