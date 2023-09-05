import 'package:flutter/material.dart';
import 'package:multi_store_app/minor_screen/search.dart';

class FakeSearch extends StatefulWidget {
  const FakeSearch({Key? key}) : super(key: key);

  @override
  State<FakeSearch> createState() => _FakeSearchState();
}

class _FakeSearchState extends State<FakeSearch> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) {
            return const SearchScreen();
          },));
        },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 1.4),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'What are you looking for?',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    height: 32,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Search',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  )
                ]),
          ),
        );
  }
}