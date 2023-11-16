# SPDX-License-Identifier: WTFPL

# mips(el)/armv5:
#	error[E0412]: cannot find type `AtomicI64` in this scope
#	error[E0412]: cannot find type `AtomicU64` in this scope
#	error: could not compile `specta` (lib) due to 2 previous errors

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-file
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-27
PKG_SOURCE_VERSION:=7456681f7bf98a1081152c86034df1d927bb47fd
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_file
PKG_MIRROR_HASH:=336bba7433d295430895b949442f18f7a95dbce4a4d7f45fc40e1677913a6e68

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-file
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=a nushell plugin called file
  URL:=https://github.com/fdncred/nu_plugin_file
  DEPENDS:=+nushell @!(mips||mipsel||TARGET_armv5_3_2)
endef

define Package/nu-plugin-file/description
  A nushell plugin that will inspect a file and
  return information based on it's magic number.
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
