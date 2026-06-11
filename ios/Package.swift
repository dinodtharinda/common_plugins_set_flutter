// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "common_plugin_set",
    platforms: [
        .iOS(.v13) // Set this to your minimum target version
    ],
    products: [
        .library(
            name: "common_plugin_set",
            targets: ["common_plugin_set"]
        ),
    ],
    dependencies: [
        // If your payment gateway has an official native iOS SPM package, 
        // you can declare it here. For example:
        // .package(url: "https://github.com/some-gateway/gateway-ios-sdk.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "common_plugin_set",
            dependencies: [
                // Add the dependency name here if you added one above
            ],
            path: "Classes",
            // This ensures Xcode can find your Pigeon generated files and plugin code
            publicHeadersPath: "." 
        )
    ]
)