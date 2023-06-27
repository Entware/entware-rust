# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-pnet
PKG_VERSION:=1.2.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-02-09
PKG_SOURCE_VERSION:=4dd61ab30877ec3e70780fc58846d1c80768f7e8
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_pnet
PKG_MIRROR_HASH:=dbef94deeebc733a50893ef9538353709f517f4458264c62d40a2b1302ab57f3

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-pnet
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to list system network interfaces
  URL:=https://github.com/fdncred/nu_plugin_pnet
  DEPENDS:=+nushell
endef

define Package/nu-plugin-pnet/description
  A nushell plugin for enumerating network interfaces in a platform-agnostic way.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/nu-plugin-pnet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_pnet \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-pnet/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_pnet'\n"
endef

$(eval $(call BuildPackage,nu-plugin-pnet))
