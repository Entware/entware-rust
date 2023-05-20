# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=igrep
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/konradsz/igrep/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=8a290b77923c253dd0ca7323ee4e10cd3e99c9f105652500df7c008cb44c55da

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/rust/cargo.mk

define Package/igrep
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Interactive Grep
  URL:=https://github.com/konradsz/igrep
endef

define Package/igrep/description
  igrep - Interactive Grep.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/igrep/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ig $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,igrep))
