# SPDX-License-Identifier: WTFPL

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-dns
PKG_VERSION:=1.0.4-alpha.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-21
PKG_SOURCE_VERSION:=2c245f75bda308277f4a4e98a48f361b5c0ad26a
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/dead10ck/nu_plugin_dns
PKG_MIRROR_HASH:=2f19300bbef7489eb1d065702c0cca8c61916515e9f71684249b676f0d966644

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-dns
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A DNS utility for nushell
  URL:=https://github.com/dead10ck/nu_plugin_dns
  DEPENDS:=+nushell #@!(mips||mipsel)
endef

define Package/nu-plugin-dns/description
  Nushell plugin that does DNS queries and parses results into meaningful types.
endef

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/nu-plugin-dns/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_dns \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-dns/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_dns"
endef

$(eval $(call BuildPackage,nu-plugin-dns))
