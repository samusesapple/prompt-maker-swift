import ProjectDescription

// Feature 타겟 설정
let featureTarget: Target = .target(
    name: "Feature",
    destinations: [.mac],
    product: .framework,
    bundleId: "com.promptmaker.feature",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    dependencies: [
        .project(target: "Core", path: .relativeToRoot("Modules/Core")),
        .project(target: "Presentation", path: .relativeToRoot("Modules/Presentation")),
        .project(target: "Network", path: .relativeToRoot("Modules/Network")),
        .project(target: "Persistence", path: .relativeToRoot("Modules/Persistence"))
    ]
)

// 테스트 타겟 설정
let testTarget: Target = .target(
    name: "FeatureTests",
    destinations: [.mac],
    product: .unitTests,
    bundleId: "com.promptmaker.feature.tests",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: "Feature")
    ]
)

// 프로젝트 설정
let project = Project(
    name: "Feature",
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
    targets: [featureTarget, testTarget],
    schemes: [
        .scheme(
            name: "Feature",
            shared: true,
            buildAction: .buildAction(targets: ["Feature"]),
            testAction: .targets(["FeatureTests"]),
            runAction: .runAction(configuration: "Debug"),
            archiveAction: .archiveAction(configuration: "Release"),
            profileAction: .profileAction(configuration: "Release"),
            analyzeAction: .analyzeAction(configuration: "Debug")
        )
    ]
) 