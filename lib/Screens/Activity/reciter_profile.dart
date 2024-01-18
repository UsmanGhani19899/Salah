import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Models/surah_model.dart';

class ReciterProfile extends StatefulWidget {
  final String reciterName;
  final int surahsLength;
  final int totalSurah;
  const ReciterProfile(
      {super.key,
      required this.surahsLength,
      required this.reciterName,
      required this.totalSurah});

  @override
  State<ReciterProfile> createState() => _ReciterProfileState();
}

final _getApi = GetApi(dio);
SurahModel? surahModel;

class _ReciterProfileState extends State<ReciterProfile> {
  Future<void> getSurah() async {
    surahModel = await _getApi.getSurah();
    setState(() {});
  }

  Future<void> apis() async {
    await getSurah();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            collapsedHeight: 80,
            toolbarHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${widget.reciterName}',
                    style: GoogleFonts.roboto(color: Colors.black),
                  ),
                  Text('${widget.totalSurah}', textScaleFactor: 1),
                ],
              ),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      child: Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: widget.surahsLength,
            ),
          ),
        ],
      ),
    );
  }
}
