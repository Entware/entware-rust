# SPDX-License-Identifier: WTFPL

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=pueue
PKG_VERSION:=3.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Nukesor/pueue/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=0c3126579661f894fb02a0d8c0e138ab23b277e97cea2d85e48d3d2b9fb1c372

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/rust/cargo.mk

define Package/pueue
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=CLI task manager for long-running tasks
  URL:=https://github.com/Nukesor/pueue
  DEPENDS:=@!(mips||mipsel)
endef

define Package/pueue/description
  Pueue is a command-line task management tool for sequential and parallel
  execution of long-running tasks.
endef

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/pueue/install
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S11pueued $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/pueue{,d} $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,pueue))
