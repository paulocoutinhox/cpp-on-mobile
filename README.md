# CppOnMobile

Projeto **CppOnMobile** demonstra como usar **C++ nativamente** em **Android** e **iOS**, integrando o mesmo código base em ambas as plataformas por meio de ferramentas modernas como **CMake**, **Gradle**, **Xcode**, **Djinni**, **Nativium** e **XPLPC**.

## 🚀 Visão Geral

O projeto é dividido em duas partes principais:

- **android/** → Contém o projeto Android com suporte ao NDK, Gradle e CMake.
- **ios/** → Contém o projeto iOS com integração via Xcode.

O objetivo é demonstrar como criar bibliotecas em C++ reutilizáveis e integrá-las nativamente em ambos os ambientes, aproveitando o máximo desempenho e eficiência da linguagem.

## 📁 Estrutura do Projeto

```
cpp-on-mobile/
├── android/
│   ├── app/
│   ├── gradle/
│   ├── build.gradle.kts
│   └── settings.gradle.kts
├── ios/
│   ├── CppOnMobile/
│   └── CppOnMobile.xcodeproj
└── README.md
```

## 🧩 Build do Projeto

### 🪟 Android (Gradle + CMake)

**Exemplo de build:**

```bash
cd android
./gradlew assembleRelease
```

O arquivo resultante será gerado em:

```
android/build/outputs/aar/mylib-release.aar
```

Para testar em outro projeto:

```gradle
implementation files('libs/mylib-release.aar')
```

### 🍎 iOS (Xcode + CMake)

**Gerar XCFramework universal:**

```bash
cmake -S . -B build_ios -G "Xcode"   -D CMAKE_SYSTEM_NAME=iOS   -D CMAKE_OSX_SYSROOT=iphoneos   -D CMAKE_OSX_ARCHITECTURES=arm64   -D CMAKE_OSX_DEPLOYMENT_TARGET=12.0   -D BUILD_SHARED_LIBS=OFF
cmake --build build_ios --config Release
```

Criar o pacote universal:

```bash
xcodebuild -create-xcframework   -library build_ios/Release-iphoneos/libmylib.a -headers include   -library build_sim/Release-iphonesimulator/libmylib.a -headers include   -output MyLibrary.xcframework
```

## 🧠 Ferramentas e Tecnologias

- **CMake** — Sistema de build multiplataforma.  
- **Gradle** — Ferramenta de automação para Android.  
- **Xcode** — Ambiente de desenvolvimento iOS/macOS.  
- **Djinni** — Gerador de glue code para integrar C++, Java e Objective-C.  
- **Nativium** — Toolkit modular para automação de builds em várias plataformas.  
- **XPLPC** — Framework leve para chamadas de procedimento entre linguagens (LPC).  

## 🏗️ Exemplo de Estrutura de Biblioteca

```
projeto/
├── include/
│   └── mylib.hpp
├── src/
│   └── mylib.cpp
└── CMakeLists.txt
```

**Build estático e compartilhado:**

```bash
cmake -S . -B build -D BUILD_SHARED_LIBS=OFF
cmake --build build
```

```bash
cmake -S . -B build -D BUILD_SHARED_LIBS=ON
cmake --build build
```

## 🧰 Empacotamento com CPack

**Gerar pacotes (.zip, .dmg, .deb, etc):**

```bash
cpack -G TGZ -C Release
# ou
cpack -G DEB -C Release
# ou
cpack -G NSIS -C Release
```

## 🧱 Glue Code com Djinni

Exemplo de interface cross-platform:

```djinni
my_cpp_interface = interface +c {
    static get_version(): i32;
    method_returning_nothing(value: i32);
}
```

Gerar o código nativo:

```bash
djinni --cpp-out CPP_OUTPUT_FOLDER --jni-out JNI_OUTPUT_FOLDER --objc-out OBJC_OUTPUT_FOLDER --idl MY_PROJECT.djinni
```

Repositório de referência: [Snapchat/Djinni](https://github.com/Snapchat/djinni)

## 🧩 Nativium e XPLPC

- **Nativium:** Filosofia *Write Once, Compile Anywhere*.
- **XPLPC:** Conecta linguagens e plataformas via Lite Procedure Call.

Ambos simplificam o processo de integração entre plataformas, builds e empacotamento.

Repositórios:  
- [Nativium](https://github.com/nativium/nativium)  
- [XPLPC](https://github.com/xplpc/xplpc)

## 🏢 Casos de Uso

Empresas que utilizam C++ multiplataforma:

- Ubook
- Dropbox
- Snapchat
- Spotify
- Telegram - TDLib
- Microsoft - Suite Office Mobile
- Mapbox Maps

Principais benefícios:

- Redução do tamanho do app  
- Código unificado para Android e iOS  
- Performance e eficiência energética  
- Testes no desktop antes do deploy mobile  

## 📚 Referências

- [Bjarne Stroustrup - The C++ Programming Language](https://www.stroustrup.com/oopsla.pdf)  
- [ISO C++ Foundation](https://isocpp.org/)  
- [Alphalist - Where C++ Excels](https://alphalist.com/blog/where-c-plus-plus-excels)

## 📄 Licença

Este projeto é distribuído sob a licença MIT.  

**Autor:** Paulo Coutinho  
📧 [paulocoutinhox@gmail.com](mailto:paulocoutinhox@gmail.com)
