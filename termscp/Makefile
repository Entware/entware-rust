# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=termscp
PKG_VERSION:=0.10.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/veeso/termscp/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=4da797c1b85c53406944c1f921354dffa57a041f9ce5ce6d557efd1c0befe84b

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
  DEPENDS:=@!(mips||mipsel) +libdbus +libopenssl +zlib
endef

define Package/termscp/description
  termscp is a feature rich terminal file transfer
  and explorer with support for SCP/SFTP/FTP/S3.
endef

RUSTC_VARS += \
	OPENSSL_NO_VENDOR=1

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/termscp/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/termscp $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,termscp))
