# CachedImageModule

**CachedImageModule** is a lightweight and efficient Swift package for downloading, caching, and displaying images asynchronously in your SwiftUI projects. It provides a simple and reusable `CachedImageView` component along with a robust caching mechanism to minimize network usage and improve app performance.

---

## Features

- Asynchronous image downloading using Swift concurrency (`async/await`)
- Automatic disk caching in HEIC format for optimized storage
- In-memory cache to avoid redundant downloads
- Easy-to-use SwiftUI view component (`CachedImageView`) with customizable size and content mode
- Synchronous loading from cache with fallback to asynchronous download
- Written in pure Swift, compatible with iOS 15+
- No external dependencies

---

## Installation

Add `CachedImageModule` to your project using [Swift Package Manager](https://swift.org/package-manager/):

1. In Xcode, go to **File > Add Packages...**
2. Enter the repository URL:

```bash
https://github.com/aitorballes/CachedImage.git
```

3. Select the version you want to use (e.g., `1.0.0`).

---

## Usage

Import the package in your SwiftUI file:

```bash
import CachedImageModule
```

Use the `CachedImageView` in your SwiftUI views:

```swift
struct ContentView: View {
let imageUrl = URL(string: "https://example.com/image.jpg")

  var body: some View {
      CachedImageView(imageUrl: imageUrl, size: 100, contentMode: .fill)
  }
}
```


---

## API

### `CachedImageView`

A SwiftUI view that displays a cached image from a URL.

- **Parameters:**
  - `imageUrl`: The URL of the image to display.
  - `size`: The height of the image view (default: 80).
  - `contentMode`: The content mode for the image (default: `.fit`).

---

## Requirements

- iOS 17.0+
- Swift 5.7+

---

## License

This project is licensed under the MIT License.

---

## Contributing

Contributions are welcome! Please open issues or pull requests for new features, bug fixes, or suggestions.

---

## Contact

For questions or support, please open an issue on GitHub.


