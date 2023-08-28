# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=shadowsocks-rust
PKG_VERSION:=1.15.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/shadowsocks/shadowsocks-rust/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=d3077af7d292ff2a0d36e9debb2104e37ad998deac4dd6eb0674b8fe7d41cf20

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_CONFIG_DEPENDS:= \
	CONFIG_SS_RUST_AEAD_CIPHER_2022 \
	CONFIG_SS_RUST_AEAD_CIPHER_2022_EXTRA \
	CONFIG_SS_RUST_AEAD_CIPHER_EXTRA \
	CONFIG_SS_RUST_DNS_OVER_HTTPS \
	CONFIG_SS_RUST_DNS_OVER_TLS \
	CONFIG_SS_RUST_LOCAL \
	CONFIG_SS_RUST_LOCAL_DNS \
	CONFIG_SS_RUST_LOCAL_HTTP \
	CONFIG_SS_RUST_LOCAL_HTTP_NATIVE_TLS \
	CONFIG_SS_RUST_LOCAL_HTTP_RUSTLS \
	CONFIG_SS_RUST_LOCAL_REDIR \
	CONFIG_SS_RUST_LOCAL_SOCKS4 \
	CONFIG_SS_RUST_LOCAL_TUN \
	CONFIG_SS_RUST_LOCAL_TUNNEL \
	CONFIG_SS_RUST_LOGGING \
	CONFIG_SS_RUST_MANAGER \
	CONFIG_SS_RUST_MULTI_THREADED \
	CONFIG_SS_RUST_SECURITY_REPLAY_ATTACK_DETECT \
	CONFIG_SS_RUST_SERVER \
	CONFIG_SS_RUST_SERVICE \
	CONFIG_SS_RUST_STREAM_CIPHER \
	CONFIG_SS_RUST_TRUST_DNS \
	CONFIG_SS_RUST_UTILITY

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/shadowsocks-rust
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A Rust port of shadowsocks
  URL:=https://github.com/shadowsocks/shadowsocks-rust
  DEPENDS:=+SS_RUST_LOCAL_HTTP_NATIVE_TLS:libopenssl
  MENU:=1
endef

define Package/shadowsocks-rust/description
  This is a port of shadowsocks.
  .
  shadowsocks is a fast tunnel proxy that helps you bypass firewalls.
endef

define Package/shadowsocks-rust/config
source "$(SOURCE)/Config.in"
endef

define Package/shadowsocks-rust/conffiles
/opt/etc/shadowsocks-rust/config.json
endef

DEFAULT_FEATURES:= \
	$(if $(CONFIG_SS_RUST_AEAD_CIPHER_2022),aead-cipher-2022) \
	$(if $(CONFIG_SS_RUST_LOCAL),local) \
	$(if $(CONFIG_SS_RUST_LOCAL_HTTP),local-http) \
	$(if $(CONFIG_SS_RUST_LOCAL_SOCKS4),local-socks4) \
	$(if $(CONFIG_SS_RUST_LOCAL_TUNNEL),local-tunnel) \
	$(if $(CONFIG_SS_RUST_LOGGING),logging) \
	$(if $(CONFIG_SS_RUST_MANAGER),manager) \
	$(if $(CONFIG_SS_RUST_MULTI_THREADED),multi-threaded) \
	$(if $(CONFIG_SS_RUST_SERVER),server) \
	$(if $(CONFIG_SS_RUST_SERVICE),service) \
	$(if $(CONFIG_SS_RUST_TRUST_DNS),trust-dns) \
	$(if $(CONFIG_SS_RUST_UTILITY),utility)

FEATURES:= \
	$(if $(CONFIG_SS_RUST_AEAD_CIPHER_2022_EXTRA),aead-cipher-2022-extra) \
	$(if $(CONFIG_SS_RUST_AEAD_CIPHER_EXTRA),aead-cipher-extra) \
	$(if $(CONFIG_SS_RUST_DNS_OVER_HTTPS),dns-over-https) \
	$(if $(CONFIG_SS_RUST_DNS_OVER_TLS),dns-over-tls) \
	$(if $(CONFIG_SS_RUST_LOCAL_DNS),local-dns) \
	$(if $(CONFIG_SS_RUST_LOCAL_HTTP_NATIVE_TLS),local-http-native-tls) \
	$(if $(CONFIG_SS_RUST_LOCAL_HTTP_RUSTLS),local-http-rustls) \
	$(if $(CONFIG_SS_RUST_LOCAL_REDIR),local-redir) \
	$(if $(CONFIG_SS_RUST_LOCAL_TUN),local-tun) \
	$(if $(CONFIG_SS_RUST_SECURITY_REPLAY_ATTACK_DETECT),security-replay-attack-detect) \
	$(if $(CONFIG_SS_RUST_STREAM_CIPHER),stream-cipher)

CARGO_ARGS += --no-default-features --features "$(DEFAULT_FEATURES) $(FEATURES)"

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/shadowsocks-rust/install
	$(INSTALL_DIR) $(1)/opt/etc/shadowsocks-rust
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/examples/config*.json \
		$(1)/opt/etc/shadowsocks-rust

  ifeq ($(CONFIG_SS_RUST_LOCAL),y)
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sslocal $(1)/opt/usr/bin
  endif
  ifeq ($(CONFIG_SS_RUST_MANAGER),y)
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ssmanager $(1)/opt/usr/bin
  endif
  ifeq ($(CONFIG_SS_RUST_SERVER),y)
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ssserver $(1)/opt/usr/bin
  endif
  ifeq ($(CONFIG_SS_RUST_SERVICE),y)
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ssservice $(1)/opt/usr/bin
  endif
  ifeq ($(CONFIG_SS_RUST_UTILITY),y)
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ssurl $(1)/opt/usr/bin
  endif
endef

$(eval $(call BuildPackage,shadowsocks-rust))
