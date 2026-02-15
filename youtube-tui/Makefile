# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

# XXX rquickjs-sys@0.9.0: rquickjs probably doesn't ship bindings

include $(TOPDIR)/rules.mk

PKG_NAME:=youtube-tui
PKG_VERSION:=0.9.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/siriusmart/youtube-tui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=d5f1829d4798c167928d811309d1fed6e9d33cd5d3fd8496bca9b84ccc105575

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/rustlang/rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442 getrandom-0216 getrandom-033 iana-time-zone-0164

define Package/youtube-tui
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=An aesthetically pleasing YouTube TUI
  URL:=https://tui.siri.ws/youtube
  DEPENDS:=+libopenssl @BROKEN
  EXTRA_DEPENDS:=yt-dlp
endef

define Package/youtube-tui/description
  Written in Rust, the YouTube TUI is a lightweight and user friendly
  TUI for browsing YouTube content from the terminal.
endef

# cannot find -lmpv|-lsixel|-lxcb
CARGO_ARGS += --no-default-features --features="halfblock,invidious"

define Package/youtube-tui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/youtube-tui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,youtube-tui))
