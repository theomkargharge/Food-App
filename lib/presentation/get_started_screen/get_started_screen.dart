import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/data/utils.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/donut.png',
              width: 200,
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Hero(
              tag: 'Feastify',
              child: Text(
                'Welcome to \nFeastify',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 5,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Get.offAllNamed('/homeScreen');
                        showSuccessFlutterToast(
                            msg:
                                'Welcome to Feastify');
                      },
                      child: ListTile(
                        title: const Text(
                          "Let's Start",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                          textAlign: TextAlign.center,
                        ),
                        trailing: Image.asset(
                          'assets/arrow.png',
                          width: 25,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
