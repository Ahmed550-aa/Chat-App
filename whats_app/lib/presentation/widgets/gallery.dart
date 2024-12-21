// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:photo_manager/photo_manager.dart';

// class GalleryPage extends StatefulWidget {
//   const GalleryPage({Key? key}) : super(key: key);

//   @override
//   _GalleryPageState createState() => _GalleryPageState();
// }

// class _GalleryPageState extends State<GalleryPage> {
//   List<AssetEntity> _mediaList = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadGalleryMedia();
//   }

//   Future<void> _loadGalleryMedia() async {
//     // طلب الإذن للوصول إلى الوسائط
//     final PermissionState result =
//         await PhotoManager.requestPermissionExtend();
//     if (result.isAuth) {
//       // إذا تم منح الإذن، قم بجلب الوسائط
//       final List<AssetPathEntity> albums =
//           await PhotoManager.getAssetPathList(type: RequestType.image);

//       // جلب الصور من الألبوم الأول
//       final List<AssetEntity> media =
//           await albums.first.getAssetListPaged(page: 0, size: 100);

//       setState(() {
//         _mediaList = media;
//         _isLoading = false;
//       });
//     } else {
//       // إذا تم رفض الإذن
//       PhotoManager.openSetting();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isLoading
//         ? const Center(child: CircularProgressIndicator())
//         : GridView.builder(
//             padding: const EdgeInsets.all(8.0),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//             ),
//             itemCount: _mediaList.length,
//             itemBuilder: (context, index) {
//               return FutureBuilder<File?>(
//                 future: _mediaList[index].file,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done &&
//                       snapshot.data != null) {
//                     return Image.file(
//                       snapshot.data!,
//                       fit: BoxFit.cover,
//                     );
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               );
//             },
//           );
//   }
// }
