$NetBSD$

--- chrome/browser/extensions/api/omnibox/omnibox_api.cc.orig	2017-02-02 02:02:49.000000000 +0000
+++ chrome/browser/extensions/api/omnibox/omnibox_api.cc
@@ -45,7 +45,7 @@ const char kBackgroundTabDisposition[] =
 // Pref key for omnibox.setDefaultSuggestion.
 const char kOmniboxDefaultSuggestion[] = "omnibox_default_suggestion";
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
 static const int kOmniboxIconPaddingLeft = 2;
 static const int kOmniboxIconPaddingRight = 2;
 #elif defined(OS_MACOSX)
