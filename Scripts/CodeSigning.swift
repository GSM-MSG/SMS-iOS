#!/usr/bin/swift
import Foundation

func handleSIGINT(_ signal: Int32) {
    exit(0)
}

signal(SIGINT, handleSIGINT)

func writeContentInFile(path: String, content: String) {
    let fileURL = URL(fileURLWithPath: path)
    let data = Data(content.utf8)
    try? data.write(to: fileURL)
}

print("Enter your Apple Developer ID Code Signing Identity: ", terminator: "")
guard let codeSigningIdentity = readLine() else {
    fatalError()
}

let codeSignContent = """
import ProjectDescription

public extension SettingsDictionary {
    static let codeSign = SettingsDictionary()
        .codeSignIdentityAppleDevelopment()
        .automaticCodeSigning(devTeam: "\(codeSigningIdentity)")
}

"""

writeContentInFile(path: "Tuist/ProjectDescriptionHelpers/CodeSign.swift", content: codeSignContent)

print("✅ Code Sign extension generated successfully!")
