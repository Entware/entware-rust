# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el)/armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `moka` due to previous error
# x86:
#	error[E0599]: no function or associated item named `new` found for struct `CpuId` in the current scope
#	error: could not compile `quanta` due to 2 previous errors

include $(TOPDIR)/rules.mk

PKG_NAME:=rgit
PKG_VERSION:=0.1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/w4/rgit/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=8c22060e8b444454a253a7469fd9ff8a3a841fee7a6ee25bd0037a0525b3b6e1

PKG_LICENSE:=WTFPL
PKG_LICENSE_FILES:=LICENSE

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/rgit
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Version Control Systems
  TITLE:=a gitweb interface written in rust
  URL:=https://github.com/w4/rgit
  DEPENDS:=@!(i386||mips||mipsel) @!TARGET_armv5_3_2 +libopenssl +zlib
endef

define Package/rgit/description
  A gitweb/cgit-like interface for the modern age.
  Written in Rust using Axum, git2, Askama and Sled.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/rgit/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rgit $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rgit))
