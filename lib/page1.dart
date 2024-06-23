import 'package:flutter/material.dart';




class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page1> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 19, 22),
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result.toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 214, 112, 29),
              ),
            ),
            Textbox(
              hintText: "Enter first number",
              controller: _controller1,
            ),
            Textbox(
              hintText: "Enter second number",
              controller: _controller2,
            ),
            Container(
              width:double.infinity,
              child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [button("Add"),
            button("Sub"),],
            ),
            ),

            Container(
              width:double.infinity,
              child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [button("Mul"),
            button("Div"),],
            ),
            )
  
          ],
        ),
      ),
    );
  }

  Container button(String a) {
    
    return Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  double num1 = double.tryParse(_controller1.text) ?? 0;
                  double num2 = double.tryParse(_controller2.text) ?? 0;
                  switch(a)
                  {
                    case "Add":
                      result=num1+num2;
                      break;
                    case "Sub":
                      result=num1-num2;
                      break;
                    case "Mul":
                      result=num1*num2;
                      break;
                    case "Div":
                      result=num1/num2;
                      break;
                  }
                });
                  
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              child:  Text(a),
            ),
          );
  }
}

class Textbox extends StatelessWidget {
  const Textbox({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: const Icon(Icons.monetization_on),
          prefixIconColor: Colors.amber,
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}
