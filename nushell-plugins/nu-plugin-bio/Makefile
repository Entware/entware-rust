# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-bio
PKG_VERSION:=0.85.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-21
PKG_SOURCE_VERSION:=6d1ec66c16e6ccf372b6058769bfd6630f217409
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/Euphrasiologist/nu_plugin_bio
PKG_MIRROR_HASH:=05107e1c7aa9366bd7d1bdfc906aa811d4dce434ec2e44bc6a62e70e7b6e46e7

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-bio
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=Bioinformatics plugin for nushell
  URL:=https://github.com/Euphrasiologist/nu_plugin_bio
  DEPENDS:=+liblzma +nushell
endef

define Package/nu-plugin-bio/description
  Parse and manipulate common bioinformatic formats in nushell.
endef

define Package/nu-plugin-bio/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_bio \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-bio/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_bio"
endef

$(eval $(call BuildPackage,nu-plugin-bio))
