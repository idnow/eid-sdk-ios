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
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.1.1/IDnowEID.xcframework.zip",
            checksum: "f7777d6678c3c6b0329d2af024107df560690109376b0c1a49ddc785cfa0ed81"
        )
    ]
)
