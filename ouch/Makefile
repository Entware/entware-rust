# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=ouch
PKG_VERSION:=0.4.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ouch-org/ouch/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=08015fa92770515cfa00570bc5f0f0a4f28f0ad238f360f3579ac043723a6ec2

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/ouch
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Compression
  TITLE:=Painless compression and decompression
  URL:=https://github.com/ouch-org/ouch
  DEPENDS:=+liblzma +libzstd +zlib
endef

define Package/ouch/description
  A command-line utility for easily compressing
  and decompressing files and directories.
endef

RUSTFLAGS += -l dylib=zstd

define Package/ouch/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ouch $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,ouch))
