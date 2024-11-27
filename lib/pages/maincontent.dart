import 'package:flutter/material.dart';
import 'package:x/UI/organismos/twitercard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> tweetsData = [
    {
      "username": "Movie ",
      "userHandle": "movie",
      "userImage": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.klipartz.com%2Fes%2Fsticker-png-fjuhl&psig=AOvVaw0TJTqaoXluRwirLGhfq5qk&ust=1732808188388000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKjz1tXr_IkDFQAAAAAdAAAAABAR",
      "tweetText": "Ohhh, encantador puto",
      "timestamp": DateTime.now().subtract(const Duration(minutes: 5)),
      "hashtags": ["MovieNight", "CinemaAddict", "NoRegrets"],
      "retweets": 10,
      "likes": 25,
      "comments": 3,
    },
    {
      "username": "i love ice cream",
      "userHandle": "icecreamdreams",
      "userImage": "https://i.pinimg.com/236x/74/c0/b8/74c0b8e1e5b1ad34607cf7cbf97ad3bc.jpg",
      "tweetText": "Ohhhh, I love ice cream so much! 🍦",
      "timestamp": DateTime.now().subtract(const Duration(hours: 1)),
      "hashtags": ["IceCreamAddict", "SweetTooth", "DessertTime"],
      "retweets": 15,
      "likes": 42,
      "comments": 7,
      "mediaUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSckl7ltXaMqyN2oVF74NXUwsiLxRuzIHh4Hg&s",
    },
  ];

  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return NetworkImage(imagePath);
    } else {
      return AssetImage(imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcbbkAWH8ZnrfxzrRnUE7h1WHWmM6WHos3Ng&s',
          height: 30,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading app bar image: $error');
            return Icon(Icons.error, color: Colors.white);
          },
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgmT9NtY_TP8_IIAV_pr5-t367EDVgVq_IcQ&s'),
            onBackgroundImageError: (exception, stackTrace) {
              print('Error loading avatar image: $exception');
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabButton('Para ti', 0),
                _buildTabButton('Siguiendo', 1),
              ],
            ),
          ),
          const Divider(color: Colors.grey, height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: tweetsData.length,
              itemBuilder: (context, index) {
                final tweetData = tweetsData[index];
                return TwitterCard(
                  username: tweetData["username"],
                  userHandle: tweetData["userHandle"],
                  userImage: _getImageProvider(tweetData["userImage"]),
                  tweetText: tweetData["tweetText"],
                  timestamp: tweetData["timestamp"],
                  hashtags: tweetData["hashtags"] as List<String>,
                  retweets: tweetData["retweets"],
                  likes: tweetData["likes"],
                  comments: tweetData["comments"],
                  mediaUrl: tweetData["mediaUrl"],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          print('Compose new tweet');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.white : Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          if (_selectedIndex == index)
            Container(
              height: 4,
              width: 56,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }
}

