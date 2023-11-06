# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=eza
PKG_VERSION:=0.15.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/eza-community/eza/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=b8b00af94d9b8f254b5a14af3da84542893617f810dcdad782e5667a1e7af1f9

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/eza/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a modern replacement for ls
  URL:=https://eza.rocks
endef

define Package/eza-git
  $(call Package/eza/Default)
  TITLE+= (with git)
  DEPENDS:=+zlib
  VARIANT:=git
endef

define Package/eza-nogit
  $(call Package/eza/Default)
  TITLE+= (without git)
  VARIANT:=nogit
  CONFLICTS:=eza-git
endef

define Package/eza-git/description
  eza is a modern, maintained replacement for ls, built on exa.
  (with Git support; ~1,7M)
endef

define Package/eza-nogit/description
  eza is a modern, maintained replacement for ls, built on exa.
  (without Git support; ~650K)
endef

ifeq ($(BUILD_VARIANT),nogit)
  CARGO_ARGS += --no-default-features
endif

define Package/eza-git/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/eza $(1)/opt/usr/bin
endef

define Package/eza-nogit/install
  $(call Package/eza-git/install,$1)
endef

$(eval $(call BuildPackage,eza-git))
$(eval $(call BuildPackage,eza-nogit))
