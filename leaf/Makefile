# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=leaf
PKG_VERSION:=0.14.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/eycorsican/leaf/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=605bfb0a12b187824a3958066e7e9651a6bfb2f0a889041e73e1d58bb706ed43

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0444 getrandom-0217 getrandom-034 getrandom-042 \
	iana-time-zone-0164 protobuf protobuf/host

define Package/leaf
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A versatile and efficient proxy framework
  URL:=https://github.com/eycorsican/leaf
  PROVIDES:=leaf-ring leaf-ssl
endef

define Package/leaf/description
  A versatile and efficient proxy framework with nice features
  suitable for various use cases.
endef

# error[E0425]: cannot find value `VERSION_3_2_0` in crate `protobuf`
RUSTC_VARS += PROTO_GEN=1

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
PKG_RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/leaf/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/leaf $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,leaf))
