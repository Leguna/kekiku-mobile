import java.util.Properties
import java.io.FileInputStream

plugins {
  id("com.android.application")
  id("kotlin-android")
  id("dev.flutter.flutter-gradle-plugin")
  id("com.google.gms.google-services")
}

val keyProperties = Properties()
val keyPropertiesFile = rootProject.file("key.properties")
if (keyPropertiesFile.exists()) {
  keyProperties.load(FileInputStream(keyPropertiesFile))
}

tasks.withType<JavaCompile> {
  options.compilerArgs.add("-Xlint:-options")
}

android {
  namespace = "site.arksana.kekiku"
  compileSdk = flutter.compileSdkVersion
  ndkVersion = "27.0.12077973"

  compileOptions {
    isCoreLibraryDesugaringEnabled = true
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
  }

  kotlinOptions {
    jvmTarget = JavaVersion.VERSION_11.toString()
  }

  defaultConfig {
    applicationId = "site.arksana.kekiku"
    minSdk = 23
    targetSdk = flutter.targetSdkVersion
    versionCode = flutter.versionCode
    versionName = flutter.versionName
    multiDexEnabled = true
  }

  signingConfigs {
    create("release") {
      storeFile = file(keyProperties["storeFile"] as String)
      storePassword = keyProperties["storePassword"] as String
      keyAlias = keyProperties["keyAlias"] as String
      keyPassword = keyProperties["keyPassword"] as String
    }
  }

  buildTypes {
    getByName("release") {
      isMinifyEnabled = false
      isMinifyEnabled = true
      isShrinkResources = true
      signingConfig = signingConfigs.getByName("release")
      proguardFiles(
        getDefaultProguardFile("proguard-android-optimize.txt"),
        "proguard-rules.pro"
      )
    }
  }
}

flutter {
  source = "../.."
}

dependencies {
  coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}