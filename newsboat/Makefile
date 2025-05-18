# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=newsboat
PKG_VERSION:=2.39
PKG_RELEASE:=1

PKG_GIT_TAG:=r$(subst $(space),.,$(wordlist 1,2,$(subst .,$(space),$(PKG_VERSION))))

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/newsboat/newsboat/tar.gz/refs/tags/$(PKG_GIT_TAG)?
PKG_HASH:=7444d16c3bc1dbdf7121dd4678ed58353b809d5b2db29ef0c4c839e2c6307516

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../rustc-dev/rust.mk

PKG_BUILD_DEPENDS += chrono-0440
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/newsboat
  SECTION:=net
  CATEGORY:=Network
  TITLE:=An RSS/Atom feed reader for text terminals
  URL:=https://newsboat.org/
  DEPENDS:=+libcurl +libjson-c +libncursesw +libopenssl +libsqlite3 +libstdcpp
  DEPENDS+=+libstfl +libxml2 $(INTL_DEPENDS)
endef

define Package/newsboat/description
  Newsboat is an RSS/Atom feed reader for the text console.
endef

define Package/newsboat/conffiles
/opt/etc/newsboat/config
endef

MAKE_VARS += $(RUSTC_VARS)

TARGET_LDFLAGS += $(if $(INTL_FULL),-lintl)

Build/Configure:=:

define Package/newsboat/install
	$(INSTALL_DIR) $(1)/opt/etc/newsboat
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/doc/example-config \
		$(1)/opt/etc/newsboat/config
	$(CP) $(PKG_BUILD_DIR)/contrib/colorschemes $(1)/opt/etc/newsboat
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/newsboat $(1)/opt/usr/bin
#	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/podboat $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,newsboat))
