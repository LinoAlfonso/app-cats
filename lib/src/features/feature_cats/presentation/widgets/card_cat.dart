
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../presentation.dart';


class CatCard extends StatelessWidget {
  final Cat cat;
  const CatCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: RenderImageNetwork(
                imageUrl: cat.imageCat?.url??'',
                size: const Size(double.infinity, 180),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        cat.name??'',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.8),
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                      // Botón "Más"
                      ElevatedButton(
                        onPressed: () {
                          // Acción para el botón
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(8),
                        ),
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
               SizedBox(height: 180,),// Espacio flexible

                Container(
                  color: Colors.black.withOpacity(0.5), // Fondo oscuro semi-transparente
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // País de origen
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white, size: 18),
                          SizedBox(width: 4),
                          Text(
                            cat.origin??'',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      // Nivel de inteligencia
                      Row(
                        children: [
                          Text(
                            "Intelligence: ${cat.intelligence}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
