# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=boringtun
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/cloudflare/boringtun/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=23a02ae0c01d194ce428c465de46538f683c696fa23a82cfc42d07d40e668e74

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/boringtun
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Userspace WireGuard Implementation in Rust
  URL:=https://github.com/cloudflare/boringtun
  DEPENDS:=@(mips||mipsel)
endef

define Package/boringtun/description
  BoringTun is an implementation of the WireGuard® protocol designed
  for portability and speed.
endef

CARGO_ARGS += --workspace

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/boringtun/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/boringtun-cli $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,boringtun))
