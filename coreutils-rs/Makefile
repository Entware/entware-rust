# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=coreutils-rs
PKG_VERSION:=0.0.18
PKG_RELEASE:=1

PKG_SOURCE:=coreutils-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/uutils/coreutils/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=1eed6317763c2fad1283bac057b25eae81a61fd8f364b814f20e1aaa32d16f8d

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

PKG_UNPACK:=$(HOST_TAR) -C "$(PKG_BUILD_DIR)" --strip-components=1 -xzf "$(DL_DIR)/$(PKG_SOURCE)"

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
	readlink realpath relpath rm rmdir \
	seq shred shuf sleep sort split stat sum sync \
	tac tail tee test timeout touch tr true truncate tsort tty \
	uname unexpand uniq unlink uptime users \
	vdir \
	wc who whoami \
	yes

define Package/coreutils-rs/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The GNU coreutils, written in Rust
  URL:=https://github.com/uutils/coreutils
endef

define Package/coreutils-apps
  $(call Package/coreutils-rs/Default)
  TITLE+=(multicall)
  VARIANT:=apps
endef

define Package/coreutils-full
  $(call Package/coreutils-rs/Default)
  MENU:=1
  VARIANT:=full
endef

define GenBins
 define Package/$(1)
  $$(call Package/coreutils-rs/Default)
   DEPENDS:=coreutils-full
   TITLE:=Utility $(2) from the Rust coreutils
 endef

 define Package/$(1)/description
  uutils is an attempt at writing universal (as in cross-platform)
  CLI utilities in Rust.
 endef
endef

$(foreach b,$(COREUTILS_APPS),$(eval $(call GenBins,coreutils-full-$(b),$(b))))

define Package/coreutils-apps/description
  uutils is an attempt at writing universal (as in cross-platform)
  CLI utilities in Rust.
  (multicall)
endef

ifeq ($(BUILD_VARIANT),apps)
  CARGO_ARGS += --features="$(COREUTILS_APPS)"
endif

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

ifeq ($(BUILD_VARIANT),apps)
  define Package/coreutils-apps/install
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
		cargo build $(CARGO_ARGS) --release \
		--manifest-path $(CARGO_BUILD_DIR)/Cargo.toml \
		--out-dir $(CARGO_INSTALL_ROOT)/bin \
		-p uu_$$$$bins; \
	done
  endef

  define Package/coreutils-full/install
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

$(eval $(call BuildPackage,coreutils-full))
$(foreach b,$(COREUTILS_APPS),$(eval $(call InstallBins,coreutils-full-$(b),$(b))))

$(eval $(call BuildPackage,coreutils-apps))
