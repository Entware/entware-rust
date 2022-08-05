# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=termscp
PKG_VERSION:=0.9.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/veeso/termscp/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=07ad690097d5a846ef0c6b1c8a681641ddc19a329400ddd8502018fbd5143f59

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

CARGO_COMPILE:=0

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/termscp
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=File Transfer
  TITLE:=a feature rich terminal file transfer and explorer
  URL:=https://veeso.github.io/termscp/
  DEPENDS:=+libdbus +libopenssl +zlib
endef

define Package/termscp/description
  termscp is a feature rich terminal file transfer
  and explorer with support for SCP/SFTP/FTP/S3.
endef

define Package/termscp/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/termscp $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,termscp))