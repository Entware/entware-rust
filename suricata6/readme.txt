diff --git a/libs/libnetfilter-log/Makefile b/libs/libnetfilter-log/Makefile
index c2acff4ac..0aff1f778 100644
--- a/libs/libnetfilter-log/Makefile
+++ b/libs/libnetfilter-log/Makefile
@@ -9,7 +9,7 @@ include $(TOPDIR)/rules.mk
 
 PKG_NAME:=libnetfilter_log
 PKG_VERSION:=1.0.2
-PKG_RELEASE:=1
+PKG_RELEASE:=1a
 
 PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
 PKG_SOURCE_URL:= \
diff --git a/libs/libnetfilter-log/patches/500-fix-for-old-kernels.patch b/libs/libnetfilter-log/patches/500-fix-for-old-kernels.patch
new file mode 100644
index 000000000..52578e386
--- /dev/null
+++ b/libs/libnetfilter-log/patches/500-fix-for-old-kernels.patch
@@ -0,0 +1,18 @@
+--- a/include/libnetfilter_log/libnetfilter_log.h
++++ b/include/libnetfilter_log/libnetfilter_log.h
+@@ -9,8 +9,15 @@
+ #ifndef __LIBNETFILTER_LOG_H
+ #define __LIBNETFILTER_LOG_H
+ 
++#ifndef LINUX_VERSION_CODE
++#include <linux/version.h>
++#endif
++
+ #include <stdint.h>
+ #include <sys/types.h>
++#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,37)
++#include <sys/socket.h> // fix sa_family_t /* AF_NETLINK */
++#endif
+ #include <linux/netlink.h>
+ #include <libnetfilter_log/linux_nfnetlink_log.h>
+