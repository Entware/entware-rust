# SPDX-License-Identifier: WTFPL

# XXX since 0.8.0:
# mips(el)/armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `tracing-chrome` (lib) due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=trippy
PKG_VERSION:=0.7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/fujiapple852/trippy/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=a3fa2902fd062516011d733def61941f867da3f9d6b84743ba4eff631bf8db18

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/trippy-legacy
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A network diagnostic tool
  URL:=https://github.com/fujiapple852/trippy
  DEPENDS:=@(mips||mipsel||TARGET_armv5_3_2)
endef

define Package/trippy-legacy/description
  A network diagnostic tool, inspired by mtr.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/trippy-legacy/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/trip $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,trippy-legacy))
