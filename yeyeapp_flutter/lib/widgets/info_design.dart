import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yeyeapp_flutter/mainScreens/itemsScreen.dart';
import 'package:yeyeapp_flutter/model/menus.dart';

import '../global/global.dart';

class InfoDesignWidget extends StatefulWidget
{


  Menus? model;
  BuildContext? context;

  InfoDesignWidget({this.model, this.context});

  @override
  State<InfoDesignWidget> createState() => _InfoDesignWidgetState();
}

class _InfoDesignWidgetState extends State<InfoDesignWidget>
{

  deleteMenu(String menuID)
  {
    FirebaseFirestore.instance.collection("sellers")
        .doc(sharedPreferences!.getString("uid"))
        .collection("menus")
        .doc(menuID)
        .delete();

    Fluttertoast.showToast(msg: "Kategori Silindi");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> ItemsScreen(model: widget.model)));
      },
      splashColor: Colors.pinkAccent,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.network(
                  widget.model!.thumbnailUrl!,
                  height: 230.0,
                  fit: BoxFit.cover,
              ),
              const SizedBox(height: 5.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.model!.menuInfo!,
                    style: const TextStyle(
                      color: Color(0xFFF882A6),
                      fontSize: 20,
                      fontFamily: "Train",
                    ),

                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_sweep,
                      color: Colors.red,
                    ),
                    onPressed: ()
                    {
                      //menü sil
                      deleteMenu(widget.model!.menuID!);
                    },
                  ),
                ],
              ),

              Text(
                widget.model!.menuTitle!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),

              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
