import SwiftUI
import Photos
import UIKit

public extension View {
    func cameraPicker(
        isShow: Binding<Bool>,
        pickedImageResult: Binding<PickedImageResult?>
    ) -> some View {
        self.fullScreenCover(isPresented: isShow) {
            CameraPicker(pickedImageResult: pickedImageResult, isPresented: isShow)
                .ignoresSafeArea()
        }
    }
}

struct CameraPicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .camera
    @Binding var pickedImageResult: PickedImageResult?
    @Binding var isPresented: Bool

    init(pickedImageResult: Binding<PickedImageResult?>, isPresented: Binding<Bool>) {
        self._pickedImageResult = pickedImageResult
        self._isPresented = isPresented
    }

    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(pickedImageResult: $pickedImageResult, isPresented: $isPresented)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .camera
        pickerController.delegate = context.coordinator
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.movie", "public.image"]
        pickerController.cameraFlashMode = .auto
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

final class ImagePickerViewCoordinator:
    NSObject,
    UINavigationControllerDelegate,
    UIImagePickerControllerDelegate {

    @Binding var pickedImageResult: PickedImageResult?
    @Binding var isPresented: Bool

    init(pickedImageResult: Binding<PickedImageResult?>, isPresented: Binding<Bool>) {
        self._pickedImageResult = pickedImageResult
        self._isPresented = isPresented
    }

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        let filename: String
        if let asset = info[.phAsset] as? PHAsset, let fileName = asset.value(forKey: "filename") as? String {
            filename = fileName
        } else if let url = info[.imageURL] as? URL {
            filename = url.lastPathComponent
        } else if let url = info[.mediaURL] as? URL {
            filename = url.lastPathComponent
        } else {
            filename = "\(UUID().uuidString).jpeg"
        }

        if let image = info[.editedImage] as? UIImage {
            let pickedImageResult = PickedImageResult(fileName: filename, uiImage: image)
            self.pickedImageResult = pickedImageResult
        } else if let image = info[.originalImage] as? UIImage {
            let pickedImageResult = PickedImageResult(fileName: filename, uiImage: image)
            self.pickedImageResult = pickedImageResult
        } else if let mediaURL = info[.mediaURL] as? URL {
            Task(priority: .userInitiated) {
                let (data, _) = try await URLSession.shared.data(from: mediaURL)
                guard let image = UIImage(data: data) else { return }
                let pickedImageResult = PickedImageResult(fileName: filename, uiImage: image)
                self.pickedImageResult = pickedImageResult
            }
        }

        self.isPresented = false
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
}
