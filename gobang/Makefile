# SPDX-License-Identifier: WTFPL

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=gobang
PKG_VERSION:=0.1.0-alpha.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/TaKO8Ki/gobang/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=923210d500f070ac862c73d1a43a10520ee8c54f6692bbce99bbd073dfa72653

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/gobang
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Database
  TITLE:=A cross-platform TUI database management tool
  URL:=https://github.com/TaKO8Ki/gobang
  DEPENDS:=+(mips||mipsel):libopenssl
endef

define Package/gobang/description
  A cross-platform TUI database management tool written in Rust.
endef

define Package/gobang/conffiles
/opt/etc/gobang/
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/gobang/install
	$(INSTALL_DIR) $(1)/opt/etc/gobang
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/sample.toml $(1)/opt/etc/gobang
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/gobang $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,gobang))