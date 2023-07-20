# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=dysk
PKG_VERSION:=2.7.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Canop/dysk/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=ac744a595a742067403e76e6b47dea4ecda89880a636265ab6ca2cd0f128fcbf

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/dysk
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Filesystem
  TITLE:=A linux utility listing your filesystems
  URL:=https://github.com/Canop/dysk
  PROVIDES:=lfs
endef

define Package/dysk/description
  A linux utility to get information on filesystems, like df but better.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/dysk/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dysk $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dysk))
