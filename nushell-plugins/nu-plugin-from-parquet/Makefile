# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-from-parquet
PKG_VERSION:=0.0.3
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-07-14
PKG_SOURCE_VERSION:=e68f01d891637ad35d24402bcb0bf5cc157d8820
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_from_parquet
PKG_MIRROR_HASH:=b7c223f95d40649fc799d34d5184cb061c755daa35be59b1f5cbc766af308dae

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
  DEPENDS:=+nushell
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
