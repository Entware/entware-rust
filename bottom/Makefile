# SPDX-License-Identifier: WTFPL

# FIXME mips/mipsel: expected `u64`, found `u32`; see readme.txt

include $(TOPDIR)/rules.mk

PKG_NAME:=bottom
PKG_VERSION:=0.6.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ClementTsang/bottom/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=4e4eb251972a7af8c46dd36bcf1335fea334fb670569434fbfd594208905b2d9

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/bottom
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Yet another graphical process/system monitor
  URL:=https://clementtsang.github.io/bottom/
  DEPENDS:=@!(mips||mipsel)
endef

define Package/bottom/description
  A cross-platform graphical process/system monitor with a customizable
  interface and a multitude of features. Supports Linux, macOS, and
  Windows. Inspired by both gtop and gotop.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/bottom/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/btm $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,bottom))
