package com.example.yandex_asadbek

import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("ru_RU") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("8d70ec9b-865b-4e9d-a200-67d4d0acd304") // Your generated API key
    }
}