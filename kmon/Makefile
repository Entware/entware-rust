# SPDX-License-Identifier: WTFPL

# FIXME all: cannot find -lxcb; see readme.txt

include $(TOPDIR)/rules.mk

PKG_NAME:=kmon
PKG_VERSION:=1.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/orhun/kmon/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=b969f861407306e129a8e77f5cdf37962f8ef06b93c5195d0f1b043ece706ad5

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/kmon
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Linux Kernel Manager and Activity Monitor
  URL:=https://kmon.cli.rs/
  DEPENDS:=@!(mips||mipsel) @BROKEN
  EXTRA_DEPENDS:=dmesg, kmod_ndms
endef

define Package/kmon/description
  Linux Kernel Manager and Activity Monitor.
endef

define Package/kmon/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/kmon $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,kmon))
