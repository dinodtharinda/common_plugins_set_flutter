import "package:pigeon/pigeon.dart";

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/payment_api.g.dart',
    dartOptions: DartOptions(),
    dartPackageName: 'com.example.common_plugin_set',
    kotlinOut:
        'android/src/main/kotlin/com/example/common_plugin_set/PaymentApi.g.kt',
    kotlinOptions: KotlinOptions(package: "com.example.common_plugin_set"),
    swiftOut: 'ios/Classes/PaymentApi.g.swift',
    swiftOptions: SwiftOptions(),
  ),
)


enum Environment{
  sandbox,
  production
}


class PaymentConfig {
  Environment environment;
  String merchantId;
  String publicKey;

  PaymentConfig(this.environment, this.merchantId, this.publicKey);
}

class PaymentRequest {
  double amount;
  String currency;
  String transactionId;

  PaymentRequest(this.amount, this.currency, this.transactionId);
}


class PaymentResult{
  String title;
  String result;

  PaymentResult(this.title, this.result);
}

@HostApi()
abstract class PaymentGateway{
  @async
  void initialize(PaymentConfig config,);

  @async
  PaymentResult makePayment(PaymentRequest request);
}