import Flutter
import UIKit

public class CommonPluginSetPlugin: NSObject, FlutterPlugin, BookApi {
   

    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let api = CommonPluginSetPlugin()
        
        BookApiSetup.setUp(binaryMessenger: messenger, api: api)
        
    }
    func getBookDetails(isbn: String) throws -> Book {
        return Book(title: "Flutter Development", author: isbn)
    }
    
    func downlodBook(isbn: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        completion(.success(()))
    }
    
     func sum(a: Double, b: Double) throws -> Double {
        return a + b
    }
    
    
    
    
}
