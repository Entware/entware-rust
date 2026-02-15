# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=feroxbuster
PKG_VERSION:=2.13.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/epi052/feroxbuster/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=6f1f3466319ea5485b9d6f05000718c6ccbe1210c1cea7b2af83a5343d068a23

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0216 getrandom-033

define Package/feroxbuster
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A fast, simple, recursive content discovery tool
  URL:=https://github.com/altugbakan/rs-feroxbuster
  DEPENDS:=+libopenssl
endef

define Package/feroxbuster/description
  A simple, fast, recursive content discovery tool written in Rust.
endef

# error: failed to run custom build command for `openssl-sys v0.9.102`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

# wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-medium-directories.txt

define Package/feroxbuster/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/feroxbuster $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/etc/feroxbuster
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ferox-config.toml.example \
		$(1)/opt/etc/feroxbuster/ferox-config.toml
	$(INSTALL_DIR) $(1)/opt/share/seclists/Discovery/Web-Content
	$(INSTALL_DATA) ./files/raft-medium-directories.txt \
		$(1)/opt/share/seclists/Discovery/Web-Content
endef

$(eval $(call BuildPackage,feroxbuster))
