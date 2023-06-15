import Foundation

protocol StudentDetailIntentProtocol {
    func onAppear()
    func dreamBookDownloadButtonDidTap(dreamBookFileURL: String)
    func dreamBookFileExporterDismissed()
}
