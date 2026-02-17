# 🎬 Moview App

Moview is a professional-grade Flutter application built as a deep dive into scalable, testable, and maintainable mobile architecture.  
This project focuses on applying industry-level best practices rather than just delivering features.

The main goal was to create a predictable codebase that is easy to extend, debug, and test.

---

## 🚀 Technical Stack & Skills

### 🧱 Architecture
- Clean Architecture (Data, Domain, Presentation layers)
- SOLID Principles
- Repository Pattern

### 🔄 State Management
- BLoC / Cubit
- Reactive UI driven by states

### 🌐 Networking
- Dio
- RESTful APIs
- JSON Parsing

### 🧠 Logic & Patterns
- Functional Programming using Dartz
- Functional Error Handling with `Either<Failure, T>`
- Dependency Injection using Get_it

### 🎨 UI / UX
- Shimmer Loading Effects
- Carousel Sliders
- Complex Animations (Animate_do)
- Cached Network Images
- Smooth and responsive user experience

### ⚡ Optimization
- Equatable for value-based equality
- Optimized state comparison
- Efficient data caching

---

## 🏗️ Architectural Foundation

The core challenge of this project was maintaining a strict separation of concerns.

By adhering to Clean Architecture, the business logic is completely independent from:
- UI components
- External data sources
- Framework-specific implementations

This makes the app:
- Easier to test
- Safer to refactor
- Ready for future scaling

---

## 🔑 Key Methodologies

### ✅ Functional Error Handling
Instead of relying on scattered try-catch blocks or risking crashes, the app uses:

`Either<Failure, T>`

This approach:
- Makes error flow predictable
- Forces proper error handling at the UI level
- Cleanly separates success and failure cases

---

### ✅ Dependency Inversion
Using Get_it, all dependencies are decoupled.

Benefits:
- No hard-wired class dependencies
- Easier unit testing
- Safer modifications without breaking other layers

---

### ✅ Reactive UI
With BLoC, the UI:
- Reacts only to emitted states
- Contains no business logic
- Remains clean and easy to maintain

---

### ✅ Performance First Mindset
Special attention was given to details that improve user experience:
- Cached images to reduce network usage
- Shimmer effects for premium loading feedback
- Efficient rebuilds using Equatable

---

## 🎯 Takeaway

Building Moview reinforced the idea that:

"A successful mobile application starts with a strong architectural blueprint."

This project represents a solid foundation for building production-ready Flutter apps, and I’m excited to apply these practices in future challenges.
Movies Module 
App Ui 
<img width="711" height="1538" alt="image" src="https://github.com/user-attachments/assets/41b8e37f-3bb8-4fb3-a45f-79516424fd61" />  <img width="714" height="1545" alt="image" src="https://github.com/user-attachments/assets/7b703ae3-2a29-46c8-b527-ccf69f4e998f" />
<img width="691" height="1494" alt="image" src="https://github.com/user-attachments/assets/985dff62-1883-4f79-bb1b-0925958661f2" />

<img width="730" height="1578" alt="image" src="https://github.com/user-attachments/assets/d5c3b08c-79a0-467b-8638-1810f80416d6" />


