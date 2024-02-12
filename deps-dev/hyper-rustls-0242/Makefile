# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=hyper-rustls
PKG_VERSION:=0.24.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-26
PKG_SOURCE_VERSION:=5ab99d99f8749e640f5252adec6cc6e453cc80ac
PKG_SOURCE_URL:=https://github.com/rustls/hyper-rustls
PKG_MIRROR_HASH:=40ddd66fa1ea6ea8647236fa902366ed4ae4a34a45ca3a8d19a7d7473b89c22d

PKG_LICENSE:=Apache-2.0 ISC MIT
PKG_LICENSE_FILES:=LICENSE LICENSE-APACHE LICENSE-ISC LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += rustls-0219 tokio-rustls-0241 webpki-roots-0243

define Package/hyper-rustls-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Rustls+hyper integration for pure rust HTTPS
  URL:=https://github.com/rustls/hyper-rustls
  BUILDONLY:=1
endef

define Package/hyper-rustls-$(PKG_VERSION)/description
  Integration between hyper HTTP library and rustls TLS stack.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,hyper-rustls-$(PKG_VERSION)))
