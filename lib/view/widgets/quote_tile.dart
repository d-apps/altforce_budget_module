import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuoteTile extends StatelessWidget {
  const QuoteTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 8, right: 12),
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Image.network(
                    "https://i.imgur.com/AnQnyTT.png",
                    fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 0),
            Text("Test", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
            const SizedBox(height: 4),
            Text("R\$ 100.000,00", style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),),
            TextButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Ver produto", style: TextStyle(color: Colors.white,fontSize: 12),),
                  const SizedBox(width: 4),
                  Icon(FontAwesomeIcons.locationArrow, color: Colors.white, size: 15,)
                ],
              ),
              onPressed: (){},
            ),
            //const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
