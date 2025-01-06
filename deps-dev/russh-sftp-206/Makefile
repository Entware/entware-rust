# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (hex-patch)

include $(TOPDIR)/rules.mk

PKG_NAME:=russh-sftp
PKG_VERSION:=2.0.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=37badd3968b53e9efcc6bb03f8c6410a7db8108e
PKG_SOURCE_URL:=https://github.com/AspectUnk/russh-sftp
PKG_MIRROR_HASH:=2808f24b8456e17c25981120574a47ea4c5e263fef67886c5d08ba06bbce0c68

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 flurry-051 seize-033

define Package/russh-sftp-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=SFTP subsystem supported server and client for Russh
  URL:=https://github.com/AspectUnk/russh-sftp
  BUILDONLY:=1
endef

define Package/russh-sftp-$(PKG_VERSION)/description
  SFTP subsystem supported server and client for Russh and more!
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,russh-sftp-$(PKG_VERSION)))
