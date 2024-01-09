// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:demnguoc/pages/models/movie_model.dart';
import 'package:demnguoc/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int page = 1;
  late RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    print('refresh');
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // if(_refreshController.refreshFailed()) {} else {

    // }
    setState(() {
      page = 1;
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print('mounted $mounted');
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    // if failed,use loadFailed(),if no data return,usße LoadNodata()
    // items.add((items.length+1).toString());
    // if (mounted) {
    //   setState(() {
    //     page++;
    //   });
    // }
    // _refreshController.loadComplete();
    // _refreshController.loadFailed();
    _refreshController.loadNoData();
  }

  @override
  Widget build(BuildContext context) {
    (context).read<MovieProvider>().callApi(page);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: StreamBuilder(
              stream: (context).read<MovieProvider>().movieController,
              initialData: const [],
              builder: (context, snapshot) {
                if (snapshot.data!.isEmpty) {
                  return const CircularProgressIndicator();
                }
                List<MovieModel> listMovies =
                    (context).read<MovieProvider>().listMovies;
                return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: WaterDropHeader(),
                  footer: ClassicFooter(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: GridView.builder(
                    itemCount: listMovies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          const Text('20-10-2022'),
                        ],
                      );
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}
