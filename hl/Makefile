# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=hl
PKG_VERSION:=0.15.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pamburus/hl/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=b1db30efb77c49623c62da91513b18eacafb9a7e038208513794519f42845ed1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/hl
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Utility for viewing json-formatted log files
  URL:=https://github.com/pamburus/hl
endef

define Package/hl/description
  Log viewer which translates JSON logs into pretty human-readable representation.
endef

define Package/hl/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hl $(1)/opt/usr/bin

	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_BUILD_DIR)/etc/defaults $(1)/opt/share/hl
endef

define Package/hl/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_std="\033[0;0m"

printf "\t$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "create a symlink in \$$HOME, e.g.:"
printf "\t$$ansi_white %s $$ansi_std\n" "ln -s /opt/share/hl ~/.config/hl"
endef

$(eval $(call BuildPackage,hl))
