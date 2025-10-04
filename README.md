
# 🖼️ SwiftUI Image Slideshow

A clean, reactive **image slideshow built with SwiftUI**, featuring:
- 🌀 Automatic slide transitions  
- ✋ Manual swipe gesture support  
- ⏸️ Pause and resume functionality  
- 🧠 MVVM architecture powered by **Combine**

This project demonstrates how to structure a scalable SwiftUI component that integrates gesture handling, timers, and reactive state updates in a modular way.

---

## 🚀 Features

✅ **Automatic Slideshow** — slides switch automatically every few seconds using a Combine timer  
✅ **Manual Swipe Support** — users can swipe through images using a `TabView`  
✅ **Pause & Resume** — long press to pause the slideshow, release to resume  
✅ **MVVM Architecture** — clean separation of UI, logic, and data  
✅ **Smooth Transitions** — powered by SwiftUI animations  

---

## 🧠 Architecture Overview

The project follows the **MVVM (Model–View–ViewModel)** pattern:

- **Model:** Holds slide data (`SlideShowModel`)
- **ViewModel:** Manages timer logic, gestures, and current slide index (`SlideShowViewModel`)
- **View:** Displays the images, handles user interaction (`SlideShowView`)

This separation makes the slideshow easy to extend, test, and reuse.

---

## ⚙️ How It Works

A Timer.publish(every: 5, ...) triggers a Combine publisher to move to the next slide every 5 seconds.
The TabView updates reactively through a published currentIndex.
Gestures (DragGesture and onLongPressGesture) control pausing and resuming.
The ViewModel handles logic, keeping the view declarative and clean.


## 🔧 Requirements

Xcode: 15.0 or later
iOS: 17.0+
Swift: 5.9 or later


## 🧩 Possible Enhancements

Add fade or custom transition animations
Load remote images with AsyncImage or URLSession
Add custom page indicators or captions
Make slide duration configurable


## 🧠 Learnings

This project demonstrates how to:
Use Combine for time-based UI updates
Apply MVVM in SwiftUI
Combine gestures, timers, and animations cohesively


## 💬 Feedback & Contributions

I’d love to hear your thoughts or suggestions!
Feel free to open an issue or submit a pull request.


## ✨ Author

Anie Parameswaran
iOS Developer | SwiftUI Enthusiast
Medium • LinkedIn
