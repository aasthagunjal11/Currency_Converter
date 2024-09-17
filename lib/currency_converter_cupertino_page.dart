import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
   final TextEditingController textEditingController = TextEditingController();
   void convert(){
     setState(() 
     {
       result = double.parse(textEditingController.text)*83.81;
     });
   }

    @override
   void dispose(){
    textEditingController.dispose();
    super.dispose();
   }

  @override
  Widget build(BuildContext context) {
//      final border = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(
//         20
//       ),
//       borderSide: const BorderSide(
//         width: 2.0,
//         style: BorderStyle.solid,
//     ),
//  );
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(  // first appBar is a property of a scaffold widget and the second AppBar() is a widget
        backgroundColor: CupertinoColors.systemGrey3,
        middle: const Text(
          "Currency Coverter",
          style:  TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          ),
          automaticallyImplyMiddle: true,
      ),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //int -> string integervalue.toString()
            // String-> int int.parse(stringvalue)
             Text(
              "INR ${result.toString()}",
              style: const TextStyle(
                fontSize: 45,
                color:Colors.white,
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoTextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: CupertinoColors.black,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(  // nuberwithoptions allows us to put a decimal
                    decimal: true,
                  ),
                  placeholder: "Please enter the amount in USD",
                  prefix: const Icon(CupertinoIcons.money_dollar),
                  
                ),
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CupertinoButton(
                color: CupertinoColors.black,
                
                onPressed:convert,  // dont write it as onPressed: covert(), becoz onpressed does not support void 
                child: const Text(
                  "Convert",
                  style: TextStyle(
                    color: CupertinoColors.white,
                  ),
                  ), 
                
                ),
             ),
            ],
          ),
        )
      ); 
  }
}