# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=exa
PKG_VERSION:=0.10.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ogham/exa/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=ff0fa0bfc4edef8bdbbb3cabe6fdbd5481a71abbbcc2159f402dea515353ae7c

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/exa/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a modern replacement for ls
  URL:=https://the.exa.website/
endef

define Package/exa-full
  $(call Package/exa/Default)
  TITLE+= (with git)
  DEPENDS:=+zlib
  VARIANT:=full
endef

define Package/exa-nogit
  $(call Package/exa/Default)
  TITLE+= (without git)
  VARIANT:=nogit
  CONFLICTS:=exa-full
endef

define Package/exa-full/description
  exa is a replacement for ls written in Rust.
  .
  (with Git support; ~1,5M)
endef

define Package/exa-nogit/description
  exa is a replacement for ls written in Rust.
  .
  (without Git support; ~516K)
endef

ifeq ($(BUILD_VARIANT),nogit)
  CARGO_ARGS += --no-default-features
endif

define Package/exa-full/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/exa $(1)/opt/bin
endef

define Package/exa-nogit/install
  $(call Package/exa-full/install,$1)
endef

$(eval $(call BuildPackage,exa-full))
$(eval $(call BuildPackage,exa-nogit))
