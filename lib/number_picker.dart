import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';


class NumberPickerScreen extends StatefulWidget {
  @override
  _NumberPickerScreenState createState() => _NumberPickerScreenState();
}

class _NumberPickerScreenState extends State<NumberPickerScreen> {
  int currentIntValue= 10;
  double currentDoubleValue = 3.0;

  NumberPicker intNumberPicker, decNumberPicker;

  //method untuk handle value ketika berubah
  handleValueChanged(num value){
    if(value != null){
      if(value is int){
        setState(() {
          currentIntValue = value;
        });
      } else {
        setState(() {
          currentDoubleValue = value;
        });
      }
    }
  }

  handleValueChangedExternally(num value){
    if(value != null){
      if(value is int){
        setState(() {
          currentIntValue = value;
          intNumberPicker.animateInt(value);
        });
      }else{
        setState(() {
          currentDoubleValue = value;
          decNumberPicker.animateDecimal(value);
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    intNumberPicker = new NumberPicker.integer(
      initialValue: currentIntValue,
      minValue: 0,
      maxValue: 100,
      step: 10,
      onChanged: handleValueChanged);
    decNumberPicker = new NumberPicker.decimal(
        initialValue: currentDoubleValue,
        minValue: 1,
        maxValue: 5,
        decimalPlaces: 2,
        onChanged: handleValueChanged);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Number Picker'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            intNumberPicker,
            RaisedButton(
              onPressed: (){
                showIntegerDialog();
              },
              child: Text("Current int value : $currentIntValue"),
              color: Colors.green,
            ),
            decNumberPicker,
            RaisedButton(
              onPressed: (){
                showDialogDouble();
              }, child: Text("Current Decimal value : $currentDoubleValue"),
            )
          ],
        ),
      ),
    );
    // return Container();
  }

  Future showIntegerDialog() async{
    await showDialog<int>(
      context: context,
      builder: (BuildContext context){
        return NumberPickerDialog.integer(
            minValue: 0,
            maxValue: 100,
            initialIntegerValue: currentIntValue);
      }
    ).then(handleValueChangedExternally);
  }

  Future showDialogDouble() async{
    await showDialog<double>(
        context: context,
        builder: (BuildContext context){
          return NumberPickerDialog.decimal(
            minValue: 1,
            maxValue: 5,
            initialDoubleValue: currentDoubleValue,
            decimalPlaces: 2,
            title: Text('Silahkan pilih bilangan desimal'),
          );
        }
    ).then(handleValueChangedExternally);
  }
}
