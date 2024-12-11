import 'package:flutter/material.dart';
import 'package:myapp/service/api_service.dart';

class CreateFeedPage extends StatefulWidget {
  const CreateFeedPage({super.key});

  @override
  State<CreateFeedPage> createState() => CreateFeedPageState();
}

class CreateFeedPageState extends State<CreateFeedPage> {
  final contentControll = TextEditingController();
  final imageControll = TextEditingController.fromValue(TextEditingValue(
      text:
          'https://www.kpopmonster.jp/wp-content/uploads/2021/07/karina_01.jpg'));

  final service = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 24),
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 84, vertical: 8),
            //   child: AspectRatio(
            //     aspectRatio: 4 / 5,
            //     child: Container(color: Colors.red),
            //   ),
            // ),
            // ElevatedButton(onPressed: () {}, child: Text('Upload Image')),
            Text('Create Feed',
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 32),
            TextField(
              controller: imageControll,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Image Url',
                // floatingLabelAlignment: FloatingLabelAlignment.start,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: contentControll,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Caption',
                // floatingLabelAlignment: FloatingLabelAlignment.start,
              ),
            ),
            Divider(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                  onPressed: () async {
                    try {
                      var message = await service.createPost(
                          contentControll.text, imageControll.text);
                      contentControll.clear();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message)));
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: Text('Save')),
            ),
            SizedBox(height: 62),
          ],
        ),
      ),
    );
  }
}
