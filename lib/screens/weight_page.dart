import 'package:flutter_provide_pack/models/weight.dart';
import 'package:flutter_provide_pack/states/weight_state.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class WeightPage extends StatelessWidget {

  final Function longPressCallBack;

  WeightPage({this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Ticker'),
        backgroundColor: Colors.lightGreen.withOpacity(0.5),
        actions: [Icon(Icons.search)],

      ),
      body:
      Consumer<WeightState>(
        builder: (context,state,widget) {
          var weights=state.weights;
          return Container(
          child: Column(
            children:<Widget> [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Current weight"),
                    SizedBox(width: 10,),
                    Text(weights.first.value.toString(),textScaleFactor: 2,),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(


                  itemBuilder: (BuildContext context,int index){
                    var weight=weights[index];
                    return ListTile(

                      trailing:Text(weight.value.toString(),),
                      
                      title: Text(
                      "${ weight.dateTime.day}.${ weight.dateTime.month}.${ weight.dateTime.year}",
                      ),
                      subtitle: Text('Diet Time:'+ weight.diet.toString()+'day'),

                      onLongPress: (){
                        state.delete(weight);
                      },
                      
                      
                    );
                },
                  itemCount: state.weights.length,
                ),
              ),
            ],

          ),
        );}
      ),

      floatingActionButton: Row(
        children: [
          FloatingActionButton(
          onPressed:()async{
            var state=Provider.of<WeightState>(context,listen: false);
            var result=await showDialog<double>(
                context: context,
                builder: (context)=> NumberPickerDialog.decimal(minValue: 1, maxValue: 200, initialDoubleValue: state.weights.first.value)
            );
            if(result!=null && result>0){
              state.add(Weight(value:result,dateTime:DateTime.now()));
            }
          },
          child:Icon(Icons.add),

        ),
        ]
      ),


    );


  }
}
