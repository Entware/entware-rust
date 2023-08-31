# SPDX-License-Identifier: WTFPL

# XXX nu 0.80.0:
# mips(el)/arm:
#	error[E0277]: the trait bound `nu_protocol::Value: From<Spanned<IndexMap<std::string::String, nu_protocol::Value>>>` is not satisfied
#	error: could not compile `nu_plugin_from_bencode` (lib) due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-from-bencode
PKG_VERSION:=0.5.0
PKG_RELEASE:=3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-08-27
PKG_SOURCE_VERSION:=c7c799a2750709f6e2b91e822e1cbf5276333dd6
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/bluk/nu_plugin_from_bencode
PKG_MIRROR_HASH:=56fa3cbd5c85bae2aaf4e4da8086f26bcbc687b09fc736e53d8cda21c9596a88

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
  DEPENDS:=+nushell @(aarch64||i386||x86_64)
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
