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
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.0.5/IDnowEID.xcframework.zip",
            checksum: "71eba44d8768e63b9c4dd7c28375bdfc7391bd4fdfc08fa6f9d0251a575a1c6e"
        )
    ]
)
