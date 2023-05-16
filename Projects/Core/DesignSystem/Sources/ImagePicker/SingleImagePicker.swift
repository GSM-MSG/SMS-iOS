import SwiftUI
import PhotosUI

public extension View {
    func imagePicker(
        isShow: Binding<Bool>,
        pickedImageResult: Binding<PickedImageResult?>,
        filter: PHPickerFilter = .images
    ) -> some View {
        self.fullScreenCover(isPresented: isShow) {
            SingleImagePicker(filter: filter, pickedImageResult: pickedImageResult)
        }
    }
}

struct SingleImagePicker: UIViewControllerRepresentable {
    let filter: PHPickerFilter
    @Binding var pickedImageResult: PickedImageResult?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = filter
        configuration.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: PHPickerViewControllerDelegate {
        var parent: SingleImagePicker

        init(_ parent: SingleImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            for result in results {
                let provider = result.itemProvider
                provider.loadFileRepresentation(forTypeIdentifier: "public.item") { [weak self] url, _ in
                    guard provider.canLoadObject(ofClass: UIImage.self) else { return }
                    provider.loadObject(ofClass: UIImage.self) { image, _ in
                        guard let image = image as? UIImage else { return }
                        DispatchQueue.main.async {
                            let pickedImageResult = PickedImageResult(
                                fileName: url?.lastPathComponent ?? "",
                                uiImage: image
                            )
                            self?.parent.pickedImageResult = pickedImageResult
                        }
                    }
                }
            }
            picker.dismiss(animated: true)
        }
    }
}
