import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Notifications',
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Mentions'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationsList(),
          _buildMentionsList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildNotificationsList() {
    return ListView.builder(
      itemCount: 10, // Example count
      itemBuilder: (context, index) {
        return _buildNotificationItem(
          icon: Icons.person_add,
          text: 'In case you missed Saad Drusteers Tweet',
          subtext: '🔥 Are you using WordPress and migrating to the JAMstack? I wrote up a case study about how we moved @TakeShape moved to JAMstack and saw great performance improvements and better DevUX.',
          timestamp: DateTime.now().subtract(Duration(hours: index)),
        );
      },
    );
  }

  Widget _buildMentionsList() {
    return ListView.builder(
      itemCount: 5, 
      itemBuilder: (context, index) {
        return _buildNotificationItem(
          icon: Icons.alternate_email,
          text: '@YourHandle was mentioned in a Tweet',
          subtext: 'Check out this amazing new feature!',
          timestamp: DateTime.now().subtract(Duration(days: index)),
        );
      },
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String text,
    required String subtext,
    required DateTime timestamp,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtext,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeago.format(timestamp),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
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

