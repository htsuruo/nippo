import 'package:flutter/material.dart';
import 'package:nippo/models/post.dart';
import 'package:nippo/theme.dart';

class ContentCard extends StatelessWidget {
  ContentCard({this.post});
  Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                )),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 4),
                    child: Text(
                      post.title,
                      softWrap: true,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16, left: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(post.description),
                        const SizedBox(height: 5),
                        Text(
                          post.date,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: VIC.red,
                  size: 26,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
