# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=digs
PKG_VERSION:=0.3.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/BiznetGIO/digs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=6bb6f9738cba2ee219257f9e3cb3f42becb562536632c544a994f4e840269681

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/digs
  SECTION:=net
  CATEGORY:=Network
  TITLE:=dig many at once
  URL:=https://github.com/BiznetGIO/digs
endef

define Package/digs/description
  digs is a DNS command-line client that able to query many DNS servers at once.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/digs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/digs $(1)/opt/usr/bin

	$(INSTALL_DIR) $(1)/opt/usr/share/digs
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/docs/digs.example.toml $(1)/opt/usr/share/digs
endef

$(eval $(call BuildPackage,digs))
