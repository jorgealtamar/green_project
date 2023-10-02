import 'package:flutter/material.dart';
import 'package:green_project/components/button_circular_icon.dart';
import 'package:green_project/constants.dart';
import 'package:green_project/screens/Detection/components/image_detection.dart';
import 'package:green_project/screens/Detection/components/result_detection.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  const Body({super.key,});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<XFile> images = [];
  String path = 'assets/images/deteccion.png' ;
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Stack(
        children: [
          // 'assets/images/deteccion.png'
          ImageDetection(image: AssetImage(path)),
          //icono para abrir camara
          Positioned(
            top: 20,
            left: 20 ,
            right: 20,
            child:  Row(
              children: [
                ButtomCircularIcon(
                  icon: Icons.add,
                  iconcolor: Colors.black,
                  backgroundcolor: secondColor,
                  sizebutton: 50,
                  press: () {
                    _openCamera();
                  },
                  
                ),
              ],
            ),
          ),
          const ResultDetection(),
        ],
      );
  }

  void _openCamera() async{
    XFile? picture = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      images.add(picture!);
      //path = images[0].path;
    });
    
  }

}