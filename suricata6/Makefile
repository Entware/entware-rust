# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=suricata
PKG_VERSION:=7.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.openinfosecfoundation.org/download
PKG_HASH:=7bcd1313118366451465dc3f8385a3f6aadd084ffe44dd257dda8105863bb769

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1
PYTHON3_PKG_BUILD:=0

PKG_BUILD_DEPENDS:=python-yaml/host

PKG_CONFIG_DEPENDS:= \
	CONFIG_SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/suricata6/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=OISF Suricata IDS
  URL:=https://www.openinfosecfoundation.org/
  DEPENDS:=+file +jansson +libatomic +libpcap +libcap-ng +liblz4 +libpcre
  DEPENDS+=+libyaml +zlib $(ICONV_DEPENDS)
  DEPENDS+= \
	+SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT:python3-light \
	+SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT:python3-logging \
	+SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT:python3-readline
endef

define Package/suricata6
  $(call Package/suricata6/Default)
  TITLE+= (reccommended)
  VARIANT:=reccommended
  DEPENDS+=+libevent2 +libevent2-pthreads +libhiredis +liblua +libmaxminddb
  DEPENDS+=+libnet-1.2.x
endef

define Package/suricata6-extra
  $(call Package/suricata6/Default)
  TITLE+= (extra)
  VARIANT:=extra
  DEPENDS+=+libevent2 +libevent2-pthreads +libhiredis +libmaxminddb +libnet-1.2.x
  DEPENDS+=+luajit +libnetfilter-log +libnetfilter-queue +libnss +nspr
endef

define Package/suricata6-mini
  $(call Package/suricata6/Default)
  TITLE+= (mimimal)
  VARIANT:=mini
endef

define Package/suricata6/description
  Suricata is the leading independent open source threat detection engine.
  By combining intrusion detection (IDS), intrusion prevention (IPS), network 
  security monitoring (NSM) and PCAP processing, Suricata can quickly identify,
  stop, and assess the most sophisticated attacks.
endef

Package/suricata6-extra/description=$(call Package/suricata6/description)
Package/suricata6-mini/description=$(call Package/suricata6/description)

define Package/suricata6/conffiles
/opt/etc/suricata/classification.config
/opt/etc/suricata/reference.config
/opt/etc/suricata/suricata.yaml
/opt/etc/suricata/threshold.config
endef

Package/suricata6-extra/conffiles=$(call Package/suricata6/conffiles)
Package/suricata6-mini/conffiles=$(call Package/suricata6/conffiles)

define Package/suricata6/config/Defauilt
  source "$(SOURCE)/Config-$(1).in"
endef

Package/suricata6-extra/config=$(call Package/suricata6/config/Defauilt,e)
Package/suricata6-mini/config=$(call Package/suricata6/config/Defauilt,m)
Package/suricata6/config=$(call Package/suricata6/config/Defauilt,r)

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

TARGET_LDFLAGS += -latomic

CONFIGURE_ARGS += \
	--disable-suricata-update \
	--enable-http2-decompression \
	--$(if $(CONFIG_SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT),en,dis)able-python \
	CARGO_HOME="$(STAGING_DIR)/host/share/cargo" \
	CARGO_BUILD_TARGET="$(RUST_TARGET_TRIPLE)"

ifeq ($(BUILD_VARIANT),extra)
CONFIGURE_ARGS += \
	--disable-lua \
	--enable-geoip \
	--enable-hiredis \
	--enable-nspr \
	--enable-nss \
	--enable-luajit \
	--enable-nflog \
	--enable-nfqueue \
	--with-libnet-includes=$(STAGING_DIR)/opt/include \
	--with-libnet-libraries=$(STAGING_DIR)/opt/lib

else ifeq ($(BUILD_VARIANT),mini)
CONFIGURE_ARGS += \
	--disable-hiredis \
	--disable-nspr \
	--disable-nss \
	--disable-lua \
	--disable-luajit \
	--disable-nflog \
	--disable-nfqueue

CONFIGURE_VARS += \
	ac_cv_lib_cap_ng_capng_clear=no \
	ac_cv_lib_lz4_LZ4F_createCompressionContext=no

else  # reccommended
CONFIGURE_ARGS += \
	--disable-luajit \
	--disable-nflog \
	--disable-nfqueue \
	--disable-nspr \
	--disable-nss \
	--enable-geoip \
	--enable-hiredis \
	--enable-lua \
	--with-libnet-includes=$(STAGING_DIR)/opt/include \
	--with-libnet-libraries=$(STAGING_DIR)/opt/lib

endif

define Package/suricata6/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/suricata $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/suricata
	$(INSTALL_CONF) \
		$(PKG_BUILD_DIR)/etc/classification.config \
		$(PKG_BUILD_DIR)/etc/reference.config \
		$(PKG_BUILD_DIR)/suricata.yaml \
		$(PKG_BUILD_DIR)/threshold.config \
			$(1)/opt/etc/suricata

	$(INSTALL_DIR) $(1)/opt/etc/suricata/rules
	$(CP) \
		$(PKG_INSTALL_DIR)/opt/share/suricata/rules/*.rules \
			$(1)/opt/etc/suricata/rules

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libhtp.so* $(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/var/lib/suricata/rules
	$(INSTALL_DIR) $(1)/opt/var/log/suricata/{certs,files}
	$(INSTALL_DIR) $(1)/opt/var/run/suricata
  ifeq ($(CONFIG_SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT),y)
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/suricata{ctl,sc} $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/lib/suricata
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/suricata/python $(1)/opt/lib/suricata/
	# Entware specific: fix exec path in scripts
	$(call Python3/FixShebang, \
		$(1)/opt/bin/suricatactl \
		$(1)/opt/bin/suricatasc \
		$(1)/opt/lib/suricata/python/suricata/sc/suricatasc.py \
	)
  endif
endef

Package/suricata6-extra/install=$(Package/suricata6/install)
Package/suricata6-mini/install=$(Package/suricata6/install)


define Package/suricata6/postinst
#!/bin/sh

echo -e "\n\tCurrent Suricata ruleset can be found at:
\thttps://rules.emergingthreats.net/open/suricata-$(PKG_VERSION)/emerging.rules.tar.gz
\n\tor you can install suricata6-update package\n"
endef

Package/suricata6-extra/postinst=$(Package/suricata6/postinst)
Package/suricata6-mini/postinst=$(Package/suricata6/postinst)

$(eval $(call BuildPackage,suricata6))
$(eval $(call BuildPackage,suricata6-extra))
$(eval $(call BuildPackage,suricata6-mini))
