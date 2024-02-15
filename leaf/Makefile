# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `leaf` (lib) due to previous error; 4 warnings emitted

include $(TOPDIR)/rules.mk

PKG_NAME:=leaf
PKG_VERSION:=0.10.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/eycorsican/leaf/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=71f6e41f8673f33d8558403a85695dbd14b36663ea44f1a29ca8ba39de4db100

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += protobuf/host protobuf chrono-0431 rcgen-0113 ring-0175
PKG_BUILD_DEPENDS += rustls-0219 quinn-0104 tokio-rustls-0241 trust-dns
PKG_BUILD_DEPENDS += webpki-roots-0243

define Package/leaf/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A versatile and efficient proxy framework
  URL:=https://github.com/eycorsican/leaf
  PROVIDES:=lief
endef

define Package/leaf-ring
  $(call Package/leaf/Default)
  VARIANT:=ring
  CONFLICTS:=leaf-ssl
endef

define Package/leaf-ssl
  $(call Package/leaf/Default)
  DEPENDS+=+libopenssl
  VARIANT:=ssl
endef

define Package/leaf-ring/description
  A versatile and efficient proxy framework with nice features
  suitable for various use cases.
endef

Package/leaf-ssl/description=$(Package/leaf-ring/description)

ifeq ($(BUILD_VARIANT),ssl)
# FIXME
# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`
CARGO_ARGS += --no-default-features --features default-openssl

# FIXME
#	error: failed to run custom build command for `openssl-sys v0.9.87`
RUSTC_VARS += OPENSSL_NO_VENDOR=1
endif

# FIXME
#	error[E0425]: cannot find value `VERSION_3_2_0` in crate `protobuf`
RUSTC_VARS += PROTO_GEN=1

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/leaf-ring/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/leaf $(1)/opt/usr/bin
endef

define Package/leaf-ssl/install
  $(call Package/leaf-ring/install,$1)
endef

$(eval $(call BuildPackage,leaf-ring))
$(eval $(call BuildPackage,leaf-ssl))
