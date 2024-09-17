import 'package:flutter/material.dart';
class CurrencyConverterMaterialPage extends StatefulWidget{
    const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>_CurrencyConverterMaterialPageState();
}
class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage>{
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
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        20
      ),
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
    ),
 );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(  // first appBar is a property of a scaffold widget and the second AppBar() is a widget
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          "Currency Coverter",
          style:  TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          ),
          centerTitle: true,
      ),
        body: Center(
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
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Please enter the amount in USD",         // LabelText, helperText
                    hintStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: const Icon(Icons.monetization_on_outlined),   // suffixIcon
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder:border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(  // nuberwithoptions allows us to put a decimal
                    decimal: true,
                  ),
                  
                ),
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 15,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(150, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                ),
                onPressed:convert,  // dont write it as onPressed: covert(), becoz onpressed does not support void 
                child: const Text("Convert"), 
                
                ),
             ),
            ],
          ),
        )
      ); 
  }
}
