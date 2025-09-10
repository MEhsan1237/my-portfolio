import 'package:flutter/material.dart';

class HeadDrawer extends StatelessWidget {
  const HeadDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment:  MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 4),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/man3.png"),
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 8),
                  child: Text(
                    "Muhammad Ehsan",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10,),
          ListTile(
           onTap: (){},
            leading: Icon(Icons.home),
            title: Text("Home",style: TextStyle(color: Colors.black,fontSize: 18),),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.home),
            title: Text("",style: TextStyle(color: Colors.black,fontSize: 18),),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.home),
            title: Text("Home",style: TextStyle(color: Colors.black,fontSize: 18),),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.home),
            title: Text("Home",style: TextStyle(color: Colors.black,fontSize: 18),),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
    );
  }
}
