import 'package:five_ts/features/auth/login_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginResetPassword extends StatefulWidget {
  const LoginResetPassword({super.key});

  @override
  _LoginResetPasswordState createState() => _LoginResetPasswordState();
}

class _LoginResetPasswordState extends State<LoginResetPassword> {
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible1 = false;
    _passwordVisible2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginAuth()),
            );
          },
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff181824),
          size: 30,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 45.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                  "Parolni tiklash",
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
                  "Parolni o'rnating",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45),
                _buildPasswordField('Parol'),
                const SizedBox(height: 16),
                _buildPasswordField("Parolni tasdiqlash"),

                const SizedBox(height: 280),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextButton(
                    onPressed: () {
                      _showSuccessDialog(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffE5E7EB),
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
                      "Saqlash",
                      style: TextStyle(
                        color: Color(0xff979C9E),
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

  Widget _buildPasswordField(String label) {
    bool isPasswordVisible = label == "Parol" ? _passwordVisible1 : _passwordVisible2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff252525),
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            hintText: "Parolni kiriting",
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  if (label == "Parol") {
                    _passwordVisible1 = !_passwordVisible1;
                  } else {
                    _passwordVisible2 = !_passwordVisible2;
                  }
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(24),
          content: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 31.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff4AB4BF).withOpacity(0.3),
                            spreadRadius: 15,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 35,
                        backgroundColor: Color(0xff249599),
                        child: Icon(
                          Icons.check,
                          size: 42,
                          color: Color(0xffFDFDFD),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                    Flexible(
                      child: Text(
                        "Parolingiz muvaffaqiyatli\n"
                            " o'zgartirildi!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff090A0A),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 2,
                right: 2,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Color(0xff9CA3AF)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

