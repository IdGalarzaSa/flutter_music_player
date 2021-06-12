import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(
              height: size.height * 0.05,
            ),
            DiscImageAndPlayer()
          ],
        ),
      ),
    );
  }
}

class DiscImageAndPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      // height: size.height * 0.45,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          _DiscImage(),
          Spacer(),
          _Player(),
        ],
      ),
    );
  }
}

class _DiscImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(20),
      height: size.height * 0.25,
      width: size.height * 0.25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(image: AssetImage('assets/aurora.jpg')),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black38,
              ),
            ),
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xff1C1C25),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ],
        ),
      ),
    );
  }
}

class _Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final myTextStyle = TextStyle(color: Colors.white.withOpacity(0.3));
    return Container(
      child: Column(
        children: [
          Text("00:00", style: myTextStyle),
          SizedBox(height: size.height * 0.03),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  height: size.height * 0.25, width: 3, color: Colors.blueGrey),
              Container(
                  height: size.height * 0.10, width: 3, color: Colors.white),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          Text("10:00", style: myTextStyle),
        ],
      ),
    );
  }
}
