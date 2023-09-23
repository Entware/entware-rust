# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=minesweep-rs
PKG_VERSION:=6.0.33
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/cpcloud/minesweep-rs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=67170b31590d2b006b1ad780f636c4eba39413a3cd7bd5711a53e5a973f23269

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
