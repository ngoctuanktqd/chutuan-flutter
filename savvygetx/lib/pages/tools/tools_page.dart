import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/tools_controller.dart';
import 'package:savvygetx/pages/tools/widgets/tools_body.dart';
import 'package:savvygetx/pages/tools/widgets/tools_header.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ToolsController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ToolsHeader(
                controller: controller,
              ),
              ToolsBody(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
