import DateUtil
import Foundation
import FoundationUtil

struct ProjectModel {
    var name: String
    var iconImage: String
    var previewImages: [String]
    var content: String
    var techStacks: Set<String>
    var mainTask: String
    var startAt: Date
    var endAt: Date?
    var isInProgress: Bool
    var relatedLinks: [RelatedLink]

    var startAtString: String {
        startAt.toStringCustomFormat(format: "yyyy.MM")
    }
    var endAtString: String {
        endAt?.toStringCustomFormat(format: "yyyy.MM") ?? ""
    }
}

extension ProjectModel {
    struct RelatedLink {
        var name: String
        var url: String
    }
}

protocol MyPageProjectStateProtocol {
    var projectList: [ProjectModel] { get }
    var collapsedProject: [Bool] { get }
    var focusedProjectIndex: Int { get }
    var isPresentedProjectImagePicker: Bool { get }
    var isPresentedPreviewImagePicker: Bool { get }
    var isPresentedProjectStartAtDatePicker: Bool { get }
    var isPresentedProjectEndAtDatePicker: Bool { get }
    var isPresentedProjectTechStackAppend: Bool { get }
    var isPresentedProjectToast: Bool { get }
}

protocol MyPageProjectActionProtocol: AnyObject {
    func toggleCollapsedProject(index: Int)
    func updateProjectName(index: Int, name: String)
    func updateIconImage(index: Int, imageURL: String)
    func appendPreviewImage(index: Int, imageURL: String)
    func removePreviewImage(index: Int, previewIndex: Int)
    func updateProjectContent(index: Int, content: String)
    func updateProjectTechStacks(index: Int, techStacks: [String])
    func removeProjectTechStack(index: Int, techStack: String)
    func updateProjectMainTask(index: Int, mainTask: String)
    func updateProjectStartAt(index: Int, startAt: Date)
    func updateProjectEndAt(index: Int, endAt: Date)
    func updateIsInProgress(index: Int, isInProgress: Bool)
    func updateProjectLinkName(index: Int, linkIndex: Int, name: String)
    func updateProjectLinkURL(index: Int, linkIndex: Int, url: String)
    func appendEmptyRelatedLink(index: Int)
    func removeProjectRelatedLink(index: Int, linkIndex: Int)
    func appendEmptyProject()
    func removeProject(index: Int)
    func updateFocusedProjectIndex(index: Int)
    func updateIsPresentedProjectImagePicker(isPresented: Bool)
    func updateIsPresentedPreviewImagePicker(isPresented: Bool)
    func updateIsPresentedProjectStartAtDatePicker(isPresented: Bool)
    func updateIsPresentedProjectEndAtDatePicker(isPresented: Bool)
    func updateIsPresentedProjectTechStackAppend(isPresented: Bool)
    func updateIsPresentedProjectToast(isPresented: Bool)
}

extension MyPageModel: MyPageProjectActionProtocol {
    func toggleCollapsedProject(index: Int) {
        guard collapsedProject[safe: index] != nil else { return }
        collapsedProject[index].toggle()
    }

    func updateProjectName(index: Int, name: String) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].name = name
    }

    func updateIconImage(index: Int, imageURL: String) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].iconImage = imageURL
    }

    func appendPreviewImage(index: Int, imageURL: String) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].previewImages.append(imageURL)
    }

    func removePreviewImage(index: Int, previewIndex: Int) {
        guard projectList[safe: index] != nil else { return }
        guard projectList[index].previewImages[safe: previewIndex] != nil else { return }
        projectList[index].previewImages.remove(at: previewIndex)
    }

    func updateProjectContent(index: Int, content: String) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].content = content
    }

    func updateProjectTechStacks(index: Int, techStacks: [String]) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].techStacks = Set(techStacks)
    }

    func removeProjectTechStack(index: Int, techStack: String) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].techStacks.remove(techStack)
    }

    func updateProjectMainTask(index: Int, mainTask: String) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].mainTask = mainTask
    }

    func updateProjectStartAt(index: Int, startAt: Date) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].startAt = startAt
    }

    func updateProjectEndAt(index: Int, endAt: Date) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].endAt = endAt
    }

    func updateIsInProgress(index: Int, isInProgress: Bool) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].isInProgress = isInProgress
    }

    func updateProjectLinkName(index: Int, linkIndex: Int, name: String) {
        guard projectList[safe: index] != nil else { return }
        guard projectList[index].relatedLinks[safe: linkIndex] != nil else { return }
        projectList[index].relatedLinks[linkIndex].name = name
    }

    func updateProjectLinkURL(index: Int, linkIndex: Int, url: String) {
        guard projectList[safe: index] != nil else { return }
        guard projectList[index].relatedLinks[safe: linkIndex] != nil else { return }
        projectList[index].relatedLinks[linkIndex].url = url
    }

    func appendEmptyRelatedLink(index: Int) {
        guard projectList[safe: index] != nil else { return }
        projectList[index].relatedLinks.append(.init(name: "", url: ""))
    }

    func removeProjectRelatedLink(index: Int, linkIndex: Int) {
        guard projectList[safe: index] != nil else { return }
        guard projectList[index].relatedLinks[safe: linkIndex] != nil else { return }
        projectList[index].relatedLinks.remove(at: linkIndex)
    }

    func appendEmptyProject() {
        projectList.append(
            .init(
                name: "",
                iconImage: "",
                previewImages: [],
                content: "",
                techStacks: [],
                mainTask: "",
                startAt: Date(),
                endAt: nil,
                isInProgress: false,
                relatedLinks: []
            )
        )
        collapsedProject.append(false)
    }

    func removeProject(index: Int) {
        guard projectList[safe: index] != nil, collapsedProject[safe: index] != nil else { return }
        projectList.remove(at: index)
        collapsedProject.remove(at: index)
    }

    func updateFocusedProjectIndex(index: Int) {
        focusedProjectIndex = index
    }

    func updateIsPresentedProjectImagePicker(isPresented: Bool) {
        isPresentedProjectImagePicker = isPresented
    }

    func updateIsPresentedPreviewImagePicker(isPresented: Bool) {
        isPresentedPreviewImagePicker = isPresented
    }

    func updateIsPresentedProjectStartAtDatePicker(isPresented: Bool) {
        isPresentedProjectStartAtDatePicker = isPresented
    }

    func updateIsPresentedProjectEndAtDatePicker(isPresented: Bool) {
        isPresentedProjectEndAtDatePicker = isPresented
    }

    func updateIsPresentedProjectTechStackAppend(isPresented: Bool) {
        isPresentedProjectTechStackAppend = isPresented
    }

    func updateIsPresentedProjectToast(isPresented: Bool) {
        isPresentedProjectToast = isPresented
    }
}
