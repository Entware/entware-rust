# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=stylus
PKG_VERSION:=0.17.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mmastrac/stylus/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f66acd73a3f7a8a2ec4b2f05855a4f8a43fa23dd266e46a5a304ac780d097d0d

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0441 getrandom-033 iana-time-zone-0163 deno/host

define Package/stylus
  SECTION:=net
  CATEGORY:=Network
  TITLE:=a lightweight status page for home infrastructure
  URL:=https://github.com/mmastrac/stylus
  EXTRA_DEPENDS:=bash
endef

define Package/stylus/description
  Stylus (style + status) is a lightweight status page for home infrastructure.
endef

define Build/Web
	( \
		cd $(PKG_BUILD_DIR)/crates/stylus-ui; \
		rm -f web/deno.lock; \
		DENO_DIR=$(TMP_DIR)/deno-cache \
		deno install --config web/deno.json --reload; \
		DENO_DIR=$(TMP_DIR)/deno-cache \
		deno bundle --config web/deno.json --minify --platform browser \
	        	--output src/compiled/stylus.js \
			--sourcemap=external web/src/app.tsx; \
		gzip -9 --force src/compiled/stylus.js.map; \
		$(CP) web/src/style.css src/compiled/stylus.css; \
	)
endef

define Build/Compile
	$(call Build/Web)
	$(call Build/Compile/Cargo)
endef

define Package/stylus/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/stylus $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_BUILD_DIR)/examples $(1)/opt/share/stylus
	$(FIND) $(1)/opt/share/stylus -type f | $(XARGS) $(SED) \
		's,^#!.*sh,#!/opt/bin/bash,'
endef

define Package/stylus/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_std="\033[0m"

URL_BOOK="https://mmastrac.github.io/stylus/getting-started/running.html"

printf "\n$$ansi_white %s $$ansi_blue %s $$ansi_std\n\n" "Read:" "$$URL_BOOK"
endef

$(eval $(call BuildPackage,stylus))
