import SwiftUI

@Observable
public final class CachedImageViewModel {
    let imagesDownloader: ImagesDownloader
    var image: UIImage?
    
    init(imagesDownloader: ImagesDownloader = .shared) {
        self.imagesDownloader = imagesDownloader
    }
    
    @MainActor
    func getImage(url: URL) async {
        do {
            self.image = try await imagesDownloader.getImage(from: url)
        } catch {
            print("Failed to download image: \(error)")
        }
    }
    
    @MainActor
    func getImageSynchronously(url: URL) {
        let docURL = imagesDownloader.urlDoc(url: url)
        
        if FileManager.default.fileExists(atPath: docURL.path), let data = try? Data(contentsOf: docURL) {
            image = UIImage(data: data)
        } else {
            Task {
                await getImage(url: url)
            }
        }
            
    }
}

public struct CachedImageView: View {
    @State private var viewModel = CachedImageViewModel()
    
    let imageUrl: URL?
    let size: CGFloat
    let contentMode: ContentMode

    public init(imageUrl: URL?, size: CGFloat = 80, contentMode: ContentMode = .fit) {
        self.imageUrl = imageUrl
        self.size = size
        self.contentMode = contentMode
    }
    
    public var body: some View {
        
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(height: size)
                .clipped()
                .cornerRadius(10)
        } else {
            Image(systemName: "photo.circle")
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(height: size)
                .clipped()
                .cornerRadius(10)
                .foregroundColor(.gray)
                .onAppear {
                    if let imageUrl = imageUrl {
                        viewModel.getImageSynchronously(url: imageUrl)
                    }
                }
        }
    }
}
