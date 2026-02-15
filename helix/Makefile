# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=helix
PKG_VERSION:=25.07.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/helix-editor/helix/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=27c8bc3eba46bc7bab1e3629c6b28ff94882eeff17366b3ea69cd8ceffba7541

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0441 getrandom-0215 getrandom-031 iana-time-zone-0163 nucleo-050

define Package/helix
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Editors
  TITLE:=A post-modern modal text editor
  URL:=https://helix-editor.com
  DEPENDS:=+libstdcpp
endef

define Package/helix/description
  A Kakoune/Neovim inspired editor, written in Rust.
endef

ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
  define Build/Prepare
	$(Build/Prepare/Default)
	patch -p1 -d $(PKG_BUILD_DIR) < ./patches-32bit/010-fix.patch
  endef
endif

define Package/helix/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hx $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/share/helix
	$(CP) $(PKG_BUILD_DIR)/runtime $(1)/opt/share/helix
	rm -fr $(1)/opt/share/helix/runtime/grammars/sources
endef

define Package/helix/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "create a symlink in \$$HOME, e.g.:"
printf "\t$$ansi_white %s $$ansi_std\n\n" "ln -nsf /opt/share/helix ~/.config/helix"
endef

$(eval $(call BuildPackage,helix))
