import ProjectDescription

// 전체 워크스페이스 설정
let workspace = Workspace(
    name: "PromptMaker",
    projects: [
        "Modules/App",
        "Modules/Core",
        "Modules/Feature",
        "Modules/Presentation",
        "Modules/Network",
        "Modules/Persistence",
        "Modules/Subscription",
        "Modules/DesignSystem"
    ]
) 