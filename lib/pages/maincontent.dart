import 'package:flutter/material.dart';
import 'package:x/UI/organismos/twitercard.dart';

void main() => runApp(const PaginaHome());

class PaginaHome extends StatelessWidget {
  const PaginaHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tweetsData = [
      {
        "username": "movie",
        "userImage": "https://store.playstation.com/store/api/chihiro/00_09_000/container/AR/es/99/UP1477-CUSA07022_00-AV00000000000010/0/image?_version=00_09_000&platform=chihiro&bg_color=000000&opacity=100&w=720&h=720",
        "tweetText": "ohhh me gaste los pasajesss.",
        "timestamp": "5 minutes ago",
        "hashtags": ["pez", "dart", "fortnite"],
        "retweets": 10,
        "likes": 5,
      },
     
      {
        "username": "encantador",
        "userImage": "https://i.pinimg.com/236x/74/c0/b8/74c0b8e1e5b1ad34607cf7cbf97ad3bc.jpg", 
        "tweetText": "ohhhh  me gustan los helados.", 
      "timestamp": "5 minutes ago",
        "hashtags": ["shrek", "dart", "helado"],
        "retweets": 10,
        "likes": 5,
      },
      
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Para Ti',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Siguiendo',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tweetsData.length,
              itemBuilder: (context, index) {
                final tweetData = tweetsData[index];
                return TwitterCard(
                  username: tweetData["username"],
                  userImage: tweetData["userImage"],
                  tweetText: tweetData["tweetText"],
                  timestamp: tweetData["timestamp"],
                  hashtags: tweetData["hashtags"] as List<String>,
                  retweets: tweetData["retweets"],
                  likes: tweetData["likes"],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          print('FloatingActionButton pressed!');
        },
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}