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
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.0.2/IDnowEID.xcframework.zip",
            checksum: "7e64b1a2093d7d9358773c6f879ce9c97a3dcad6c5b52b8a81d366c82edacd80"
        )
    ]
)
