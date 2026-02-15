# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nushell
PKG_VERSION:=0.106.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/nushell/nushell/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=3e24044c354d050a850b69dc77c99cc503542c3d9d75fed0aef1c12fefdf380b

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0440 getrandom-0216 getrandom-033 iana-time-zone-0161 openssl-probe-015

define Package/nushell/Default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A new type of shell
  URL:=https://www.nushell.sh
endef

define Package/nushell
  $(call Package/nushell/Default)
  DEPENDS:=+libopenssl
  EXTRA_DEPENDS:=git-http
endef

define Package/nushell/description
  A new type of shell.
endef

define Package/nu-plugin-custom-values
  $(call Package/nushell/Default)
  TITLE:=CustomValue plugin for Nushell
  EXTRA_DEPENDS:=nushell (=$(PKG_VERSION)-$(PKG_RELEASE))
endef

define Package/nu-plugin-custom-values/description
  CustomValue plugin for Nushell.
endef

define Package/nu-plugin-formats
  $(call Package/nushell/Default)
  TITLE:=A nushell plugin to convert data to nushell tables
  EXTRA_DEPENDS:=nushell (=$(PKG_VERSION)-$(PKG_RELEASE))
endef

define Package/nu-plugin-formats/description
  An I/O plugin for a set of file formats for Nushell.
endef

define Package/nu-plugin-gstat
  $(call Package/nushell/Default)
  TITLE:=Git stat plugin for Nushell
  DEPENDS:=+libopenssl
  EXTRA_DEPENDS:=nushell (=$(PKG_VERSION)-$(PKG_RELEASE))
endef

define Package/nu-plugin-gstat/description
  A git status plugin for Nushell.
endef

define Package/nu-plugin-inc
  $(call Package/nushell/Default)
  TITLE:=Incrementor plugin for Nushell
  EXTRA_DEPENDS:=nushell (=$(PKG_VERSION)-$(PKG_RELEASE))
endef

define Package/nu-plugin-inc/description
  A version incrementer plugin for Nushell.
endef

define Package/nu-plugin-query
  $(call Package/nushell/Default)
  TITLE:=Query plugin for Nushell
  DEPENDS:=+libcurl
  EXTRA_DEPENDS:=nushell (=$(PKG_VERSION)-$(PKG_RELEASE))
endef

define Package/nu-plugin-query/description
  A Nushell plugin to query JSON, XML, and various web data.
endef

define Package/nu-plugin-stress-internals
  $(call Package/nushell/Default)
  TITLE:=Used to test behavior of plugin protocol
  EXTRA_DEPENDS:=nushell (=$(PKG_VERSION)-$(PKG_RELEASE))
endef

define Package/nu-plugin-stress-internals/description
  A test plugin for Nushell to stress aspects of the internals.
endef

CARGO_ARGS += \
	--workspace \
	$(if $(CONFIG_ARCH_64BIT),,--exclude nu_plugin_polars)

# arm/mips(el): undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'
ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += -l dylib=atomic
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

define Package/nu-plugin-stress-internals/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_stress_internals \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-custom-values/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_custom_values"
endef

define Package/nu-plugin-formats/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_formats"
endef

define Package/nu-plugin-gstat/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_gstat"
endef

define Package/nu-plugin-inc/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_inc"
endef

define Package/nu-plugin-query/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_query"
endef

define Package/nu-plugin-stress-internals/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_stress_internals"
endef

$(eval $(call BuildPackage,nushell))
$(eval $(call BuildPackage,nu-plugin-custom-values))
$(eval $(call BuildPackage,nu-plugin-formats))
$(eval $(call BuildPackage,nu-plugin-gstat))
$(eval $(call BuildPackage,nu-plugin-inc))
$(eval $(call BuildPackage,nu-plugin-query))
#$(eval $(call BuildPackage,nu-plugin-stress-internals))
