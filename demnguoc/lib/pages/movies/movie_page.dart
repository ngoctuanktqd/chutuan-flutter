import 'package:demnguoc/pages/models/movie_model.dart';
import 'package:demnguoc/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});
  @override
  Widget build(BuildContext context) {
    (context).read<MovieProvider>().callApi();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: StreamBuilder(
              stream: (context).read<MovieProvider>().movieController,
              initialData: const [],
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.data!.isEmpty) {
                  return const CircularProgressIndicator();
                }
                List<MovieModel> listMovies = snapshot.data as List<MovieModel>;
                return GridView.builder(
                  itemCount: listMovies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image:
                                  'https://image.tmdb.org/t/p/w500${listMovies[index].poster_path}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(listMovies[index].title),
                        const Text('20-10-2023'),
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
