# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/feeds/rust/rust.mk

### cargo-build - Compile local packages and all of their dependencies.
CARGO_COMPILE ?= 1

CARGO_ARGS += -Z unstable-options

define Build/Configure/Cargo
endef
#	( [ -f $(PKG_BUILD_DIR)/.cargo/config.toml ]; $(RM) $(PKG_BUILD_DIR)/.catgo/config.toml ; \
#		$(INSTALL_DIR) $(PKG_BUILD_DIR)/.cargo; \
#	( \
#		echo '[target.$(RUST_TARGET_TRIPLE)]'; \
#		echo 'linker = "$(TARGET_CROSS)gcc"'; \
#		echo '[install]'; \
#		echo 'root = "$(PKG_INSTALL_DIR)/opt"'; \
#	) > $(PKG_BUILD_DIR)/.cargo/config.toml ; \
#	)
#endef

ifeq ($(CARGO_COMPILE),1)
  define Build/Compile/Cargo
	$(RUSTC_VARS) \
	RUSTFLAGS="$(RUSTFLAGS)" \
	$(CARGO_VARS) \
	$(CARGO_BIN) build \
	--profile minsize \
	--manifest-path $(CARGO_BUILD_DIR)/Cargo.toml \
	--out-dir $(CARGO_INSTALL_ROOT)/bin \
	$(CARGO_ARGS)
  endef
  define MoveLibs
	@( \
		if ls -1 $(CARGO_INSTALL_ROOT)/bin | grep -q '\.rlib'; then \
			rm -f $(CARGO_INSTALL_ROOT)/lib/*; \
			$(INSTALL_DIR) $(CARGO_INSTALL_ROOT)/lib; \
			mv -f $(CARGO_INSTALL_ROOT)/bin/*.rlib $(CARGO_INSTALL_ROOT)/lib; \
		fi; \
	);
  endef
  Hooks/Compile/Post += MoveLibs
else
  define Build/Install/Cargo
	$(RUSTC_VARS) \
	RUSTFLAGS="$(RUSTFLAGS)" \
	$(CARGO_VARS) \
	$(CARGO_BIN) install --bins --no-track \
	--profile minsize \
	--path $(CARGO_BUILD_DIR) \
	--root $(CARGO_INSTALL_ROOT) \
	$(CARGO_ARGS)
  endef
endif

Build/Configure=$(call Build/Configure/Cargo)
Build/Compile=$(call Build/Compile/Cargo)
Build/Install=$(call Build/Install/Cargo)
