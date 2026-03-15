# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=youtube-tui
PKG_REAL_VERSION:=0.9.3
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2026-03-11
PKG_SOURCE_VERSION:=2fc2d5a43fb49dd32be1af7ad895fd3d697fbb1a
PKG_SOURCE_URL:=https://github.com/Siriusmart/youtube-tui
PKG_MIRROR_HASH:=ab24063579219132c9e6ab708815348c9d820d07ac08a9a9183078f0f618bcef

PKG_VERSION:=$(PKG_REAL_VERSION)_git$(subst -,,$(PKG_SOURCE_DATE))~$(call version_abbrev,$(PKG_SOURCE_VERSION))

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/rustlang/rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0442 getrandom-0216 getrandom-034 iana-time-zone-0164 rquickjs-090

define Package/youtube-tui
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=An aesthetically pleasing YouTube TUI
  URL:=https://tui.siri.ws/youtube
  DEPENDS:=+libopenssl
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
