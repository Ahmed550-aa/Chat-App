import 'package:flutter/material.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/core/constants/text_style.dart';
import 'package:whats_app/presentation/pages/call.dart';
import 'package:whats_app/presentation/widgets/recent_call_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: CallPage(),
  ));
}

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Call()));
        },
        backgroundColor: AppColors.logo,
        child: const Icon(Icons.add_call, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Calls", style: CustomTextStyles.h1),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined, color: Colors.black))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Favorites", style: CustomTextStyles.h3),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.logo),
                  child:
                      const Icon(Icons.favorite, color: Colors.white, size: 24),
                ),
                title: const Text("Add favorite", style: CustomTextStyles.h3),
              ),
            ),
            const Text("Recent", style: CustomTextStyles.h3),
            const RecentCallList()
          ],
        ),
      ),
    );
  }
}
