import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class TwitterCard extends StatelessWidget {
  final String username;
  final String userHandle;
  final ImageProvider userImage;
  final String tweetText;
  final DateTime timestamp;
  final List<String> hashtags;
  final int retweets;
  final int likes;
  final int comments;
  final String? mediaUrl;

  const TwitterCard({
    Key? key,
    required this.username,
    required this.userHandle,
    required this.userImage,
    required this.tweetText,
    required this.timestamp,
    required this.hashtags,
    required this.retweets,
    required this.likes,
    required this.comments,
    this.mediaUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: userImage,
                  onBackgroundImageError: (exception, stackTrace) {
                    print('Error loading avatar image: $exception');
                  },
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
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
                                  '@$userHandle',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            timeago.format(timestamp),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_horiz, color: Colors.grey),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tweetText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      if (mediaUrl != null) ...[
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            mediaUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 200,
                                color: Colors.grey[800],
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading media image: $error');
                              return Container(
                                height: 200,
                                color: Colors.grey[800],
                                child: const Center(
                                  child: Icon(Icons.error, color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      if (hashtags.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 4,
                          children: hashtags
                              .map((hashtag) => Text(
                                    '#$hashtag',
                                    style: const TextStyle(color: Colors.blue),
                                  ))
                              .toList(),
                        ),
                      ],
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildIconButton(Icons.chat_bubble_outline, comments.toString()),
                          _buildIconButton(Icons.repeat, retweets.toString()),
                          _buildIconButton(Icons.favorite_border, likes.toString()),
                          _buildIconButton(Icons.share, ''),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey, height: 1),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 18),
        const SizedBox(width: 4),
        Text(count, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}

