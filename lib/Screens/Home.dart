import 'package:flutter/material.dart';
import 'ImageCatScreen.dart';
import 'CatRegistration.dart';
import '../database/Database_helper.dart'; 
import '../models/CatModel.dart'; 

class HomePage extends StatefulWidget{

  const HomePage({super.key});

  @override
  _HomePageState createState(){
    return _HomePageState();
  } 
}

class _HomePageState extends State<HomePage>{
  final dbHelper = DatabaseHelper();
  List<CatModel> cats = [];

  @override
  void initState() {
    super.initState();
    _loadCats();
  }

    void _loadCats() async {
    final allCats = await dbHelper.listCats();
    setState(() {
      cats = allCats.cast<CatModel>();
    });
  }

  void _deleteCat(int id) async {
    await dbHelper.deleteCat(id);
    _loadCats();
  }

  void _editCat(CatModel cat) async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=> CatRegistration(cat: cat),
      )
    );

    if(result == true){
      _loadCats();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Cat App'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: cats.isEmpty
            ? Center(
                child: Text('No cats registered'),
              )
            : ListView.builder(
                itemCount: cats.length,
                itemBuilder: (context, index) {
                  final cat = cats[index];
                  return ListTile(
                    title: Text(cat.name),
                    subtitle: Text(cat.breed),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${cat.age} years'),
                        IconButton(onPressed: ()=>_editCat(cat), icon: Icon(Icons.edit)),
                        IconButton(onPressed: ()=>_deleteCat(cat.id!), icon: Icon(Icons.delete)),
                      ],
                    ),           
                  );
                },
              ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                heroTag: 'btn1',
                onPressed: ()=>goToImageCatScreen(context), 
                child: Icon(Icons.pets)),

              FloatingActionButton(
                heroTag: 'btn2',
                onPressed: ()=>goToCatRegistration(context), 
                child: Icon(Icons.add),
              ),
            ],
          ),
          ),
      );
  }

  Future<dynamic>? goToCatRegistration(BuildContext context) async{
    try{
      final result= await Navigator.push(context, MaterialPageRoute(builder: (context) => CatRegistration()));
      if(result==true){
        _loadCats();
      }
    }catch(error){
      print('Error: $error');
      return null;
    }
  }

Future<dynamic>? goToImageCatScreen(BuildContext context){
  
    try{
      return Navigator.push(context, MaterialPageRoute(builder: (context) => ImageCatScreen()));
    }catch(error){
      print('Error: $error');
      return null;
    }
  }
}



