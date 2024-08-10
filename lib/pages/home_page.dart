import 'package:flutter/material.dart';
import 'package:recetasapp/models/food_model.dart';
import 'package:recetasapp/widgets/food_card_widget.dart';
import 'package:recetasapp/widgets/form_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController urlImageController = TextEditingController();

  // List<Map<String, dynamic>> foodList = [];
  List<FoodModel> foodModelList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff29304B),
        appBar: AppBar(
          title: const Text(
            "Mis Recetas",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff29304B),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              FormWidget(
                hint: "Ingrese el Título",
                controller: titleController,
                svg: "title",
              ),
              FormWidget(
                hint: "Ingrese la descripción",
                controller: descriptionController,
                svg: "description",
              ),
              FormWidget(
                hint: "Ingrese url de la imagen",
                controller: urlImageController,
                svg: "urlImage",
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEDA971)),
                  onPressed: () {
                    FoodModel foodModelAux = FoodModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      urlImage: urlImageController.text,
                    );
                    foodModelList.add(foodModelAux);
                    setState(() {});
                    // print(foodList.length);
                  },
                  child: const Text("Agregar"),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Align(
                  alignment:
                      Alignment.centerLeft, // Aligns the text to the left
                  child: Text(
                    "Listado general",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  itemCount: foodModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: FoodCardWidget(
                        titulo: foodModelList[index].title,
                        descripcion: foodModelList[index].description,
                        urlImage: foodModelList[index].urlImage,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
