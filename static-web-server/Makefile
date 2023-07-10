# SPDX-License-Identifier: WTFPL

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=static-web-server
PKG_VERSION:=2.19.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/joseluisq/static-web-server/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f5d5f19ab8d5fd9d33ef18e7c1cf673e7fae105e7a358930752deeaafd59cdf4

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/static-web-server
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Static Web Server
  URL:=https://sws.joseluisq.net/
  DEPENDS:=@!(mips||mipsel) +libopenssl
endef

define Package/static-web-server/description
  A blazing fast and asynchronous web server for static files-serving.
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

define Package/static-web-server/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/static-web-server $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,static-web-server))
