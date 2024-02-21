import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/movie_item.dart';
import 'package:moviegetx/apps/widgets/text_field_form_custom.dart';
import 'package:moviegetx/managers/controllers/explore_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextFormFieldCustom(
                controller: controller.state.searchController,
                hinText: 'Search',
                inputType: InputType.name,
                prefixIcon: Icons.search_outlined,
              ),
            ),
            getWidth(context, 0.04),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: MovieColor.primary_500.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Image.asset('assets/images/icon_filter.png'),
            ),
          ],
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        enablePullUp: true,
        onLoading: controller.onLoading,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Obx(
              () {
                List listMovieExplore = controller.state.listMovieExplore;
                if (listMovieExplore.isEmpty) {
                  if (controller.state.searchController.text != '') {
                    return show404(context);
                  }
                  return showLoadingData(context);
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listMovieExplore.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 186 / 248,
                  ),
                  itemBuilder: (context, index) {
                    final item = listMovieExplore[index];
                    return MovieItem(item: item);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
