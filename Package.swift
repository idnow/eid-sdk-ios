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
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.0.4/IDnowEID.xcframework.zip",
            checksum: "4771c6c3e132f5d7c62b9f36cfdcdae694c356649b749bbc1e6d79168f150aaf"
        )
    ]
)
