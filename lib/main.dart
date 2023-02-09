import 'package:bmi/jimi.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: jimiScreen(),
    );
  }
}
class MyHomePage extends StatefulWidget {
    @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result='';
  var bgColor=Colors.grey.shade300;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('JIMI BMI CALCULATOR')),
      ),
      body:Container(

        color: bgColor,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label:Text("Enter your weight (In Kgs)"),
                    prefixIcon: Icon(Icons.line_weight),


                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration:InputDecoration(
                    label:Text("Enter your height (in feet)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration:InputDecoration(
                    label:Text("Enter your height (in Inches)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: (){
                  var wt=wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch=inController.text.toString();

                  if(wt!=''&&ft!=''&& inch!=''){

                    var intwt=int.parse(wt);
                    var intft=int.parse(ft);
                    var ininch=int.parse(inch);

                    var tinch=(intft*12)+ininch;
                    var tcm=tinch*2.54;
                    var tm=tcm/100;
                    var bmi=intwt/(tm*tm);
                    var msg='';

                    if(bmi>25){
                      msg="You're over weight";
                      bgColor=Colors.orange.shade200;

                    }else if(bmi<18){
                      msg="You're underWeight";
                      bgColor=Colors.redAccent.shade200;

                    }else {
                      msg="You're healthy";
                      bgColor=Colors.green.shade200;

                    }
                    setState(() {
                      result='$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}';

                    });




                    //calculation
                  }else{
                    setState(() {
                      result='please fill all the required fields';
                    });

                  }




                }, child: Text("Calculate")),
                SizedBox(
                  height: 10,
                ),
                Text(result,style: TextStyle(fontSize: 19),),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
