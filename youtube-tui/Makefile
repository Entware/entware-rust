# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=youtube-tui
PKG_VERSION:=0.8.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/siriusmart/youtube-tui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=5c8834874800b98a78b12fb90fedbab507cc3a4f9949ea08d3f050efabb62ff0

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/rustlang/rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 getrandom-0216 iana-time-zone-0163

define Package/youtube-tui
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=An aesthetically pleasing YouTube TUI
  URL:=https://siriusmart.github.io/youtube-tui
  DEPENDS:=+libopenssl
endef

define Package/youtube-tui/description
  Written in Rust, the YouTube TUI is a lightweight and user friendly
  TUI for browsing YouTube content from the terminal.
endef

# cannot find -lmpv|-lsixel|-lxcb
CARGO_ARGS += --no-default-features --features="halfblock"

define Package/youtube-tui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/youtube-tui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,youtube-tui))
