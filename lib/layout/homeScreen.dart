import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smile_shope/layout/cubit/cubit.dart';
import 'package:smile_shope/layout/cubit/state.dart';

import '../screens/screen1/screen1.dart';

class SmileShopeHomeScreen extends StatefulWidget {


  SmileShopeHomeScreen({super.key, });

  @override
  State<SmileShopeHomeScreen> createState() => _SmileShopeHomeScreenState();
}

class _SmileShopeHomeScreenState extends State<SmileShopeHomeScreen> {
  GlobalKey<ScaffoldState> scaffoldkey= GlobalKey<ScaffoldState>(); //مشان وقت يضغط على برغر يفتح
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SmileShopeHomeCubit(),
      child: BlocConsumer<SmileShopeHomeCubit, SmileShopeHomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SmileShopeHomeCubit.get(context);

            return SafeArea(
              child: Scaffold(
                key:scaffoldkey ,
                appBar: AppBar(
                  // backgroundColor: Colors.blueGrey,
                  leading: Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    child: IconButton(
                        onPressed: () {
                          scaffoldkey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu_rounded,
                          size: 35,
                        )),
                  ),
                  //  const Icon(
                  //   Icons.menu_open_rounded,
                  //   size: 30,
                  // ),


                  actions: const [
                    Padding(
                      padding: EdgeInsets.all( 10),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 25,
                      ),
                    ),
                  ],
                ),

                drawer: Drawer(
                  child: Column(
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(color: Colors.blueGrey),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              //  backgroundImage:
                              backgroundImage: AssetImage(
                                'assets/images/img1.jpg',
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '   Welcome to ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  '   Smile Shope',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 233, 115, 150),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      DrawerList(
                        icon: Icons.home,
                        text: 'Home',
                        onpress: () {
                          Navigator.pop(context);
                        },
                      ),
                      DrawerList(
                        icon: Icons.store,
                        text: 'Stores',
                        onpress: () {
                          Get.to(const SmileShopeScreen1());
                        },
                      ),
                      DrawerList(
                          icon: Icons.shopping_cart,
                          text: 'Cart',
                          onpress: () {
                            Get.to(const SmileShopeScreen1());
                          }),
                      DrawerList(
                          icon: Icons.logout,
                          text: 'Logout',
                          onpress: () {
                            Get.to(const SmileShopeScreen1());
                          }),
                    ],
                  ),
                ),

                // AppBar(
                //   title: const Text(
                //     'Smile Shope 🤩 Hellow ',
                //     style: TextStyle(fontSize: 25),
                //   ),
                // ),
                body: cubit.screens[cubit.index],
                bottomNavigationBar: BottomNavigationBar(
                    elevation: 1.5,
                    currentIndex: cubit.index,
                    onTap: (value) {
                      cubit.changeBottomNavigation(value);
                    },

                    // enableFeedback: true,
                    // mouseCursor: MouseCursor.defer,
                    unselectedItemColor: Colors.black,
                    selectedItemColor: Colors.pink,
                    backgroundColor: const Color.fromARGB(255, 217, 215, 215),
                    type: BottomNavigationBarType.fixed,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.category), label: 'categores'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.ac_unit), label: 'ls'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
                    ]),
              ),
            );
          }),
    );
  }
}

class DrawerList extends StatelessWidget {
  DrawerList(
      {super.key,
      required this.icon,
      required this.text,
      required this.onpress});
  IconData icon;
  String text;
  Function()? onpress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      title: Text(
        text,
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      leading: Icon(
        icon,
        size: 32,
      ),
    );
  }
}
