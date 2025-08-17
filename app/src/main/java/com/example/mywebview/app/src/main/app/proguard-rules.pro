# ====== PROGUARD RULES MINIMAL ======

# Keep all classes dari AndroidX (biar gak error)
-keep class androidx.** { *; }
-dontwarn androidx.**

# Keep semua Activity, Service, BroadcastReceiver, ContentProvider
-keep class * extends android.app.Activity
-keep class * extends android.app.Service
-keep class * extends android.content.BroadcastReceiver
-keep class * extends android.content.ContentProvider

# Keep semua WebView (biar fungsi loadUrl gak error)
-keepclassmembers class * extends android.webkit.WebView {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public void addJavascriptInterface(java.lang.Object, java.lang.String);
    public void loadUrl(java.lang.String);
}

# Jangan optimize native method
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep semua method dipanggil lewat refleksi (misal Firebase / SDK pihak ketiga)
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
