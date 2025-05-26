import ProjectDescription

// Subscription 타겟 설정
let subscriptionTarget: Target = .target(
    name: "Subscription",
    destinations: [.mac],
    product: .framework,
    bundleId: "com.promptmaker.subscription",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    dependencies: [
        .project(target: "Core", path: .relativeToRoot("Modules/Core")),
        .project(target: "Network", path: .relativeToRoot("Modules/Network")),
        .project(target: "Persistence", path: .relativeToRoot("Modules/Persistence"))
    ]
)

// 테스트 타겟 설정
let testTarget: Target = .target(
    name: "SubscriptionTests",
    destinations: [.mac],
    product: .unitTests,
    bundleId: "com.promptmaker.subscription.tests",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: "Subscription")
    ]
)

// 프로젝트 설정
let project = Project(
    name: "Subscription",
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
    targets: [subscriptionTarget, testTarget],
    schemes: [
        .scheme(
            name: "Subscription",
            shared: true,
            buildAction: .buildAction(targets: ["Subscription"]),
            testAction: .targets(["SubscriptionTests"]),
            runAction: .runAction(configuration: "Debug"),
            archiveAction: .archiveAction(configuration: "Release"),
            profileAction: .profileAction(configuration: "Release"),
            analyzeAction: .analyzeAction(configuration: "Debug")
        )
    ]
) 