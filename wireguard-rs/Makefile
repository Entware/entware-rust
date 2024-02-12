# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`
# armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `wireguard-rs` due to 10 previous errors; 2 warnings emitted

include $(TOPDIR)/rules.mk

PKG_NAME:=wireguard-rs
PKG_VERSION:=0.1.1
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/WireGuard/wireguard-rs
PKG_SOURCE_VERSION:=7d84ef9064559a29b23ab86036f7ef62b450f90c
PKG_MIRROR_HASH:=8c42b74d94a2a9d4973e7749f375c87128bfcefcf626c0266301483f14234d97

PKG_LICENSE:=BSD
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += ring-0175

define Package/wireguard-rs
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=fast, modern, secure vpn tunnel
  URL:=https://www.wireguard.com/
  DEPENDS:=@!LINUX_2_6_36
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
