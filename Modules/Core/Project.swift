import ProjectDescription

// Core 타겟 설정
let coreTarget: Target = .target(
    name: "Core",
    destinations: [.mac],
    product: .framework,
    bundleId: "com.promptmaker.core",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    dependencies: []
)

// 테스트 타겟 설정
let testTarget: Target = .target(
    name: "CoreTests",
    destinations: [.mac],
    product: .unitTests,
    bundleId: "com.promptmaker.core.tests",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: "Core")
    ]
)

// 프로젝트 설정
let project = Project(
    name: "Core",
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
    targets: [coreTarget, testTarget],
    schemes: [
        .scheme(
            name: "Core",
            shared: true,
            buildAction: .buildAction(targets: ["Core"]),
            testAction: .targets(["CoreTests"]),
            runAction: .runAction(configuration: "Debug"),
            archiveAction: .archiveAction(configuration: "Release"),
            profileAction: .profileAction(configuration: "Release"),
            analyzeAction: .analyzeAction(configuration: "Debug")
        )
    ]
) 