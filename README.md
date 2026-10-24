
# 🐾 PetRescue

PetRescue is an iOS app that helps people in Naples act fast when they find an animal in need, and learn how to adopt and care for animals responsibly.

Built with **SwiftUI** as a team project.

---

## ✨ Features

### 🚨 Emergency
- Find rescue associations and veterinarians in Naples
- Open contact details and call with one tap
- Works **offline**: all numbers are stored in the app, because in an emergency the internet might not be available

### 🏠 Adoption
- Browse local shelters with address and description
- Confirmation dialog before starting a call
- The Call button is disabled when a shelter is closed

### 📚 Learn
- Short flashcard lessons on training, hand signals and how to calm a scared animal
- Progress page to track completed lessons
- Accessible from every tab through the profile button

### 👋 Onboarding
- Three introduction pages with swipe navigation, Skip and Continue
- Welcome page with a "Get started" button
- Shown **only on the first launch** (saved with `@AppStorage`)

---

## 🛠 Tech Stack

- **Language:** Swift
- **UI:** SwiftUI
- **Architecture:** MVVM (Models, ViewModels, Views)
- **Persistence:** `@AppStorage` for onboarding state
- **Design:** Sketch
- **App icon:** Icon Composer
- **Minimum iOS version:** <iOS XX>

---

## 📁 Project Structure
PetsRescue/
├── Models/
│ ├── Contact.swift
│ ├── Contact+Shelters.swift
│ └── OnboardingPage.swift
├── ViewModel/
│ ├── AdoptionViewModel.swift
│ └── EmergencyViewModel.swift
├── Views/
│ ├── Components/
│ ├── AdoptionCardView.swift
│ ├── AdoptionView.swift
│ ├── ContactDetailView.swift
│ ├── EmergencyView.swift
│ ├── MainTabView.swift
│ ├── OnboardingView.swift
│ ├── OnboardingPageView.swift
│ └── WelcomeView.swift
├── AppColors.swift
├── Assets.xcassets
├── ContentView.swift
└── PetsRescueApp.swift


- `ContentView` decides what to show on launch: `OnboardingView` on the first launch, `MainTabView` afterwards.
- `AppColors.swift` contains the shared color palette, so every screen matches the design.

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone <repository-url>

   ```bash

2. Open PetsRescue.xcodeproj in Xcode.
3.SSelect an iPhone simulator and press ⌘R to run.

To see the onboarding again: delete the app from the simulator and run it again.

🎨 Design

The full app was designed in Sketch, including Emergency, Records and sightings, Adoption, Learn, Account settings and Onboarding.

Given the time available, we prioritized the four most important sections by difficulty and impact: Emergency, Adoption, Learn and Onboarding.
