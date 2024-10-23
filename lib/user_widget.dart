// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:panel_kit/controller.dart';
// import 'package:provider/provider.dart';

// class PanelKitUserWidget extends StatelessWidget {
//   final String name;
//   final String description;
//   final NetworkImage? image;
//   final VoidCallback onLogout;
//   const PanelKitUserWidget({super.key, required this.name, required this.description, this.image, required this.onLogout});

//   @override
//   Widget build(BuildContext context) {
//     final controller = context.read<PanelKitController>();

//     Widget logoutButton = IconButton(
//       onPressed: onLogout,
//       icon: HugeIcon(
//         icon: HugeIcons.strokeRoundedLogout02,
//         color: controller.theme.menuItemColor,
//         size: 24.0,
//       ),
//     );

//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Column(
//         children: [
//           controller.theme.divider,
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               image != null
//                   ? CircleAvatar(
//                       radius: 20,
//                       // backgroundColor: Colors.red,
//                       backgroundImage: image)
//                   : HugeIcon(
//                       icon: HugeIcons.strokeRoundedUserCircle,
//                       color: controller.theme.menuItemColor,
//                       size: 30.0,
//                     ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                   Text(
//                     description,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(fontSize: 10, color: Colors.white),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               logoutButton,
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
