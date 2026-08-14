// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "IDnowEID",
    platforms: [
        .iOS(.v14)
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
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.2.2"),
        .package(url: "https://github.com/idnow/openssl-sdk-ios.git", exact: "3.6.1"),
        .package(url: "https://github.com/Governikus/AusweisApp2-SDK-iOS.git", exact: "2.2.2")
    ],
    targets: [
        .binaryTarget(
            name: "IDnowEID",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.5.1/IDnowEID.xcframework.zip",
            checksum: "d2e2ab399250cd653131bf09cd144b344ceccdf54e6e053adf3c9b228a2ec210"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.5.1/IDnowEIDDynamic.xcframework.zip",
            checksum: "d32e1e2d5be6e5ae6c51090b51d7c5373354fbe97c1daf306d65bf823903ad5e"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.5.1/IDnowEIDGovernikus.xcframework.zip",
            checksum: "414abbdef883ad667c4898ae0ddad9b6ee87420380ca6d8e968d783707dc7827"
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
