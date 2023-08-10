# SPDX-License-Identifier: WTFPL

# mips(el)/arm:
#	Some errors have detailed explanations: E0412, E0425, E0432, E0433, E0599.
#	For more information about an error, try `rustc --explain E0412`.
#	error: could not compile `simd-json` (lib) due to 149 previous errors

include $(TOPDIR)/rules.mk

PKG_NAME:=nushell

ifeq ($(CONFIG_NU_0_80_0),y)
PKG_VERSION:=0.80.0
PKG_RELEASE:=1
PKG_HASH:=6331fe7abeee87b7188639c0ed18ebdb288f188a6de1d12b9f4f046f595cf8ce
PATCH_DIR:=
else
PKG_VERSION:=0.83.1
PKG_RELEASE:=1
PKG_HASH:=a08baef4e487cf200b14cd4a8555110106a947ac439ad8e2759f5ec52c8f9656
endif

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/nushell/nushell/tar.gz/refs/tags/$(PKG_VERSION)?

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

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
endef

define Package/nushell/description
  A new type of shell.
endef

define Package/nu-plugin-custom-values
  $(call Package/nushell/Default)
  TITLE:=CustomValue plugin for Nushell
  DEPENDS:=+nushell
endef

define Package/nu-plugin-custom-values/description
  CustomValue plugin for Nushell.
endef

define Package/nu-plugin-formats
  $(call Package/nushell/Default)
  TITLE:=A nushell plugin to convert data to nushell tables
  DEPENDS:=+nushell
endef

define Package/nu-plugin-formats/description
  An I/O plugin for a set of file formats for Nushell.
endef

define Package/nu-plugin-gstat
  $(call Package/nushell/Default)
  TITLE:=Git stat plugin for Nushell
  DEPENDS:=+nushell
endef

define Package/nu-plugin-gstat/description
  A git status plugin for Nushell.
endef

define Package/nu-plugin-inc
  $(call Package/nushell/Default)
  TITLE:=Incrementor plugin for Nushell
  DEPENDS:=+nushell
endef

define Package/nu-plugin-inc/description
  A version incrementer plugin for Nushell.
endef

define Package/nu-plugin-query
  $(call Package/nushell/Default)
  TITLE:=Query plugin for Nushell
  DEPENDS:=+nushell
endef

define Package/nu-plugin-query/description
  A Nushell plugin to query JSON, XML, and various web data.
endef

define Package/nushell/config
config NU_0_80_0
	bool
	default y if (arm||mips||mipsel)

config NU_0_83_1
	bool
	default y if (aarch64||i386||x86_64)
endef

#define Package/nushell/conffiles
#/opt/root/.config/nushell/config.nu
#/opt/root/.config/nushell/env.nu
#/opt/root/.config/nushell/plugin.nu
#endef

# XXX 3rd-party plugins
define NushellDir
	$(LN) $(PKG_BUILD_DIR) $(BUILD_DIR)/nushell
endef
Hooks/Compile/Post += NushellDir

CARGO_ARGS += \
	--workspace \
	$(if $(CONFIG_NU_0_83_1),--features="extra dataframe")

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/nushell/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu $(1)/opt/usr/bin
endef

define Package/nu-plugin-custom-values/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_custom_values \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-formats/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_formats \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-gstat/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_gstat \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-inc/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_inc \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-query/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_query \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-custom-values/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_custom_values'\n"
endef

define Package/nu-plugin-formats/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_formats'\n"
endef

define Package/nu-plugin-gstat/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_gstat'\n"
endef

define Package/nu-plugin-inc/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_inc'\n"
endef

define Package/nu-plugin-query/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_query'\n"
endef

$(eval $(call BuildPackage,nushell))
$(eval $(call BuildPackage,nu-plugin-custom-values))
$(eval $(call BuildPackage,nu-plugin-formats))
$(eval $(call BuildPackage,nu-plugin-gstat))
$(eval $(call BuildPackage,nu-plugin-inc))
$(eval $(call BuildPackage,nu-plugin-query))
