# SPDX-License-Identifier: WTFPL
#
# XXX since v0.8.4: mips(el): AtomicU64 not supported

include $(TOPDIR)/rules.mk

PKG_NAME:=dust
PKG_VERSION:=0.8.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bootandy/dust/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=611f2da80ef5b1d4423bcda159a65e9436692357b686b91b1dd8245a76eed589

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/dust
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=A more intuitive version of du
  URL:=https://crates.io/crates/du-dust
  DEPENDS:=@!(mips||mipsel)
endef

define Package/dust/description
  du + rust = dust. Like du but more intuitive.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/dust/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dust $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dust))
