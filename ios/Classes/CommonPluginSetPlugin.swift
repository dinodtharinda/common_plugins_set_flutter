import Flutter
import UIKit

public class CommonPluginSetPlugin: NSObject, FlutterPlugin, BookApi {
    var reportApi: ReportApi?

    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let api = CommonPluginSetPlugin()
        
        api.reportApi = ReportApi(binaryMessenger: messenger)
        
        BookApiSetup.setUp(binaryMessenger: messenger, api: api)
        
    }
    func getBookDetails(isbn: String) throws -> Book {
        return Book(title: "Flutter Development", author: isbn)
    }
    
    func downlodBook(isbn: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        reportApi?.reportBook(isbn: isbn, reason: "Test ios reseson") { _ in }
        completion(.success(()))
    }
    
     func sum(a: Double, b: Double) throws -> Double {
        return a + b
    }
    
    
    
    
}
