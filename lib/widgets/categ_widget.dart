import 'package:flutter/material.dart';
import 'package:multi_store_app/minor_screen/subCateg_product.dart';

class CategHeaderLabel extends StatelessWidget {
  const CategHeaderLabel({
    Key? key,
    required this.headerLabel,
  }) : super(key: key);

  final String headerLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        headerLabel,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }
}

class SubCategModel extends StatelessWidget {
  const SubCategModel({
    Key? key,
    required this.mainCategName,
    required this.subCategName,
    required this.assetName,
    required this.subcategLable,
  }) : super(key: key);

  final String mainCategName;
  final String subCategName;
  final String assetName;
  final String subcategLable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return SubCategProducts(
              subcategName: subCategName,
              maincategName: mainCategName,
            );
          },
        ));
      },
      child: Column(
        children: [
          SizedBox(
              height: 70,
              width: 70,
              child: Image(
                image: AssetImage(assetName),
              )),
          Text(subcategLable,style:const TextStyle(fontSize: 11), ),
        ],
      ),
    );
  }
}

class SliderBar extends StatelessWidget {
  const SliderBar({
    Key? key,
    required this.context,
    required this.mainCategName,
  }) : super(key: key);

  final BuildContext context;
  final String mainCategName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.05,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mainCategName == 'beauty'
                    ? const Text('')
                    : Text(
                        ' << ',
                        style: textStyle(),
                      ),
                Text(
                  mainCategName,
                  style: textStyle(),
                ),
                mainCategName == 'men'
                    ? const Text('')
                    :  Text(
                        ' >> ',
                        style: textStyle(),
                      ),
              ],
            )),
      ),
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
        color: Colors.brown,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 10);
  }
}
