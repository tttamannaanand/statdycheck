// import 'package:flutter/material.dart';
// import 'package:stardy_app/Views/screens/Video_Larning_Page.dart';
// import '../../widgets/color_codes.dart';
// import '../../Pages/Learn_page.dart';

// class RoadmapPage extends StatelessWidget {
//   final String career;
//   const RoadmapPage({super.key, required this.career});

//   @override
//   Widget build(BuildContext context) {
//     final topics = ["HTML", "CSS", "JavaScript", "React", "Node.js"];

//     return Scaffold(
//       backgroundColor: AppColors.black,
//       appBar: AppBar(
//         backgroundColor: AppColors.black,
//         title: Text("$career Roadmap"),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: topics.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: const Icon(
//               Icons.radio_button_checked,
//               color: AppColors.darkRed,
//             ),
//             title: Text(
//               topics[index],
//               style: const TextStyle(color: Colors.white),
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => VideoLearningPage(topic: topics[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
