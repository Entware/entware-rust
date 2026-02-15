# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

# XXX mips(el) (hex-patch)

include $(TOPDIR)/rules.mk

PKG_NAME:=russh-sftp
PKG_VERSION:=2.1.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=c2590f9a41cf99c2fb3c672e045a9837a8adcb35
PKG_SOURCE_URL:=https://github.com/AspectUnk/russh-sftp
PKG_MIRROR_HASH:=c868194214251dff27317f17a058cfe6e711e7a7a0253f17334673f38bf20648

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 flurry-052 getrandom-0216 seize-033

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
