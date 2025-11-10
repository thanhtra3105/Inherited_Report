import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  bool isStreaming = false;

  void toggleStream() {
    setState(() {
      isStreaming = !isStreaming;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.videocam,
              size: 100,
              color: isStreaming ? Colors.red : Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              isStreaming ? "Live Stream Active" : "Stream Offline",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isStreaming ? Colors.red : Colors.black,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: toggleStream,
              icon: Icon(isStreaming ? Icons.stop : Icons.play_arrow),
              label: Text(isStreaming ? "Stop Stream" : "Start Stream"),
              style: ElevatedButton.styleFrom(
                backgroundColor: isStreaming ? Colors.red : Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: isStreaming
                    ? Text(
                        "📹 Simulated Camera Feed...",
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      )
                    : Text(
                        "Camera Standby",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
