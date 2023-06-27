# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-from-bencode
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-04-25
PKG_SOURCE_VERSION:=9717987c85179cc4d7f5b6d15403e426788c1384
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/bluk/nu_plugin_from_bencode
PKG_MIRROR_HASH:=1b25b3496618b119f7c6b2b90b7e81663e5a32a558da386b5663d0fcf68f76e2

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

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_from_bencode'\n"
endef

$(eval $(call BuildPackage,nu-plugin-from-bencode))
