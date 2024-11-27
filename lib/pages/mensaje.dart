import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
     
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search for people and groups',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
      
          Expanded(
            child: ListView(
              children: [
                _buildMessageItem(
                  'movie',
                  '@movie',
                  'Hey! You\'re new around here!',
                  DateTime.now().subtract(const Duration(days: 1)),
                  'https://tr.rbxcdn.com/30DAY-Avatar-6FCB2D44D98898DB5F2174FDE1D84B34-Png/420/420/Avatar/Png/noFilter',
                ),
                _buildMessageItem(
                  'Andrew Parker',
                  '@andrewww',
                  'You accepted the request',
                  DateTime.now().subtract(const Duration(days: 2)),
                  'https://prod.docsiteassets.roblox.com/assets/resources/npc-kit/Endorsed-NPC-Zombie.jpeg',
                ),
                _buildMessageItem(
                  'Komal Kucharov',
                  '@kuchkarov',
                  'You accepted the request',
                  DateTime.now().subtract(const Duration(days: 2)),
                  'https://prod.docsiteassets.roblox.com/assets/resources/npc-kit/Endorsed-NPC-Zombie.jpeg',
                ),
                _buildMessageItem(
                  'karennnne',
                  '@karennnne',
                  'You should definitely appreciate if you could retweet this if you think its worthy :)',
                  DateTime.now().subtract(const Duration(days: 5)),
                  'https://prod.docsiteassets.roblox.com/assets/resources/npc-kit/Endorsed-NPC-Zombie.jpeg',
                ),
                _buildMessageItem(
                  'Maximilian',
                  '@maximiliannn',
                  'Hey! Thanks for the follow!',
                  DateTime.now().subtract(const Duration(days: 7)),
                  'https://prod.docsiteassets.roblox.com/assets/resources/npc-kit/Endorsed-NPC-Zombie.jpeg',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.mail_outline,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMessageItem(
    String name,
    String handle,
    String message,
    DateTime timestamp,
    String avatarUrl,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(avatarUrl),
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
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        handle,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        timeago.format(timestamp),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

