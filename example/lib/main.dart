import 'package:common_plugin_set/common_plugin_set.dart';
import 'package:common_plugin_set/src/payment_api.g.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  PaymentResult? result;

  void toggleLoading(bool state) {
    setState(() {
      isLoading = state;
    });
  }

  void makePayment() async {
    toggleLoading(true);

    result = await CommonPluginSet.shared.makePayment(
      PaymentRequest(amount: 500, currency: 'LKR', transactionId: "#1341324"),
    );

    toggleLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : result != null
          ? Center(
            child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [Text(result!.title), Text(result!.result)],
              ),
          )
          : Center(child: Text("Result is empty!")),

      floatingActionButton: FloatingActionButton(
        onPressed: makePayment,
        child: Icon(Icons.add),
      ),
    );
  }
}
