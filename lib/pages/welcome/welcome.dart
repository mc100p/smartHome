import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smarthome/pages/homepage/homepage.dart';
import 'package:smarthome/utils/magic_string.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(reverse: true);

  // late final Animation<Offset> _offsetAnimation = Tween<Offset>(
  //   begin: Offset.zero,
  //   end: const Offset(1.5, 0.0),
  // ).animate(
  //   CurvedAnimation(parent: _controller, curve: Interval(0, 1)),
  // );

  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _position = Tween<double>(begin: 20, end: 40)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0, 0.3))
          ..addListener(() {
            setState(() {});
          }));

    _opacity = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0, 0.3))
          ..addListener(() {
            setState(() {});
          }));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 225, 225),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              children: [
                Image.asset(
                  '${ImageNames.companyLogo}',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Luxury Places",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("to Stay",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40))
                  ],
                )
              ],
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image(
                    image: AssetImage(ImageNames.welcome_image1),
                    fit: BoxFit.fitHeight),
              ),
              GestureDetector(
                onVerticalDragUpdate: (drageUpdateDetails) {
                  // context.pushNamed(RouteNames.homepage);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                      (route) => false);

                  // await Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Homepage(),
                  //     ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: _position.value),
                        child: Opacity(
                          opacity: _opacity.value,
                          child: Icon(
                            Icons.swipe_up_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
