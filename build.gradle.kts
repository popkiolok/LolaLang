plugins {
    kotlin("jvm") version "1.9.0"
    id("antlr")
}

group = "com.lola.lang"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    "antlr"("org.antlr:antlr4:+")

    testImplementation(kotlin("test"))
}

tasks.test {
    useJUnitPlatform()
}

kotlin {
    jvmToolchain(17)
}