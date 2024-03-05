import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String pageName;
final action; 
  const AppBarWidget({super.key, required this.pageName, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 80,
        // centerTitle: true,
        elevation: 0,
        actions: action,
        title: Text(
          "$pageName",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 25,),
        ));
  }
    @override
  Size get preferredSize => Size.fromHeight(80);
}