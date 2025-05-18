# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=static-web-server
PKG_VERSION:=2.36.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/joseluisq/static-web-server/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=e242e21b3e4b46395bda21b351438df6b5c54b1319a41a86b52eb49ed5567a40

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440

define Package/static-web-server
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Static Web Server
  URL:=https://sws.joseluisq.net/
  DEPENDS:=+libopenssl
endef

define Package/static-web-server/description
  A blazing fast and asynchronous web server for static files-serving.
endef

# error: failed to run custom build command for `openssl-sys v0.9.87`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/static-web-server/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/static-web-server $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,static-web-server))
