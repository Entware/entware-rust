# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=jql
PKG_VERSION:=7.0.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/yamafaktory/jql/tar.gz/refs/tags/$(PKG_NAME)-v$(PKG_VERSION)?
PKG_HASH:=51d00df5316d6b60b22988612f7b881e7b76a80bc2de77e37065479b36937c50

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENCE-APACHE LICENCE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

PKG_UNPACK:=$(HOST_TAR) -C "$(PKG_BUILD_DIR)" --strip-components=1 -xzf "$(DL_DIR)/$(PKG_SOURCE)"

define Package/jql
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a JSON Query Language CLI tool
  URL:=https://github.com/yamafaktory/jql
endef

define Package/jql/description
  jql - JSON Query Language - is a fast and simple
  command-line tool to manipulate JSON data.
endef

define Package/jql/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/jql $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,jql))
