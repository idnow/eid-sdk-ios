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
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.0.0/IDnowEID.xcframework.zip",
            checksum: "867148fd27de3ca18d1f574f4984cbd13181f182ac741feea9e843f08b7f5fc0"
        )
    ]
)
