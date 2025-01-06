# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=feroxbuster
PKG_VERSION:=2.11.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/epi052/feroxbuster/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=61aa0a5654584c015ff58df69091ec40919b38235b20862975a8ab0649467a83

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

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
