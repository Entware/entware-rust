# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=mqttui
PKG_VERSION:=0.24.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/EdJoPaTo/mqttui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=287de6901f43bf1d879be25acffb02f7601e023afc90b11c8e0504e757a6589f

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0445 getrandom-0217 getrandom-034 getrandom-043 iana-time-zone-0164

define Package/mqttui
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Terminal
  TITLE:=MQTT Terminal UI
  URL:=https://github.com/EdJoPaTo/mqttui
  EXTRA_DEPENDS:=mosquitto
endef

define Package/mqttui/description
  Subscribe to a MQTT Topic or publish something quickly from the terminal.
endef

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/mqttui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/mqttui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,mqttui))
