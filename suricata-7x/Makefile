# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=suricata
PKG_VERSION:=7.0.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.openinfosecfoundation.org/download
PKG_HASH:=21824f7ff12087c0c9b9de207199a75a9c31b03036688c7cb9c178f0a3b57f8d

PKG_LICENSE:=GPL-2.0-only
PKG_LICENSE_FILES:=COPYING LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1
PYTHON3_PKG_BUILD:=0

PKG_BUILD_DEPENDS:=python-yaml/host

PKG_CONFIG_DEPENDS:= \
	CONFIG_SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/suricata7/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=OISF Suricata IDS
  URL:=https://www.openinfosecfoundation.org/
  DEPENDS:=+jansson +libatomic +libelf +libmagic +libpcap +libcap-ng +liblz4
  DEPENDS+=+libpcre2 +libyaml +zlib $(ICONV_DEPENDS)
  DEPENDS+= \
	+SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT:python3-light \
	+SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT:python3-logging \
	+SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT:python3-readline
endef

define Package/suricata7
  $(call Package/suricata7/Default)
  TITLE+= (reccommended)
  VARIANT:=reccommended
  DEPENDS+=+libevent2 +libevent2-pthreads +libhiredis +liblua +libmaxminddb
  DEPENDS+=+libnet-1.2.x
endef

define Package/suricata7-extra
  $(call Package/suricata7/Default)
  TITLE+= (extra)
  VARIANT:=extra
  DEPENDS+=+libevent2 +libevent2-pthreads +libhiredis +libmaxminddb +libnet-1.2.x
  DEPENDS+=+libnetfilter-log +libnetfilter-queue @HAS_LUAJIT_ARCH +luajit
endef

define Package/suricata7-mini
  $(call Package/suricata7/Default)
  TITLE+= (mimimal)
  VARIANT:=mini
endef

define Package/suricata7/description
  Suricata is the leading independent open source threat detection engine.
  By combining intrusion detection (IDS), intrusion prevention (IPS), network 
  security monitoring (NSM) and PCAP processing, Suricata can quickly identify,
  stop, and assess the most sophisticated attacks.
endef

Package/suricata7-extra/description=$(call Package/suricata7/description)
Package/suricata7-mini/description=$(call Package/suricata7/description)

define Package/suricata7/conffiles
/opt/etc/suricata/classification.config
/opt/etc/suricata/reference.config
/opt/etc/suricata/suricata.yaml
/opt/etc/suricata/threshold.config
endef

Package/suricata7-extra/conffiles=$(call Package/suricata7/conffiles)
Package/suricata7-mini/conffiles=$(call Package/suricata7/conffiles)

define Package/suricata7/config/Defauilt
  source "$(SOURCE)/Config-$(1).in"
endef

Package/suricata7-extra/config=$(call Package/suricata7/config/Defauilt,e)
Package/suricata7-mini/config=$(call Package/suricata7/config/Defauilt,m)
Package/suricata7/config=$(call Package/suricata7/config/Defauilt,r)

TARGET_LDFLAGS += -latomic

CONFIGURE_ARGS += \
	--disable-suricata-update \
	--$(if $(CONFIG_SURICATA_$(BUILD_VARIANT)_PYTHON_SUPPORT),en,dis)able-python \
	CARGO_HOME="$(CARGO_HOME)" \
	CARGO_BUILD_TARGET="$(RUSTC_TARGET_ARCH)"

ifeq ($(BUILD_VARIANT),extra)
CONFIGURE_ARGS += \
	--disable-lua \
	--enable-geoip \
	--enable-hiredis \
	--enable-luajit \
	--enable-nflog \
	--enable-nfqueue \
	--with-libnet-includes=$(STAGING_DIR)/opt/include \
	--with-libnet-libraries=$(STAGING_DIR)/opt/lib

else ifeq ($(BUILD_VARIANT),mini)
CONFIGURE_ARGS += \
	--disable-hiredis \
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
	--enable-geoip \
	--enable-hiredis \
	--enable-lua \
	--with-libnet-includes=$(STAGING_DIR)/opt/include \
	--with-libnet-libraries=$(STAGING_DIR)/opt/lib

endif

define Package/suricata7/install
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

Package/suricata7-extra/install=$(Package/suricata7/install)
Package/suricata7-mini/install=$(Package/suricata7/install)


define Package/suricata7/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_blue_cur_ul="\033[1;3;4;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s$$ansi_std\n" "Info:" "current Suricata ruleset can be found at:"
printf "\t$$ansi_blue_cur_ul%s$$ansi_std\n\n" "https://rules.emergingthreats.net/open/suricata-$(PKG_VERSION)/emerging.rules.tar.gz"
printf "\t$$ansi_white%s$$ansi_white_cur %s$$ansi_std$$ansi_white %s$$ansi_std\n\n" "or you can install" "'suricata-update'" "package"
endef

Package/suricata7-extra/postinst=$(Package/suricata7/postinst)
Package/suricata7-mini/postinst=$(Package/suricata7/postinst)

$(eval $(call BuildPackage,suricata7))
$(eval $(call BuildPackage,suricata7-extra))
$(eval $(call BuildPackage,suricata7-mini))
