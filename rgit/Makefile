# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rgit
PKG_VERSION:=0.1.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/w4/rgit/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=638904fcca224fc6773b1b49df65f4d346e81e3521f9e42ba8f3a70ff0457400

PKG_LICENSE:=WTFPL
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0215

define Package/rgit
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Version Control Systems
  TITLE:=a gitweb interface written in rust
  URL:=https://github.com/w4/rgit
  DEPENDS:=+libopenssl +libstdcpp +zlib
endef

define Package/rgit/description
  A gitweb/cgit-like interface for the modern age.
  Written in Rust using Axum, git2, Askama and Sled.
endef

# error: failed to run custom build command for `sha1-asm v0.5.3`
# cargo:warning=src/aarch64.S:*: Error: selected processor does not support
TARGET_CFLAGS:=$(filter-out -mcpu=%,$(TARGET_CFLAGS))

# arm/mips(el): undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'
ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += -l dylib=atomic
endif

define Package/rgit/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rgit $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rgit))
