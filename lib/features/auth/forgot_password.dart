import 'package:five_ts/features/auth/login_num.dart';
import 'package:five_ts/features/auth/recovery_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginNumber()),
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
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/welcome.svg',
                height: 64.0,
                width: 64.0,
              ),

              const SizedBox(height: 45),
              Text(
                "Parolni tiklash!",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Text(
                "Parolni tiklash uchun telefon raqamingizni\n"
                    "     yoki elektron pochtangizni kiriting",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              const SizedBox(height: 50),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 21),
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Telefon raqam",
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
                        decoration: InputDecoration(
                          hintText: "+998 (_ _) _ _ _  _ _  _ _",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff72777A),
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:const  BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const  BorderSide(
                              color:Color(0xff4AB4BF),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xffD1D5DB),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 5),
            const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Color(0xffF2F4F5),
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        "yoki",
                        style: TextStyle(
                            color: Color(0xff6D6F72),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xffF2F4F5),
                      ),
                    )
                  ],
                ),
              ),

             const  SizedBox(height: 5),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 21),
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
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
                        decoration: InputDecoration(
                          hintText: "Elektron pochtani kiriting",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff72777A),
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:const  BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const  BorderSide(
                              color:Color(0xff4AB4BF),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xffD1D5DB),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 190),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RecoveryPassword()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
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
                    "Tiklash",
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
    );
  }
}
