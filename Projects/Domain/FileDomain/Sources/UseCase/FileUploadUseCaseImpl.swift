import FileDomainInterface
import Foundation

struct FileUploadUseCaseImpl: FileUploadUseCase {
    private let fileRepository: any FileRepository

    init(fileRepository: any FileRepository) {
        self.fileRepository = fileRepository
    }

    func execute(file: Data, fileName: String) async throws -> String {
        try await fileRepository.fileUpload(file: file, fileName: fileName)
    }
}
