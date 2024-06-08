import DesignSystem
import Foundation
import SwiftUI

struct GSMAuthenticationFileDownloadView: View {
    @Environment(\.openURL) var openURL
    private let uiModel: [GSMAuthenticationFormUIModel.File]
    private typealias File = GSMAuthenticationFormUIModel.File

    init(
        uiModel: [GSMAuthenticationFormUIModel.File]
    ) {
        self.uiModel = uiModel
    }

    var body: some View {
        fileAreaView(files: uiModel)
    }

    @ViewBuilder
    private func fileAreaView(files: [File]) -> some View {
        LazyVStack(spacing: 16) {
            HStack(spacing: 16) {
                SMSText("파일 다운로드", font: .title1)

                Spacer()

                SMSIcon(.downChevron)
                    .rotationEffect(false ? .degrees(90) : .degrees(0))
                    .buttonWrapper {
                    }
            }

            fileSectionList(sections: files)
        }
        .padding(20)
    }

    @ViewBuilder
    private func fileSectionList(sections: [File]) -> some View {
        LazyVStack(spacing: 16) {
            ForEach(sections, id: \.name) { sections in
                VStack {
                    fileDownloadView(fileName: sections.name, url: sections.url)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    @ViewBuilder
    private func fileDownloadView(
        fileName: String,
        url: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                SMSIcon(.file)
                    .padding(8)
                    .background(Color.sms(.system(.white)))
                    .clipShape(Circle())
                    .padding(.trailing, 12)

                SMSText(fileName, font: .body1)
                    .foregroundColor(.sms(.neutral(.n50)))
                    .lineLimit(2)
                    .truncationMode(.middle)
                    .padding(.trailing, 8)

                Spacer()

                SMSChip(
                    "다운로드",
                    style: .outline,
                    action: {
                        guard
                            let fileUrl = URL(string: url)
                        else { return }
                        openURL(fileUrl)
                    },
                    iconLabel: {
                        EmptyView()
                    }
                )
            }
            .padding(.vertical, 8)
        }
        .padding(.horizontal, 16)
        .background(Color.sms(.neutral(.n10)))
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.sms(.neutral(.n20)))
        }
    }
}
