# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=tealdeer
PKG_VERSION:=1.6.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dbrgn/tealdeer/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=d42db25a56a72faec173c86192656c5381281dc197171f385fccffd518930430

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/tealdeer
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a very fast implementation of tldr
  URL:=https://github.com/dbrgn/tealdeer
  DEPENDS:=+libopenssl
endef

define Package/tealdeer/description
  Fetch and show tldr help pages for many CLI commands.
  Full featured offline client with caching support.
endef

# XXX "ring"
ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
  CARGO_ARGS += --no-default-features --features=native-tls
endif

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/tealdeer/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/tldr $(1)/opt/usr/bin
endef

define Package/tealdeer/postinst
#!/bin/sh

echo "Updating the local cache ..."
tldr --update
endef

$(eval $(call BuildPackage,tealdeer))
