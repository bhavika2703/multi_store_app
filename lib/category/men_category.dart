import 'package:flutter/material.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/categ_widget.dart';

// List<String> imagetry = [
//   'images/try/image0.jpg',
//   'images/try/image1.jpg',
//   'images/try/image2.jpg',
//   'images/try/image3.jpg',
// ];

// List<String> labeltry= [
//  'shirts',
//  'jeans',
//   'shoes',
//   'jacket',
// ];

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.76,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategHeaderLabel(headerLabel: 'Men'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3,
                      children: List.generate(men.length, (index) {
                        return SubCategModel(
                            mainCategName:'men',
                            subCategName: men[index], 
                            assetName: 'images/men/men$index.jpg',
                            subcategLable: men[index]);
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: SliderBar(context: context, mainCategName: 'men'))
        ],
      ),
    );
  }
}
