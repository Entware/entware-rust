# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-from-bencode
PKG_VERSION:=0.7.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-21
PKG_SOURCE_VERSION:=469f17f5d49ecb6274b8df88bf4c8a0cc965f199
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/bluk/nu_plugin_from_bencode
PKG_MIRROR_HASH:=98ad236f3e683faf266877001a805608db6f3f2f644123652b344d9085b7d675

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-from-bencode
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to convert bencode data
  URL:=https://github.com/bluk/nu_plugin_from_bencode
  DEPENDS:=+nushell
endef

define Package/nu-plugin-from-bencode/description
  A converter plugin from the bencode format for Nushell.
endef

define Package/nu-plugin-from-bencode/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_from_bencode \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-from-bencode/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_from_bencode"
endef

$(eval $(call BuildPackage,nu-plugin-from-bencode))
