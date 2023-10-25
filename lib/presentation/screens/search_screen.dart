import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  static const String routeName = '/search-city';
  final _formKey = GlobalKey<FormState>();
  String? city;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).pop(city);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
        centerTitle: true,
        leading: const Icon(CupertinoIcons.back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter a city",
                  hintText: "Enter a city",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a city";
                  } else if (value.length < 3) {
                    return "Please enter at least 3 character";
                  }
                  return null;
                },
                onSaved: (value){
                  city = value;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed:()=> _submit(context),
                child: const Text("GET WEATHER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
