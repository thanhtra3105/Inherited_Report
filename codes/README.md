# USV Dashboard AppState (InheritedWidget Demo)

## 1. Introduction
A Flutter multi-page application demonstrating how to manage global app state (navigation + theme) using InheritedWidget — the foundation of state management in Flutter.
This project extends the previous USV Dashboard by adding dynamic page navigation, theme switching, and a Drawer-based UI structure.

---

## 2. System Features

| **Feature** | **Description** | **Implementation** |
|--------------|----------------|------------------|
| **Global State Sharing** | Manage app-wide states like currentPage and isDarkTheme without prop drilling. | Custom AppState (InheritedWidget) |
| **Dynamic Page Navigation** | Instantly switch between multiple pages (Overview, Mission, Dashboard, Stream, Setting) from Drawer. | appState.changePage("Dashboard"). |
| **Theme Toggle** | Switch between Light and Dark mode dynamically.. | appState.toggleTheme(). |
| **State Access Anywhere** | Widgets can access global data easily.. | AppState.of(context). |
| **Performance Optimization** | Only dependent widgets rebuild when data changes. | dependOnInheritedWidgetOfExactType(). |
---

## 3. Installation & Run Guide

### 3.1. Prerequisites

- **Flutter SDK:** Ensure that Flutter is installed and environment variables are properly set.  
  Check with the command:
  ```bash
  flutter doctor
  ```
-  SDK: (Included with Flutter)
- IDE: Visual Studio Code or Android Studio.

### 3.2. Environment Setup

Clone the repository:
```bash
git clone https://github.com/thanhtra3105/Inherited_Report.git

cd Inherited_Report
```

Install dependencies:
```bash
flutter pub get
```
### 3.3. Run the Application

This app is designed to run cross-platform (Mobile, Web, and Desktop).

Open IDE: Open the Inherited_Report folder in your IDE.

Select Device: Choose an emulator/simulator or a real device.

Run the app:
```bash
  flutter run
```

You can switch between pages from the left Drawer menu, and toggle the app’s theme in the icon light/dark.

#4. Project Structure
```plaintext
lib/
├── pages/
│   ├── dashboardPage.dart     # Main Dashboard page (displaying overall data)
│   ├── missionPage.dart       # Mission selection page for USV
│   ├── overviewPage.dart      # System overview page
│   └── streamPage.dart        # Video streaming page
├── widgets/
│   ├── batteryCard.dart       # Card displaying battery status
│   ├── dashboardCard.dart     # General dashboard information card
│   ├── historyChart.dart      # Historical Line Chart
│   └── speedCard.dart         # Card showing current speed
└── main.dart                  # Application entry point

```
# License
...

# ©️ Copyright

© 2025 thanhtra3105
All rights reserved.
Copyright belongs to thanhtra3105 & Mojinnn

## Authors: thanhtra3105 & Mojinnn
### Version: 1.0.0

