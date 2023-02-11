package com.example.integrationflutter

import android.widget.Toast
import com.google.android.material.snackbar.Snackbar
import com.tuya.smart.android.user.api.ILoginCallback
import com.tuya.smart.android.user.api.IRegisterCallback
import com.tuya.smart.android.user.bean.User
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.tuya.smart.home.sdk.TuyaHomeSdk
import com.tuya.smart.sdk.api.INeedLoginListener
import com.tuya.smart.sdk.api.IResultCallback


class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.example.integration_tuya_flutter"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        TuyaHomeSdk.setDebugMode(true)
        TuyaHomeSdk.init(application)
        TuyaHomeSdk.setOnNeedLoginListener {
            INeedLoginListener {

            }
        }

        channel = MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                CHANNEL
        )

        channel.setMethodCallHandler { call, result ->

            var argument = call.arguments as Map<String, String>
            var countryCode = argument["country_code"]
            var email = argument["email"]
            var password = argument["password"]
            var code = argument["code"]

            // Login
            if (call.method == "loginData") {
                TuyaHomeSdk.getUserInstance().loginWithEmail(
                        countryCode,
                        email,
                        password,
                        object : ILoginCallback {
                            override fun onSuccess(user: User?) {
                                Toast.makeText(application, "Login Successful", Toast.LENGTH_SHORT).show()
                                result.success(true);
                            }

                            override fun onError(code: String?, error: String?) {
                                Toast.makeText(application, "$code - $error", Toast.LENGTH_SHORT).show()
                            }
                        }
                )
            }

            // Validate code
            if (call.method == "validateData") {
                TuyaHomeSdk.getUserInstance().sendVerifyCodeWithUserName(
                    email,
                    "",
                    countryCode,
                    1,
                    object : IResultCallback {
                        override fun onError(code: String, error: String) {
                            Toast.makeText(application, "Validate failed", Toast.LENGTH_SHORT).show()
                        }

                        override fun onSuccess() {
                            Toast.makeText(application, "Validate Successful", Toast.LENGTH_SHORT).show()
                        }
                    })
            }

            // Register
            if (call.method == "registerData") {
                TuyaHomeSdk.getUserInstance().registerAccountWithEmail(
                    countryCode,
                    email,
                    password,
                    code,
                    object : IRegisterCallback {
                        override fun onSuccess(user: User) {
                            Toast.makeText(application, "Register Successful", Toast.LENGTH_SHORT).show()
                        }

                        override fun onError(code: String, error: String) {
                            Toast.makeText(application, "Validate failed", Toast.LENGTH_SHORT).show()
                        }
                    })
            }
        }
    }

}
