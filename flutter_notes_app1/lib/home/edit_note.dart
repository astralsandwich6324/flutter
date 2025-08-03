import 'package:flutter/material.dart';
import 'package:flutter_notes_app1/sqlite/model/note.dart';
import 'package:flutter_notes_app1/sqlite/sqlite_insert.dart';
import 'package:flutter_notes_app1/sqlite/sqlite_update.dart';

class EditNote extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Note _note = ModalRoute.of(context)!.settings.arguments as Note;
    return Scaffold(
      appBar: AppBar(
        title:Text("Edit Note") ,
      ),
      body: _Form(_note),
    );
  }
}

class _Form extends StatelessWidget{
  final _formKey = GlobalKey <FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final Note _note;

  _Form(this._note){
    _nameController.text = _note.name.toString();
    _descriptionController.text = _note.description.toString();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 25,
        left: 25,
        
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLength: 50,
                validator: (value) => _validateName(value!),
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  )
                ),
              ),
               SizedBox(
                height: 25,
              ),
              TextFormField(
                maxLength: 500,
                maxLines: 10,
                
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: "Descripcion",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  )
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                label: Text("Guardar"),
                icon: Icon(Icons.save), 
                onPressed: ()=> _save(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _validateName(String value){
    if(value.trim().isEmpty){
      return "Empy file";
    }
    return null;
  }

  
  void _save(BuildContext context){
    if(_formKey.currentState!.validate()){
      SqliteUpdate().note(Note(
        id: _note.id,
        name : _nameController.text.trim(), 
        description:  _descriptionController.text.trim(), 
      ));
      Navigator.pop(context);
    }
  }
  
}