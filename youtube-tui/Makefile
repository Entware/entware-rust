# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=youtube-tui
PKG_REAL_VERSION:=0.9.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2026-05-29
PKG_SOURCE_VERSION:=800b65178f3c6cc2b2afdfc28b3e04e0fc212769
PKG_SOURCE_URL:=https://github.com/Siriusmart/youtube-tui
PKG_MIRROR_HASH:=0ac8121f53192d4d152f1dfd6b65195581d4034ad541098364447c80575fcd06

PKG_VERSION:=$(PKG_REAL_VERSION)_git$(subst -,,$(PKG_SOURCE_DATE))~$(call version_abbrev,$(PKG_SOURCE_VERSION))

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/rustlang/rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0444 getrandom-0217 getrandom-034 getrandom-042 \
	iana-time-zone-0164 rquickjs-090

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
