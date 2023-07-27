import DesignSystem
import NukeUI
import StudentDomainInterface
import SwiftUI

@MainActor
struct ProjectRowView: View {
    let project: ProjectEntity
    @Environment(\.openURL) var openURL

    init(project: ProjectEntity) {
        self.project = project
    }

    var body: some View {
        VStack(spacing: 24) {
            projectHeaderSection()
            projectPreviewsSection()
            projectTechStacksSection()
            projectMyActivity()
            projectRelatedLinks()
        }
    }

    @ViewBuilder
    func projectHeaderSection() -> some View {
        HStack(spacing: 8) {
            LazyImage(url: URL(string: project.iconImageURL)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(8)
                } else {
                    Color.sms(.neutral(.n30))
                        .frame(width: 40, height: 40)
                        .cornerRadius(8)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                SMSText(project.name, font: .body1)
                    .foregroundColor(.sms(.system(.black)))

                let startString = project.inProgress.start
                let endString = project.inProgress.end ?? "진행 중"
                SMSText("\(startString) ~ \(endString)", font: .caption2)
                    .foregroundColor(.sms(.system(.black)))
            }

            Spacer()
        }
    }

    @ViewBuilder
    func projectPreviewsSection() -> some View {
        let rows = [GridItem(.flexible()), .init(.flexible())]
        LazyVGrid(columns: rows, spacing: 9) {
            ForEach(project.previewImageURLs, id: \.self) { preview in
                LazyImage(url: URL(string: preview)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(8)
                    } else {
                        Color.sms(.neutral(.n30))
                            .cornerRadius(8)
                    }
                }
            }
        }
    }

    @ViewBuilder
    func projectTechStacksSection() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 4) {
                ForEach(project.techStacks, id: \.self) { techStack in
                    SMSText(techStack, font: .caption2)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6.5)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.sms(.neutral(.n10)))
                        }
                }
            }
        }
    }

    @ViewBuilder
    func projectMyActivity() -> some View {
        SMSText(project.myActivity, font: .body2)
            .lineLimit(nil)
            .aligned(.leading)
    }

    @ViewBuilder
    func projectRelatedLinks() -> some View {
        VStack(spacing: 8) {
            ForEach(project.links, id: \.self) { link in
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        SMSText(link.name, font: .body1)
                            .foregroundColor(.sms(.system(.black)))

                        SMSText(link.url, font: .caption2)
                            .foregroundColor(.sms(.neutral(.n40)))
                    }

                    Spacer()

                    Image(systemName: "arrow.up.right")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.sms(.neutral(.n40)))
                }
                .frame(maxWidth: .infinity)
                .padding(8)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.sms(.neutral(.n10)))
                }
                .buttonWrapper {
                    guard let url = URL(string: link.url) else { return }
                    openURL(url)
                }
            }
        }
    }
}
