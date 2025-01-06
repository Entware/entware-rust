# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=systeroid
PKG_VERSION:=0.4.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/orhun/systeroid/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=ed8bea7d111de32d0885fd36664bed8a4acb77775a0cc0034d29b5aa5db255e1

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 iana-time-zone-0161

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

# clipboard support is enabled by default
CARGO_ARGS += --no-default-features

# XXX docs
define Docs
	( \
		cd $(PKG_BUILD_DIR); \
		if [ ! -f "$(DL_DIR)/linux-docs.tgz" ]; then \
			$(SHELL) scripts/clone-linux-docs.sh; \
			$(TAR) -czf $(DL_DIR)/linux-docs.tgz linux-docs; \
		else \
			$(TAR) -xzf $(DL_DIR)/linux-docs.tgz; \
		fi; \
	)
endef

Hooks/Compile/Post += Docs

define Package/systeroid-tui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/systeroid-tui $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/share/doc
	$(CP) $(PKG_BUILD_DIR)/linux-docs $(1)/opt/share/doc
endef

define Package/systeroid/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/systeroid $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,systeroid-tui))
$(eval $(call BuildPackage,systeroid))
