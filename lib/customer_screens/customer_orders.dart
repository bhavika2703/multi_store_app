import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/appbar_widget.dart';

class CustomerOrders extends StatelessWidget {
  const CustomerOrders({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'EditBusiness'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}