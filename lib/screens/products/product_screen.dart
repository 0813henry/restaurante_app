import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '/model/product_model.dart';
import '../../services/cloudinary_service.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? _imageUrl;
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null) {
      final url = await CloudinaryService().uploadImage(_imageFile!);
      if (url != null) {
        setState(() {
          _imageUrl = url;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agregar Producto")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nombre"),
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: "Precio"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              _imageFile != null
                  ? Image.file(_imageFile!, height: 100)
                  : SizedBox(),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text("Seleccionar Imagen"),
              ),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text("Subir Imagen"),
              ),
              _imageUrl != null
                  ? Image.network(_imageUrl!, height: 100)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}