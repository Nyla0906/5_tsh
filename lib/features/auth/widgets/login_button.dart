// import 'package:flutter/material.dart';
//
// class LoginButton extends StatefulWidget {
//   const LoginButton({super.key});
//
//   @override
//   State<LoginButton> createState() => _LoginButtonState();
// }
//
// class _LoginButtonState extends State<LoginButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextButton(
//           onPressed: () {
//             setState(() {
//               if (_phoneController.text.isEmpty || _passwordController.text.isEmpty) {
//                 _errorMessage = "Noto'g'ri telefon raqam yoki parol";
//               } else {
//                 _errorMessage = null;
//               }
//             });
//           },
//
//
//           style: TextButton.styleFrom(
//             backgroundColor: const Color(0xff4AB4BF),
//             minimumSize: const Size(327, 42),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           child: const Text(
//             'Login',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//         ),
//         const SizedBox(height: 5),
//         TextButton(
//           onPressed: () {},
//           style: TextButton.styleFrom(
//             backgroundColor: Colors.white,
//             minimumSize: const Size(327, 42),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//               side: const BorderSide(
//                 color: Color(0xff249599),
//                 width: 1,
//               ),
//             ),
//           ),
//           child: const Text(
//             'Akkount yaratish',
//             style: TextStyle(
//               color: Color(0xff249599),
//               fontSize: 16,
//             ),
//           ),
//         ),
//         const SizedBox(height: 5),
//         TextButton(
//           onPressed: () {},
//           style: TextButton.styleFrom(
//             backgroundColor: const Color(0xffF3F4F6),
//             minimumSize: const Size(327, 42),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           child: const Text(
//             'Mehmon sifatida kirish',
//             style: TextStyle(
//               color: Color(0xff249599),
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
