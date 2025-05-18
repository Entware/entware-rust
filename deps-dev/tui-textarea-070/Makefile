# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

# XXX mips(el) (gitui)

include $(TOPDIR)/rules.mk

PKG_NAME:=tui-textarea
PKG_VERSION:=0.7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rhysd/tui-textarea/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=93e84d5fc74134be66b3766e652ca89eab1b6a38f4c16570d02cc730f21e668f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.txt

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/tui-textarea-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=a simple yet powerful text editor widget
  URL:=https://github.com/rhysd/tui-textarea
  BUILDONLY:=1
endef

define Package/tui-textarea-$(PKG_VERSION)/description
  tui-textarea is a simple yet powerful text editor widget for
  ratatui and tui-rs. Multi-line text editor can be easily put as part of your
  TUI application.
endef

ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
  define Build/Prepare
	$(Build/Prepare/Default)
	patch -p1 -d $(PKG_BUILD_DIR) < ./patches-32bit/010-fix.patch
  endef
endif

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,tui-textarea-$(PKG_VERSION)))
