# $(STAGING_DIR)/host/share/cargo/registry/src/github.com-*/procfs-*/

--- a/src/process/namespaces.rs
+++ b/src/process/namespaces.rs
@@ -30,7 +30,7 @@
                 ns_type,
                 path,
                 identifier: stat.st_ino,
-                device_id: stat.st_dev,
+                device_id: stat.st_dev as u64,
             })
         }
 
