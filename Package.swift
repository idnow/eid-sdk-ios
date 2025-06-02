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
            url: "https://github.com/nabil-lahlou-idnow/eid-test/releases/download/1.0.4/IDnowEID.xcframework.zip",
            checksum: "bc0e4b96c9bbb473ecf950a9031d439f823071c311046b876441b359e2faf643"
        )
    ]
)