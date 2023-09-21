# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-pnet
PKG_VERSION:=1.2.0
PKG_RELEASE:=5

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-09-06
PKG_SOURCE_VERSION:=9316f0b1b23803676d0075b26cddcd9e88d43858
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_pnet
PKG_MIRROR_HASH:=6fcd682a3a622d6561588767e6aa9db71d2d72b22be065bb80dbdfa4276a2b10

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-pnet
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to list system network interfaces
  URL:=https://github.com/fdncred/nu_plugin_pnet
  DEPENDS:=+nushell
endef

define Package/nu-plugin-pnet/description
  A nushell plugin for enumerating network interfaces in a platform-agnostic way.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/nu-plugin-pnet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_pnet \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-pnet/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_pnet"
endef

$(eval $(call BuildPackage,nu-plugin-pnet))
