# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-bio
PKG_VERSION:=0.76.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-02-23
PKG_SOURCE_VERSION:=caeb689b038b2558542f6153d8918ae8373ec0b6
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/Euphrasiologist/nu_plugin_bio
PKG_MIRROR_HASH:=489e0d6c5b4eb39bc1c065fb765430a38514366bacac0e92c591904efd76163c

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

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_bio'\n"
endef

$(eval $(call BuildPackage,nu-plugin-bio))
