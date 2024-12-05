import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:myapp/data/model/post_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Socio-App',
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: dataDummy.length,
        itemBuilder: (context, index) {
          return FeedTile(
            feed: dataDummy[index],
          );
        },
      ),
    );
  }
}

class FeedTile extends StatefulWidget {
  const FeedTile({
    super.key,
    required this.feed,
  });
  final PostModel feed;

  @override
  State<FeedTile> createState() => _FeedTileState();
}

class _FeedTileState extends State<FeedTile> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          child: Image.network(widget.feed.imageUrl),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    IconlyBold.heart,
                    color: Colors.pink,
                  ),
                  SizedBox(width: 8),
                  Text(widget.feed.likes.toString()),
                  Expanded(child: Container()),
                  Icon(
                    IconlyBold.chat,
                    color: Colors.pink,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    widget.feed.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Text(widget.feed.content),
                ],
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      isShow = !isShow;
                      print(isShow);
                      setState(() {});
                    },
                    child: Text(
                      isShow ? 'Hide Comments' : 'View all 100 comments',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  if (isShow)
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Row(
                        children: [
                          Text(
                            widget.feed.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Text(widget.feed.content),
                        ],
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
