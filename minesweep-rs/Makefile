# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=minesweep-rs
PKG_VERSION:=6.0.39
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/cpcloud/minesweep-rs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=4b84ba2bd97826eb285195c4d73cd84b39ba5ed4da00604c6604960e12ca8ad3

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/minesweep-rs
  SECTION:=games
  CATEGORY:=Games
  TITLE:=A mine sweeping game written in Rust
  URL:=https://github.com/cpcloud/minesweep-rs
endef

define Package/minesweep-rs/description
  A terminal battleship game in Rust.
endef

define Package/minesweep-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/minesweep $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,minesweep-rs))
