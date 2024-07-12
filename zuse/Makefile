# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=zuse
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/19h/zuse/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=923df58ec1a7fabb21b66c8b87bc9351ba2421411849e2580f7007ffe45290e7

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=readme.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/zuse
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A flexible high-performance uptime bot
  URL:=https://github.com/19h/zuse
  DEPENDS:=+libopenssl
endef

define Package/zuse/description
  A flexible high-performance uptime bot powered by async Rust with
  Telegram, SNS and Slack notification backends.
endef

# error: failed to run custom build command for `openssl-sys v0.9.98`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

define Package/zuse/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/zuse $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,zuse))
