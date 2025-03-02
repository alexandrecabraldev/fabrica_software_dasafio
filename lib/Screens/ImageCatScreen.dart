import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'https://api.thecatapi.com/v1/images/search';
String imageUrl = '';

class ImageCatScreen extends StatefulWidget{
  
  const ImageCatScreen({super.key});

  @override
  State<StatefulWidget> createState(){
    return ImageCatScreenState();
  }
}

class ImageCatScreenState extends State<ImageCatScreen>{

  Future<String?> fetchCatImage() async{

    try{
      var response = await http.get(Uri.parse(url));
      final List<dynamic> data = await json.decode(response.body);

      setState((){
        imageUrl = data[0]['url'];
      });

      return imageUrl;

    }catch(error){
        print('Error: $error');
        return null;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text('Cat Images'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageUrl.isNotEmpty ? Image.network(imageUrl) : Text('Click to show Cat Images'),
              SizedBox(height: 16.0,),
              ElevatedButton(onPressed: fetchCatImage, child: Icon(Icons.refresh)),
            ],
          ),
        ),
      );
  }
}