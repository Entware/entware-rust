# SPDX-License-Identifier: WTFPL

# mips(el)/armv5:
#	error[E0432]: unresolved imports `std::sync::atomic::AtomicI64`, `std::sync::atomic::AtomicU64`
#	error: could not compile `sled` due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=fclones
PKG_VERSION:=0.34.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pkolaczk/fclones/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=5e8c94bb5fb313a5c228bdc870cf6605487338f31c5a14305e54e7e3ac15d0ad

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/fclones
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Finds duplicate, unique, under- or over-replicated files
  URL:=https://github.com/pkolaczk/fclones
  DEPENDS:=@!(mips||mipsel||TARGET_armv5_3_2)
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
