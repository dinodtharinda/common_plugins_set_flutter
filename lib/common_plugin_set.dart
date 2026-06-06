
import 'dart:async';

import 'package:common_plugin_set/src/message.g.dart';

class CommonPluginSet extends ReportApi {
  static CommonPluginSet shared = CommonPluginSet();
  final BookApi _bookApi = BookApi();
  
  CommonPluginSet() {
    ReportApi.setUp(this);
  }

  Future<Book> fetchBook(String isbn)async{
    return  await _bookApi.getBookDetails(isbn);
  }

  

  Future<double> sum(double a, double b)async{
    
    return await _bookApi.sum(a, b);
  }




  final _reportStreamController = StreamController<String>.broadcast();
  Stream<String> get reportStream => _reportStreamController.stream;


  Future<void> triggerDownload(String isbn)async{
    await _bookApi.downlodBook(isbn);
  }
  
  @override
  void reportBook(String isbn, String reason) {
    print("Book with isbn $isbn is reported for reason: $reason");

    _reportStreamController.add("Book with isbn $isbn is reported for reason: $reason");
  }
}
