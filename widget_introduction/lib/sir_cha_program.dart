import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Introduction'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Hello Shivam"),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
              padding: const EdgeInsets.all(20),
              child: const Text("Hello Aum"),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "38",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        "Sent messages",
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.pink,
                ),
                const SizedBox(width: 8),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Hello Sahil"),
            const Text("Hello Parth"),
            const Placeholder(
              child: Text("Hello Manav"),
            ),
            const Icon(Icons.call),
            Container(
              width: 400,
              height: 700,
              color: Colors.grey,
              child: const Image(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1550355291-bbee04a92027?q=80&w=2836&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
