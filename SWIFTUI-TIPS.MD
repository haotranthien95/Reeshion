# SwiftUI Cheat Sheet (2025)

## 1) State & Data Flow

| Tool | When to use | Lifetime | Notes |
|---|---|---|---|
| `@State` | Local view state (toggle, text, counter) | Per view | Not shared outside. |
| `@Binding` | Pass read/write state to a child view | Parent-owned | Great for reusable controls. |
| `@ObservedObject` | Observe an object owned elsewhere | Per view | Doesn’t manage lifecycle. |
| `@StateObject` | View creates/owns object (like ViewModel) | Stable | Default for screen-level VM. |
| `@EnvironmentObject` | Shared state across the view tree | Ancestor | Use only for global contexts. |
| `@Environment(\...)` | Access system values (colorScheme, dismiss) | N/A | System-provided. |
| `@AppStorage` | Persist small user settings | Whole app | Backed by `UserDefaults`. |
| `@SceneStorage` | Save/restore per scene | Per scene | Small values only. |

---

## 2) Layout Containers

| View | Use case | Strength | Notes |
|---|---|---|---|
| `VStack` / `HStack` / `ZStack` | Simple layouts | Easy | For small UI building. |
| `LazyVStack` / `LazyHStack` | Scrollable stack | Lazy loading | Wrap in `ScrollView`. |
| `List` | Large scrollable lists | Native reuse | Best for big data. |
| `Grid` / `LazyVGrid` | Grids | Flexible | Use with `GridItem`. |
| `Form` | Settings screens | Auto grouping | Matches iOS look. |
| `ScrollView` | Free scrolling | Customizable | No reuse, be careful. |
| `GeometryReader` | Need parent size | Powerful | May stretch unexpectedly. |

---

## 3) Navigation

| API | When | Pros | Notes |
|---|---|---|---|
| `NavigationStack` | iOS 16+ modern push navigation | Path control | Preferred over `NavigationView`. |
| `NavigationSplitView` | Multi-column apps (iPad/Mac) | Great UX | For sidebar + detail. |
| `sheet`, `fullScreenCover` | Modal views | Simple | Don’t over-nest. |
| `alert`, `confirmationDialog` | Alerts, quick choices | Native | Keep simple. |

---

## 4) Styling & Drawing

| Category | Tool | When |
|---|---|---|
| Control styling | `.buttonStyle`, `.toggleStyle` | Theming |
| Background | `.background`, `.overlay` | Layering |
| Shapes | `RoundedRectangle`, `Capsule` | Buttons/cards |
| Blur effect | `.background(.ulraThinMaterial)` | Glassy UI |
| Custom drawing | `Canvas` | Charts/graphics |

---

## 5) Animation & Transition

| Tool | When | Notes |
|---|---|---|
| `.animation(_, value:)` | Animate value changes | Controlled |
| `withAnimation {}` | Wrap state changes | Explicit |
| `.transition(.move/.opacity)` | View enter/exit | Needs `if` condition |
| `matchedGeometryEffect` | Smooth moves between views | Hero animation |

---

## 6) Concurrency

| Tool | When | Notes |
|---|---|---|
| `.task` | Fetch data on appear | Cancels on disappear |
| `.refreshable` | Pull-to-refresh | List/ScrollView |
| `@MainActor` | Update UI safely | Run heavy work off-main |
| `@Published` | Observable state | Don’t over-publish |

---

## 7) App Lifecycle

| Tool | When | Notes |
|---|---|---|
| `@main App` | Entry point | Defines scenes |
| `@Environment(\.scenePhase)` | Detect active/inactive | Save/restore |
| Widgets & Intents | iOS 17+ integrations | App shortcuts, widgets |

---

## 8) Architecture

| Choice | When | Notes |
|---|---|---|
| MVVM | Screen + ViewModel + UseCase | Most common |
| Modular features | Large apps | Split into Feature, Domain, Core |
| Dependency Injection | Replaceable services | Protocol + Factory |

---

## 9) Testing & Preview

| Tool | When | Notes |
|---|---|---|
| `PreviewProvider` | Test multiple states | Dark/light, locale, etc. |
| Unit test ViewModel | Business logic | Mock repositories |
| Snapshot test | Stable UI validation | Great for design system |

---

## 10) Performance Tips

- Split views into smaller components.  
- Use `@StateObject` to avoid recreating VMs.  
- Prefer `List`/`Lazy*` for large data.  
- Avoid heavy work inside `body`.  
- Don’t abuse `GeometryReader`.  

---

## 11) Accessibility & Localization

- Use `.accessibilityLabel`, `.accessibilityHint`.  
- Use system `Font` for Dynamic Type.  
- Test dark/light, high contrast.  
- Localize with `String(localized:)`.  

---

## 12) UIKit Integration

- `UIViewRepresentable` / `UIViewControllerRepresentable` → wrap UIKit views.  
- `UIHostingController` → embed SwiftUI in UIKit.  
- Use `Coordinator` for delegate handling.  

---

## 13) Input & Forms

- `Form` for settings.  
- `@FocusState` to manage keyboard.  
- `onChange` for live validation.  
- `submitLabel` for keyboard return types.  

---

## 14) Storage & Networking

- Small settings → `@AppStorage`.  
- Data persistence → SwiftData/CoreData.  
- Network → `URLSession` with async/await.  
- Caching → Repository layer.  

---

## 15) “When to use what” Quick Patterns

- **List of items** → `NavigationStack` + `List` + `@StateObject`.  
- **Settings screen** → `Form` + `@AppStorage`.  
- **Product grid** → `LazyVGrid`.  
- **Modal picker** → `.sheet` with `@Binding`.  
- **Multi-column app** → `NavigationSplitView`.  
- **Global session** → `@EnvironmentObject` (sparingly).  
