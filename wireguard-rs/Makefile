# SPDX-License-Identifier: WTFPL

# XXX depends on "ring"

include $(TOPDIR)/rules.mk

PKG_NAME:=wireguard-rs
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/WireGuard/wireguard-rs
PKG_SOURCE_VERSION:=7d84ef9064559a29b23ab86036f7ef62b450f90c
PKG_MIRROR_HASH:=8c42b74d94a2a9d4973e7749f375c87128bfcefcf626c0266301483f14234d97

PKG_LICENSE:=BSD
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/wireguard-rs
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=fast, modern, secure vpn tunnel
  URL:=https://www.wireguard.com/
  DEPENDS:=@!(mips||mipsel)
endef

define Package/wireguard-rs/description
  Cross-platform high-performance userspace implementation of WireGuard in Rust.
endef

ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/wireguard-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/wireguard-rs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,wireguard-rs))
