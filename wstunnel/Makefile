# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=wstunnel
PKG_VERSION:=10.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/erebe/wstunnel/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=ede8dfb23fbab3ed5090a256ea79290c036b04e3312b8ad487d47bc5e71ff570

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += bb8-090 chrono-0441 getrandom-0216 iana-time-zone-0163 \
	rust-bindgen/host

define Package/wstunnel
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tunneling over websocket protocol
  URL:=https://github.com/erebe/wstunnel
  DEPENDS:=+ca-certificates
endef

define Package/wstunnel/description
  Tunnel all your traffic over Websocket or HTTP2.
endef

CARGO_SOURCE_SUBDIR:=wstunnel-cli

# cannot be used when making a shared object; recompile with -fPIC
RUSTFLAGS += -C relocation-model=pic

define Package/wstunnel/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/wstunnel $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,wstunnel))
