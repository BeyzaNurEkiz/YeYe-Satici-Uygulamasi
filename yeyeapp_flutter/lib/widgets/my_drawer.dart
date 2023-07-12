import 'package:flutter/material.dart';
import 'package:yeyeapp_flutter/mainScreens/earnings_screen.dart';
import 'package:yeyeapp_flutter/mainScreens/history_screen.dart';
import 'package:yeyeapp_flutter/mainScreens/home_screen.dart';
import 'package:yeyeapp_flutter/mainScreens/new_orders_screen.dart';
import '../authentication/auth_screen.dart';
import '../global/global.dart';

class MyDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: ListView(
        children: [
          //header Drawer
          Container(
            padding: EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          sharedPreferences!.getString("photoUrl")!
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                    sharedPreferences!.getString("name")!,
                  style: TextStyle(color: Colors.black, fontSize: 24, fontFamily: "Train"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12,),


          //body Drawer
          Container(
            padding: EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.black,),
                  title: const Text(
                    "Ana Sayfa",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const HomeScreen()));
                  },
                ),

                ListTile(
                  leading: Icon(Icons.monetization_on, color: Colors.black,),
                  title: const Text(
                    "Kazançlarım",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const EarningsScreen()));

                  },
                ),
                ListTile(
                  leading: Icon(Icons.reorder, color: Colors.black,),
                  title: const Text(
                    "Yeni Siparişler",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>   NewOrdersScreen()));

                  },
                ),
                ListTile(
                  leading: Icon(Icons.local_shipping, color: Colors.black,),
                  title: const Text(
                    "Geçmiş Siparişler",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>HistoryScreen()));

                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.black,),
                  title: const Text(
                    "Çıkış Yap",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: ()
                  {
                    firebaseAuth.signOut().then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> const AuthScreen()));
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
