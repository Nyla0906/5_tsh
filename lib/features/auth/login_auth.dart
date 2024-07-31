import 'dart:async';

import 'package:five_ts/features/auth/loginreset_password.dart';
import 'package:five_ts/features/auth/recovery_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({super.key});

  @override
  _LoginAuthState createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  late Timer _timer;
  int _start = 12;
  bool _isTimeUp = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isTimeUp = true;
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RecoveryPassword()),
            );
          },
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff181824),
          size: 30,
        ),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 45.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/otp_icon.svg',
                  height: 64.0,
                  width: 64.0,
                ),
                const SizedBox(height: 45),
                Text(
                  "Autentifikatsiya",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff252525),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Telefon raqamingizga yuborilgan\n"
                      "       tasdiqlash kodini kiriting",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.none,
                      pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 42,
                      fieldWidth: 42,
                      activeColor: _isTimeUp ? Colors.red : Colors.black,
                      selectedColor: _isTimeUp ? Colors.red : Color(0xff4AB4BF),
                      inactiveColor: _isTimeUp ? Colors.red : Color(0xffE4E7EC),
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _isTimeUp ? "Kodni qayta yuborish" : '00 : $_start',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4AB4BF),
                    ),
                  ),
                ),

                const SizedBox(height: 330),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => const LoginResetPassword()
                      ),);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff4AB4BF),
                      minimumSize: const Size(double.maxFinite, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: Color(0xffE5E7EB),
                          width: 1,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Tasqidlash",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
