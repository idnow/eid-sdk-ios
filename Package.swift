// swift-tools-version:5.9
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
        ),
        .library(
            name: "IDnowEIDDynamic",
            targets: ["IDnowEIDDynamicWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", exact: "3.6.1"),
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.1.3")
    ],
    targets: [
        .binaryTarget(
            name: "IDnowEID",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.2.0/IDnowEID.xcframework.zip",
            checksum: "9fb6fe35e6c1cef5fdc2d68487c3ffd1e1c4ecc9dc55004d1dec3d79a9620075"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.2.0/IDnowEIDDynamic.xcframework.zip",
            checksum: "3f42c8ed385ce66ecd2fedd40feb4d742baeba57e2135fee33fc69cf789ef334"
        ),
        .target(
            name: "IDnowEIDDynamicWrapper",
            dependencies: [
                "IDnowEIDDynamic",
                .product(name: "OpenSSL", package: "OpenSSL"),
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios")
            ],
            path: "sources-dynamic"
        )
    ]
)
