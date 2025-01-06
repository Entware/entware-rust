# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=xiu
PKG_VERSION:=0.13.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/harlanc/xiu/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=a842ce4e11d32b62b2f9e8604751e18b533edc2307864bcc1c6acfe2e710f2da

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438

define Package/xiu
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=A powerful live server by Rust
  URL:=https://www.rustxiu.com/
  DEPENDS:=+libopenssl +libopus
endef

define Package/xiu/description
 Xiu is a simple,high performance and secure live media server
 written in pure Rust.
endef

define Package/xiu/conffiles
/opt/etc/xiu/
endef

# error: failed to run custom build command for `openssl-sys v0.9.96`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

define Package/xiu/install
	$(INSTALL_DIR) $(1)/opt/etc/xiu
	$(CP) $(PKG_BUILD_DIR)/application/xiu/src/config/examples/*.toml \
		$(1)/opt/etc/xiu
	$(INSTALL_DIR) $(1)/opt/usr/bin
#	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/http-server $(1)/opt/usr/bin
#	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/pprtmp $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/xiu $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,xiu))
