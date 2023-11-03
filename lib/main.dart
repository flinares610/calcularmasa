import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CalculoMasa(),
    debugShowCheckedModeBanner: false,
  ));
}

class CalculoMasa extends StatefulWidget {
  const CalculoMasa({super.key});

  @override
  State<CalculoMasa> createState() => _CalculoMasaState();
}

class _CalculoMasaState extends State<CalculoMasa> {
  double inAltura = 0;
  double inKg = 0;
  double Sumatotal = 0;
  String tipoPeso = "";
  String infoPeso = "";
  bool mostrarImagen = false;
  var imagAset = "assets/images/normal.png";

  void calculoMasa(medida, peso) {
    var medidaMetro = medida / 100;
    Sumatotal = peso / (medidaMetro * medidaMetro);
  }

  void recomenDieta() {
    if (Sumatotal <= 18.5) {
      tipoPeso = "DELGADO";
      infoPeso =
          "Comer con más frecuencia, Escoger comidas ricas en nutrientes, Tomar batidos y licuados de frutas";
      imagAset = "assets/images/delgada.png";
      mostrarImagen = true;
    } else if (Sumatotal <= 24.9) {
      tipoPeso = "NORMAL";
      infoPeso =
          "Tiene un peso normal siga así cuidandose su alimentación y comiendo cosas nutritivas.";
      imagAset = "assets/images/normal.png";
      mostrarImagen = true;
    } else if (Sumatotal <= 29.9) {
      tipoPeso = "SOBREPESO";
      infoPeso =
          "Que paso... Debes cuidar mas su salud, cuidado con lo que comes te recomiendo comer mas cosas sanas para regular tu peso y a su vez realizar ejercicios.";
      imagAset = "assets/images/sobrepeso.png";
      mostrarImagen = true;
    } else if (Sumatotal >= 30.0) {
      tipoPeso = "OBESIDAD";
      infoPeso =
          "Se recomienda visitar a un especialista para que te pueda ayudar";
      imagAset = "assets/images/obesidad.png";
      mostrarImagen = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Calcular masa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Altura",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      inAltura.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      "cm",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Slider(
                  value: inAltura,
                  min: 0,
                  max: 300,
                  onChanged: (cm) {
                    inAltura = cm;
                    setState(() {});
                  },
                )
              ],
            ),
            Divider(),
            Column(
              children: [
                Text(
                  "Peso",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      inKg.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      "Kg",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Slider(
                  value: inKg,
                  min: 0,
                  max: 500,
                  onChanged: (kg) {
                    inKg = kg;
                    setState(() {});
                  },
                )
              ],
            ),
            Divider(),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (inAltura == 0) {
                        if (inKg == 0) {
                          Sumatotal = 0;
                          tipoPeso = "";
                          infoPeso = "";
                          mostrarImagen = false;
                        } else {
                          Sumatotal = 0;
                          tipoPeso = "";
                          infoPeso = "";
                          mostrarImagen = false;
                        }
                      } else {
                        if (inKg == 0) {
                          Sumatotal = 0;
                          tipoPeso = "";
                          infoPeso = "";
                          mostrarImagen = false;
                        } else {
                          calculoMasa(inAltura, inKg);
                          recomenDieta();
                        }
                      }

                      setState(() {});
                    },
                    child: Text("CALCULAR"))),
            Divider(),
            Column(
              children: [
                Text(
                  Sumatotal.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                Text(tipoPeso,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 8,
                ),
                Text(infoPeso,
                    style: TextStyle(
                        fontSize: 14,
                        //color: Colors.blue,
                        fontWeight: FontWeight.bold)),
                Visibility(
                  visible:
                      mostrarImagen, // Controla la visibilidad de la imagen
                  child: Image.asset(imagAset, width: 200, height: 200),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
