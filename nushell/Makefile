# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nushell
PKG_VERSION:=0.78.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/nushell/nushell/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=eff55bf4e0739113cfdc890c0ed90f46ebbfd722b49f7ce65e76b347733bc654

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/nushell/Default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A new type of shell
  URL:=https://www.nushell.sh/
endef

define Package/nushell
  $(call Package/nushell/Default)
  DEPENDS:=+libopenssl +zlib
  EXTRA_DEPENDS:=git-http
  MENU:=1
endef

define Package/nu_plugin_custom_values
  $(call Package/nushell/Default)
  TITLE:=CustomValue plugin for Nushell
  DEPENDS:=nushell
endef

define Package/nu_plugin_gstat
  $(call Package/nushell/Default)
  TITLE:=Git stat plugin for Nushell
  DEPENDS:=nushell
endef

define Package/nu_plugin_inc
  $(call Package/nushell/Default)
  TITLE:=Incrementor plugin for Nushell
  DEPENDS:=nushell
endef

define Package/nu_plugin_query
  $(call Package/nushell/Default)
  TITLE:=Query plugin for Nushell
  DEPENDS:=nushell
endef

define Package/nushell/description
  A new type of shell.
endef

define Package/nu_plugin_custom_values/description
  CustomValue plugin for Nushell.
endef

define Package/nu_plugin_gstat/description
  A git status plugin for Nushell.
endef

define Package/nu_plugin_inc/description
  A version incrementer plugin for Nushell.
endef

define Package/nu_plugin_query/description
  A Nushell plugin to query JSON, XML, and various web data.
endef

#define Package/nushell/conffiles
#/opt/root/.config/nushell/config.nu
#/opt/root/.config/nushell/env.nu
#/opt/root/.config/nushell/plugin.nu
#endef

# XXX mips(el): error[E0425]: cannot find function `write_str_simd` in this scope
CARGO_ARGS += \
	--workspace \
	$(if $(or $(CONFIG_mips),$(CONFIG_mipsel)),,--features dataframe)

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/nushell/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu $(1)/opt/usr/bin
endef

define Package/nu_plugin_custom_values/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_custom_values \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu_plugin_gstat/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_gstat \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu_plugin_inc/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_inc \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu_plugin_query/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_query \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu_plugin_custom_values/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_custom_values'\n"
endef

define Package/nu_plugin_gstat/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_gstat'\n"
endef

define Package/nu_plugin_inc/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_inc'\n"
endef

define Package/nu_plugin_query/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_query'\n"
endef

$(eval $(call BuildPackage,nushell))
$(eval $(call BuildPackage,nu_plugin_custom_values))
$(eval $(call BuildPackage,nu_plugin_gstat))
$(eval $(call BuildPackage,nu_plugin_inc))
$(eval $(call BuildPackage,nu_plugin_query))
