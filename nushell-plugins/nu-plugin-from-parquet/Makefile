# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-from-parquet
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-27
PKG_SOURCE_VERSION:=6df8ebf0248193b162fb025bff2181be741c4024
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_from_parquet
PKG_MIRROR_HASH:=38b7c8a8053879cfaa940d0e16318f8b63d44e48cc3b09ad70b07a54da444635

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

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_from_parquet"
endef

$(eval $(call BuildPackage,nu-plugin-from-parquet))
