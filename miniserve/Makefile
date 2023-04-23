# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=miniserve
PKG_VERSION:=0.23.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/svenstaro/miniserve/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=2812e5f700612576587a76ba5ea51a3eb7f60b1dd1b580cd9a015ad2feac5b8f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/miniserve
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=a CLI tool to serve files and dirs over HTTP
  URL:=https://github.com/svenstaro/miniserve
endef

define Package/miniserve/description
  miniserve is a small, self-contained cross-platform CLI tool that
  allows you to just grab the binary and serve some file(s) via HTTP. 
endef

# XXX "ring"
ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
  CARGO_ARGS += --no-default-features
endif

define Package/miniserve/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/miniserve $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,miniserve))
