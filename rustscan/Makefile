# SPDX-License-Identifier: WTFPL

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=rustscan
PKG_VERSION:=2.1.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/RustScan/RustScan/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=51244a5bde278b25de030bd91e4ebe1d4b87269b2d0f7f601565caef4fb5749a

PKG_BUILD_DIR:=$(BUILD_DIR)/RustScan-$(PKG_VERSION)

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/rustscan
  SECTION:=net
  CATEGORY:=Network
  TITLE:=The Modern Port Scanner
  URL:=https://github.com/RustScan/RustScan
  DEPENDS:=+(mips||mipsel):libopenssl
  EXTRA_DEPENDS:=nmap
endef

define Package/rustscan/description
  The Modern Port Scanner.
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

define Package/rustscan/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rustscan $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rustscan))
