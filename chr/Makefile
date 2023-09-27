# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=chr
PKG_VERSION:=1.0.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pemistahl/chr/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=a9aaaddeefd92ddff55dbe8123bd40082615a2ae0d5fe0968adefad9f99fe0d5

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/chr
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A command-line tool that gives information about Unicode characters
  URL:=https://github.com/pemistahl/chr
endef

define Package/chr/description
  chr is a command-line utility that is meant to give
  various information about Unicode characters.
endef

# FIXME (host vs target)
# X86_64:
#	error while loading shared libraries: libssl.so.3: cannot open shared object \
#	file: No such file or directory
ifeq ($(CONFIG_x86_64),y)
RUSTC_VARS += \
	X86_64_UNKNOWN_LINUX_GNU_OPENSSL_STATIC=true \
	X86_64_UNKNOWN_LINUX_GNU_OPENSSL_INCLUDE_DIR="$(STAGING_DIR_HOST)/include" \
	X86_64_UNKNOWN_LINUX_GNU_OPENSSL_LIB_DIR="$(STAGING_DIR_HOST)/lib"
endif

define FixDB
	$(HOST_TAR) -xJf files/chr.db.tar.xz -C $(PKG_BUILD_DIR)
endef

Hooks/Compile/Pre += FixDB

define Package/chr/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/chr $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,chr))
