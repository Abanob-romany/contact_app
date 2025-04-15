# Contact Keeper - Flutter App

A clean and modern **Contact App** built with Flutter, featuring a smooth onboarding splash screen, a dynamic home view, and a sleek bottom sheet for adding contacts. This app provides an elegant solution for managing personal contacts in a beautifully responsive UI.

---

## ✨ Features

- **Splash Screen**
  - Displays the app logo

- **Home Screen**
  - Shows a placeholder message when no contacts are added
  - Responsive design that adapts to screen size
  - Clean **ListView** with custom contact cards once data is added

- **Floating Action Button (FAB)**
  - Opens a modal bottom sheet with a contact form
  - Includes input fields for:
    - **Profile Photo** (picker) 
    - **Full Name**
    - **Email Address**
    - **Phone Number**
  - Form validation ensures proper user input

- **Dynamic Contact List**
  - Contacts are added in real-time to the home screen
  - Beautiful custom cards with:
    - Rectangular avatar with circular border 
    - Name, phone, and email neatly styled

---

## 🧠 How It Works

- Uses a list inside the app to store contacts temporarily
- On adding a new contact, the list is updated and re-rendered
- You can extend it later with local storage like Hive or SQLite

