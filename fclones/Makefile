# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=fclones
PKG_VERSION:=0.27.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pkolaczk/fclones/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=1605c8a5d6677f1d133a8b323b49a7ec0900d62e869d82e2c608a55c40ee0851

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/fclones
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Finds duplicate, unique, under- or over-replicated files
  URL:=https://github.com/pkolaczk/fclones
endef

define Package/fclones/description
  A simple command-line utility program that finds duplicate, unique, under- or
  over-replicated files.
  Contrary to fdupes or rdfind, fclones processes files in parallel, which makes
  it very efficient on SSDs. fclones communicates through standard Unix streams
  and it can write reports in human- and machine-friendly formats, therefore you
  can easily combine it with other tools.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/fclones/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/fclones $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,fclones))
