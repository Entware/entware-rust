# SPDX-License-Identifier: WTFPL

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=aim
PKG_VERSION:=1.8.3
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mihaigalos/aim/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=18e4cdbe5317da02bc56b786107bef8469edb3176cc7a4db7151022d61fd0ddd

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/aim
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Download Manager
  TITLE:=A command line download/upload tool with resume
  URL:=https://github.com/mihaigalos/aim
  DEPENDS:=@!(mips||mipsel) +libopenssl
endef

define Package/aim/description
  A command line download/upload tool with resume.
endef

# FIXME
#	error: failed to run custom build command for `openssl-sys v0.9.87`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/aim/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/aim $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,aim))
