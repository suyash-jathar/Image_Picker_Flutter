import  'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? image;
  dynamic c=ImagePicker();
  selectImageFromGallery(ImageSource source)async{
    final image=  await c.pickImage(source: source);
    final imageTemporary=File(image.path);
    setState(() {
        this.image=imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Center(child:  Text("Image Picker Example"))),
      body: image==null?
      Column(
        children: [
          const SizedBox(height: 250,),
          const Center(child: Text("No Image  .."),),
          const SizedBox(height: 10,),
          RaisedButton(onPressed: (){
            selectImageFromGallery(ImageSource.gallery);
          },          
          child: SizedBox(
            width: 220,
            child: Row(
              children: const [
                 Icon(Icons.photo,color: Colors.black,),
                 SizedBox(width: 10,),
                Text("Select Photo From Gallery"),
              ],
            ),
          ),
          ),
          RaisedButton(onPressed: (){
            selectImageFromGallery(ImageSource.camera);
          },          
          child: SizedBox(
            width: 220,
            child: Row(
              children: const [
                Icon(Icons.camera,color: Colors.black,),
                SizedBox(width: 10,),
                Text("Select Photo From Camera"),
              ],
            ),
          ),
          ),
        ],
      )
      :
      Column(
        children: [
          const SizedBox(height: 100,),
          Center(
            child: SizedBox(
              height: 250,
              width: 200,
              child: Image.file(image!,fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 50,),
          RaisedButton(onPressed: (){
            selectImageFromGallery(ImageSource.gallery);
          },
          child: SizedBox(
            width: 220,
            child: Row(
              children: const [
                Icon(Icons.photo,color: Colors.black,),
                SizedBox(width: 10,),
                Text("Select Photo From Camera"),
              ],
            ),
          ),
          ),
          RaisedButton(onPressed: (){
            selectImageFromGallery(ImageSource.camera);
          },
          child: SizedBox(
            width: 220,
            child: Row(
              children: const [
                Icon(Icons.camera,color: Colors.black,),
                SizedBox(width: 10,),
                Text("Select Photo From Camera"),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}