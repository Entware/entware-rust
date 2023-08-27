# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/feeds/rust/rust.mk

### cargo-build - Compile local packages and all of their dependencies.
CARGO_COMPILE ?= 1

### cargo-install - Build and install a Rust binary
CARGO_INSTALL ?= 0

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

  CARGO_ARGS += -Z unstable-options

  define Build/Compile/Cargo
	$(RUSTC_VARS) \
	RUSTFLAGS="$(RUSTFLAGS)" \
	cargo build \
	--release \
	$(CARGO_ARGS) \
	--manifest-path $(CARGO_BUILD_DIR)/Cargo.toml \
	--out-dir $(CARGO_INSTALL_ROOT)/bin \
	$(CARGO_VARS)
  endef
else
  CARGO_INSTALL:=1
endif

ifeq ($(CARGO_INSTALL),1)
  define Build/Install/Cargo
	$(RUSTC_VARS) \
	RUSTFLAGS="$(RUSTFLAGS)" \
	cargo install \
	$(CARGO_ARGS) \
	--path $(CARGO_BUILD_DIR) \
	--root $(CARGO_INSTALL_ROOT) \
	$(CARGO_VARS)
  endef
endif

Build/Configure=$(call Build/Configure/Cargo)
Build/Compile=$(call Build/Compile/Cargo)
Build/Install=$(call Build/Install/Cargo)
