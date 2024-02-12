# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=async-rustls
PKG_VERSION:=0.4.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/smol-rs/async-rustls/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=5bef7782ad763e8f317b725dd2310dcaacaa975b1c54334b576d0c56e219f383

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT LICENSE-THIRD-PARTY

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += rustls-0219 rustls-webpki-01017 webpki-roots-0243

define Package/async-rustls-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Async TLS/SSL streams using rustls
  URL:=https://github.com/smol-rs/async-rustls
  BUILDONLY:=1
endef

define Package/async-rustls-$(PKG_VERSION)/description
  Asynchronous TLS/SSL streams using Rustls.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,async-rustls-$(PKG_VERSION)))
