package com.example.common_plugin_set

import android.content.Context

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** CommonPluginSetPlugin */
class CommonPluginSetPlugin :
    FlutterPlugin, BookApi{
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var context: Context
    private lateinit var reportApi: ReportApi

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext

        BookApi.setUp(flutterPluginBinding.binaryMessenger,this)
        reportApi = ReportApi(flutterPluginBinding.binaryMessenger)

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun getBookDetails(isbn: String): Book {
        return Book(isbn, "Example Book Title")
    }

    override fun downlodBook(
        isbn: String,
        callback: (kotlin.Result<Unit>) -> Unit
    ) {
        reportApi.reportBook("1234567890", "Example Book Title"){}
        callback(kotlin.Result.success(Unit))
    }

    override fun sum(a: Double, b: Double): Double {

        return a + b
    }
}
