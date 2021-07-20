import 'package:e_permanentka/enum/training_type_enum.dart';
import 'package:e_permanentka/repositories/checkbox_repository.dart';
import 'package:e_permanentka/value_objects/checkbox_value_object.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';
import 'package:e_permanentka/value_objects/season_ticket_screen_arguments.dart';
import 'package:e_permanentka/widgets/choice_of_training.dart';
import 'package:e_permanentka/widgets/online_training_widget.dart';
import 'package:e_permanentka/widgets/outside_training_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_permanentka/checkboxListTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_permanentka/constants.dart';
import '../checkboxListTile.dart';

List<FlexibleCheckboxListTile> flexibleCheckboxListTiles = [];

class SeasonTicketScreen extends StatefulWidget {
  static const String id = 'season_ticket_screen';

  @override
  _SeasonTicketScreenState createState() => _SeasonTicketScreenState();
}

class _SeasonTicketScreenState extends State<SeasonTicketScreen> {
  final CheckBoxRepository checkboxRepository = CheckBoxRepository();
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  var receivedCheckboxes = [];
  bool isLoading = true;
  User? loggedInUser;
  late int numberOfReceivedCheckboxes;
  double count = 0;

  void initState() {
    super.initState();
    numberOfReceivedCheckboxes = receivedCheckboxes.length;

    getCurrentUser();
  }

  Widget buildLoading() => Center(
        child: CircularProgressIndicator(
          strokeWidth: 6.0,
        ),
      );

  Future<void> getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final SeasonTicketScreenArguments seasonTicketScreenArguments =
        ModalRoute.of(context)!.settings.arguments
            as SeasonTicketScreenArguments;

    EPermanentkaValueObject ePermanentkaValueObject =
        seasonTicketScreenArguments.ePermanentkaValueObject;

    return Scaffold(
      backgroundColor: kColorFitM,
      appBar: AppBar(
        leading: null,
        title: Text(
          loggedInUser?.displayName ?? 'unknown',
          style: kFontStyleWhiteSize20,
        ),
        backgroundColor: kColorFitM,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ...ePermanentkaValueObject.listOfCheckboxes.map(
                        (checkboxValueObject) =>
                            FlexibleCheckboxListTile(checkboxValueObject))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  12 > ePermanentkaValueObject.countCheckboxes()
                      ? FloatingActionButton(
                          onPressed: () async {
                            CheckboxValueObject checkboxValueObject =
                                CheckboxValueObject(
                                    ePermanentkaValueObject, Map());
                            await showDialog(
                                context: context,
                                builder: (_) {
                                  return ChoiceOfTraining(checkboxValueObject);
                                });
                            setState(() {
                              ePermanentkaValueObject.listOfCheckboxes
                                  .add(checkboxValueObject);
                              getTrainingData(checkboxValueObject);
                            });
                            // flexibleCheckboxListTiles.add(FlexibleCheckboxListTile(
                            //     CheckboxValueObject(checkBoxValueObject, )));
                          },
                          child: Icon(
                            Icons.add,
                            color: kColorFitM,
                          ),
                          backgroundColor: Colors.white,
                        )
                      : Row(
                          children: [
                            Text(
                              'žádné další vstupy',
                              style: kFontStyleBlackSize20,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.cancel_outlined,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                  //
                ],
              ),
              SizedBox(
                child: Divider(
                  color: Colors.black,
                ),
                height: 25.0,
                width: 250.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'zbývá ',
                    style: kFontStyleWhite,
                  ),
                  Text(
                    '${12 - ePermanentkaValueObject.countCheckboxes()} ',
                    style: kFontStyleBlackSize20,
                  ),
                  Text(
                    'z 12 vstupů',
                    style: kFontStyleWhite,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
      return null;
    }
  }
}
