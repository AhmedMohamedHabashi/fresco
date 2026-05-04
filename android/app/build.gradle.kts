plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")

    // Google Services (Firebase)
    id("com.google.gms.google-services")
}

android {
    namespace = "com.devVision.fresco"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.devVision.fresco"

        minSdk = flutter.minSdkVersion  // مهم جدًا لـ Firebase Auth
        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // Firebase BOM (بيخلي الإصدارات متوافقة تلقائيًا)
    implementation(platform("com.google.firebase:firebase-bom:34.12.0"))

    // Firebase Auth
    implementation("com.google.firebase:firebase-auth")

    // Analytics (اختياري)
    implementation("com.google.firebase:firebase-analytics")
}

flutter {
    source = "../.."
}
