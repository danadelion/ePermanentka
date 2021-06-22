import 'package:e_permanentka/enum/training_type_enum.dart';
import 'package:e_permanentka/repositories/checkbox_repository.dart';
import 'package:e_permanentka/value_objects/checkbox_value_object.dart';
import 'package:flutter/material.dart';

class ChoiceOfTraining extends StatefulWidget {
  final CheckBoxValueObject checkBoxValueObject;
  ChoiceOfTraining(this.checkBoxValueObject);

  @override
  _ChoiceOfTrainingState createState() => _ChoiceOfTrainingState();
}

class _ChoiceOfTrainingState extends State<ChoiceOfTraining> {
  // late CheckBoxRepository checkBoxRepository = CheckBoxRepository();
  final CheckBoxRepository _checkBoxRepository = CheckBoxRepository();

  @override
  Widget build(BuildContext context) {
    CheckBoxValueObject checkBoxValueObject = widget.checkBoxValueObject;

    Widget outsideTrainingButton = TextButton(
      child: Text('venkovní'),
      onPressed: () async {
        checkBoxValueObject.trainingType = TrainingType.Outside;
        await _checkBoxRepository.save(checkBoxValueObject);
        Navigator.pop(context);
      },
    );
    Widget onlineTrainingButton = TextButton(
      child: Text('online'),
      onPressed: () {
        checkBoxValueObject.trainingType = TrainingType.Online;
        _checkBoxRepository.save(checkBoxValueObject);
        Navigator.pop(context);
      },
    );
    Widget backToSeasonTicket = TextButton(
      child: Text('zpět'),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Vyber si druh tréninku'),
      content: Text(''),
      actions: [
        backToSeasonTicket,
        outsideTrainingButton,
        onlineTrainingButton,
      ],
    );
    return alert;
  }
}

// choiceOfTraining(BuildContext context) {
//   // set up the buttons
// }

// DropdownButton<String>(
// value: dropdownValue,
// icon: const Icon(Icons.arrow_downward),
// iconSize: 24,
// elevation: 16,
// style: const TextStyle(color: Colors.deepPurple),
// underline: Container(
// height: 2,
// color: Colors.deepPurpleAccent,
// ),
// onChanged: (String? newValue) {
// setState(() {
// dropdownValue = newValue!;
// });
// },
// items: <String>['vyber druh tréninku', 'venkovní', 'online']
// .map<DropdownMenuItem<String>>((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
