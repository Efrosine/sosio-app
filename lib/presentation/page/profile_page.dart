import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Karina',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 4,
      ),
      body: ListView(
        children: [
          SizedBox(height: 16),
          SizedBox.fromSize(
            size: Size.fromHeight(170),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: NetworkImage(
                        'https://wallpapercave.com/wp/wp8315545.jpg'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '2,023',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text('Post'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '2,023',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text('Folowers'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '2,023',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text('Folowing'),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1),
            itemBuilder: (context, index) => SizedBox(
              child: Image.network(
                'https://wallpapercave.com/wp/wp8315545.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
