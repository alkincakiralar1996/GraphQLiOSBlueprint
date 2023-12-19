import Foundation

func executeShellCommand(command: String, in directoryPath: String) {
    let task = Process()
    task.launchPath = "/bin/bash"
    task.arguments = ["-c", command]
    task.currentDirectoryPath = directoryPath

    task.launch()
    task.waitUntilExit()
}

let fileURL = URL(fileURLWithPath: #file)
let projectDirectoryURL = fileURL.deletingLastPathComponent().deletingLastPathComponent()
let apolloConfigDirectoryPath = projectDirectoryURL.appendingPathComponent("GraphQLiOSBlueprint/Data/Core").path
let apolloCliExecutablePath = projectDirectoryURL.appendingPathComponent("GraphQLiOSBlueprint/Data/Core/apollo-ios-cli").path

let apolloCommand = "\(apolloCliExecutablePath) fetch-schema"
executeShellCommand(command: apolloCommand, in: apolloConfigDirectoryPath)

let generateCommand = "\(apolloCliExecutablePath) generate"
executeShellCommand(command: generateCommand, in: apolloConfigDirectoryPath)

print("Successfully fetched and re-generated the apollo files")
