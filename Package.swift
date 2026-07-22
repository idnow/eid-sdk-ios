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
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.2.1"),
        .package(url: "https://github.com/idnow/openssl-sdk-ios.git", exact: "3.6.1"),
        .package(url: "https://github.com/Governikus/AusweisApp2-SDK-iOS.git", exact: "2.2.2")
    ],
    targets: [
        .binaryTarget(
            name: "IDnowEID",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.5.0/IDnowEID.xcframework.zip",
            checksum: "60cbba6adcf5b608af892c03573f92d8ea11ece0bae0cc46362bd377fc0fb8b6"
        ),
        .binaryTarget(
            name: "IDnowEIDDynamic",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.5.0/IDnowEIDDynamic.xcframework.zip",
            checksum: "63317ef1e2d82ab8cb5870a26a1f0e5165da869a1fc454b9a034f7423c32088c"
        ),
        .binaryTarget(
            name: "IDnowEIDGovernikus",
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.5.0/IDnowEIDGovernikus.xcframework.zip",
            checksum: "fd3599faf2085901cbf0db6d3ec95f72241e78803322a51fb9dc1a1b78d01b1c"
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
