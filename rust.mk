# SPDX-License-Identifier: WTFPL

### deps
PKG_BUILD_DEPENDS:=rustc-dev

CARGO_BUILD_DIR = $(PKG_BUILD_DIR)$(if $(CARGO_SOURCE_SUBDIR),/$(CARGO_SOURCE_SUBDIR))

CARGO_HOME:=$(STAGING_DIR)/host/share/cargo

CARGO_INSTALL_ROOT:=$(PKG_INSTALL_DIR)/opt
CARGO_TARGET_DIR:=$(PKG_BUILD_DIR)/openwrt-build

CARGO_BIN:=$(STAGING_DIR)/host/bin/cargo
RUSTC_BIN:=$(STAGING_DIR)/host/bin/rustc
RUSTC_WRAPPER_BIN:=$(RUSTC_BIN)
RUSTDOC_BIN:=$(STAGING_DIR)/host/bin/rustdoc
RUSTFMT_BIN:=$(STAGING_DIR)/host/bin/rustfmt

CARGO_ARGS ?=
CARGO_VARS ?=
RUSTC_VARS ?=
RUSTFLAGS ?=

# target
RUST_TARGET_TRIPLE:=$(REAL_GNU_TARGET_NAME)

ifeq ($(CONFIG_TARGET_armv5_3_2),y)
RUST_TARGET_TRIPLE:=$(subst arm,armv5te,$(RUST_TARGET_TRIPLE))
endif

ifeq ($(or $(CONFIG_TARGET_armv7_2_6),$(CONFIG_TARGET_armv7_3_2)),y)
RUST_TARGET_TRIPLE:=$(subst arm,armv7,$(RUST_TARGET_TRIPLE))
endif

ifeq ($(CONFIG_TARGET_x86_2_6),y)
RUST_TARGET_TRIPLE:=$(subst i486,i586,$(RUST_TARGET_TRIPLE))
endif

### any `-sys` packages
RUSTC_VARS += \
	CARGO_BUILD_TARGET="$(RUST_TARGET_TRIPLE)" \
	CARGO_HOME="$(CARGO_HOME)" \
	CARGO_INSTALL_ROOT="$(CARGO_INSTALL_ROOT)" \
	CARGO_TARGET_DIR="$(CARGO_TARGET_DIR)" \
	CRATE_CC_NO_DEFAULTS="" \
	CROSS_COMPILE="$(REAL_GNU_TARGET_NAME)-" \
	PKG_CONFIG_ALLOW_CROSS=1 \
	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
	PKG_CONFIG_PATH="$(STAGING_DIR)/opt/lib/pkgconfig:$(STAGING_DIR)/opt/share/pkgconfig" \
	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)/opt" \
	RUSTC="$(RUSTC_BIN)" \
	RUSTDOC="$(RUSTDOC_BIN)" \
	RUSTFMT="$(RUSTFMT_BIN)" \
	TARGET="$(RUST_TARGET_TRIPLE)" \
	AR="$(TARGET_AR)" \
	CC="$(TARGET_CC)" \
	CXX="$(TARGET_CXX)" \
	CFLAGS="$(TARGET_CFLAGS)" \
	CXXFLAGS="$(TARGET_CXXFLAGS)" \
	TARGET_AR="$(TARGET_AR)" \
	TARGET_CC="$(TARGET_CC)" \
	TARGET_CXX="$(TARGET_CXX)" \
	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
	TARGET_CXXFLAGS="$(TARGET_CXXFLAGS)" \
	HOST_AR="$(AR)" \
	HOST_CC="$(HOSTCC)" \
	HOST_CXX="$(HOSTCXX)" \
	HOST_CFLAGS="$(HOST_CFLAGS)" \
	HOST_CXXFLAGS="$(HOST_CFLAGS)"

#ifeq ($(CONFIG_ARCH_64BIT),y)
#RUSTC_VARS += \
#	CARGO_CFG_TARGET_POINTER_WIDTH=64
#else
#RUSTC_VARS += \
#	CARGO_CFG_TARGET_POINTER_WIDTH=32
#endif

#ifeq ($(CONFIG_BIG_ENDIAN),y)
#RUSTC_VARS += \
#	CARGO_CFG_TARGET_ENDIAN=big
#else
#RUSTC_VARS += \
#	CARGO_CFG_TARGET_ENDIAN=little
#endif

RUSTFLAGS += \
	-C link-arg=-Wl,--dynamic-linker=/opt/lib/$(DYNLINKER)

### the package size shrinks a bit ~42%
RUST_OPT_SIZE ?= 1

ifeq ($(RUST_OPT_SIZE),1)
RUSTFLAGS += \
	-C codegen-units=1 \
	-C opt-level=z \
	-C panic=abort \
	-C relocation-model=static \
	-C strip=symbols
endif

### the package size shrinks a bit more ~12%
### if - "error: lto can only be run for executables, cdylibs and static library outputs"
### set `RUST_MIN_SIZE:=0`
RUST_MIN_SIZE ?= 1

ifeq ($(RUST_MIN_SIZE),1)
RUSTFLAGS += \
	-C embed-bitcode=yes \
	-C lto=yes
endif
### total: RUST_OPT_SIZE + RUST_MIN_SIZE ~49%

### aarch64/x86_64: -C no-redzone=yes
