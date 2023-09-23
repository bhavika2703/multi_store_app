import 'package:flutter/material.dart';
import 'package:multi_store_app/customer_screens/customer_orders.dart';
import 'package:multi_store_app/customer_screens/wishlist.dart';
import 'package:multi_store_app/main_screen/cart.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.yellow, Colors.brown])),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.white,
                expandedHeight: 140,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        opacity: constraints.biggest.height <= 120 ? 1 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: const Text('Account',
                            style: TextStyle(color: Colors.black)),
                      ),
                      background: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.brown])),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25, left: 30),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                  'images/inapp/guest.jpg',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                  'guest'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) =>  const CartScreen(isShowBackButton: true),));
                                },
                                child: SizedBox(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Center(
                                        child: Text(
                                      'Cart',
                                      style: TextStyle(
                                          color: Colors.yellow, fontSize: 20),
                                    )))),
                          ),
                          Container(
                            color: Colors.yellow,
                            child: TextButton(
                                onPressed: () {
                                   Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) =>const  CustomerOrders(),));
                                },
                                child: SizedBox(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Center(
                                        child: Text(
                                      'Orders',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 20),
                                    )))),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                   Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) =>const  WishListScreen(),));
                                },
                                child: SizedBox(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Center(
                                        child: Text(
                                      'Wishlist',
                                      style: TextStyle(
                                          color: Colors.yellow, fontSize: 20),
                                    )))),
                          )
                        ],
                      ),
                    ),
                    Container(
                     color: Colors.grey.shade300,  
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 150,
                            child: Image(image: AssetImage('images/inapp/logo.jpg')),
                          ),
                       
                      const ProfileHeaderLabel(headerLable: '  Account Info.  '),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              RepeatedListTile(
                                title: 'Email Address',
                                subTitle: 'example@gmail.com',
                                icon: Icons.email,
                              ),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'phone No. ',
                                subTitle: '+1111111',
                                icon: Icons.phone,
                              ),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'Address',
                                subTitle: 'example:140  -- st -- New Gersy',
                                icon: Icons.location_pin,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ProfileHeaderLabel(headerLable: ' Account Settings '),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              RepeatedListTile(
                                title: 'Edit Profile',
                                icon: Icons.edit,
                                subTitle: '',
                                onPressed: () {},
                              ),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'Change Password',
                                icon: Icons.lock,
                                subTitle: '',
                                onPressed: () {},
                              ),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'Log Out',
                                icon: Icons.logout,
                                subTitle: '',
                                onPressed: () {
                                    Navigator.pushReplacementNamed(context, '/welcome_screen');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                                      ],
                                    ),
                    ), ],
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

// ignore: must_be_immutable
class RepeatedListTile extends StatelessWidget {
  final String title;
  String subTitle = '';
  final IconData icon;
  final Function()? onPressed;
  RepeatedListTile(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.icon,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLable;
  const ProfileHeaderLabel({
    Key? key,
    required this.headerLable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(color: Colors.grey, thickness: 1),
          ),
          Text(
            headerLable,
            style: const TextStyle(
                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(color: Colors.grey, thickness: 1),
          ),
        ],
      ),
    );
  }
}
