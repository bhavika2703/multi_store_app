import 'package:flutter/material.dart';

class SubCategProducts extends StatefulWidget {
  final String subCategName;
  final String mainCategName;
  const SubCategProducts(
      {Key? key, required this.subCategName, required this.mainCategName})
      : super(key: key);

  @override
  State<SubCategProducts> createState() => _SubCategProductsState();
}

class _SubCategProductsState extends State<SubCategProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.subCategName,style: TextStyle(color: Colors.black)),
      ),
      body: Center(child: Text(widget.mainCategName)),
    );
  }
}
