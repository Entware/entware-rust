# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=systeroid
PKG_VERSION:=0.4.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/orhun/systeroid/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=756b341dc86553ce8df583d55e6d01517bf52721a556713a4fb6056c0f823f3b

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0439 getrandom-0215 iana-time-zone-0161

define Package/systeroid-tui
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A terminal user interface for managing kernel parameters
  URL:=https://github.com/orhun/systeroid
endef

define Package/systeroid-tui/description
  A terminal user interface for managing kernel parameters.
endef

define Package/systeroid
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A more powerful alternative to sysctl
  URL:=https://github.com/orhun/systeroid
  DEPENDS:=+systeroid-tui
endef

define Package/systeroid/description
  A more powerful alternative to sysctl.
endef

define Package/systeroid-tui/conffiles
/opt/etc/systeroid/systeroid.conf
endef

# clipboard support is enabled by default
CARGO_ARGS += --no-default-features

define Build/Configure
	$(TAR) -xzf ./files/linux-docs-$(KERNEL_PATCHVER).tgz -C $(PKG_BUILD_DIR)/
	$(call $(Build/Configure/Cargo))
endef

define Package/systeroid-tui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/systeroid-tui $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/etc/systeroid
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/config/systeroid.conf $(1)/opt/etc/systeroid
	$(INSTALL_DIR) $(1)/opt/share/doc
	$(CP) $(PKG_BUILD_DIR)/linux-docs $(1)/opt/share/doc
	touch $(1)/opt/share/doc/linux-docs/admin-guide/sysctl/index.rst
endef

define Package/systeroid/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/systeroid $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,systeroid-tui))
$(eval $(call BuildPackage,systeroid))
