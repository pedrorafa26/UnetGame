import 'package:flutter/material.dart';
import 'package:four_unet_one/global_widgets/back.dart';

final List<BorderRadius> _buttonBorders = [
  BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(7),
    bottomRight: Radius.circular(30),
    bottomLeft: Radius.circular(7),
  ),
  BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(30),
    bottomRight: Radius.circular(15),
    bottomLeft: Radius.circular(15),
  ),
  BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
    bottomRight: Radius.circular(15),
    bottomLeft: Radius.circular(40),
  ),
  BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(15),
    bottomRight: Radius.circular(40),
    bottomLeft: Radius.circular(15),
  )
];

class LevelSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Maneje el body del Scaffold con un Stack, cuyo primer widget sea el Back()
    //Luego va montando lo demás, las fuentes ya están agregadas en el pubspeck.yaml
    //así como el logo, aun estoy decidiendo si trabajar con .svg o .png por eso están las dos
    //La fuente del título es WildHazelnut y la de los números es SweetPurple
    // uso style: TextStyle(fontFamily: 'WildHazelnut')
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Back(),
          SafeArea(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // SizedBox(
                      //   height: 45,
                      // ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              OutlineButton(
                                borderSide: BorderSide(color: Colors.white),
                                padding: EdgeInsets.all(0),
                                child: Icon(
                                  Icons.arrow_left,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                shape: CircleBorder(),
                                highlightedBorderColor: Colors.white,
                                highlightColor: Colors.white,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Text(
                                'Seleciona un nivel',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'WildHazelnut',
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              Image.asset(
                                'assets/images/layout/logo.png',
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 60,
                      // ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              controller: ScrollController(
                                keepScrollOffset: true,
                              ),
                              shrinkWrap: false,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 25,
                                mainAxisSpacing: 15,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                int lengthBorders = _buttonBorders.length;
                                int borderRadiusNumber = index < lengthBorders
                                    ? index
                                    : int.parse(
                                        '${(index + (index / lengthBorders).floor()) % lengthBorders}');
                                return LevelButton(
                                  numberLevel: '${index + 1}',
                                  borderRadius:
                                      _buttonBorders[borderRadiusNumber],
                                );
                              },
                              itemCount: 20,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 45,
                      // ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            'Tranquilo, amigo, ella volverá; \nQuien no vuelve es el semestre',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 25,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final String numberLevel;
  final BorderRadius borderRadius;

  LevelButton({@required this.numberLevel, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          builder: (context) => AlertDialog(
            content: Text('Has seleccionado el nivel $numberLevel'),
          ),
          context: context,
        );
      },
      child: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
          borderRadius: this.borderRadius != null
              ? this.borderRadius
              : BorderRadius.all(
                  Radius.circular(15),
                ),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            '${this.numberLevel}',
            style: TextStyle(
              color: Color(0xFF03245E),
              fontFamily: 'SweetPurple',
              fontSize: 35,
            ),
          ),
        ),
      ),
    );
  }
}
