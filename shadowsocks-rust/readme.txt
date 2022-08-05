# $(STAGING_DIR)/host/share/cargo/registry/src/github.com-*/sha1-asm-*/

--- a/build.rs
+++ b/build.rs
@@ -15,7 +15,7 @@
     };
     let mut build = cc::Build::new();
     if target_arch == "aarch64" {
-        build.flag("-march=armv8-a+crypto");
+        build.flag("-mcpu=cortex-a53+crypto");
     }
     build.flag("-c").file(asm_path).compile("libsha1.a");
 }
