# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=delta
PKG_VERSION:=0.16.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dandavison/delta/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=00d4740e9da4f543f34a2a0503615f8190d307d1180dfb753b6911aa6940197f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/git-delta
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a syntax-highlighting pager for git
  URL:=https://github.com/dandavison/delta
  DEPENDS:=+zlib
  EXTRA_DEPENDS:=git, less
endef

define Package/git-delta/description
  A syntax-highlighting pager for git, diff, and grep output.
endef

define Package/git-delta/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/delta $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,git-delta))
