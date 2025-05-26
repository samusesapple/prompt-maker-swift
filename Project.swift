import ProjectDescription

let project = Project(
    name: "PromptMakerSwift",
    targets: [
        .target(
            name: "PromptMakerSwift",
            destinations: .macOS,
            product: .app,
            bundleId: "io.tuist.PromptMakerSwift",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["PromptMakerSwift/Sources/**"],
            resources: ["PromptMakerSwift/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "PromptMakerSwiftTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "io.tuist.PromptMakerSwiftTests",
            infoPlist: .default,
            sources: ["PromptMakerSwift/Tests/**"],
            resources: [],
            dependencies: [.target(name: "PromptMakerSwift")]
        ),
    ]
)
