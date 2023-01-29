# SPDX-License-Identifier: WTFPL
#
# XXX depends on "ring"

include $(TOPDIR)/rules.mk

PKG_NAME:=rustdesk-server
PKG_VERSION:=1.1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustdesk/rustdesk-server/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=ec1bc005f9442a15e0a63fe76ba95c079d086bdf68727e61477bd06b2aae59bb

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/rustdesk-server
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=RustDesk Server Program
  URL:=https://rustdesk.com/server
  DEPENDS:=@!(mips||mipsel)
endef

define Package/rustdesk-server/description
  RustDesk Server Program.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/rustdesk-server/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hbb{r,s} $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rustdesk-utils $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rustdesk-server))
