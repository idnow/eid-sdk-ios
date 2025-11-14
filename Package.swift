// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "IDnowEID",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "IDnowEID",
            targets: ["IDnowEID"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "IDnowEID",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.1.0/IDnowEID.xcframework.zip",
            checksum: "a4f9c662843c00236126824c1f9c9f09b3f9e965c4693a19bab7dff9b81c6e7a"
        )
    ]
)
