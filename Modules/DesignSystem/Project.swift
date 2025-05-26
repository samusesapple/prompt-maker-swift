import ProjectDescription

// DesignSystem 타겟 설정
let designSystemTarget: Target = .target(
    name: "DesignSystem",
    destinations: [.mac],
    product: .framework,
    bundleId: "com.promptmaker.designsystem",
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
    name: "DesignSystemTests",
    destinations: [.mac],
    product: .unitTests,
    bundleId: "com.promptmaker.designsystem.tests",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: "DesignSystem")
    ]
)

// 프로젝트 설정
let project = Project(
    name: "DesignSystem",
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
    targets: [designSystemTarget, testTarget],
    schemes: [
        .scheme(
            name: "DesignSystem",
            shared: true,
            buildAction: .buildAction(targets: ["DesignSystem"]),
            testAction: .targets(["DesignSystemTests"]),
            runAction: .runAction(configuration: "Debug"),
            archiveAction: .archiveAction(configuration: "Release"),
            profileAction: .profileAction(configuration: "Release"),
            analyzeAction: .analyzeAction(configuration: "Debug")
        )
    ]
) 