## Keep `Companion` object fields of serializable classes.
## This avoids serializer lookup through `getDeclaredClasses` as done for named companion objects.
-if @kotlinx.serialization.Serializable class **
-keepclassmembers class <1> {
    static <1>$Companion Companion;
}

## Keep `serializer()` on companion objects (both default and named) of serializable classes.
-if @kotlinx.serialization.Serializable class ** {
    static **$* *;
}
-keepclassmembers class <2>$<3> {
    kotlinx.serialization.KSerializer serializer(...);
}

## Keep `INSTANCE.serializer()` of serializable objects.
-if @kotlinx.serialization.Serializable class ** {
    public static ** INSTANCE;
}
-keepclassmembers class <1> {
    public static <1> INSTANCE;
    kotlinx.serialization.KSerializer serializer(...);
}

## @Serializable and @Polymorphic are used at runtime for polymorphic serialization.
-keepattributes RuntimeVisibleAnnotations,AnnotationDefault

-keepnames class <1>$$serializer { # -keepnames suffices; class is kept when serializer() is kept.
    static <1>$$serializer INSTANCE;
}

# Uncomment this to preserve the line number information for
# debugging stack traces.
-keepattributes SourceFile,LineNumberTable

# Repackage classes into the top-level.
-repackageclasses

# Amount of optimization iterations, taken from an SO post
-optimizationpasses 5

# Broaden access modifiers to increase results during optimization
-allowaccessmodification

# Add these for your dependencies
-keep class androidx.compose.** { *; }
-keep class * extends androidx.room.RoomDatabase { *; }
-keep class * extends androidx.lifecycle.ViewModel { *; }
-keep class io.insert-koin.** { *; }
-keep class kotlinx.coroutines.** { *; }
-keep class xyz.wingio.logra.** { *; }

# Keep Koin
-keep class org.koin.** { *; }
-keepclassmembers class * {
    @org.koin.core.annotation.Module *;
}
-keepclassmembers class * {
    @org.koin.core.annotation.Single *;
}
-keepclassmembers class * {
    @org.koin.core.annotation.Factory *;
}

# Keep Shizuku
-keep class dev.rikka.shizuku.** { *; }

# Keep Voyager
-keep class cafe.adriel.voyager.** { *; }

# Keep Room entities
-keepclassmembers class * {
    @androidx.room.Entity *;
    @androidx.room.PrimaryKey *;
}

# Keep Compose runtime
-keep class androidx.compose.runtime.** { *; }

# Keep your app's main components
-keep class xyz.wingio.logra.ui.** { *; }
-keep class xyz.wingio.logra.domain.** { *; }
-keep class xyz.wingio.logra.data.** { *; }

# Keep all classes in your app package
-keep class xyz.wingio.logra.** { *; }

# Keep all Composable functions
-keep @androidx.compose.runtime.Composable class * {
    @androidx.compose.runtime.Composable <methods>;
}

# Keep ViewModels
-keepclassmembers class * extends androidx.lifecycle.ViewModel {
    <init>(...);
}

# Keep Room components
-keep class * extends androidx.room.RoomDatabase {
    *;
}
-keep @androidx.room.Entity class * { *; }

# Keep Koin components
-keep class org.koin.** { *; }
-keepclassmembers class * {
    @org.koin.core.annotation.Module *;
    @org.koin.core.annotation.Single *;
    @org.koin.core.annotation.Factory *;
}

# Disable aggressive optimization temporarily to fix R8
-dontoptimize
