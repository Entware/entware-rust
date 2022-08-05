# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=lfs
PKG_VERSION:=2.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Canop/lfs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=5481cfce5762c8dfdc49f315a7cb102f5f09d57a97080b41c41e3b9bc01a3f2a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/lfs
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Filesystem
  TITLE:=give information on mounted filesystems
  URL:=https://github.com/Canop/lfs
endef

define Package/lfs/description
  A linux utility listing your filesystems.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/lfs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/lfs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,lfs))
