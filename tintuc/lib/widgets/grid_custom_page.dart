import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tintuc/apps/router/router_name.dart';
import 'package:tintuc/models/new_model.dart';

class GridCustomPost extends StatefulWidget {
  GridCustomPost({
    super.key,
    required this.listData,
    this.skeletonizer = true,
  });
  bool skeletonizer;

  final List<NewModel> listData;

  @override
  State<GridCustomPost> createState() => _GridCustomPostState();
}

class _GridCustomPostState extends State<GridCustomPost> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.listData.length,
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.listData[index].thumb,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      print(widget.listData[index].id);
                      Navigator.pushNamed(
                        context,
                        RouterName.newPage,
                        arguments: {
                          'id': widget.listData[index].id,
                          'title': widget.listData[index].title,
                        },
                      );
                    },
                    child: Text(
                      widget.listData[index].title,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.listData[index].description,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text(
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
    );
  }
}
