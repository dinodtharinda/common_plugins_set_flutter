import 'package:common_plugin_set/src/payment_api.g.dart';
export 'src/payment_api.g.dart';

class CommonPluginSet {
  final PaymentGateway _paymentGateway = PaymentGateway();

  static CommonPluginSet shared = CommonPluginSet();

  void initialize(PaymentConfig config) {
    _paymentGateway.initialize(config);
  }

  Future<PaymentResult> makePayment(PaymentRequest request) async {
    return await _paymentGateway.makePayment(request);
  }
}
