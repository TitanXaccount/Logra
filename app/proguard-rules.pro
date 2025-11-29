# UNCOMMENT these essential rules:
-if @kotlinx.serialization.Serializable class **
-keepclassmembers class <1> {
    static <1>$Companion Companion;
}

-if @kotlinx.serialization.Serializable class ** {
    static **$* *;
}
-keepclassmembers class <2>$<3> {
    kotlinx.serialization.KSerializer serializer(...);
}

-if @kotlinx.serialization.Serializable class ** {
    public static ** INSTANCE;
}
-keepclassmembers class <1> {
    public static <1> INSTANCE;
    kotlinx.serialization.KSerializer serializer(...);
}

-keepattributes RuntimeVisibleAnnotations,AnnotationDefault

-keepnames class <1>$$serializer {
    static <1>$$serializer INSTANCE;
}

-keepattributes SourceFile,LineNumberTable
-repackageclasses
-optimizationpasses 5
-allowaccessmodification

# ADD these for your app:
-keep class xyz.wingio.logra.** { *; }
-keep class org.koin.** { *; }
