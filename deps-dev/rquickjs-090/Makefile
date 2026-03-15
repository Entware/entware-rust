# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# XXX all (youtube-tui)

include $(TOPDIR)/rules.mk

PKG_NAME:=rquickjs
PKG_VERSION:=0.9.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/DelSkayn/rquickjs
PKG_MIRROR_HASH:=3ec636acee164927f2e2a9b606f19ec2e6247fc424a4f509c3184ba1588e3e5e

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0444 iana-time-zone-0164

define Package/rquickjs-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=bindings to the quickjs javascript engine
  URL:=https://github.com/DelSkayn/rquickjs
  BUILDONLY:=1
endef

define Package/rquickjs-$(PKG_VERSION)/description
  High level bindings to the QuickJS JavaScript engine.
endef

#CARGO_ARGS += -F bindgen

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rquickjs-$(PKG_VERSION)))
