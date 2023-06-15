import SwiftUI
import UniformTypeIdentifiers

struct HWPDocument: FileDocument {
    static var readableContentTypes: [UTType] = [
        UTType(filenameExtension: "hwp"),
        UTType(filenameExtension: "hwpx")
    ].compactMap { $0 }

    let hwpData: Data

    init(hwpData: Data) {
        self.hwpData = hwpData
    }

    init(configuration: ReadConfiguration) throws {
        self.hwpData = configuration.file.regularFileContents ?? .init()
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: hwpData)
    }
}
