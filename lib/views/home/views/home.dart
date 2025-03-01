import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:krishak/consts/images.dart';
import 'package:krishak/utils/common_image.dart';
import 'package:krishak/views/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        if (!kDebugMode) controller.googleSignIn();
      },
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text("Krishak", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Gap(20),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 400),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            // prefixIcon: Icon(Icons.search),
                            isDense: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.blueGrey.shade50, width: .5),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text("Home", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
                      Gap(20),
                      InkWell(
                        onTap: () {
                          // context.go('/create');
                        },
                        child: Text("Categories", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
                      ),
                      Gap(20),
                      InkWell(
                        onTap: () {
                          context.go('/create');
                        },
                        child: Text("Contribute", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
                      ),
                      Gap(20),
                      Text("Any Questions", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
                      Gap(20),
                      Obx(() {
                        return !controller.isLogin.value
                            ? InkWell(
                              onTap: () {
                                controller.googleSignIn();
                              },
                              child: Text("Sign In", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
                            )
                            : SizedBox(height: 40, width: 40, child: CommonImageWidget(image: controller.userImage, borderRadius: 500));
                      }),
                      Gap(40),
                    ],
                  ),
                ),
                Gap(10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(10, (index) {
                        return Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 800),
                            child: InkWell(
                              onTap: () {},
                              mouseCursor: MouseCursor.defer,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(image: NetworkImage("https://picsum.photos/200"), fit: BoxFit.cover),
                                                ),
                                              ),
                                              Gap(10),
                                              Text("Siva"),
                                            ],
                                          ),
                                          Text(
                                            "Farmers: The Unsung Heroes of Our Society",
                                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                          ),
                                          Gap(5),
                                          Text(
                                            "Farmers are the backbone of food production, ensuring that billions of people have access to nutritious meals every day. Their work directly impacts the stability and well-being of nations",
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueGrey),
                                          ),

                                          Gap(15),
                                          Row(
                                            spacing: 32,
                                            children: [
                                              Text(
                                                "Sep 20, 2025",
                                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueGrey),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [CommonImageWidget(image: AppImages.bookmarkIna), Gap(5), Text("Save")],
                                              ),
                                            ],
                                          ),
                                          Gap(10),
                                          Divider(color: Colors.blueGrey.shade50),
                                        ],
                                      ),
                                    ),
                                    Gap(15),
                                    Container(
                                      width: 150,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(image: NetworkImage("https://picsum.photos/200"), fit: BoxFit.cover),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        );
      },
    );
  }
}
