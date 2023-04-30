# SPDX-License-Identifier: WTFPL

# XXX repository has been archived by the owner

# FIXME armv7-2.6: (crashed) src/widgets/mem.rs, line 71

include $(TOPDIR)/rules.mk

PKG_NAME:=ytop
PKG_VERSION:=0.6.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/cjbassi/ytop/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=d9fd6ce00e27de894bc0790947fbeab40e81e34afa5ead5a53d126c458d50e99

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

CARGO_COMPILE:=0

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/ytop
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A TUI system monitor
  URL:=https://github.com/cjbassi/ytop
  DEPENDS:=@!TARGET_armv7_2_6
endef

define Package/ytop/description
  Another TUI based system monitor, this time in Rust!
endef

define Package/ytop/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ytop $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,ytop))
