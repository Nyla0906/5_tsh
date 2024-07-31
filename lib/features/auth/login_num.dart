import 'package:five_ts/features/auth/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginNumber extends StatefulWidget {
  const LoginNumber({super.key});

  @override
  _LoginNumberState createState() => _LoginNumberState();
}

class _LoginNumberState extends State<LoginNumber> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/welcome.svg',
                  height: 64.0,
                  width: 64.0,
                ),
                const SizedBox(height: 35),
                Text(
                  'Xush kelibsiz!',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Akkauntga kirish uchun ma’lumotingizni kirting',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                const SizedBox(height: 35),
                Container(
                  width: double.maxFinite,
                  height: 36,
                  margin: const EdgeInsets.symmetric(horizontal: 21.0),
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffF2F4F5),
                      width: 0.1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffF8F8F8),
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,

                    tabs: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text('Telefon raqam'),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text('Email'),
                      ),
                    ],
                    labelColor: const Color(0xffFFFFFF),
                    unselectedLabelColor: const Color(0xff6C7072),
                    indicator: BoxDecoration(
                      color: const Color(0xff4AB4BF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    indicatorPadding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: TabBarView(
                    children: [
                      buildPhoneLogin(),
                      buildEmailLogin(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPhoneLogin() {
    return Column(
      children: [
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 32),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),

        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(horizontal: 21),
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Telefon raqam',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: '+998 (_ _) _ _ _  _ _  _ _',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff72777A),
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        buildPasswordInput(),
        buildForgotPasswordButton(),
        const SizedBox(height: 40),
        buildLoginButtons(),
      ],
    );
  }

  Widget buildEmailLogin() {
    return Column(
      children: [
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 32),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),

        Container(
          width: 390,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Elektron pochtani kiriting',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff72777A),
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        buildPasswordInput(),
        buildForgotPasswordButton(),
        const SizedBox(height: 40),
        buildLoginButtons(),
      ],
    );
  }

  Widget buildPasswordInput() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 21),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Parol',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 2),
          Expanded(
            child: TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: 'Parolni kiriting',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff72777A),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 246),
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
        },
        child: const Text(
          'Parolni unutdingizmi?',
          style: TextStyle(
            color: Color(0xff4AB4BF),
            fontWeight: FontWeight.w400,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: Color(0xff4AB4BF),
            decorationThickness: 2,
          ),
        ),
      ),
    );
  }


  Widget buildLoginButtons(){
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                if (_phoneController.text.isEmpty || _passwordController.text.isEmpty) {
                  _errorMessage = "Noto'g'ri telefon raqam yoki parol";
                } else {
                  _errorMessage = null;
                }
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff4AB4BF),
              minimumSize: const Size(double.maxFinite, 42),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(double.maxFinite, 42),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color(0xff249599),
                  width: 1,
                ),
              ),
            ),
            child: const Text(
              'Akkount yaratish',
              style: TextStyle(
                color: Color(0xff249599),
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 5),

          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xffF3F4F6),
              minimumSize: const Size(double.maxFinite, 42),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Mehmon sifatida kirish',
              style: TextStyle(
                color: Color(0xff249599),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


