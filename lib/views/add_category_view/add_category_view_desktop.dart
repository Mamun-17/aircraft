
import 'dart:io';

import 'package:aircraft_inventory_management/view_models/dashboard_view_model.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/common_widget/common_widget.dart';

class AddCategoryViewDesktop extends StatefulWidget {
  const AddCategoryViewDesktop({Key? key}) : super(key: key);

  @override
  State<AddCategoryViewDesktop> createState() => _AddCategoryViewDesktopState();
}

class _AddCategoryViewDesktopState extends State<AddCategoryViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder: (context, dvm, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 52,
                width: MediaQuery.of(context).size.width * .716,
                color: Colors.white,
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [

                      GestureDetector(
                        onTap: (){
                          dvm.navigateTosubPage(context, 'dashboard');
                        },
                          child: Icon(Icons.arrow_back, color: Colors.black,)
                      ),

                      SizedBox(
                        width: 5,
                      ),
                      Text("New Aircraft", style: TextStyle(
                        fontFamily: 'Inter'
                      ),),
                    ],
                  ),
                ),
              ),

              Container(
                height: 747,
                width: MediaQuery.of(context).size.width * .716,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicWidth(
                        child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Aircraft Name",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                    fontSize: 16
                                  ),
                                ),

                                SizedBox(width: 10,),

                                Common_Container(bordercolor: Colors.black, border: 0,
                                    height: 45,
                                    color: Colors.white,
                                    width: 389,
                                    radius: 5,
                                    mywidget:TextField(
                                      controller: dvm.aircraft_name_controller,
                                      style: TextStyle(

                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Inter"
                                      ),

                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(top: 30, left: 10),

                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(5),


                                          )
                                      ),
                                    ),
                                    blurRadius: 5,
                                    boxshadowopacity: .15,
                                    offset: 2,
                                    spreadRadius: 0),




                              ],
                            ),

                                SizedBox(height: 40,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text(
                                      "Aircraft ID",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter',
                                          fontSize: 16
                                      ),
                                    ),

                                    SizedBox(width: 10,),

                                    Common_Container(bordercolor: Colors.black, border: 0,
                                        height: 45,
                                        color: Colors.white,
                                        width: 389,
                                        radius: 5,
                                        mywidget:TextField(
                                          controller: dvm.aircraft_id_controller,
                                          style: const TextStyle(
                                            color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Inter"
                                          ),

                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(top: 30, left: 10),

                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.circular(5),


                                              )
                                          ),
                                        ),
                                        blurRadius: 5,
                                        boxshadowopacity: .15,
                                        offset: 2,
                                        spreadRadius: 0),

                                  ],
                                ),
                              ],
                            ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 7,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  DropTarget(

                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: dvm.dragEntered?Colors.green.withOpacity(0.3): Colors.black54
                                          ),
                                          shape: BoxShape.rectangle,
                                          color: dvm.dragEntered?Colors.green.withOpacity(0.3): Colors.white,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Stack(
                                        children: [
                                          if(dvm.pickedImage!=null)
                                            Center(child: Image.file(File(dvm.pickedImage!.path)))
                                          else
                                            SizedBox.shrink(),

                                          if(dvm.pickedImage!=null)
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: GestureDetector(
                                                onTap: (){
                                                  dvm.pickImage();
                                                },
                                                child: Text("Browse Image",style: TextStyle(
                                                    color: Color(0xff448DF2),
                                                    fontWeight: FontWeight.bold
                                                ),),
                                              ),
                                            )
                                          else
                                            Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,

                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        vertical: 15
                                                    ),
                                                    child: Icon(Icons.camera_rounded),
                                                  ),


                                                  GestureDetector(
                                                    onTap: (){
                                                      dvm.pickImage();
                                                    },
                                                    child: Text("Browse Image",style: TextStyle(
                                                        color: Color(0xff448DF2),
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                  ),
                                                ],
                                              ),
                                            ),

                                        ],
                                      ),
                                    ),
                                    onDragDone: (details){
                                      try{
                                      print(details.files.length);
                                        dvm.updatePickedImage(details.files.first);
                                      }catch(e){
                                        print(e);
                                      }

                                    },
                                    onDragEntered: (details){
                                      dvm.updateDragEntered(true);
                                    },
                                    onDragExited: (details){
                                      dvm.updateDragEntered(false);
                                    },
                                  ),

                                  SizedBox(height: 50,),

                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width*0.3,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(

                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey
                                                  ),
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 20
                                                ),
                                                child: Text('Cancel'),
                                              ),
                                            ),
                                            onTap: (){
                                              dvm.navigateTosubPage(context, 'dashboard');
                                            },
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              dvm.addCategory(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF1e4837),
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 20
                                                ),
                                                child: Text('Add Item',style: TextStyle(
                                                    color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                                ),),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )




                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
