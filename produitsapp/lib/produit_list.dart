import 'package:flutter/material.dart';
import 'package:produitsapp/produit_box.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  State<ProduitsList> createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List liste = [
    ["1 Produit", false],
    ["2 Produit", true],
    ["3 Produit", false],
    ["4 Produit", false],
    ["5 Produit", false],
  ];
  final nomController = TextEditingController();
  void onchanged(bool? value, int index) {
    setState(() {
      liste[index][1] = value;
    });
  }

  void saveProduit() {
    setState(() {
      liste.add([nomController.text, false]);
      nomController.clear();
      Navigator.of(context).pop();
    });
  }

  // Method to open the dialog for adding a product
  Future<void> openAddProductDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ajouter un produit'),
          content: TextField(
            controller: nomController,
            decoration: const InputDecoration(hintText: "Nom du produit"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: saveProduit,
              child: const Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }


  void delProduit(int index) {
    setState(() {
      liste.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produits")),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddProductDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            nomProduit: liste[index][0],
            selProduit: liste[index][1],
            onChanged: (value) => onchanged(value, index),
            delProduit: (context) => delProduit(index),
          );
        },
      ),
    );
  }
}
