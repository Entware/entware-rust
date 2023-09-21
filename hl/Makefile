# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=hl
PKG_VERSION:=0.20.0-beta.14.7.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pamburus/hl/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=779b18393fc788422b518d37fbec095a1538edfa864d91a82411f3e6ba716d79

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
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "create a symlink in \$$HOME, e.g.:"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "ln -snf /opt/share/hl ~/.config/hl"
endef

$(eval $(call BuildPackage,hl))
