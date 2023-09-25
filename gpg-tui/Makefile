# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=gpg-tui
PKG_VERSION:=0.10.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/orhun/gpg-tui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=838a8f29acb646bdfef7e8efcd1d6c93ccd69b0e491e5fa855df779a75122fe7

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/gpg-tui
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Encryption
  TITLE:=a Terminal User Interface for GnuPG
  URL:=https://github.com/orhun/gpg-tui
  DEPENDS:=+gnupg2 +libgpg-error +libgpgme
endef

define Package/gpg-tui/description
  Manage your GnuPG keys with ease!
endef

define Package/gpg-tui/conffiles
/opt/etc/gpg-tui/gpg-tui.toml
endef

define Package/gpg-tui/install
	$(INSTALL_DIR) $(1)/opt/etc/gpg-tui
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/config/*.toml $(1)/opt/etc/gpg-tui
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/gpg-tui $(1)/opt/usr/bin
endef

define Package/gpg-tui/postinst
#!/bin/sh

if ! grep -q "GPG_TUI_CONFIG" /opt/etc/profile; then
  echo -e "\n# set GPG_TUI_CONFIG" >> /opt/etc/profile
  echo "export GPG_TUI_CONFIG=\"/opt/etc/gpg-tui/gpg-tui.toml\"" >> /opt/etc/profile
fi
endef

define Package/gpg-tui/postrm
#!/bin/sh

sed -i '/GPG_TUI_CONFIG/d' /opt/etc/profile
endef

$(eval $(call BuildPackage,gpg-tui))
