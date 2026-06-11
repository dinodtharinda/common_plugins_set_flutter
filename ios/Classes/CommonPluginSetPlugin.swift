import Flutter
import UIKit

public class CommonPluginSetPlugin: NSObject, FlutterPlugin, PaymentGateway {
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        
        let instance = CommonPluginSetPlugin()
        let messanger =  registrar.messenger()
        
        PaymentGatewaySetup.setUp(binaryMessenger: messanger, api: instance)
        
    }
    
    func initialize(config: PaymentConfig, completion: @escaping (Result<Void, any Error>) -> Void) {
        
    }
    
    func makePayment(request: PaymentRequest, completion: @escaping (Result<PaymentResult, any Error>) -> Void) {
        Task.detached{
            try await Task.sleep(nanoseconds: 2_000_000_000)
            completion(Result.success(PaymentResult(title: "success", result: "\(request.transactionId) Payment successful \(request.amount)\(request.currency)!")))
        }
        
    }
    
    
}
