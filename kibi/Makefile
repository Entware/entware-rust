# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=kibi
PKG_VERSION:=0.3.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ilai-deutel/kibi/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=a7a7b6f6937f39ae86fd4f556034a3744bb99091c102bc6f38b281ee751d10e9

PKG_LICENSE:=Apache-2.0 BSD-2-Clause MIT
PKG_LICENSE_FILES:=COPYRIGHT LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442 getrandom-0216 getrandom-034 iana-time-zone-0164

define Package/kibi
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Editors
  TITLE:=A text editor, written in Rust
  URL:=https://github.com/ilai-deutel/kibi
endef

define Package/kibi/description
  A configurable text editor with UTF-8 support, incremental
  search, syntax highlighting, line numbers and more, written
  in less than 1024 lines of Rust with minimal dependencies.
endef

define Package/kibi/conffiles
/opt/etc/kibi/config.ini
/opt/share/kibi/syntax.d/
endef

define Package/kibi/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/kibi $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/etc/kibi
	$(CP) $(PKG_BUILD_DIR)/config_example.ini $(1)/opt/etc/kibi/config.ini
	$(INSTALL_DIR) $(1)/opt/share/kibi
	$(CP) $(PKG_BUILD_DIR)/syntax.d $(1)/opt/share/kibi
endef

$(eval $(call BuildPackage,kibi))
