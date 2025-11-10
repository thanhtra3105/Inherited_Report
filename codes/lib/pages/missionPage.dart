import 'package:flutter/material.dart';

class MissionPage extends StatefulWidget {
  const MissionPage({super.key});

  @override
  State<MissionPage> createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  List<String> missions = [
    "Survey Area A",
    "Check Water Quality",
    "Return to Base",
  ];
  bool isLoading = false;

  void addMission() {
    setState(() {
      missions.add("New Mission #${missions.length + 1}");
    });
  }

  void simulateMission() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 3));
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addMission,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mission Control",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: simulateMission,
              icon: Icon(Icons.play_arrow),
              label: Text("Start Mission Simulation"),
            ),
            SizedBox(height: 16),
            if (isLoading)
              Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: ListView.builder(
                  itemCount: missions.length,
                  itemBuilder: (context, i) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.flag, color: Colors.blue),
                        title: Text(missions[i]),
                        subtitle: Text("Status: Pending"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
