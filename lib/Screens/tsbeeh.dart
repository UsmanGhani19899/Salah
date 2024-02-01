// import 'package:flutter/material.dart';

// class TasbeehConuter extends StatefulWidget {
//   const TasbeehConuter({super.key});

//   @override
//   State<TasbeehConuter> createState() => _TasbeehConuterState();
// }

// class _TasbeehConuterState extends State<TasbeehConuter> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.bottomCenter,
//         child: RotatedBox(
//           quarterTurns: 90,
//           child: Stack(
//             children: [
//               ClipPath(
//                 clipper: CurveClipper(),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey,
//                       border: Border(bottom: BorderSide(color: Colors.red))),
//                   height: 300.0,
//                 ),
//               ),
//               ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return CircleAvatar(
//                       radius: 30,
//                     );

//                   },
//                   itemExtentBuilder: (context,index){
// return CircleAvatar(
//                       radius: 30,
//                     );
//                   },
//                   ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     int curveHeight = 10;
//     Offset controlPoint = Offset(size.width / 5, size.height + curveHeight);
//     Offset endPoint = Offset(size.width, size.height - curveHeight);

//     Path path = Path()
//       ..lineTo(0, curveHeight - size.height)
//       ..quadraticBezierTo(
//           controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
//       ..lineTo(size.width, 0)
//       ..close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
