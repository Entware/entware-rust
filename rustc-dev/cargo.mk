# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

rust_mk_path:=$(dir $(lastword $(MAKEFILE_LIST)))
include $(rust_mk_path)rust.mk

### cargo-build - Compile local packages and all of their dependencies.
CARGO_ARGS += -Z unstable-options
CARGO_COMPILE ?= 1
USE_CARGO_LOCK ?= 1

ifneq ($(USE_CARGO_LOCK),1)
  define ConfigurePre/Cargo
	@rm -f $(PKG_BUILD_DIR)/Cargo.lock
  endef
  Hooks/Configure/Pre += ConfigurePre/Cargo
endif

define Build/Configure/Cargo
endef
#define Build/Configure/Cargo
#	( \
#		echo ''; \
#		echo '[patch.crates-io]'; \
#		echo 'pkg1 = { path = "../pkg1-a.b.c" }'; \
#		echo 'pkg2 = { path = "$(BUILD_DIR)/pkg2-a.b.c" }'; \
#	) >> $(PKG_BUILD_DIR)/Cargo.toml
#endef

ifneq ($(USE_CARGO_LOCK),1)
  define ConfigurePost/Cargo
	@CARGO_HOME=$(CARGO_HOME) $(CARGO_BIN) fetch \
		--manifest-path $(CARGO_BUILD_DIR)/Cargo.toml
  endef
  Hooks/Configure/Post += ConfigurePost/Cargo
endif

ifeq ($(CARGO_COMPILE),1)
  define Build/Compile/Cargo
	$(RUSTC_HOST_VARS) \
	$(RUSTC_VARS) \
	$(CARGO_VARS) \
	$(CARGO_BIN) build \
		--profile $(CARGO_PKG_PROFILE) \
		--manifest-path $(CARGO_BUILD_DIR)/Cargo.toml \
		--out-dir $(CARGO_INSTALL_ROOT)/bin \
	$(CARGO_ARGS)
  endef
  define MoveLibs
	@( \
		[ -d "$(CARGO_INSTALL_ROOT)/lib" ] && rm -fr $(CARGO_INSTALL_ROOT)/lib; \
		for ext in a rlib so; do \
		if ls -1 $(CARGO_INSTALL_ROOT)/bin | grep -q "\.$$$$ext"; then \
			$(INSTALL_DIR) $(CARGO_INSTALL_ROOT)/lib; \
			mv $(CARGO_INSTALL_ROOT)/bin/*.$$$$ext $(CARGO_INSTALL_ROOT)/lib; \
		fi; \
		done; \
		find $(CARGO_INSTALL_ROOT) -type d -empty -delete; \
	);
  endef
  Hooks/Compile/Post += MoveLibs
else
  define Build/Install/Cargo
	$(RUSTC_HOST_VARS) \
	$(RUSTC_VARS) \
	$(CARGO_VARS) \
	$(CARGO_BIN) install \
		--bins \
		--no-track \
		--profile $(CARGO_PKG_PROFILE) \
		--path $(CARGO_BUILD_DIR) \
		--root $(CARGO_INSTALL_ROOT) \
	$(CARGO_ARGS)
  endef
endif

Build/Configure=$(call Build/Configure/Cargo)
Build/Compile=$(call Build/Compile/Cargo)
Build/Install=$(call Build/Install/Cargo)
