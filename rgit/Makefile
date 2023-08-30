# SPDX-License-Identifier: WTFPL

# mips(el)/armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `moka` due to previous error
# x86:
#	error[E0599]: no function or associated item named `new` found for struct `CpuId` in the current scope
#	error: could not compile `quanta` due to 2 previous errors

include $(TOPDIR)/rules.mk

PKG_NAME:=rgit
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/w4/rgit/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=248dbcc6507005df3f77b9b5449c85bfa9238b97881eab0ffff3c887e63f8a74

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
