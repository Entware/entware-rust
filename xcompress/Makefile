# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=xcompress
PKG_VERSION:=0.11.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/magiclen/xcompress/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=5d4bbf98f57810af942134e7b50d6fc68e40ccd0c71744f618d226e1264f1879

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/xcompress
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Compression
  TITLE:=a free file archiver utility
  URL:=https://magiclen.org/xcompress
endef

define Package/xcompress/description
  XCompress is a free file archiver utility on Linux,
  providing multi-format archiving to and extracting
  from ZIP, Z, GZIP, BZIP2, LZ, XZ, LZMA, 7ZIP, TAR,
  RAR and ZSTD.
endef

define Package/xcompress/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/xcompress $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,xcompress))
