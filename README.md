# 🛒 ShopX – E-commerce iOS App

ShopX is an e-commerce project built with **SwiftUI**, following **Clean Architecture** and a multi-module structure for scalability and maintainability.  
It is designed as a foundation for a production-ready app with support for **Firebase, Stripe**, and other popular SDKs.

---
## Info
- Theme: [Reetro-theme](http://material-foundation.github.io/material-theme-builder/?primary=%23B8423B&bodyFont=Inter&displayFont=Inter&colorMatch=false)
<img width="915" height="642" alt="Screenshot 2025-09-25 at 18 20 32" src="https://github.com/user-attachments/assets/25cbf771-a304-4071-9d7e-18ba1054fc55" />

## 🚀 Features

- ✅ SwiftUI UI Layer (Home, Catalog, Product Detail, Cart, Checkout, Profile, Orders)
- ✅ Clean Architecture (Domain – Data – Core – Features – App)
- ✅ Multi-module project (Swift Package Manager)
- ✅ Networking (`URLSession` + async/await, Endpoint builder)
- ✅ Persistence (Core Data via `CorePersistence`)
- ✅ Dependency Injection (composition root at the App target)
- ✅ Firebase Integration (Analytics, Crashlytics, Performance, Remote Config, Auth)
- ✅ Stripe Payment SDK (Apple Pay / Credit Card)
- ✅ Testable: Unit Tests, UI Tests (XCUITest), Snapshot Tests
- ✅ Tooling: SwiftLint, SwiftFormat, SwiftGen, Danger (CI)

---

## 📂 Project Structure
```
ShopX/
├── ShopX/ # App target (composition root)
│ └── ShopXApp.swift
│
├── Modules/AppModules/ # Swift Package (multi-module)
│ ├── Package.swift
│ └── Sources/
│ ├── CoreUtilities/ # Logging, extensions, helpers
│ ├── CoreNetworking/ # NetworkClient, Endpoint builder
│ ├── CorePersistence/ # PersistenceStore (Core Data)
│ ├── CoreAnalytics/ # Analytics (Firebase wrapper)
│ │
│ ├── DomainProducts/ # Entities, ProductRepository, UseCases
│ ├── DomainAuth/ # Auth models, repository
│ ├── DomainCart/ # Cart models, repository
│ ├── DomainOrders/ # Order models, repository
│ │
│ ├── DataProducts/ # RepositoryImpl (network + persistence)
│ ├── DataAuth/
│ │
│ ├── FeaturesHome/ # SwiftUI View + ViewModel for Home screen
│ └── ... (Search, Cart, Checkout, Profile...)
│
├── ShopXTests/ # Unit tests for App target
├── ShopXUITests/ # XCUITest (end-to-end)
└── README.md
```

---

## 🛠 Requirements

- macOS 14+
- Xcode 15+
- iOS 16+ (recommended iOS 17+)
- Swift 5.9+

---

## ⚙️ Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/haotranthien95/Reeshion.git
   cd Reeshion
   ```
2. Install dependencies via Swift Package Manager:

* Open `Reeshion.xcodeproj` in Xcode

* Go to **File → Add Packages… → Add Local…**

* Select **Modules/AppModules**

3. Add the following products to the Reeshion target:

* `FeaturesHome`

* `DataProducts`

* `DomainProducts`

* `CoreNetworking`

* `CoreUtilities`

4. Build & Run (⌘R)

👉 At this stage, the Repository may return mock data instead of a real API.

---
## 🧪 Testing

* Unit Tests: run with ⌘U or xcodebuild test

* UI Tests: XCUITest scripts under ShopXUITests/

* Snapshot Tests: using pointfreeco/SnapshotTesting

* Code coverage: enable in Xcode Scheme → Test → Options → Gather coverage

## 📊 Tooling & CI/CD

* SwiftLint
 – enforce coding style

* SwiftFormat
 – auto format

* SwiftGen
 – assets, strings, colors

* Danger
 – PR linting

* GitHub Actions (or Bitrise/Fastlane) – build, test, distribute

* Firebase App Distribution / TestFlight – for QA/Testers

## 🔒 Security & Privacy

* Keychain for tokens/credentials

* HTTPS enforced (ATS)

* No sensitive data logged

* Privacy Manifest for SDKs

* ATT prompt if tracking is used
## 🗺 Roadmap

- [ ] Add **Search** feature module  
- [ ] Implement **Cart** and **Checkout** flows  
- [ ] Integrate **Stripe** for payments (Apple Pay / Credit Card)  
- [ ] Connect **Firebase Remote Config** for feature flags & A/B testing  
- [ ] Enhance UI/UX with **skeleton loaders**, **shimmer effects**, and **dark mode** support  
- [ ] Add **localization** (English, Vietnamese, Japanese, …)  

---

## 👨‍💻 Contributors

- **Hao Tran** – iOS Developer / Architect  
- (Add other team members here)

---

## 📄 License

This project is **proprietary**. All rights reserved.
