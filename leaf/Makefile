# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `leaf` (lib) due to previous error; 4 warnings emitted

include $(TOPDIR)/rules.mk

PKG_NAME:=leaf
PKG_VERSION:=0.11.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/eycorsican/leaf/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f80d110ac56a0ffcdbcdcd1cc3631b6bf079ea18191d9a1c9f819cfff5b0c2fa

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += protobuf/host protobuf chrono-0431 quinn-0104

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
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/leaf/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/leaf $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,leaf))
