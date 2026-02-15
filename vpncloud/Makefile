# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=vpncloud
PKG_REAL_VERSION:=2.4.0
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-03-21
PKG_SOURCE_VERSION:=bef99162fe0d66e2c9fbf6421a69ca8ec2ac8f55
PKG_SOURCE_URL:=https://github.com/dswd/vpncloud
PKG_MIRROR_HASH:=8acd1a09b451c196c1d690e808e6e4db5b9385c68daf9cfa84db911925d252db

PKG_VERSION:=$(PKG_REAL_VERSION)_git$(subst -,,$(PKG_SOURCE_DATE))~$(call version_abbrev,$(PKG_SOURCE_VERSION))

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0441 getrandom-0215 iana-time-zone-0163

define Package/vpncloud
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Peer-to-Peer VPN
  URL:=https://vpncloud.ddswd.de
  DEPENDS:=@!(mips||mipsel)
endef

define Package/vpncloud/description
  VpnCloud is a high performance peer-to-peer mesh VPN over UDP
 supporting strong encryption, NAT traversal and a simple configuration. It
 establishes a fully-meshed self-healing VPN network in a peer-to-peer manner
 with strong end-to-end encryption based on elliptic curve keys and AES-256.
 VpnCloud creates a virtual network interface on the host and forwards all
 received data via UDP to the destination. It can work on TUN devices (IP based)
 and TAP devices (Ethernet based).
endef

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/vpncloud/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/vpncloud $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/etc/vpncloud
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/assets/example.net.disabled \
		$(1)/opt/etc/vpncloud
endef

$(eval $(call BuildPackage,vpncloud))
