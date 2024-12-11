import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myapp/entity/post_entity.dart';
import 'package:myapp/entity/user_entity.dart';
import 'package:myapp/presentation/page/signin_page.dart';
import 'package:myapp/service/api_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ApiService service = ApiService();
  UserEntity? user;
  List<PostEntity>? post;

  Future<void> setUp() async {
    user = await service.getCurrentUser();
    post = await service.getCurrentUserPosts();
    log('ini init', name: 'profile');
    log(user?.username ?? 'kosong', name: 'profile');
    setState(() {});
  }
  

  @override
  initState() {
    setUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user?.username ?? 'Karina',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SigninPage(),
                  ),
                  (route) => true,
                );
              },
              icon: Icon(Icons.logout))
        ],
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
                    backgroundImage: NetworkImage(user?.profilePicture ??
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
                            user?.postsCount.toString()??'0',
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
                            user?.followersCount.toString()??'0',
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
                            user?.followingCount.toString()??'0',
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
            itemCount: post?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1),
            itemBuilder: (context, index) => SizedBox(
              child: Image.network(post?[index].image??
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
