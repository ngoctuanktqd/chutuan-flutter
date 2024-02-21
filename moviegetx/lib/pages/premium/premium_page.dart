import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/premium_controller.dart';
import 'package:moviegetx/pages/premium/widgets/premium_plans.dart';

class PremiumPage extends GetView<PremiumController> {
  const PremiumPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Premium',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Subscribe to Premium',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: MovieColor.primary_500),
            ),
            getHeight(context, 0.02),
            Text(
              'Enjoy watching Full-HD movies, without restrictions and without ads',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            getHeight(context, 0.02),
            Obx(
              () {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PremiumPlans(
                      plans:
                          '/${controller.state.premiumPlansList[index].name}',
                      price:
                          '${controller.state.premiumPlansList[index].price}',
                      indexPlans: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return getHeight(context, 0.02);
                  },
                  itemCount: controller.state.premiumPlansList.length,
                );
              },
            ),
            getHeight(context, 0.02),
          ],
        ),
      ),
    );
  }
}
