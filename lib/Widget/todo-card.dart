import 'package:flutter/material.dart';

class todocard extends StatelessWidget {


  // This widget is the root of your application.
 final String vartitle;
 final bool daneOrnot;
 final Function chageStatus;
 final int index;
 final Function delete;


 const todocard({Key? key, required this.vartitle, required this.chageStatus, required this.daneOrnot, required this.index, required this.delete }) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        chageStatus(index);

      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  color: daneOrnot? Color.fromARGB(255, 27, 26, 26) : Colors.white,
                  fontSize: 22,
                  decoration: daneOrnot? TextDecoration.lineThrough : TextDecoration.none,

                ),

              ),
              Row(
                children: [
                  Icon(
                    daneOrnot ? Icons.check : Icons.close,
                    color: daneOrnot ? Colors.green[400] : Colors.red,
                    size: 27,
                  ),
                  SizedBox(
                    width: 17,
                  ),

                  IconButton(
                      onPressed: (){
                        delete(index);
                      },
                      icon: Icon(Icons.delete),
                    color: Color.fromARGB(255, 255, 200, 196),
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(11),

          ),
        ),
      ),
    );

  }
}