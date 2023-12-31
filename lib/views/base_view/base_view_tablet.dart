import 'package:aircraft_inventory_management/view_models/view_model_for_base_view/base_view_model.dart';
import 'package:aircraft_inventory_management/views/add_category_view/add_category_view_tablet.dart';
import 'package:aircraft_inventory_management/views/add_inventory_item_view/add_inventory_view_tablet.dart';
import 'package:aircraft_inventory_management/views/dashboard_view/dashboard_view_tablet.dart';
import 'package:aircraft_inventory_management/views/inventory_view/inventory_view_for_tablet.dart';
import 'package:aircraft_inventory_management/views/settings/profile_settings.dart';
import 'package:aircraft_inventory_management/views/settings/profile_settings_tablet.dart';
import 'package:aircraft_inventory_management/views/single-item_details/single_item_details_tablet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../res/constants.dart';
import '../add_inventory_item_view/add_inventory_view.dart';
import 'base_view_widget.dart';

class Base_View_tablet extends StatefulWidget {
  const Base_View_tablet({Key? key}) : super(key: key);

  @override
  State<Base_View_tablet> createState() => _Base_View_tabletState();
}

class _Base_View_tabletState extends State<Base_View_tablet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseViewModel>(
      builder: (context,mp,_) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: Color(0xFFF5F5F5),
              drawer: Drawer(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                ),
                child: Column(
                  children: [

                    Container(
                      height: 94,
                      width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       color: Color(0xFF052169),
                       image: DecorationImage(
                         image: AssetImage("assets/image_files/Bangladesh Army Aviation.png")
                       )
                     ),

                    ),
                    Expanded(child: Container(

                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFF052169),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 15),
                            GestureDetector(
                                onTap: (){
                                  mp.changingOptions(context,'dashboard');

                                },
                                child: MyBaseViewContainer(text: "Dashboard",
                                    containercolor: mp.baseviewPage=="dashboard"?Color(0xFFECECEC):Colors.transparent,
                                    icon: Icons.home,
                                    textcolor: mp.baseviewPage=='dashboard'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72),
                                    iconcolor: mp.baseviewPage=='dashboard'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72))),

                            SizedBox(height: 20,),
                            Visibility(
                              visible: mp.pickedAircraft!=null,
                              child: Column(
                                children: [
                                  GestureDetector(
                                      onTap: (){
                                        mp.changingOptions(context,'add_item');

                                      },
                                      child: MyBaseViewContainer(text: "Add Item",
                                          containercolor: mp.baseviewPage=="add_item"?Color(0xFFECECEC):Colors.transparent,
                                          icon: Icons.add_shopping_cart_outlined,
                                          textcolor: mp.baseviewPage=='add_item'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72),
                                          iconcolor: mp.baseviewPage=='add_item'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72))),

                                  SizedBox(height: 20,),
                                  GestureDetector(
                                      onTap: (){
                                        mp.changingOptions(context,'inventory');

                                      },
                                      child: MyBaseViewContainer(text: "Inventory",
                                          containercolor: mp.baseviewPage=="inventory"?Color(0xFFECECEC):Colors.transparent,
                                          icon: Icons.add_shopping_cart_outlined,
                                          textcolor: mp.baseviewPage=='inventory'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72),
                                          iconcolor: mp.baseviewPage=='inventory'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72))),


                                  SizedBox(height: 20,),

                                  Visibility(
                                    visible: mp.pickedAircraftItem!=null,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                            onTap: (){
                                              mp.changingOptions(context,'item_details');

                                            },
                                            child: MyBaseViewContainer(text: "Item Details",
                                                containercolor: mp.baseviewPage=="item_details"?Color(0xFFECECEC):Colors.transparent,
                                                icon: Icons.add_shopping_cart_outlined,
                                                textcolor: mp.baseviewPage=='item_details'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72),
                                                iconcolor: mp.baseviewPage=='item_details'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72))),
                                        SizedBox(height: 20,),
                                      ],
                                    ),
                                  ),



                                  GestureDetector(
                                      onTap: (){
                                        mp.changingOptions(context,'product_overview');
                                      },
                                      child: MyBaseViewContainer(text: "Parts Overview",
                                          containercolor: mp.baseviewPage=="product_overview"?Colors.white:Colors.transparent,
                                          icon: Icons.event_note_sharp,
                                          textcolor: mp.baseviewPage=='product_overview'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72),
                                          iconcolor: mp.baseviewPage=='product_overview'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72))),


                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),

                            mp.user.is_admin==true?Column(
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      mp.changingOptions(context,'manage_store');
                                    },
                                    child: MyBaseViewContainer(text: "Manage Store",
                                        containercolor: mp.baseviewPage=="manage_store"?Color(0xFFECECEC):Colors.transparent,
                                        icon: Icons.storefront,
                                        textcolor: mp.baseviewPage=='manage_store'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72),
                                        iconcolor: mp.baseviewPage=='manage_store'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72))),

                                SizedBox(height: 20,),
                              ],
                            ):SizedBox.shrink(),



                            /*GestureDetector(
                                    onTap: (){
                                      mp.changingOptions(4);
                                    },
                                    child: MyBaseViewContainer(text: "Suppliers",
                                        icon: Icons.account_circle_outlined,
                                        textcolor: mp.baseviewIndex==4?Color(0xFF0B6CF3):Color(0xFF797979),
                                        iconcolor: mp.baseviewIndex==4?Color(0xFF0B6CF3):Color(0xFF797979))),

                                SizedBox(height: 40,),*/

                            GestureDetector(
                                onTap: (){
                                  mp.changingOptions(context,'settings');
                                },
                                child: MyBaseViewContainer(text: "Settings",
                                    containercolor: mp.baseviewPage=="settings"?Color(0xFFECECEC):Colors.transparent,
                                    icon: Icons.settings,
                                    textcolor: mp.baseviewPage=='settings'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72),
                                    iconcolor: mp.baseviewPage=='settings'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72))),

                            SizedBox(height: 20,),

                            GestureDetector(
                                onTap: ()async{
                                  await mp.logout(context);
                                },
                                child: MyBaseViewContainer(text: "Log Out",
                                    containercolor: mp.baseviewPage=="log_out"?Color(0xFFECECEC):Colors.transparent,
                                    icon: Icons.logout,
                                    textcolor: mp.baseviewPage=='log_out'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72),
                                    iconcolor: mp.baseviewPage=='log_out'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72))),

                            SizedBox(height: 20,),

                            GestureDetector(
                                onTap: (){
                                  mp.changingOptions(context,'help');
                                },
                                child: MyBaseViewContainer(text: "help",
                                    containercolor: mp.baseviewPage=="help"?Color(0xFFECECEC):Colors.transparent,
                                    icon: Icons.question_mark,
                                    textcolor: mp.baseviewPage=='help'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72),
                                    iconcolor: mp.baseviewPage=='help'?Color(0xFF0B6CF3):Color(0xFFFFFFFF).withOpacity(0.72))),
                          ],
                        ),
                      ),
                    ))

                  ],
                ),

              ),

              body:  Container(
                width: AppConstants().tablet_width,

                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0,right: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Color(0xFF052169),

                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Builder(
                                  builder: (context) {
                                    return GestureDetector(
                                        onTap: (){
                                          Scaffold.of(context).openDrawer();
                                        },
                                        child: Icon(Icons.menu,size: 46,color: Colors.white,));
                                  }
                              ),
                              Expanded(
                                child: Container(
                                  color: Color(0xFF052169),
                                  height: 94,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      mp.baseviewPage=='dashboard'?Container(
                                          height: 44,
                                          width: MediaQuery.of(context).size.width*.277,
                                          decoration: BoxDecoration(
                                              color:Colors.white,
                                              border: Border.all(width: 1,color: Color(0xFFECECEC)),
                                              borderRadius: BorderRadius.circular(35)
                                          ),
                                          child: TextField(
                                            onChanged: (s){
                                              mp.filterAircraft(context,s);
                                            },
                                            decoration: const InputDecoration(

                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none
                                                ),
                                                contentPadding: EdgeInsets.only(top: 6),
                                                prefixIcon: Icon(Icons.search,
                                                  color: Color(0xFF858D9D),
                                                  size: 20,),
                                                hintText: "Search aircraft"
                                            ),

                                          )
                                      ):SizedBox.shrink(),
                                      SizedBox(width: 66,),
                                      Container(
                                        height: 36,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Color(0xFF569DFF),),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                        ),
                                        child: Center(
                                          child: FaIcon(FontAwesomeIcons.rotateRight,
                                            color: Color(0xFF569DFF),
                                            size: 20,),
                                        ),
                                      ),
                                      SizedBox(width: 50,),
                                      Container(
                                        height: 36,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF569DFF),
                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                        ),
                                        child: Center(
                                          child: FaIcon(FontAwesomeIcons.bell,
                                            color: Colors.white,
                                            size: 20,),
                                        ),
                                      ),
                                      SizedBox(width: 40,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Container(
                                          height: 44,
                                          //width: MediaQuery.of(context).size.width*.111,

                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(width: 1,color: Color(0xFFECECEC)),
                                              borderRadius: BorderRadius.circular(35)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 4,bottom: 5),
                                                child: CircleAvatar(
                                                  radius: 35,
                                                  backgroundColor: Colors.black,

                                                ),
                                              ),


                                              Padding(
                                                padding: const EdgeInsets.only(right: 7),
                                                child: Text("${mp.user.email}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Inter",
                                                      color: Color(0xFF212121)
                                                  ),),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                     //Single_Item_Details_Tablet_View()
                       //AddInventoryView(fromAddStock: true,),
                       // AddCategoryForTablet()
                       //AddInventoryView()
                       // AddCategoryForTablet()
                        //MyDashBoardView()
                       // ProfileSettingsTablet()
                        Profile_Settings_View()




                      ],
                    ),
                  ),
                ),
              )


          ),
        );
      }
    );
  }
}
