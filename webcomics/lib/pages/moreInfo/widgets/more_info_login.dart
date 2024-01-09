import 'package:flutter/material.dart';

class MoreInfoLoginPage extends StatelessWidget {
  const MoreInfoLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.amber,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Text('LOGIN'),
                          Text('SIGN UP'),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: TabBarView(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              color: Colors.pink,
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              child: Image.asset(
                'assets/images/placeholder_avatar.gif',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.diamond_rounded,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '0',
                        style: TextStyle(fontSize: 22.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.arrow_right_rounded),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Top up',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
