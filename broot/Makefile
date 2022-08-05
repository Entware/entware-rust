# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=broot
PKG_VERSION:=1.14.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Canop/broot/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=992e3b5c2b73a25366bf67ccc8d99a51be9c07c75ec6ea413883dd8a8857c2e4

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/broot
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A new file manager
  URL:=https://dystroy.org/broot
  DEPENDS:=+zlib
  EXTRA_DEPENDS:=git-http
endef

define Package/broot/description
  A better way to navigate directories.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/broot/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/broot $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,broot))
