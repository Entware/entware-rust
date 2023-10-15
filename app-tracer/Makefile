# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=app-tracer
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2022-10-19
PKG_SOURCE_VERSION:=d0b1198c9865383ecb323454203fe21da46d5205
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/yarenty/app_tracer
PKG_MIRROR_HASH:=dadc37bcb49d9aaa80f5bd9c1aea7e202f439a19bd17dfd29a7eb491c92957ef

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/app-tracer
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Application tracing
  URL:=https://github.com/yarenty/app_tracer
endef

define Package/app-tracer/description
  Monitor live application either as child process or separate
  PID, collecting /displaying stats ( cpu usage, memory usage).
endef

define Package/app-tracer/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/tracer $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,app-tracer))
