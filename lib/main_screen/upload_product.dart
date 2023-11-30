import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/snackbar.dart';
// ignore: implementation_imports

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({Key? key}) : super(key: key);

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  late double price;
  late int quantity;
  late String proName;
  late String proDesc;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Colors.blueGrey.shade100,
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Center(
                              child: Text(
                            'You have not \n  \n picked images yet !',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 30,
                        child: Divider(
                          color: Colors.yellow,
                          thickness: 1.5,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter price';
                            } else if (value.isValidPrice() != true) {
                              return 'invalid price';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            price = double.parse(value!);
                          },
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: textFormsDecoration().copyWith(
                            labelText: 'price',
                            hintText: 'price .. \$',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter Quantity';
                            } else if (value.isValidQuantity() != true) {
                              return 'not valid quantity';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            quantity = int.parse(value!);
                          },
                          keyboardType: TextInputType.number,
                          decoration: textFormsDecoration().copyWith(
                            labelText: 'Quantity',
                            hintText: 'Add Quantity',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter producr name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            proName = value!;
                          },
                          maxLength: 100,
                          maxLines: 3,
                          decoration: textFormsDecoration().copyWith(
                            labelText: 'prodcut name',
                            hintText: 'Enter product name',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter prodcut description';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            proDesc = value!;
                          },
                          maxLength: 100,
                          maxLines: 5,
                          decoration: textFormsDecoration().copyWith(
                            labelText: 'prodcut description',
                            hintText: 'Enter product description',
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.yellow,
              child: const Icon(Icons.photo_library, color: Colors.black),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              uploadProduct();
            },
            backgroundColor: Colors.yellow,
            child: const Icon(Icons.upload, color: Colors.black),
          )
        ]),
      ),
    );
  }

  void uploadProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('valid');
      print(price);
      print(quantity);
      print(proName);
      print(proDesc);
    } else {
      MyMessageHandler().showSnackBar(_scaffoldKey, 'please fill all field');
    }
  }

  InputDecoration textFormsDecoration() {
    return InputDecoration(
      labelText: 'price',
      hintText: 'price .. \$',
      labelStyle: const TextStyle(color: Colors.purple),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

extension QuantityValidator on String {
  bool isValidQuantity() {
    return RegExp(r'^[1-9][0-9]*$').hasMatch(this);
  }
}

extension PriceValidator on String {
  bool isValidPrice() {
    return RegExp(r'^((([1-9][0-9]*[\.]*)||([0][\.]*))([0-9]{1,2}))$')
        .hasMatch(this);
  }
}
