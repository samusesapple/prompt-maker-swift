import ProjectDescription

// Network 타겟 설정
let networkTarget: Target = .target(
    name: "Network",
    destinations: [.mac],
    product: .framework,
    bundleId: "com.promptmaker.network",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    dependencies: [
        .project(target: "Core", path: .relativeToRoot("Modules/Core"))
    ]
)

// 테스트 타겟 설정
let testTarget: Target = .target(
    name: "NetworkTests",
    destinations: [.mac],
    product: .unitTests,
    bundleId: "com.promptmaker.network.tests",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: "Network")
    ]
)

// 프로젝트 설정
let project = Project(
    name: "Network",
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
    targets: [networkTarget, testTarget],
    schemes: [
        .scheme(
            name: "Network",
            shared: true,
            buildAction: .buildAction(targets: ["Network"]),
            testAction: .targets(["NetworkTests"]),
            runAction: .runAction(configuration: "Debug"),
            archiveAction: .archiveAction(configuration: "Release"),
            profileAction: .profileAction(configuration: "Release"),
            analyzeAction: .analyzeAction(configuration: "Debug")
        )
    ]
) 