# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-cryptography
PKG_VERSION:=41.0.3
PKG_RELEASE:=1

PYPI_NAME:=cryptography
PKG_HASH:=6d192741113ef5e30d89dcb5b956ef4e1578f304708701b8b73d38e3e1461f34

PKG_LICENSE:=Apache-2.0 BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE LICENSE.APACHE LICENSE.BSD LICENSE.PSF

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include ../rust.mk

PKG_BUILD_DEPENDS += \
	libffi/host \
	python-cffi/host \
	python-setuptools-rust/host \
	python-wheel/host

define Package/python3-cryptography
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Cryptographic recipes and primitives (rust)
  URL:=https://github.com/pyca/cryptography
  DEPENDS:= \
	+libopenssl \
	+python3-cffi \
	+python3-distutils \
	+python3-email \
	+python3-urllib \
	+python3-uuid
endef

define Package/python3-cryptography/description
  cryptography is a package which provides cryptographic recipes and primitives
  to Python developers. Our goal is for it to be your "cryptographic standard
  library". It supports Python 3.6+ and PyPy3 7.2+.
endef

RUSTFLAGS += -C relocation-model=pic

PYTHON3_PKG_SETUP_VARS += \
	CARGO_BUILD_TARGET="$(RUST_TARGET_TRIPLE)" \
	CARGO_HOME="$(CARGO_HOME)" \
	RUSTFLAGS="$(RUSTFLAGS)"

$(eval $(call Py3Package,python3-cryptography))
$(eval $(call BuildPackage,python3-cryptography))
#$(eval $(call BuildPackage,python3-cryptography-src))
