# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=mqttui
PKG_VERSION:=0.21.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/EdJoPaTo/mqttui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=34caa9a540c107738b7156f8a67cbbd2d1f6a25522f964142943aae7d3099501

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438

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
