import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridSkeleton extends StatelessWidget {
  GridSkeleton({super.key, this.length = 4});
  int length;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        itemCount: length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 1,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/placeholder/placeholder.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Itaque ex repellat dignissimos voluptates.',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Text(
                        'Veritatis et id culpa. Recusandae tenetur sint rem deleniti non rerum. Placeat rerum iure ea voluptatem et suscipit neque quasi incidunt. Reiciendis asperiores consectetur sed necessitatibus. Placeat inventore voluptatum accusamus distinctio reprehenderit necessitatibus voluptas laboriosam. Eos cupiditate ad sint officiis.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Mar 5 2023',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
