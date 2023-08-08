# SPDX-License-Identifier: WTFPL

# mips(el)/armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `moka` due to previous error
# x86:
#	error[E0599]: no function or associated item named `new` found for struct `CpuId` in the current scope
#	error: could not compile `quanta` due to 2 previous errors

include $(TOPDIR)/rules.mk

PKG_NAME:=rgit
PKG_VERSION:=0.1.0
PKG_RELEASE:=3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-08-05
PKG_SOURCE_VERSION:=fe41118a177236a4a878ddbfea6d5f5a1cb998dc
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/w4/rgit
PKG_MIRROR_HASH:=0a150f70356c30703fc9ed0cd50fc863bd2b1a908c911829548fd6a2646c1f0f

PKG_LICENSE:=WTFPL
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/rgit
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Version Control Systems
  TITLE:=a gitweb interface written in rust
  URL:=https://github.com/w4/rgit
  DEPENDS:=@!(i386||mips||mipsel||TARGET_armv5_3_2) +libopenssl +zlib
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
