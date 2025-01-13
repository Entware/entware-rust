# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=shadowsocks-rust
PKG_VERSION:=1.22.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/shadowsocks/shadowsocks-rust/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=2857372667b66aa7f8ef2d27a8a19209cbf3e5da2e6d1d1d493411d72d173861

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

PKG_CONFIG_DEPENDS:= \
	CONFIG_SS_RUST_AEAD \
	CONFIG_SS_RUST_AEAD_CIPHER_2022 \
	CONFIG_SS_RUST_AEAD_CIPHER_2022_EXTRA \
	CONFIG_SS_RUST_AEAD_CIPHER_EXTRA \
	CONFIG_SS_RUST_DNS_OVER_H3 \
	CONFIG_SS_RUST_DNS_OVER_HTTPS \
	CONFIG_SS_RUST_DNS_OVER_NATIVE_TLS \
	CONFIG_SS_RUST_DNS_OVER_TLS \
	CONFIG_SS_RUST_HICKORY_DNS \
	CONFIG_SS_RUST_LOCAL_DNS \
	CONFIG_SS_RUST_LOCAL_FAKE_DNS \
	CONFIG_SS_RUST_LOCAL_HTTP \
	CONFIG_SS_RUST_LOCAL_HTTP_NATIVE_TLS \
	CONFIG_SS_RUST_LOCAL_HTTP_RUSTLS \
	CONFIG_SS_RUST_LOCAL_ONLINE_CONFIG \
	CONFIG_SS_RUST_LOCAL_REDIR \
	CONFIG_SS_RUST_LOCAL_SOCKS4 \
	CONFIG_SS_RUST_LOCAL_TUN \
	CONFIG_SS_RUST_LOCAL_TUNNEL \
	CONFIG_SS_RUST_LOGGING \
	CONFIG_SS_RUST_MULTI_THREADED \
	CONFIG_SS_RUST_SECURITY_REPLAY_ATTACK_DETECT \
	CONFIG_SS_RUST_STREAM_CIPHER \
	CONFIG_SS_RUST_UTILITY_URL_OUTLINE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 getrandom-0215 iana-time-zone-0161

define Package/shadowsocks-rust/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A Rust port of shadowsocks
  URL:=https://github.com/shadowsocks/shadowsocks-rust
endef

define Package/shadowsocks-rust
  $(call Package/shadowsocks-rust/Default)
  MENU:=1
endef

define Package/shadowsocks-rust-local
  $(call Package/shadowsocks-rust/Default)
  TITLE:=local server (sslocal)
  DEPENDS:=shadowsocks-rust +SS_RUST_LOCAL_HTTP_NATIVE_TLS:libopenssl
endef

define Package/shadowsocks-rust-manager
  $(call Package/shadowsocks-rust/Default)
  TITLE:=manager server (ssmanager)
  DEPENDS:=+shadowsocks-rust-server
endef

define Package/shadowsocks-rust-server
  $(call Package/shadowsocks-rust/Default)
  TITLE:=remote server (ssserver)
  DEPENDS:=shadowsocks-rust
endef

define Package/shadowsocks-rust-service
  $(call Package/shadowsocks-rust/Default)
  TITLE:=service (ssservice)
  DEPENDS:= \
	+shadowsocks-rust-local \
	+shadowsocks-rust-manager \
	+shadowsocks-rust-server
endef

define Package/shadowsocks-rust-utility
  $(call Package/shadowsocks-rust/Default)
  TITLE:=encode and decode ShadowSocks URL (ssurl)
  DEPENDS:=+shadowsocks-rust-local +SS_RUST_LOCAL_HTTP_NATIVE_TLS:libopenssl
endef

define Package/shadowsocks-rust/description
  This is a port of shadowsocks.
  shadowsocks is a fast tunnel proxy that helps you bypass firewalls.
endef

Package/shadowsocks-rust-local/description=$(Package/shadowsocks-rust/description)
Package/shadowsocks-rust-manager/description=$(Package/shadowsocks-rust/description)
Package/shadowsocks-rust-server/description=$(Package/shadowsocks-rust/description)
Package/shadowsocks-rust-service/description=$(Package/shadowsocks-rust/description)
Package/shadowsocks-rust-utility/description=$(Package/shadowsocks-rust/description)

define Package/shadowsocks-rust/config
source "$(SOURCE)/Config.in"
endef

define Package/shadowsocks-rust/conffiles
/opt/etc/shadowsocks-rust/config.json
endef

BINS:=local manager server service utility

DEFAULT_FEATURES:= \
	$(if $(CONFIG_SS_RUST_AEAD),aead-cipher) \
	$(if $(CONFIG_SS_RUST_AEAD_CIPHER_2022),aead-cipher-2022) \
	$(if $(CONFIG_SS_RUST_HICKORY_DNS),hickory-dns) \
	$(if $(CONFIG_SS_RUST_LOCAL_HTTP),local-http) \
	$(if $(CONFIG_SS_RUST_LOCAL_SOCKS4),local-socks4) \
	$(if $(CONFIG_SS_RUST_LOCAL_TUNNEL),local-tunnel) \
	$(if $(CONFIG_SS_RUST_LOGGING),logging) \
	$(if $(CONFIG_SS_RUST_MULTI_THREADED),multi-threaded)

FEATURES:= \
	$(if $(CONFIG_SS_RUST_AEAD_CIPHER_2022_EXTRA),aead-cipher-2022-extra) \
	$(if $(CONFIG_SS_RUST_AEAD_CIPHER_EXTRA),aead-cipher-extra) \
	$(if $(CONFIG_SS_RUST_DNS_OVER_H3),dns-over-h3) \
	$(if $(CONFIG_SS_RUST_DNS_OVER_HTTPS),dns-over-https) \
	$(if $(CONFIG_SS_RUST_DNS_OVER_NATIVE_TLS),dns-over-native-tls) \
	$(if $(CONFIG_SS_RUST_DNS_OVER_TLS),dns-over-tls) \
	$(if $(CONFIG_SS_RUST_LOCAL_DNS),local-dns) \
	$(if $(CONFIG_SS_RUST_LOCAL_FAKE_DNS),local-fake-dns) \
	$(if $(CONFIG_SS_RUST_LOCAL_HTTP_NATIVE_TLS),local-http-native-tls) \
	$(if $(CONFIG_SS_RUST_LOCAL_HTTP_RUSTLS),local-http-rustls) \
	$(if $(CONFIG_SS_RUST_LOCAL_ONLINE_CONFIG),local-online-config) \
	$(if $(CONFIG_SS_RUST_LOCAL_REDIR),local-redir) \
	$(if $(CONFIG_SS_RUST_LOCAL_TUN),local-tun) \
	$(if $(CONFIG_SS_RUST_SECURITY_REPLAY_ATTACK_DETECT),security-replay-attack-detect) \
	$(if $(CONFIG_SS_RUST_STREAM_CIPHER),stream-cipher) \
	$(if $(CONFIG_SS_RUST_UTILITY_URL_OUTLINE),utility-url-outline)

CARGO_ARGS += --no-default-features --features "$(BINS) $(DEFAULT_FEATURES) $(FEATURES)"

# error: failed to run custom build command for `openssl-sys v0.9.102`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

define Package/shadowsocks-rust/install
	$(INSTALL_DIR) $(1)/opt/etc/shadowsocks-rust
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/examples/config*.json \
		$(1)/opt/etc/shadowsocks-rust
endef

define Package/shadowsocks-rust-local/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sslocal $(1)/opt/usr/bin
endef

define Package/shadowsocks-rust-manager/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ssmanager $(1)/opt/usr/bin
endef

define Package/shadowsocks-rust-server/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ssserver $(1)/opt/usr/bin
endef

define Package/shadowsocks-rust-service/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ssservice $(1)/opt/usr/bin
endef

define Package/shadowsocks-rust-utility/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ssurl $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,shadowsocks-rust))
$(eval $(call BuildPackage,shadowsocks-rust-local))
$(eval $(call BuildPackage,shadowsocks-rust-manager))
$(eval $(call BuildPackage,shadowsocks-rust-server))
$(eval $(call BuildPackage,shadowsocks-rust-service))
$(eval $(call BuildPackage,shadowsocks-rust-utility))
