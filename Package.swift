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
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.1.10"),
        .package(url: "https://github.com/Governikus/AusweisApp2-SDK-iOS.git", exact: "2.2.2")
    ],
    targets: [
        .binaryTarget(
            name: "IDnowEID",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.3.6/IDnowEID.xcframework.zip",
            checksum: "743c579ac651da177303c03ec9541b74bfeef6d5dd84f7800e355ff817ac00c0"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.3.6/IDnowEIDDynamic.xcframework.zip",
            checksum: "bd68af7f1482581099b0d0a5b2f1087ff0f6d99154b4d576c4901382a8610b21"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.3.6/IDnowEIDGovernikus.xcframework.zip",
            checksum: "34b054ca12251a1d58ef581879e1dd1a2c579107818fc307af9e8999fc00b719"
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
