// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "JXBanner",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "JXBanner",
            targets: ["JXBanner"]),
    ],
    dependencies: [
        .package(url: "https://github.com/YFCasually/JXPageControl.git", .branch("SPM"))
    ],
    targets: [
        .target(
            name: "JXBanner",
            dependencies: ["JXPageControl"],
            path: "JXBanner/Classes"
        )
    ]
)
