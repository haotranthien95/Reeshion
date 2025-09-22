# AsyncImage in SwiftUI – Complete Guide (2025)

`AsyncImage` is a built-in SwiftUI view (iOS 15+) that loads and displays remote images asynchronously.  
This guide walks you through **basic to advanced usage**, including examples and best practices.

---

## 1. Basic Usage

The simplest way to load an image from a URL:

```swift
AsyncImage(url: URL(string: "https://example.com/image.png"))
```

- Displays the remote image if successful.
- Uses default scaling (`.scaledToFit`).
- Shows a **system placeholder** while loading.

---

## 2. Custom Placeholder

You can provide your own placeholder while the image is loading:

```swift
AsyncImage(url: URL(string: "https://example.com/photo.jpg")) { image in
    image
        .resizable()
        .scaledToFit()
} placeholder: {
    ProgressView()
}
.frame(width: 200, height: 200)
```

- `image`: The loaded `Image`.
- `placeholder`: Any view (e.g., `ProgressView`, `Color`, custom skeleton view).

---

## 3. Handling Loading States with `AsyncImagePhase`

`AsyncImage` can expose the full state via `AsyncImagePhase`:

```swift
AsyncImage(url: URL(string: "https://example.com/avatar.png")) { phase in
    switch phase {
    case .empty:
        ProgressView() // loading
    case .success(let image):
        image
            .resizable()
            .scaledToFill()
    case .failure(_):
        Image(systemName: "xmark.circle") // error fallback
    @unknown default:
        EmptyView()
    }
}
.frame(width: 100, height: 100)
.clipShape(Circle())
```

### `AsyncImagePhase` states:
- `.empty` → No image loaded yet.
- `.success(Image)` → Successfully loaded.
- `.failure(Error)` → Failed to load.

---

## 4. Using `scale`

`scale` controls how the image matches the display scale:

```swift
AsyncImage(
    url: URL(string: "https://example.com/2x-image.png"),
    scale: 2.0
) { image in
    image.resizable()
} placeholder: {
    ProgressView()
}
```

- Example: Pass `2.0` for @2x assets.

---

## 5. Adding Animations with `transaction`

You can animate transitions when the image loads:

```swift
AsyncImage(
    url: URL(string: "https://example.com/photo.jpg"),
    transaction: Transaction(animation: .easeInOut)
) { phase in
    switch phase {
    case .empty:
        ProgressView()
    case .success(let image):
        image
            .resizable()
            .scaledToFit()
            .transition(.scale) // animated by transaction
    case .failure:
        Image(systemName: "exclamationmark.triangle")
    @unknown default:
        EmptyView()
    }
}
```

---

## 6. Advanced Example: Profile Avatar

```swift
struct ProfileAvatar: View {
    let url: URL?

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                Color.gray.opacity(0.3)
                    .overlay(ProgressView())
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Image(systemName: "person.crop.circle.badge.exclamationmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 80, height: 80)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 2))
        .shadow(radius: 4)
    }
}
```

---

## 7. Best Practices

✅ **Always handle failure**  
Provide a fallback (e.g., system icon or placeholder) so users don’t see a blank box.

✅ **Use `resizable()` + `.scaledToFit()` or `.scaledToFill()`**  
Ensures proper aspect ratio.

✅ **Cache if necessary**  
`AsyncImage` doesn’t provide advanced caching. For heavy apps, consider libraries like [Kingfisher](https://github.com/onevcat/Kingfisher) or [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI).

✅ **Limit image size**  
Set `.frame(width:height:)` to avoid rendering large images unnecessarily.

✅ **Add animation**  
Use `transaction` + `.transition` for a smooth fade or scale-in effect.

✅ **Accessibility**  
Add `.accessibilityLabel("Profile Picture")` for screen readers.

---

## 8. When to Use `AsyncImage`

- ✅ Quick prototypes or small apps.  
- ✅ When you just need a simple async image loader.  
- ❌ For production apps needing **advanced caching, progressive loading, or prefetching**, use a third-party library.  

---

## 9. Summary

- `AsyncImage` is built-in and convenient.  
- You can customize **placeholder**, **error state**, and **success rendering**.  
- Advanced behaviors: `AsyncImagePhase`, `scale`, `transaction`.  
- For complex apps → pair with caching/image libraries.

---
