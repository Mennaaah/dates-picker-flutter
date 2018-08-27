import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';
class StateModel extends Model {
   List<DateTime> _dates=[];
     List get dates=>_dates;
 


void generateNextDays(DateTime startingDate) {
     final int days = 5; //Test with 5,15,20
   
     //Now our list has the starting date
     _dates.add(startingDate);

 int i=0;
 int j=1;
     DateTime d2;
while (_dates.length<6){
d2=_dates[i].add(new Duration(days:j*1));
var formatter= new DateFormat('E');
if(formatter.format(d2)!="Fri" && formatter.format(d2)!="Sat"){
//if(d2.weekday!= 6 && d2.weekday!=7){
_dates.add(d2);
print(formatter.format(d2));
print(d2);
i++;
j=0;
}
   j++;
}
  }
 
 
                 notifyListeners();
}



void main() => runApp(new DatePickerTask());




class DatePickerTask extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ScopedModel( 
       model: StateModel(),
          
       child: new MaterialApp(
          home:ScopedModelDescendant(                  //return a NEW SCAFELED ON THE SCOPED MODEL
              // rebuildOnChange: ,
              builder: (_, __, StateModel stateModel) {
        return new  Scaffold(
        appBar: AppBar(title: Text('Date Picker Task')),
        body: new Column( 
            children: <Widget> [
              new Container(
            child:ListView.builder(
      //Delegate: SliverGridDelegateWithFixedCrossAxisCount(
        //crossAxisCount: 2
      itemCount: stateModel.dates.length,
      itemBuilder: (context, i) {
        return ( ListTile(
          title: Text(stateModel.dates[i]),  
         )
        ); 
         },
         ),
              ),
          new   Container( 
            child:Builder(
          builder: (con) => RaisedButton(
                textColor: Theme.of(context).accentTextTheme.display1.color,
                color: Theme.of(context).primaryColor,
                child: Text('Choose a starting date'),
              
                onPressed: () => showDatePicker(
                      context: con,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 30)),
                      lastDate: DateTime.now().add(Duration(days: 30)),
                    )
                        //After we choose a date from the picker we call out function with the chosen date
                        .then((DateTime val) => stateModel.generateNextDays(val)),
              ),
              
        ),
           )
            ]
          )
            );
              }
              )
         
        
        )
           );
            
              }
          
    
      

              }



        
       
        
            
         
         
        

          
        
    
    
               
           
       
    
              
  

  _generateNextDays(DateTime startingDate) {
    print(startingDate);
     final int days = 5; //Test with 5,15,20
     final List<DateTime> dates = [];
     //Now our list has the starting date
     dates.add(startingDate);

 int i=0;
     DateTime d2;
while (dates.length<5){
d2=dates[i].add(new Duration(days:1));
var formatter= new DateFormat('E');
if(formatter.format(d2)!="Friday" && formatter.format(d2)!="Saturday"){
dates.add(d2);
    //Implment your task in this function
    //If you need to, the docs for [DateTime] class from here:
    //  https://api.dartlang.org/stable/2.0.0/dart-core/DateTime-class.ht
  }

}
print(days);
  }

