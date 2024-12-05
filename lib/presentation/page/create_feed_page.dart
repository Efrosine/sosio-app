import 'package:flutter/material.dart';

class CreateFeedPage extends StatelessWidget {
  const CreateFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 84, vertical: 8),
              child: AspectRatio(
                aspectRatio: 4 / 5,
                child: Container(color: Colors.red),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Upload Image')),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Caption',
                    floatingLabelAlignment: FloatingLabelAlignment.start),
              ),
            ),
            Divider(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(onPressed: () {}, child: Text('Save')),
            ),
            SizedBox(height: 62),
          ],
        ),
      ),
    );
  }
}
