import 'package:flutter/material.dart';
import 'pages/dashboardPage.dart';
import 'pages/missionPage.dart';
import 'pages/overviewPage.dart';
import 'pages/streamPage.dart';
import 'pages/settingPage.dart';

/// -----------------------------
/// AppState (InheritedWidget)
/// -----------------------------
class AppState extends InheritedWidget {
  final String selectedPage;
  final bool isDark;
  final Function(String) changePage;
  final VoidCallback toggleTheme;

  const AppState({
    super.key,
    required this.selectedPage,
    required this.isDark,
    required this.changePage,
    required this.toggleTheme,
    required super.child,
  });

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>()!;
  }

  @override
  bool updateShouldNotify(covariant AppState oldWidget) {
    // rebuild lại khi trang hoặc theme thay đổi
    return selectedPage != oldWidget.selectedPage || isDark != oldWidget.isDark;
  }
}

/// -----------------------------
/// AppStateWidget (Stateful)
/// -----------------------------
class AppStateWidget extends StatefulWidget {
  final Widget child;
  const AppStateWidget({super.key, required this.child});

  @override
  State<AppStateWidget> createState() => _AppStateWidgetState();
}

class _AppStateWidgetState extends State<AppStateWidget> {
  String selectedPage = "Dashboard";
  bool isDark = false;

  void changePage(String page) {
    setState(() {
      selectedPage = page;
    });
  }

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      selectedPage: selectedPage,
      isDark: isDark,
      changePage: changePage,
      toggleTheme: toggleTheme,
      child: widget.child,
    );
  }
}

/// -----------------------------
/// Main entry
/// -----------------------------
void main() {
  runApp(const AppStateWidget(child: USVApp()));
}

/// -----------------------------
/// Root App widget
/// -----------------------------
class USVApp extends StatelessWidget {
  const USVApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'USV App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: appState.isDark ? ThemeMode.dark : ThemeMode.light,
      home: const MainHome(),
    );
  }
}

/// -----------------------------
/// Main Home with Drawer & NavBar
/// -----------------------------
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _currentIndex = 0;

  Widget _buildBody(String page) {
    switch (page) {
      case "Mission":
        return const MissionPage();
      case "Overview":
        return const OverviewPage();
      case "Stream":
        return const StreamPage();
      default:
        return const DashboardPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    final page = appState.selectedPage;

    return Scaffold(
      appBar: AppBar(
        title: Text("USV - $page"),
        actions: [
          IconButton(
            onPressed: appState.toggleTheme,
            icon: Icon(appState.isDark ? Icons.dark_mode : Icons.light_mode),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),

      // Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "USV Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text("Overview"),
              onTap: () {
                appState.changePage("Overview");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Mission"),
              onTap: () {
                appState.changePage("Mission");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Dashboard"),
              onTap: () {
                appState.changePage("Dashboard");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Stream"),
              onTap: () {
                appState.changePage("Stream");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: _buildBody(page),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            switch (value) {
              case 0:
                appState.changePage("Dashboard");
                break;
              case 1:
                appState.changePage("Setting");
                break;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
    );
  }
}
