# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=procs
PKG_VERSION:=0.14.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dalance/procs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=fa5af0951dc8aa63c0590f8c5c1136594866057704cfb1cdfc22ac3cc49437c6

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/procs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A modern replacement for ps
  URL:=https://github.com/dalance/procs
  EXTRA_DEPENDS:=less
endef

define Package/procs/description
  procs is a replacement for ps written in Rust.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/procs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/procs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,procs))
