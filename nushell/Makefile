# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nushell
PKG_VERSION:=0.79.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/nushell/nushell/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=cbabc26ce509c672db943f3ac6d44d1e3efbafc3b5929411ac209afe14848ef7

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

define Package/nu-plugin-custom-values
  $(call Package/nushell/Default)
  TITLE:=CustomValue plugin for Nushell
  DEPENDS:=nushell
endef

define Package/nu-plugin-formats
  $(call Package/nushell/Default)
  TITLE:=A nushell plugin to convert data to nushell tables
  DEPENDS:=nushell
endef

define Package/nu-plugin-gstat
  $(call Package/nushell/Default)
  TITLE:=Git stat plugin for Nushell
  DEPENDS:=nushell
endef

define Package/nu-plugin-inc
  $(call Package/nushell/Default)
  TITLE:=Incrementor plugin for Nushell
  DEPENDS:=nushell
endef

define Package/nu-plugin-query
  $(call Package/nushell/Default)
  TITLE:=Query plugin for Nushell
  DEPENDS:=nushell
endef

define Package/nushell/description
  A new type of shell.
endef

define Package/nu-plugin-custom-values/description
  CustomValue plugin for Nushell.
endef

define Package/nu-plugin-formats/description
  An I/O plugin for a set of file formats for Nushell.
endef

define Package/nu-plugin-gstat/description
  A git status plugin for Nushell.
endef

define Package/nu-plugin-inc/description
  A version incrementer plugin for Nushell.
endef

define Package/nu-plugin-query/description
  A Nushell plugin to query JSON, XML, and various web data.
endef

#define Package/nushell/conffiles
#/opt/root/.config/nushell/config.nu
#/opt/root/.config/nushell/env.nu
#/opt/root/.config/nushell/plugin.nu
#endef

# FIXME
# mips(el)/armv(5/7)
#	Some errors have detailed explanations: E0412, E0425, E0432, E0433, E0599.
#	For more information about an error, try `rustc --explain E0412`.
#	error: could not compile `simd-json` due to 149 previous errors
CARGO_ARGS += \
	--workspace \
	$(if $(or $(CONFIG_arm),$(CONFIG_mips),$(CONFIG_mipsel)),,--features dataframe)

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
