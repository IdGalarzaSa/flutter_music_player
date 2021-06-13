import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/player_model.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _SongInformation(),
            Expanded(child: _Lyrics()),
          ],
        ),
      ),
    );
  }
}

class _SongInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
          ),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.center,
            colors: [
              Color(0xff33333E),
              Color(0xff201E28),
            ],
          )),
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(height: size.height * 0.05),
          _DiscImageAndPlayer(),
          SizedBox(height: size.height * 0.03),
          _InformationSongAndPlayButton(),
          SizedBox(height: size.height * 0.08),
        ],
      ),
    );
  }
}

class _Lyrics extends StatelessWidget {
  final lyrics = getLyrics();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 1.5,
        children: lyrics
            .map(
              (newLine) => Text(
                newLine,
                style: TextStyle(
                    fontSize: 20, color: Colors.white.withOpacity(0.8)),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _DiscImageAndPlayer extends StatelessWidget {
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

    final animationController = Provider.of<PlayerModel>(context);

    return Container(
      padding: EdgeInsets.all(20),
      height: size.height * 0.25,
      width: size.height * 0.25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              controller: (currentController) =>
                  animationController.controller = currentController,
              child: Image(image: AssetImage('assets/aurora.jpg')),
            ),
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

class _InformationSongAndPlayButton extends StatefulWidget {
  @override
  __InformationSongAndPlayButtonState createState() =>
      __InformationSongAndPlayButtonState();
}

class __InformationSongAndPlayButtonState
    extends State<_InformationSongAndPlayButton>
    with SingleTickerProviderStateMixin {
  bool isPlaying = true;

  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          _InformationSong(
            titleSong: 'Far Away',
            autor: 'Breaking Benjamin',
          ),
          Spacer(),
          FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                final discController =
                    Provider.of<PlayerModel>(context, listen: false).controller;

                if (isPlaying) {
                  isPlaying = false;
                  animationController.forward();
                  discController?.stop();
                } else {
                  isPlaying = true;
                  animationController.reverse();
                  discController?.repeat();
                }
              },
              child: AnimatedIcon(
                  icon: AnimatedIcons.pause_play,
                  progress: animationController))
        ],
      ),
    );
  }
}

class _InformationSong extends StatelessWidget {
  final String titleSong;
  final String autor;

  const _InformationSong({required this.titleSong, required this.autor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleSong,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "-${this.autor}-",
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
