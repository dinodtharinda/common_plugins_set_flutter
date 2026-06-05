
import 'package:common_plugin_set/src/message.g.dart';

class CommonPluginSet {
  static CommonPluginSet shared = CommonPluginSet();
  final BookApi _bookApi = BookApi();

  Future<Book> fetchBook(String isbn)async{
    return  await _bookApi.getBookDetails(isbn);
  }

  Future<void> triggerDownload(String isbn)async{
    await _bookApi.downlodBook(isbn);
  }

  Future<double> sum(double a, double b)async{
    
    return await _bookApi.sum(a, b);
  }
}
