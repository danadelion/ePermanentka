import 'package:e_permanentka/checkboxListTile.dart';
import 'package:e_permanentka/enum/training_type_enum.dart';
import 'package:e_permanentka/repositories/checkbox_repository.dart';
import 'package:e_permanentka/value_objects/checkbox_value_object.dart';
import 'package:flutter/material.dart';

class ChoiceOfTraining extends StatefulWidget {
  final CheckboxValueObject checkBoxValueObject;
  ChoiceOfTraining(this.checkBoxValueObject);

  @override
  _ChoiceOfTrainingState createState() => _ChoiceOfTrainingState();
}

class _ChoiceOfTrainingState extends State<ChoiceOfTraining> {
  // late CheckBoxRepository checkBoxRepository = CheckBoxRepository();
  final CheckBoxRepository _checkBoxRepository = CheckBoxRepository();

  @override
  Widget build(BuildContext context) {
    CheckboxValueObject checkBoxValueObject = widget.checkBoxValueObject;

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

    List<Widget> actions = [
      backToSeasonTicket,
      onlineTrainingButton,
    ];
    if (11.5 > checkBoxValueObject.ePermanentkaValueObject.countCheckboxes()) {
      actions.add(outsideTrainingButton);
    }

    AlertDialog alert = AlertDialog(
      title: Text('Vyber si druh tréninku'),
      content: Text(''),
      actions: actions,
    );
    return alert;
  }
}
