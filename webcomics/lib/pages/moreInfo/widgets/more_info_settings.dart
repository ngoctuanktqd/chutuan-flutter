import 'package:flutter/material.dart';
import 'package:webcomics/apps/untils/const.dart';

class MoreInfoSettingPage extends StatelessWidget {
  const MoreInfoSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: const Row(
              children: [
                Icon(Icons.auto_stories_rounded),
                SizedBox(width: 10),
                Expanded(child: Text('Your preference')),
                Text(
                  'All',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 10),
                arrowMoreInfoPage,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: const Row(
              children: [
                Icon(Icons.email_rounded),
                SizedBox(width: 10),
                Expanded(child: Text('Messages')),
                SizedBox(width: 10),
                arrowMoreInfoPage,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.move_to_inbox_rounded),
                SizedBox(width: 10),
                Expanded(child: Text('Inbox')),
                SizedBox(width: 10),
                arrowMoreInfoPage,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: const Row(
              children: [
                Icon(Icons.ios_share_rounded),
                SizedBox(width: 10),
                Expanded(child: Text('Share with friends')),
                SizedBox(width: 10),
                arrowMoreInfoPage,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: const Row(
              children: [
                Icon(Icons.person_add_rounded),
                SizedBox(width: 10),
                Expanded(child: Text('Enter invite code')),
                SizedBox(width: 10),
                arrowMoreInfoPage,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: const Row(
              children: [
                Icon(Icons.contact_support_rounded),
                SizedBox(width: 10),
                Expanded(child: Text('Help Center')),
                SizedBox(width: 10),
                arrowMoreInfoPage,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: const Row(
              children: [
                Icon(Icons.create_rounded),
                SizedBox(width: 10),
                Expanded(child: Text('Creator Awards')),
                SizedBox(width: 10),
                arrowMoreInfoPage,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: const Row(
              children: [
                Icon(Icons.settings_rounded),
                SizedBox(width: 10),
                Expanded(child: Text('Settings')),
                SizedBox(width: 10),
                arrowMoreInfoPage,
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
