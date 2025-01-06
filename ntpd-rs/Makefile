# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=ntpd-rs
PKG_VERSION:=1.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pendulum-project/ntpd-rs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=172210e8ef5f4fbac9b09f211cedc6bebce0f2686870ba33dd87cb579da07e80

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=COPYING LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/ntpd-rs
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Time Synchronization
  TITLE:=Full-featured implementation of NTP with NTS support
  URL:=https://github.com/pendulum-project/ntpd-rs
endef

define Package/ntpd-rs/description
  A full-featured implementation of the Network Time Protocol,
  including NTS support. 
endef

define Package/ntpd-rs/conffiles
/opt/etc/ntpd-rs/ntp.toml
endef

define Package/ntpd-rs/install
	$(INSTALL_DIR) $(1)/opt/etc/ntpd-rs
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/docs/examples/conf/ntp.toml.default \
			$(1)/opt/etc/ntpd-rs
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ntp.toml $(1)/opt/etc/ntpd-rs
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S65ntp-daemon $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/bin/ntp-{ctl,daemon} $(1)/opt/usr/bin
#	$(INSTALL_BIN) \
#		$(PKG_INSTALL_DIR)/opt/bin/ntp-metrics-exporter $(1)/opt/usr/bin
#	$(INSTALL_BIN) \
#		$(PKG_INSTALL_DIR)/opt/bin/nts-pool-ke $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/var/run/ntpd-rs
endef

$(eval $(call BuildPackage,ntpd-rs))
