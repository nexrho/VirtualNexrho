// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VirtualNexrho",
    platforms: [.macOS(.v26)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VirtualNexrho",
            targets: ["VirtualNexrho"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/container.git", from: "1.1.0"),
        .package(url: "https://github.com/k-arindam/Initializable.git", from: "1.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VirtualNexrho",
            dependencies: [
                "Initializable",
                .product(name: "MachineAPIClient", package: "container"),
                .product(name: "ContainerAPIClient", package: "container")
            ]
        ),
        .testTarget(
            name: "VirtualNexrhoTests",
            dependencies: ["VirtualNexrho"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
