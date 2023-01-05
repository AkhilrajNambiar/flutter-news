import 'package:flutter/material.dart';

class SavedNews extends StatefulWidget {
  const SavedNews({Key? key}) : super(key: key);

  @override
  State<SavedNews> createState() => _SavedNewsState();
}

class _SavedNewsState extends State<SavedNews> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Saved news"),
    );
  }
}
