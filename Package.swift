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
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.0.6/IDnowEID.xcframework.zip",
            checksum: "4335fa2e6f3b83130c046cd3037a268a28ed60748e64279fb344e1bb854f2636"
        )
    ]
)
