import 'package:flutter/material.dart';




class  Steppers extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Steppers> {
  int _steppercount = 0;

  List<Step> _steps(){

    List<Step> mysteps = [
       Step(title: Text("Step 1"),
           content: TextField(),
           isActive: _steppercount >= 0,
       ),
       Step(title: Text("Step 2"),
         content: TextField(),
         isActive: _steppercount >= 1,
       ),
       Step(title: Text("Step 3"),
         content: TextField(),
         isActive: _steppercount >= 2,
       )
    ];
    
    return mysteps;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Stepper'),
      ),
      body: Stepper(
        steps: _steps(),
        currentStep: _steppercount,
        onStepTapped: (step){setState(() {_steppercount=step;});},
        onStepContinue: (){
          setState(() {
            if(this._steppercount < _steps().length-1){
              this._steppercount = _steppercount+1;
            }
          });
        },
        onStepCancel: (){
          setState(() {
            if(this._steppercount > 0){
              this._steppercount = _steppercount-1;
            }
          });
        },
        type: StepperType.vertical,
//          controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
//            return Row(
//              mainAxisSize: MainAxisSize.max,
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                RaisedButton(
//                  onPressed: onStepCancel,
//                  child: const Text('Back!'),
//                ),
//                RaisedButton(
//                  onPressed: onStepContinue,
//                  child: const Text('Next!'),
//                ),
//              ],
//            );
//          },
      ),
    );
  }
}

