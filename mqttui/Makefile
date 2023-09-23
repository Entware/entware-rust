# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=mqttui
PKG_VERSION:=0.19.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/EdJoPaTo/mqttui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=76d39f14920eb1cf1a65239f1e54c840f20b35c2be96f074819be5175427a7e7

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

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

# FIXME
# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`
ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
CARGO_ARGS += --no-default-features
endif

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/mqttui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/mqttui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,mqttui))
