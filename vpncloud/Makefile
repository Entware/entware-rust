# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=vpncloud
PKG_VERSION:=2.3.0
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dswd/vpncloud/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=b1f3ee63458899d43ca3515322246ad8a2a5a5de6cc9da84927f486e110d9789

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/vpncloud
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Peer-to-Peer VPN
  URL:=https://vpncloud.ddswd.de
  DEPENDS:=@!(mips||mipsel)
endef

define Package/vpncloud/description
  VpnCloud is a high performance peer-to-peer mesh VPN over UDP supporting
  strong encryption, NAT traversal and a simple configuration. It establishes
  a fully-meshed self-healing VPN network in a peer-to-peer manner with strong
  end-to-end encryption based on elliptic curve keys and AES-256. VpnCloud
  creates a virtual network interface on the host and forwards all received
  data via UDP to the destination. It can work on TUN devices (IP based) and
  TAP devices (Ethernet based).
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
