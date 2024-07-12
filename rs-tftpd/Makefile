# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rs-tftpd
PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/altugbakan/rs-tftpd/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=587391cf5eb02614b95bb151538d960a533c61c7323a2186a3ea85cf7409c879

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/rs-tftpd
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=File Transfer
  TITLE:=Multithreaded TFTP server daemon
  URL:=https://github.com/altugbakan/rs-tftpd
  PROVIDES:=tftpd
endef

define Package/rs-tftpd/description
  Pure Rust implementation of a Trivial File Transfer Protocol server
  daemon.
endef

define Package/rs-tftpd/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/tftpd $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rs-tftpd))
