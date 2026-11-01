# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# XXX mips(el) (termscp)

include $(TOPDIR)/rules.mk

PKG_NAME:=google-cloud-auth
PKG_VERSION:=1.16.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://static.crates.io/crates/$(PKG_NAME)/
PKG_HASH:=ff461519b1a948200f163574be072753bcfb462a323f0eb426629d89872dd685

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/google-cloud-auth-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Google Cloud authentication library
  URL:=https://github.com/googleapis/google-cloud-rust
  BUILDONLY:=1
endef

define Package/google-cloud-auth-$(PKG_VERSION)/description
  Google Cloud authentication library for Rust.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,google-cloud-auth-$(PKG_VERSION)))
