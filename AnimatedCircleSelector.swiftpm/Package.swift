// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "CircleAnimation",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "CircleAnimation",
            targets: ["AppModule"],
            bundleIdentifier: "net.xddevelop.CircleAnimatin.CircleAnimation",
            teamIdentifier: "QN87FRUFS2",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .barChart),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)
