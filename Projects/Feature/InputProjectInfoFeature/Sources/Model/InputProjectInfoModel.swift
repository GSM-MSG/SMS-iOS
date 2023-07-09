import Foundation
import FoundationUtil

final class InputProjectInfoModel: ObservableObject , InputProjectInfoStateProtocol {
    @Published var projectList: [ProjectInfo] = []
    @Published var projectErrorSetList: [Set<InputProjectInfoErrorField>] = []
}

extension InputProjectInfoModel: InputProjectInfoActionProtocol {
    func updateProjectName(index: Int, name: String) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].name = name
    }

    func updateIconImage(index: Int, data: Data) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].iconImage = data
    }

    func appendPreviewImage(index: Int, data: Data) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].previewImages.append(data)
    }

    func removePreviewImage(index: Int, previewIndex: Int) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].previewImages.remove(at: previewIndex)
    }

    func updateProjectContent(index: Int, content: String) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].content = content
    }

    func updateProjectTechStacks(index: Int, techStacks: [String]) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].techStacks = techStacks
    }

    func updateProjectMainTask(index: Int, mainTask: String) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].mainTask = mainTask
    }

    func updateProjectStartAt(index: Int, startAt: Date) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].startAt = startAt
    }

    func updateProjectEndAt(index: Int, endAt: Date) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].endAt = endAt
    }

    func updateProjectLinkName(index: Int, linkIndex: Int, name: String) {
        guard
            let project = projectList[safe: index],
            project.relatedLinks[safe: linkIndex] != nil
        else { return }
        self.projectList[index].relatedLinks[linkIndex].name = name
    }

    func updateProjectLinkURL(index: Int, linkIndex: Int, url: String) {
        guard
            let project = projectList[safe: index],
            project.relatedLinks[safe: linkIndex] != nil
        else { return }
        self.projectList[index].relatedLinks[linkIndex].url = url
    }

    func removeProjectRelatedLink(index: Int, linkIndex: Int) {
        guard
            let project = projectList[safe: index],
            project.relatedLinks[safe: linkIndex] != nil
        else { return }
        self.projectList[index].relatedLinks.remove(at: linkIndex)
    }
}
