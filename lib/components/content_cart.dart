import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.lightBlueAccent,
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 4),
                    child: Text(
                      'タイトルタイトルタイトルタイトルタイトル',
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
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 16, left: 4),
                    child: Text(
                        '関係者によりますと、東京都内で２７日、新たに３９人が新型コロナウイルスに感染していたことが分かりました。'),
                  ),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: const Color(0xFFE84855),
                size: 28,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
