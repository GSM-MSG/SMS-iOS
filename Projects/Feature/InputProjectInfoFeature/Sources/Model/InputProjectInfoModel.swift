import DesignSystem
import Foundation
import FoundationUtil

final class InputProjectInfoModel: ObservableObject, InputProjectInfoStateProtocol {
    @Published var projectList: [ProjectInfo] = []
    @Published var collapsedProject: [Bool] = []
    @Published var projectErrorSetList: [Set<InputProjectInfoErrorField>] = []
    @Published var isPresentedImagePicker: Bool = false
    @Published var isPresentedPreviewImagePicker: Bool = false
    @Published var isPresentedStartAtDatePicker: Bool = false
    @Published var isPresentedEndAtDatePicker: Bool = false
    var focusedProjectIndex: Int = 0
}

extension InputProjectInfoModel: InputProjectInfoActionProtocol {
    func toggleCollapsedProject(index: Int) {
        guard collapsedProject[safe: index] != nil else { return }
        self.collapsedProject[index].toggle()
    }

    func updateProjectName(index: Int, name: String) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].name = name
    }

    func updateIconImage(index: Int, image: PickedImageResult) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].iconImage = image
    }

    func appendPreviewImage(index: Int, image: PickedImageResult) {
        guard projectList[safe: index] != nil else { return }
        self.projectList[index].previewImages.append(image)
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
        if endAt <= projectList[index].startAt {
            self.projectList[index].startAt = endAt
        }
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

    func appendEmptyRelatedLink(index: Int) {
        guard projectList[safe: index] != nil else { return }
        let relatedLink = ProjectInfo.RelatedLink(name: "", url: "")
        self.projectList[index].relatedLinks.append(relatedLink)
    }

    func removeProjectRelatedLink(index: Int, linkIndex: Int) {
        guard
            let project = projectList[safe: index],
            project.relatedLinks[safe: linkIndex] != nil
        else { return }
        self.projectList[index].relatedLinks.remove(at: linkIndex)
    }

    func appendEmptyProject() {
        let newProject = ProjectInfo(
            name: "",
            previewImages: [],
            content: "",
            techStacks: [],
            mainTask: "",
            startAt: Date(),
            relatedLinks: []
        )
        self.projectList.append(newProject)
        self.collapsedProject.append(false)
    }

    func removeProject(index: Int) {
        guard projectList[safe: index] != nil, collapsedProject[safe: index] != nil else { return }
        self.projectList.remove(at: index)
        self.collapsedProject.remove(at: index)
    }

    func updateFocusedProjectIndex(index: Int) {
        self.focusedProjectIndex = index
    }

    func updateIsPresentedImagePicker(isPresented: Bool) {
        self.isPresentedImagePicker = isPresented
    }

    func updateIsPresentedPreviewImagePicker(isPresented: Bool) {
        self.isPresentedPreviewImagePicker = isPresented
    }

    func updateIsPresentedStartAtDatePicker(isPresented: Bool) {
        self.isPresentedStartAtDatePicker = isPresented
    }

    func updateIsPresentedEndAtDatePicker(isPresented: Bool) {
        self.isPresentedEndAtDatePicker = isPresented
    }
}
