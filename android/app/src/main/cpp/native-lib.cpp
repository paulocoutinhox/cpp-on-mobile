#include <jni.h>
#include <string>
#include "MyCppLib.hpp"

extern "C" JNIEXPORT jstring JNICALL
Java_com_paulocoutinho_cpponmobile_MainActivity_stringFromJNI(JNIEnv *env, jobject /* this */)
{
    std::string hello = getStringFromCpp();

    return env->NewStringUTF(hello.c_str());
}
