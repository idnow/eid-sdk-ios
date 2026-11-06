// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "IDnowEID",
    platforms: [
        .iOS(.v15)
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
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.3.0"),
        .package(url: "https://github.com/idnow/openssl-sdk-ios.git", exact: "3.6.1"),
        .package(url: "https://github.com/Governikus/AusweisApp2-SDK-iOS.git", exact: "2.2.2")
    ],
    targets: [
        .binaryTarget(
            name: "IDnowEID",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.6.0/IDnowEID.xcframework.zip",
            checksum: "62e75b8e79b9d9b04281e60ce9f03d29cc67beb77201c3e5e02ad8446595c9e7"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.6.0/IDnowEIDDynamic.xcframework.zip",
            checksum: "ba3b6e57adc3757c7d93d797d4a0a983c060408886a7e0790aa88ea91ecef619"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.6.0/IDnowEIDGovernikus.xcframework.zip",
            checksum: "0bf7428efa4b479f3597be037dfca05bea3765357945a28d83ca37e697dedcef"
        ),
        .target(
            name: "IDnowEIDDynamicWrapper",
            dependencies: [
                "IDnowEIDDynamic",
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios"),
                .product(name: "OpenSSL", package: "openssl-sdk-ios")
            ],
            path: "sources-dynamic"
        ),
        .target(
            name: "IDnowEIDGovernikusWrapper",
            dependencies: [
                "IDnowEIDGovernikus",
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios"),
                .product(name: "AusweisApp2", package: "AusweisApp2-SDK-iOS")
            ],
            path: "sources-governikus"
        )
    ]
)
