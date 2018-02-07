$NetBSD$

--- test/sanitizer_common/TestCases/NetBSD/kvm_open.cc.orig	2018-02-06 15:16:34.859277674 +0000
+++ test/sanitizer_common/TestCases/NetBSD/kvm_open.cc
@@ -0,0 +1,13 @@
+// RUN: %clangxx -O0 -g %s -o %t && %run %t
+
+#include <fcntl.h>
+#include <kvm.h>
+
+int main(void) {
+  kvm_t K;
+
+  K = kvm_open(NULL, NULL, NULL, KVM_NO_FILES, "kvm_open");
+  kvm_close(&K);
+
+  return 0;
+}
