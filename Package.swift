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
            url: "https://github.com/idnow/eid-sdk-ios/releases/download/1.0.1/IDnowEID.xcframework.zip",
            checksum: "1f9406dd7f5b9324b293cb650d2b894cb6bc6a481587ac67e8e3782d8b27fe54"
        )
    ]
)
