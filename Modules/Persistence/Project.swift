import ProjectDescription

// Persistence 타겟 설정
let persistenceTarget: Target = .target(
    name: "Persistence",
    destinations: [.mac],
    product: .framework,
    bundleId: "com.promptmaker.persistence",
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
    name: "PersistenceTests",
    destinations: [.mac],
    product: .unitTests,
    bundleId: "com.promptmaker.persistence.tests",
    deploymentTargets: .macOS("13.0"),
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: "Persistence")
    ]
)

// 프로젝트 설정
let project = Project(
    name: "Persistence",
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
    targets: [persistenceTarget, testTarget],
    schemes: [
        .scheme(
            name: "Persistence",
            shared: true,
            buildAction: .buildAction(targets: ["Persistence"]),
            testAction: .targets(["PersistenceTests"]),
            runAction: .runAction(configuration: "Debug"),
            archiveAction: .archiveAction(configuration: "Release"),
            profileAction: .profileAction(configuration: "Release"),
            analyzeAction: .analyzeAction(configuration: "Debug")
        )
    ]
) 