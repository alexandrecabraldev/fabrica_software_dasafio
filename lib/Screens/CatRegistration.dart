import 'package:fabrica_software_dasafio/database/Database_helper.dart';
import 'package:flutter/material.dart';
import 'package:fabrica_software_dasafio/models/CatModel.dart';

class CatRegistration extends StatefulWidget{
  const CatRegistration({super.key});

  @override
  State<StatefulWidget> createState(){
    return CatRegistrationState();
  }
}

class CatRegistrationState extends State<CatRegistration>{

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  final dbHelper = DatabaseHelper();

  void _clearAllFields(){
    _nameController.clear();
    _ageController.clear();
    _colorController.clear();
    _breedController.clear();
    _weightController.clear();
  }

  void _saveCats() async{

    final name = _nameController.text;
    int age;
    double weight;
    try{
      age = int.parse(_ageController.text);
    }catch(error){
      print('Error: $error');
      return;
    }
    final color = _colorController.text;
    final breed = _breedController.text;

    try{
      weight = double.parse(_weightController.text);
    }catch(error){
      print('Error: $error');
      return;
    }
    
    final cat = CatModel(name: name, age: age, color: color, breed: breed, weight: weight);

    await dbHelper.insertCat(cat);

    _clearAllFields();
    Navigator.pop(context, true);

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro de gato'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Nome',

                  ),
                ),
                SizedBox(height: 16.0,),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Idade',

                  ),
                ),
                SizedBox(height: 16.0,),
                TextField(
                  controller: _colorController,
                  decoration: InputDecoration(
                    hintText: 'cor do pelo',

                  ),
                ),
                SizedBox(height: 16.0,),
                TextField(
                  controller: _breedController,
                  decoration: InputDecoration(
                    hintText: 'raça',

                  ),
                ),
                SizedBox(height: 16.0,),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'peso (Kg)',

                  ),
                ),
                SizedBox(height: 16.0,),
                ElevatedButton(onPressed: ()=>_saveCats(), child: Text('Cadastrar')),
              ],
            ),
        ),
      ),
    );
  }
}