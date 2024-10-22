import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selProduit;
  final Function(bool?)? onChanged;
  final Function(BuildContext context)? delProduit;
    const ProduitBox(
      {super.key,
      required this.nomProduit,
      this.selProduit = false,
      this.onChanged,
      this.delProduit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(),
         children: [
          SlidableAction(onPressed: delProduit,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(45),
          )
         ]),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Checkbox(value: selProduit, onChanged: onChanged),
              Text(nomProduit),
            ],
          ),
        ),
      ),
    );
  }
}
