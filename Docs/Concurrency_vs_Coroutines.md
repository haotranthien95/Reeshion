# So sánh Swift Concurrency và Kotlin Coroutines

Swift Concurrency và Kotlin Coroutines đều nhằm mục tiêu giúp viết code
bất đồng bộ dễ đọc, an toàn và có **structured concurrency**, nhưng khác
nhau về cơ chế cốt lõi và mức độ an toàn compile-time.

------------------------------------------------------------------------

## Bảng so sánh nhanh

  -------------------------------------------------------------------------------------
  Chủ đề                  Swift Concurrency           Kotlin Coroutines
  ----------------------- --------------------------- ---------------------------------
  Từ khóa chính           `async/await`, `Task`,      `suspend`, `coroutineScope`,
                          `TaskGroup`, `actor`        `launch/async`, `Flow`

  Structured concurrency  `async let`, `TaskGroup`    `coroutineScope`,
                                                      `supervisorScope`, `async/await`

  Luồng chính (UI)        `@MainActor`                `Dispatchers.Main`,
                                                      `withContext(Dispatchers.Main)`

  An toàn dữ liệu         `actor` + `Sendable`        Dispatcher confinement, `Mutex`,
                          (compiler check)            `Flow`, actor pattern thủ công

  Hủy (cancellation)      Hợp tác, qua                Hợp tác, qua `Job`, `isActive`,
                          `Task.isCancelled`,         `CancellationException`
                          `TaskGroup`                 

  Dòng dữ liệu async      `AsyncSequence`,            `Flow`, `StateFlow`, `SharedFlow`
                          `AsyncStream`               

  Executor/Thread pool    Quản lý tự động, có         `Dispatchers.Default`,
                          `@MainActor`,               `Dispatchers.IO`,
                          `Task.detached`             `Dispatchers.Main`, ...

  Bắt lỗi                 `try/await` + `throws`      `try` trong `suspend`,
                                                      `supervisorScope` để cô lập lỗi

  Tích hợp legacy         `withCheckedContinuation`   `suspendCancellableCoroutine` để
                          để bridge completion        bridge callback Java
                          handler                     

  Kiểm soát tài nguyên    `TaskGroup`, `actor`        `coroutineScope`,
                                                      `SupervisorJob`, `Flow`,
                                                      `Channel`
  -------------------------------------------------------------------------------------

------------------------------------------------------------------------

## Triết lý thiết kế

-   **Swift Concurrency**:
    -   Đặt trọng tâm vào **an toàn compile-time**.\
    -   Có `actor` để cô lập state.\
    -   Có `Sendable` để compiler kiểm tra thread-safety.\
    -   `@MainActor` đảm bảo UI logic chỉ chạy trên main thread.
-   **Kotlin Coroutines**:
    -   Thiên về **thực dụng và linh hoạt**.\
    -   Quản lý concurrency bằng dispatcher, scope, và job hierarchy.\
    -   Không có compiler check như `Sendable`, phụ thuộc nhiều vào
        convention.

------------------------------------------------------------------------

## Mapping tinh thần

### Chạy song song và chờ kết quả

**Swift:**

``` swift
async let a = fetchA()
async let b = fetchB()
let (ra, rb) = await (try a, try b)
```

**Kotlin:**

``` kotlin
coroutineScope {
    val a = async { fetchA() }
    val b = async { fetchB() }
    val ra = a.await()
    val rb = b.await()
}
```

------------------------------------------------------------------------

### Nhóm task có cấu trúc

**Swift:** `withTaskGroup(of:) { group in ... }`\
**Kotlin:** `coroutineScope { ... }` + `async`

------------------------------------------------------------------------

### Luồng chính (UI)

**Swift:**

``` swift
@MainActor
func updateUI() { ... }
```

**Kotlin:**

``` kotlin
withContext(Dispatchers.Main) {
    updateUI()
}
```

------------------------------------------------------------------------

### Stream dữ liệu async

**Swift:**

``` swift
for await value in stream {
    print(value)
}
```

**Kotlin:**

``` kotlin
flow.collect { value ->
    println(value)
}
```

------------------------------------------------------------------------

### Tránh data race

**Swift:** đưa state vào `actor`, hoặc dùng type `Sendable`.\
**Kotlin:** giới hạn cập nhật state trong một dispatcher, hoặc dùng
`Mutex`, `StateFlow`.

------------------------------------------------------------------------

## Khi nào cái nào mạnh hơn?

-   **Swift Concurrency**: mạnh về **compile-time safety**, `actor` +
    `Sendable` giảm thiểu race condition.\
-   **Kotlin Coroutines**: mạnh về **ecosystem** (đặc biệt là `Flow` với
    operators phong phú), linh hoạt với dispatcher và reactive
    programming.

------------------------------------------------------------------------

## Lời khuyên thực dụng

-   iOS/SwiftUI:
    -   Dùng `async/await` + `TaskGroup` cho song song.\
    -   Đánh dấu UI logic bằng `@MainActor`.\
    -   Chia sẻ state qua `actor` hoặc immutable + `Sendable`.\
    -   Stream UI bằng `AsyncSequence`/`AsyncStream`.
-   Android/Kotlin:
    -   Dùng `viewModelScope` + `StateFlow` cho UI state.\
    -   Quản lý dispatcher (`IO` cho I/O, `Default` cho CPU).\
    -   Dùng `supervisorScope` khi muốn cô lập lỗi.\
    -   Nhớ xử lý hủy đúng cách (`isActive`, `CancellationException`).

------------------------------------------------------------------------
