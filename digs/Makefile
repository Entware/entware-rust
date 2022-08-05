# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=digs
PKG_VERSION:=0.1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/BiznetGIO/digs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f9054cda2cf91db481d603cf117b615e66ce88c7010937c32eddbd9638e37558

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
endef

$(eval $(call BuildPackage,digs))
