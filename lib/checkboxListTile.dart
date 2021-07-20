import 'package:e_permanentka/enum/training_type_enum.dart';
import 'package:e_permanentka/screens/season_ticket_screen.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';
import 'package:e_permanentka/widgets/online_training_widget.dart';
import 'package:e_permanentka/widgets/outside_training_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'value_objects/checkbox_value_object.dart';

late final EPermanentkaValueObject ePermanentkaValueObject;

// ignore: must_be_immutable
class FlexibleCheckboxListTile extends StatefulWidget {
  CheckboxValueObject checkboxValueObject;

  FlexibleCheckboxListTile(this.checkboxValueObject);

  @override
  _FlexibleCheckboxListTileState createState() =>
      _FlexibleCheckboxListTileState();
}

class _FlexibleCheckboxListTileState extends State<FlexibleCheckboxListTile> {
  DateTime selectedDate = DateTime.now();
  User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    CheckboxValueObject checkboxValueObject = widget.checkboxValueObject;
    selectedDate = (checkboxValueObject.broadcasted != null
        ? checkboxValueObject.broadcasted
        : DateTime.now())!;

    return getTrainingData(checkboxValueObject);
  }

  getTrainingData(CheckboxValueObject checkboxValueObject) {
    if (checkboxValueObject.trainingType == TrainingType.Outside) {
      return OutsideTraining(checkboxValueObject);
    } else if (checkboxValueObject.trainingType == TrainingType.Online) {
      return Column(
        children: [
          OnlineTraining(checkboxValueObject),
        ],
      );
    } else {
      return SeasonTicketScreen();
    }
  }
}
