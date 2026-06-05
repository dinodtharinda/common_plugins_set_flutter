import "package:pigeon/pigeon.dart";


@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/message.g.dart',
  dartOptions: DartOptions(),
  dartPackageName: 'com.example.common_plugin_set',
  kotlinOut: 'android/src/main/kotlin/com/example/common_plugin_set/Messages.g.kt',
  kotlinOptions: KotlinOptions(package: "com.example.common_plugin_set"),
  swiftOut: 'ios/Classes/message.g.swift',
  swiftOptions: SwiftOptions()

))

class Book {
  String? title;
  String? author;
}

@HostApi()
abstract class BookApi {
  Book getBookDetails(String isbn);


  @async 
  void downlodBook(String isbn);

  double sum(double a, double b);
}