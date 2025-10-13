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
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.0.7/IDnowEID.xcframework.zip",
            checksum: "cd549c6ffd9383feb11031efbfcf2873bc1e5c09c3d0fa18482b60c9ce935a56"
        )
    ]
)
