import 'package:demnguoc/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<Object>(
                stream: (context).read<HomeProvider>().StreamNumber,
                initialData: (context).read<HomeProvider>().number,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: const TextStyle(fontSize: 40),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      (context).read<HomeProvider>().play();
                    },
                    icon: const Icon(Icons.play_arrow_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      (context).read<HomeProvider>().pause();
                    },
                    icon: const Icon(Icons.pause),
                  ),
                  IconButton(
                    onPressed: () {
                      (context).read<HomeProvider>().reset();
                    },
                    icon: const Icon(Icons.restart_alt),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
