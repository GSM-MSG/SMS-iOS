import FileDomainInterface
import Foundation

struct DreamBookUploadUseCaseImpl: DreamBookUploadUseCase {
    private let fileRepository: any FileRepository

    init(fileRepository: any FileRepository) {
        self.fileRepository = fileRepository
    }

    func execute(file: Data) async throws -> String {
        try await fileRepository.dreamBookUpload(file: file)
    }
}
