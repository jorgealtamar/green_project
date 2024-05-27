import 'dart:io';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screens/Detection/components/icon_card.dart';
import 'package:image_picker/image_picker.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List? _outputs;
  File? _image;
  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    loadModel().then((value){
      setState((){
          _loading= false;
      });
    });
  }

  loadModel() async{
   
      await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1, // defaults to 1
      );
   
  }

  classifyImage(File image) async{
    
    var output = await Tflite.runModelOnImage(
      path: image.path,   // required
      imageMean: 0.0,   // defaults to 117.0
      imageStd: 255.0,  // defaults to 1.0
      numResults: 2,    // defaults to 5
      threshold: 0.2,   // defaults to 0.1
      asynch: true      // defaults to true
    );
    
    setState(() {
      _loading=false;
      _outputs= output;
      
    });
  }

  Future<void> pickImage() async{
   
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
   
    if (image == null) {
      setState(() {
        _loading = false; // Oculta el indicador si no se selecciona ninguna imagen
      });
      return;
    }
    
    File newImage = File(image.path);
    setState(() {
      _loading = true;
      _image =newImage;
    
    });
    await classifyImage(_image!);
  }

    Future<void> photoImage() async{
   
    setState(() {
      _loading = true; // Muestra el indicador de carga
    });
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    
    if (image == null) {
      setState(() {
        _loading = false; // Oculta el indicador si no se selecciona ninguna imagen
      });
      return;
    }
    
    File newImage = File(image.path);
    setState(() {
      _loading = true;
      _image =newImage;
     
    });
    await classifyImage(_image!);
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: SizedBox(
              height: size.height*0.68,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20*3),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              onPressed: (){
                                
                              }, 
                              icon: const Icon(BootstrapIcons.arrow_left),
                            ),
                          ),
                          const SizedBox(height: 20*3,),
                          IconCard(
                            icon: BootstrapIcons.camera,
                            press: (){
                              photoImage();
                            },
                          ),
                          IconCard(
                            icon: BootstrapIcons.image,
                            press: (){
                              pickImage();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  _loading ? SizedBox(
                    height: size.height*0.5,
                    width: size.width*0.75,
                    child: const Center(child: CircularProgressIndicator(color: Colors.blue,)),
                  )
                  : Container(
                    height: size.height*0.5,
                    width: size.width*0.75,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(63),
                        bottomLeft: Radius.circular(63),
                      ),
                      boxShadow: [BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 60,
                        color: primaryColor.withOpacity(0.29),
                      )],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(63),
                        bottomLeft: Radius.circular(63),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16, // Establece el aspect ratio 9/16
                        child: _image == null
                          ? const Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/principal.jpg'),
                            )
                          : Image(
                              fit: BoxFit.cover,
                              image: FileImage(_image!),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _image == null 
                        ? const Text('Plástico', style:  TextStyle(color: Color(0xFF545454), fontSize: 35,fontWeight: FontWeight.bold),)
                        : _outputs != null 
                          ? Text(_outputs![0]["label"], style:  const TextStyle(color: Color(0xFF545454), fontSize: 35,fontWeight: FontWeight.bold),)
                          : const Text('Plástico', style:  TextStyle(color: Color(0xFF545454), fontSize: 35,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(
                width: size.width/2,
                height: 84,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20)
                      )
                    )
                  ),
                  onPressed: (){
                      if(_outputs != null){
                        switch(_outputs![0]['label']){
                          case 'plásticos':
                            context.push('/detalle/1');
                            break;
                          case 'cartón':
                            context.push('/detalle/2');
                            break;
                          case 'papel':
                            context.push('/detalle/3');
                            break;
                          case 'frutas':
                            context.push('/detalle/4');
                            break;
                        }
                      }else{
                        context.push('/detalle/1');
                      }
                  }, 
                  child: Text('Conoce más', style: GoogleFonts.francoisOne(color: Colors.white, fontSize: 18),)
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 84,
                  child: TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF0F0F0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20)
                        )
                      )
                    ),
                    child: Text('Buscar caneca', style: GoogleFonts.francoisOne(color: Colors.black, fontSize: 18),),
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}


