import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/utils/extensions.dart';

class HomePageScreen extends StatefulWidget {
  String text;
  HomePageScreen({Key? key, required this.text}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.only(left: 20, top: context.paddingTop),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            child: Text("${widget.text}", style: TextStyle(fontSize: 16),),
          ),
        ),
      ],
    );
  }
}