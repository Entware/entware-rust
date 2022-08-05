# $(STAGING_DIR)/host/share/cargo/registry/src/github.com-*/clipboard-*/

--- a/src/lib.rs
+++ b/src/lib.rs
@@ -19,8 +19,8 @@
 #![crate_type = "dylib"]
 #![crate_type = "rlib"]
 
-#[cfg(all(unix, not(any(target_os="macos", target_os="android"))))]
-extern crate x11_clipboard as x11_clipboard_crate;
+//#[cfg(all(unix, not(any(target_os="macos", target_os="android"))))]
+//extern crate x11_clipboard as x11_clipboard_crate;
 
 #[cfg(windows)]
 extern crate clipboard_win;
@@ -36,8 +36,8 @@
 mod common;
 pub use common::ClipboardProvider;
 
-#[cfg(all(unix, not(any(target_os="macos", target_os="android"))))]
-pub mod x11_clipboard;
+//#[cfg(all(unix, not(any(target_os="macos", target_os="android"))))]
+//pub mod x11_clipboard;
 
 #[cfg(windows)]
 pub mod windows_clipboard;
@@ -48,7 +48,8 @@
 pub mod nop_clipboard;
 
 #[cfg(all(unix, not(any(target_os="macos", target_os="android"))))]
-pub type ClipboardContext = x11_clipboard::X11ClipboardContext;
+//pub type ClipboardContext = x11_clipboard::X11ClipboardContext;
+pub type ClipboardContext = nop_clipboard::NopClipboardContext;
 #[cfg(windows)]
 pub type ClipboardContext = windows_clipboard::WindowsClipboardContext;
 #[cfg(target_os="macos")]
