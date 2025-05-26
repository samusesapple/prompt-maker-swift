import ProjectDescription

// Presentation 타겟 설정
let presentationTarget: Target = .target(
    name: "Presentation",
    destinations: [.mac],
    product: .framework,
    bundleId: "com.promptmaker.presentation",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    dependencies: [
        .project(target: "Core", path: .relativeToRoot("Modules/Core")),
        .project(target: "DesignSystem", path: .relativeToRoot("Modules/DesignSystem"))
    ]
)

// 테스트 타겟 설정
let testTarget: Target = .target(
    name: "PresentationTests",
    destinations: [.mac],
    product: .unitTests,
    bundleId: "com.promptmaker.presentation.tests",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: "Presentation")
    ]
)

// 프로젝트 설정
let project = Project(
    name: "Presentation",
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
    targets: [presentationTarget, testTarget],
    schemes: [
        .scheme(
            name: "Presentation",
            shared: true,
            buildAction: .buildAction(targets: ["Presentation"]),
            testAction: .targets(["PresentationTests"]),
            runAction: .runAction(configuration: "Debug"),
            archiveAction: .archiveAction(configuration: "Release"),
            profileAction: .profileAction(configuration: "Release"),
            analyzeAction: .analyzeAction(configuration: "Debug")
        )
    ]
) 