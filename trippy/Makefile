# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=trippy
PKG_VERSION:=0.7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/fujiapple852/trippy/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=a3fa2902fd062516011d733def61941f867da3f9d6b84743ba4eff631bf8db18

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/trippy
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A network diagnostic tool
  URL:=https://github.com/fujiapple852/trippy
endef

define Package/trippy/description
  A network diagnostic tool, inspired by mtr.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/trippy/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/trip $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,trippy))
