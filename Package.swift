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
        ),
        .library(
            name: "IDnowEIDGovernikus",
            targets: ["IDnowEIDGovernikusWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.1.8"),
        .package(url: "https://github.com/Governikus/AusweisApp2-SDK-iOS.git", exact: "2.2.2")
    ],
    targets: [
        .binaryTarget(
            name: "IDnowEID",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.3.5/IDnowEID.xcframework.zip",
            checksum: "f9c60839cef6c1ba970843a49b88a37317b14d63c912e0f93b16cb4f4f10d9aa"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.3.5/IDnowEIDDynamic.xcframework.zip",
            checksum: "abf7b23b6b236b014e590b450ff1c23d29654592ed0fd97509517da11a5d400c"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.3.5/IDnowEIDGovernikus.xcframework.zip",
            checksum: "6118fb6fc8a690a19cca8d07997fbb0dd2e59ac38e25d9edd806a857de44c519"
        ),
        .binaryTarget(
            name: "OpenSSL",
            path: "Frameworks/OpenSSL.xcframework"
        ),
        .target(
            name: "IDnowEIDDynamicWrapper",
            dependencies: [
                "IDnowEIDDynamic",
                "OpenSSL",
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios")
            ],
            path: "sources-dynamic"
        ),
        .target(
            name: "IDnowEIDGovernikusWrapper",
            dependencies: [
                "IDnowEIDGovernikus",
                "OpenSSL",
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios"),
                .product(name: "AusweisApp2", package: "AusweisApp2-SDK-iOS")
            ],
            path: "sources-governikus"
        )
    ]
)
