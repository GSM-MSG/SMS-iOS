import FileDomainInterface
import Foundation

struct ImageUploadUseCaseImpl: ImageUploadUseCase {
    private let fileRepository: any FileRepository

    init(fileRepository: any FileRepository) {
        self.fileRepository = fileRepository
    }

    func execute(image: Data, fileName: String) async throws -> String {
        try await fileRepository.imageUpload(image: image, fileName: fileName)
    }
}
