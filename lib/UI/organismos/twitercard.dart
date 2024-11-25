import 'package:flutter/material.dart';

class TwitterCard extends StatelessWidget {
  final String username;
  final String userImage;
  final String tweetText;
  final String timestamp;
  final List<String> hashtags;
  final int retweets;
  final int likes;

  const TwitterCard({
    super.key,
    required this.username,
    required this.userImage,
    required this.tweetText,
    required this.timestamp,
    required this.hashtags,
    required this.retweets,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '@$username',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      timestamp,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              tweetText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: hashtags
                  .map((hashtag) => Chip(
                        label: Text('#$hashtag', style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.blue[800],
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.repeat, color: Colors.white),
                    Text('$retweets', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.pink),
                    Text('$likes', style: TextStyle(color: Colors.white)),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.share, color: Colors.white),
                  onPressed: () {
               
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}