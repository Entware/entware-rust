# SPDX-License-Identifier: WTFPL

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`
# armv5:
#	error[E0432]: unresolved imports `core::sync::atomic::AtomicI64`, `core::sync::atomic::AtomicU64`
#	error[E0412]: cannot find type `AtomicU64` in module `core::sync::atomic`
#	error: could not compile `crossbeam-utils` due to 3 previous errors

include $(TOPDIR)/rules.mk

PKG_NAME:=atuin
PKG_VERSION:=14.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ellie/atuin/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=00ba6eea19f11b3f73652e71af69b3dc7eb221761519f3b9680047f5476915b4

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/atuin
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=magical shell history
  URL:=https://atuin.sh
  DEPENDS:=@!(mips||mipsel||TARGET_armv5_3_2)
endef

define Package/atuin/description
  Magical shell history.
endef

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/atuin/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/atuin $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,atuin))
