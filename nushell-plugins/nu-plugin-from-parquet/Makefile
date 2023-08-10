# SPDX-License-Identifier: WTFPL

# XXX nu 0.80.0:
# mips(el)/arm:
#	error[E0599]: no variant or associated item named `bool` found for enum `nu_protocol::Value` in the current scope
#	error: could not compile `nu_plugin_from_parquet` (bin "nu_plugin_from_parquet") due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-from-parquet
PKG_VERSION:=0.0.3
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-07-27
PKG_SOURCE_VERSION:=e33ec56ab898d9bb24eafeccfa2a7dda8b68f02e
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_from_parquet
PKG_MIRROR_HASH:=444a7c488c24c3b517f1183fdd418b4af99092fea4b4255a65eed0ec900cae01

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-from-parquet
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to add parquet support
  URL:=https://github.com/jakeswenson/nu_plugin_from_parquet
  DEPENDS:=+nushell @(aarch64||i386||x86_64)
endef

define Package/nu-plugin-from-parquet/description
  This is a nushell plugin to parse parquet data files into nu structured types.
endef

define Package/nu-plugin-from-parquet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_from_parquet \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-from-parquet/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_from_parquet'\n"
endef

$(eval $(call BuildPackage,nu-plugin-from-parquet))
