# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

# arm|mips(el):
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`

include $(TOPDIR)/rules.mk

PKG_NAME:=http
PKG_VERSION:=2.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/thecoshman/http/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=63ffb4a99684e7afdca6549191e4901cce1407d4b33a2ce6380883373585f044

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442 getrandom-034 iana-time-zone-0164

define Package/httplz
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=a basic http server for hosting a folder fast and simply
  URL:=https://github.com/thecoshman/http
  DEPENDS:=@ARCH_64BIT +libopenssl
endef

define Package/httplz/description
  Host These Things Please - a basic HTTP server for hosting a folder
  fast and simply.
endef

RUSTC_VARS += RUSTC_BOOTSTRAP=1

define Package/httplz/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/httplz $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,httplz))
