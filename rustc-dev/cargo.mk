# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

rust_mk_path:=$(dir $(lastword $(MAKEFILE_LIST)))
include $(rust_mk_path)rust.mk

CARGO_ARGS += -Z unstable-options
USE_CARGO_COMPILE ?= 1
USE_CARGO_LOCK ?= 1

### skip step
Build/Configure/Cargo/Default:=:

### remove Cargo.lock; update dependencies and generate new Cargo.lock
define Build/Configure/Cargo/Fetch
	@( rm -f $(PKG_BUILD_DIR)/Cargo.lock; )
	@( \
		CARGO_HOME=$(CARGO_HOME) $(CARGO_BIN) fetch \
		--manifest-path $(CARGO_BUILD_DIR)/Cargo.toml \
		$(if $(findstring s,$(OPENWRT_VERBOSE)),--verbose); \
	)
endef

### compile package and all its dependencies
define Build/Compile/Cargo/Default
	( \
		$(RUSTC_HOST_VARS) $(RUSTC_VARS) \
		$(CARGO_VARS) $(CARGO_BIN) build \
		--artifact-dir $(CARGO_INSTALL_ROOT)/bin \
		--manifest-path $(CARGO_BUILD_DIR)/Cargo.toml \
		--profile $(CARGO_PKG_PROFILE) \
		$(if $(findstring s,$(OPENWRT_VERBOSE)),--verbose) \
		$(CARGO_ARGS); \
	)
endef

### build and install (I forgot why I needed to)
define Build/Install/Cargo/Default
	( \
		$(RUSTC_HOST_VARS) $(RUSTC_VARS) \
		$(CARGO_VARS) $(CARGO_BIN) install \
		--bins \
		--no-track \
		--path $(CARGO_BUILD_DIR) \
		--profile $(CARGO_PKG_PROFILE) \
		--root $(CARGO_INSTALL_ROOT) \
		$(if $(findstring s,$(OPENWRT_VERBOSE)),--verbose) \
		$(CARGO_ARGS); \
	)
endef

### move libs
define Build/Compile/Cargo/Libs
	@( \
		[ -d "$(CARGO_INSTALL_ROOT)/lib" ] && rm -fr $(CARGO_INSTALL_ROOT)/lib; \
		for ext in a rlib so; do \
		if ls -1 $(CARGO_INSTALL_ROOT)/bin | grep -q "\.$$$$ext"; then \
			$(INSTALL_DIR) $(CARGO_INSTALL_ROOT)/lib; \
			mv $(CARGO_INSTALL_ROOT)/bin/*.$$$$ext $(CARGO_INSTALL_ROOT)/lib; \
		fi; \
		done; \
		find $(CARGO_INSTALL_ROOT) -type d -empty -delete; \
	)
endef

ifneq ($(USE_CARGO_LOCK),1)
  define Build/Configure/Cargo
	$(call Build/Configure/Cargo/Default)
	$(call Build/Configure/Cargo/Fetch)
  endef
else
  define Build/Configure/Cargo
	$(call Build/Configure/Cargo/Default)
  endef
endif

ifeq ($(USE_CARGO_COMPILE),1)
  define Build/Compile/Cargo
	$(call Build/Compile/Cargo/Default)
	$(call Build/Compile/Cargo/Libs)
  endef
else
  define Build/Install/Cargo
	$(call Build/Install/Cargo/Default)
  endef
endif

Build/Configure=$(call Build/Configure/Cargo)
Build/Compile=$(call Build/Compile/Cargo)
Build/Install=$(call Build/Install/Cargo)
