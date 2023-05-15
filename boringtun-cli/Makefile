# SPDX-License-Identifier: WTFPL

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`
# armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `boringtun` due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=boringtun-cli
PKG_VERSION:=0.5.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/cloudflare/boringtun/tar.gz/refs/tags/$(PKG_NAME)-$(PKG_VERSION)?
PKG_HASH:=0b457ed40767760f992803aa56a095958313b46a51605a3c82a942a6c5b8b8cb

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/boringtun-cli
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Userspace WireGuard Implementation in Rust
  URL:=https://github.com/cloudflare/boringtun
  DEPENDS:=@!(mips||mipsel||TARGET_armv5_3_2)
endef

define Package/boringtun-cli/description
  BoringTun is an implementation of the WireGuard® protocol designed
  for portability and speed.
endef

CARGO_ARGS += --workspace

# FIXME
# i386:
#	undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_i386),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/boringtun-cli/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/boringtun-cli $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,boringtun-cli))
