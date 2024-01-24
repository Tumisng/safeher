import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Order #12345 confirmed!',
      'body': 'Your order has been shipped and will arrive soon. Track it here:',
      'icon': Icons.shopping_cart,
      'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
      'isRead': false,
    },
    {
      'title': 'New follower on Instagram',
      'body': '@[username] started following you. Check out their profile!',
      'icon': Icons.person,
      'timestamp': DateTime.now().subtract(const Duration(days: 1)),
      'isRead': true,
    },

  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        ),
        body: ListView.builder(
          itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationListTile(
            title: notification['title'],
            body: notification['body'],
            icon: notification['icon'],
            timestamp: notification['timestamp'],
            isRead: notification['isRead'],
            onTap: () {
              // Handle notification tap (e.g., navigate to a specific screen)
              Navigator.of(context).pushNamed('/notificationDetails', arguments: notification);
            },
          );
        },
        )
        
    );
  }
}

class NotificationListTile extends StatelessWidget {
  final String title;
  final String body;
  final IconData icon;
  final DateTime timestamp;
  final bool isRead;
  final VoidCallback onTap;

  const NotificationListTile({
    Key? key,
    required this.title,
    required this.body,
    required this.icon,
    required this.timestamp,
    required this.isRead,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title, style: TextStyle(fontWeight: isRead ? FontWeight.normal : FontWeight.bold)),
      subtitle: Text(
        body,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        formatTimestamp(timestamp),
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
      onTap: onTap,
    );
  }

  String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return
 
'Just now';
    } else
 
if (difference.inMinutes < 60) {
      return
 
'${difference.inMinutes}m ago';
    } else
 
if (difference.inHours < 24) {
      return
 
'${difference.inHours}h ago';
    } else
 
if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${difference.inDays ~/ 7}w ago';
    }
  }
}