# SPDX-License-Identifier: WTFPL

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`
# armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `sqlx-core` (lib) due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=atuin
PKG_VERSION:=17.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ellie/atuin/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=b03d3a1597ba2bbd784612e730419c2cdc099311adf48518bd9c00d2799199f6

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
