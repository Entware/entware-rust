# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=coreutils
PKG_VERSION:=0.0.27
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/uutils/coreutils/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=3076543a373c8e727018bd547cc74133f4a6538849e4990388f2bbea9a9aff6b

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438

# XXX without:  chcon & runcon (depends on SELinux);
#		stdbuf (fail to compile on several platforms).

COREUTILS_APPS:= \
	arch \
	base32 base64 basename basenc \
	cat chgrp chmod chown chroot cksum comm cp csplit cut \
	date dd df dir dircolors dirname du \
	echo env expand expr \
	factor false fmt fold \
	groups \
	hashsum head hostid hostname \
	id install \
	join \
	kill \
	link ln logname ls \
	mkdir mkfifo mknod mktemp more mv \
	nice nl nohup nproc numfmt \
	od \
	paste pathchk pinky pr printenv printf ptx pwd \
	readlink realpath rm rmdir \
	seq shred shuf sleep sort split stat sum sync \
	tac tail tee test timeout touch tr true truncate tsort tty \
	uname unexpand uniq unlink uptime users \
	vdir \
	wc who whoami \
	yes

define Package/uutils-coreutils/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The GNU coreutils, written in Rust
  URL:=https://github.com/uutils/coreutils
endef

define Package/uutils-coreutils-apps
  $(call Package/uutils-coreutils/Default)
  TITLE+=(multicall)
  VARIANT:=apps
endef

define Package/uutils-coreutils-full
  $(call Package/uutils-coreutils/Default)
  MENU:=1
  VARIANT:=full
endef

define GenBins
 define Package/$(1)
  $$(call Package/uutils-coreutils/Default)
   DEPENDS:=uutils-coreutils-full
   TITLE:=Utility $(2) from the Rust coreutils
 endef

 define Package/$(1)/description
  $(2)
  uutils coreutils is a cross-platform reimplementation of the GNU coreutils
  in Rust. While all programs have been implemented, some options might be
  missing or different behavior might be experienced.
 endef
endef

$(foreach b,$(COREUTILS_APPS),$(eval $(call GenBins,uutils-coreutils-$(b),$(b))))

define Package/uutils-coreutils-apps/description
  A multicall (BusyBox-type) binary.
  uutils coreutils is a cross-platform reimplementation of the GNU coreutils
  in Rust. While all programs have been implemented, some options might be
  missing or different behavior might be experienced.
endef

ifeq ($(BUILD_VARIANT),apps)
  CARGO_ARGS += --features="$(COREUTILS_APPS)"
endif

ifeq ($(BUILD_VARIANT),apps)
  define Package/uutils-coreutils-apps/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/coreutils $(1)/opt/usr/bin

	for apps in $(COREUTILS_APPS); do \
		$(LN) coreutils $(1)/opt/usr/bin/uu_$$$$apps ; \
	done
  endef
else
  define Build/Compile/Cargo
	for bins in $(COREUTILS_APPS); do \
		cd $(CARGO_BUILD_DIR) && \
		$(RUSTC_VARS) RUSTFLAGS="$(RUSTFLAGS)" \
		cargo build $(CARGO_ARGS) \
		--profile $(CARGO_PKG_PROFILE) \
		--manifest-path $(CARGO_BUILD_DIR)/Cargo.toml \
		--out-dir $(CARGO_INSTALL_ROOT)/bin \
		-p uu_$$$$bins; \
	done
  endef

  define Package/uutils-coreutils-full/install
	true
  endef

  define InstallBins
    define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/$(2) $$(1)/opt/usr/bin/$(2)
    endef

    $$(eval $$(call BuildPackage,$(1)))
  endef
endif

$(eval $(call BuildPackage,uutils-coreutils-full))
$(foreach b,$(COREUTILS_APPS),$(eval $(call InstallBins,uutils-coreutils-$(b),$(b))))

$(eval $(call BuildPackage,uutils-coreutils-apps))
