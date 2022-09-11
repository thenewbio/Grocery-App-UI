import 'package:flutter/material.dart';
import 'package:grocery_app/screens/dashboards/dashboard_screen.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:grocery_app/utils/routes/navigation_service.dart';
import 'package:grocery_app/utils/routes/route_names.dart';

import '../../utils/locator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final NavigationService _service = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/login.png',
                height: MediaQuery.of(context).size.height * .4,
                width: double.maxFinite),
            SizedBox(),
            Text(
              'Get your groceries\n with nectar',
              style: TextStyle(
                  color: Color(0xff030303),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                decoration: InputDecoration(
                    prefix: Image.asset('assets/images/country.png'),
                    hintText: '+880',
                    hintStyle: const TextStyle(
                      color: Color(0xff030303),
                    )),
              ),
            ),
            Center(child: Text('Or connect with social media')),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _service.navigateTo(dashboardRoute);
                  },
                  child: SizedBox(
                    child: Image.asset('assets/images/google.png'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    // print('facebook');
                  },
                  child: SizedBox(
                    child: Image.asset('assets/images/facebook.png'),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
