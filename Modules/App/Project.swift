import ProjectDescription

// App 타겟 설정
let appTarget: Target = .target(
    name: "App",
    destinations: [.mac],
    product: .app,
    bundleId: "com.promptmaker.app",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    dependencies: [
        .project(target: "Core", path: .relativeToRoot("Modules/Core")),
        .project(target: "Feature", path: .relativeToRoot("Modules/Feature")),
        .project(target: "Presentation", path: .relativeToRoot("Modules/Presentation")),
        .project(target: "Network", path: .relativeToRoot("Modules/Network")),
        .project(target: "Persistence", path: .relativeToRoot("Modules/Persistence")),
        .project(target: "Subscription", path: .relativeToRoot("Modules/Subscription")),
        .project(target: "DesignSystem", path: .relativeToRoot("Modules/DesignSystem"))
    ]
)

// 테스트 타겟 설정
let testTarget: Target = .target(
    name: "AppTests",
    destinations: [.mac],
    product: .unitTests,
    bundleId: "com.promptmaker.app.tests",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: "App")
    ]
)

// 프로젝트 설정
let project = Project(
    name: "App",
    organizationName: "PromptMaker",
    options: .options(
        automaticSchemesOptions: .disabled,
        disableBundleAccessors: false,
        disableShowEnvironmentVarsInScriptPhases: false,
        disableSynthesizedResourceAccessors: false
    ),
    packages: [],
    settings: .settings(
        base: [
            "SWIFT_VERSION": "5.0",
            "MACOSX_DEPLOYMENT_TARGET": "13.0",
            "SWIFT_STRICT_CONCURRENCY": "complete"
        ]
    ),
    targets: [appTarget, testTarget],
    schemes: [
        .scheme(
            name: "App",
            shared: true,
            buildAction: .buildAction(targets: ["App"]),
            testAction: .targets(["AppTests"]),
            runAction: .runAction(configuration: "Debug"),
            archiveAction: .archiveAction(configuration: "Release"),
            profileAction: .profileAction(configuration: "Release"),
            analyzeAction: .analyzeAction(configuration: "Debug")
        )
    ]
) 