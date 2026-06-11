package com.example.common_plugin_set

import android.content.Context

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** CommonPluginSetPlugin */
class CommonPluginSetPlugin :
    PaymentGateway,
    FlutterPlugin {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity

    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        PaymentGateway.setUp(flutterPluginBinding.binaryMessenger,this)
    }



    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun initialize(
        config: PaymentConfig,
        callback: (kotlin.Result<Unit>) -> Unit
    ) {

    }

    override fun makePayment(
        request: PaymentRequest,
        callback: (kotlin.Result<PaymentResult>) -> Unit
    ) {
        Thread {
            try {
                Thread.sleep(2 * 1000)

                callback(
                    kotlin.Result.success(
                        PaymentResult(
                            "success",
                            "${request.transactionId} Payment successful ${request.amount}${request.currency}!"
                        )
                    )
                )
            } catch (e: Exception) {
                callback(kotlin.Result.failure(e))
            }
        }.start()
    }
}
