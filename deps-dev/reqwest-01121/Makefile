# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=reqwest
PKG_VERSION:=0.11.21
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/seanmonstar/reqwest/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=9c18d2f248394285460be2bcd278f12eb6ee3ec79d07d9caf9c94cc16d4f4eb2

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += hyper-rustls-0242 quinn-0104 ring-0175 \
		rustls-0219 tokio-rustls-0241 trust-dns webpki-roots-0243

define Package/reqwest-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=higher level HTTP client library
  URL:=https://github.com/seanmonstar/rustls
  BUILDONLY:=1
endef

define Package/reqwest-$(PKG_VERSION)/description
  An easy and powerful Rust HTTP Client.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,reqwest-$(PKG_VERSION)))
