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
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.0.3/IDnowEID.xcframework.zip",
            checksum: "81a68df03636973d7a7bbb83155d3cef222479186c0baad39cd6a0eec91bc7e7"
        )
    ]
)
