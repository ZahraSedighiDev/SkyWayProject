// // lib/screens/flights_page.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class FlightsPage extends StatelessWidget {
//   const FlightsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // برای اینکه در هر سایزی درست نمایش داده بشه
//     double screenWidth = MediaQuery.of(context).size.width;
//     int crossAxisCount = screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1);

//     return Scaffold(
//       appBar: AppBar(title: const Text("صفحه پروازها")), // یا کلا حذفش کن اگه نمی‌خوای
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             StaggeredGrid.count(
//               crossAxisCount: crossAxisCount,
//               mainAxisSpacing: 16,
//               crossAxisSpacing: 16,
//               children: [
//                 StaggeredGridTile.count(
//                   crossCellAxisCount: 2,
//                   mainCellAxisCount: 2,
//                   crossAxisCellCount: null,
//                   mainAxisCellCount: null,
//                   child: _buildFlightCard("مسقط", "https://picsum.photos/600/400"),
//                 ),
//                 _buildFlightCard("شنژن", "https://picsum.photos/300/200"),
//                 _buildFlightCard("پکن", "https://picsum.photos/300/200"),
//                 _buildFlightCard("آنکارا", "https://picsum.photos/300/200"),
//                 _buildFlightCard("بانکوک", "https://picsum.photos/300/200"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );

//   }
//   // این متد برای نمایش کارت است
//   Widget _buildFlightCard(String title, String imageUrl) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
//       ),
//       child: Column(
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
//               child: CachedNetworkImage( // حتما پکیج cached_network_image نصب باشه
//                 imageUrl: imageUrl,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 placeholder: (context, url) => Center(child: CircularProgressIndicator()),
//                 errorWidget: (, url, error) => Icon(Icons.error),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text("تهران - $title - تهران"),
//           ),
//         ],
//       ),
//     );
//   }

// }
