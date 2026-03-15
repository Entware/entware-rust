# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# XXX mips(el) (spider)

include $(TOPDIR)/rules.mk

PKG_NAME:=chromey
PKG_VERSION:=2.38.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=16b0177183a43fa471f9802bc95552f46791bbfb
PKG_SOURCE_URL:=https://github.com/spider-rs/chromey
PKG_MIRROR_HASH:=d7c8fd06520e3ef76de2cfbc2d85f0874eda2816061574d228c5e1bdebcbdd6e

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0444 getrandom-0217 getrandom-034 getrandom-041 iana-time-zone-0164

define Package/chromey-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Chrome DevTools Protocol for Rust
  URL:=https://github.com/spider-rs/chromey
  BUILDONLY:=1
endef

define Package/chromey-$(PKG_VERSION)/description
  Concurrent chrome devtools protocol automation library for Rust.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,chromey-$(PKG_VERSION)))
