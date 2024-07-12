# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error[E0412]: cannot find type `AtomicI64` in this scope
#	error[E0412]: cannot find type `AtomicU64` in this scope
#	error: could not compile `specta` (lib) due to 2 previous errors

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-file
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-04-08
PKG_SOURCE_VERSION:=151ba6dd2a488889f8ecf5beaa1eaaa073c3b107
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_file
PKG_MIRROR_HASH:=352be3b96704315cf082c6ffb0135e37972595d220ebc1515877e7cbf1f40e35

PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0435 specta-105

define Package/nu-plugin-file
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=a nushell plugin called file
  URL:=https://github.com/fdncred/nu_plugin_file
  DEPENDS:=+nushell
endef

define Package/nu-plugin-file/description
  A nushell plugin that will inspect a file and return information
  based on it's magic number.
endef

define Package/nu-plugin-file/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_file \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-file/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_file"
endef

$(eval $(call BuildPackage,nu-plugin-file))
