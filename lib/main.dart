import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/models/user.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
        useInheritedMediaQuery: true, // Set to true
        locale: DevicePreview.locale(context), // Add the locale here
        home: const MyHomePage(title: 'TEST'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userInfo = {'first_name': null};
    final User user = User.fromJson(userInfo);
    print(user);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.firstName,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                const CustomTextField(
                  hintText: 'First Name',
                ),
                SizedBox(height: 16.h),
                const CustomTextField(
                  hintText: 'Email',
                ),
                SizedBox(height: 16.h),
                const CustomTextField(
                  obscureText: true,
                  hintText: 'Password',
                ),
                SizedBox(height: 16.h),
                const CustomTextField(
                  obscureText: true,
                  hintText: 'Confirm Password',
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(14.h)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 14.h, fontWeight: FontWeight.w700))),
                    child: const Text('Create Account'),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 16.w),
                  Text('or sign up with',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(width: 16.w),
                  Expanded(child: Divider()),
                ]),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.black12),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(EdgeInsets.all(14.h)),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 14.h, fontWeight: FontWeight.w700),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.g_mobiledata,
                          size: 24.sp,
                        ),
                        SizedBox(width: 10.w),
                        const Text('Google'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.obscureText = false,
    this.hintText = '',
  }) : super(key: key);

  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
    );
  }
}
