import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;

  const SettingPage({
    super.key,
    required this.isDark,
    required this.onThemeToggle,
  });

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool soundEnabled = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 20),
            _sectionTitle("General"),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _settingTile(
                    icon: Icons.dark_mode,
                    title: "Dark Mode",
                    trailing: Switch(
                      value: widget.isDark,
                      onChanged: (v) => widget.onThemeToggle(),
                    ),
                  ),
                  _settingTile(
                    icon: Icons.volume_up,
                    title: "Sound Effects",
                    trailing: Switch(
                      value: soundEnabled,
                      onChanged: (v) {
                        setState(() => soundEnabled = v);
                      },
                    ),
                  ),
                  _settingTile(
                    icon: Icons.notifications_active,
                    title: "Notifications",
                    trailing: Switch(
                      value: notificationsEnabled,
                      onChanged: (v) {
                        setState(() => notificationsEnabled = v);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _sectionTitle("System Info"),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _infoTile("App Version", "v1.0.0"),
                  Divider(height: 1),
                  _infoTile("Device ID", "USV-CTRL-2025"),
                  Divider(height: 1),
                  _infoTile("Network", "Connected"),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                icon: Icon(Icons.logout),
                label: Text("Log Out", style: TextStyle(fontSize: 16)),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Logging out...")));
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  Widget _settingTile({
    required IconData icon,
    required String title,
    required Widget trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: trailing,
    );
  }

  Widget _infoTile(String title, String value) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text(value, style: TextStyle(color: Colors.grey[700])),
    );
  }
}
