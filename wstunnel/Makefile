# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=wstunnel
PKG_VERSION:=10.5.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/erebe/wstunnel/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=cf600e97ec15d243be6f32f5418ff48ab59f0714258f18f7dc7b95759847a9d7

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0442 getrandom-0216 getrandom-034 iana-time-zone-0164 \
	rust-bindgen/host

define Package/wstunnel
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tunneling over websocket protocol
  URL:=https://github.com/erebe/wstunnel
  EXTRA_DEPENDS:=ca-certificates
endef

define Package/wstunnel/description
  Tunnel all your traffic over Websocket or HTTP2.
endef

# cannot be used when making a shared object; recompile with -fPIC
CARGO_ARGS += --no-default-features --features=ring
RUSTFLAGS += -C relocation-model=pic

define Package/wstunnel/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/wstunnel $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,wstunnel))
