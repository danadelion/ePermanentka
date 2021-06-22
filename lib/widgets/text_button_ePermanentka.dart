import 'package:e_permanentka/screens/season_ticket_screen.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';
import 'package:e_permanentka/value_objects/season_ticket_screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:e_permanentka/constants.dart';

class TextButtonEPermanentka extends StatefulWidget {
  EPermanentkaValueObject ePermanentkaValueObject;

  TextButtonEPermanentka(this.ePermanentkaValueObject);

  @override
  _TextButtonEPermanentkaState createState() => _TextButtonEPermanentkaState();
}

class _TextButtonEPermanentkaState extends State<TextButtonEPermanentka> {
  @override
  Widget build(BuildContext context) {
    DateTime date = widget.ePermanentkaValueObject.created;
    var createdDate = DateTime(date.year, date.month, date.day);
    String exparing =
        '${createdDate.day}.${createdDate.month + 5}.${createdDate.year}';

    int numberOfReceivedCheckboxes = 12 - 1;

    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  // side: BorderSide(color: Colors.red),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, SeasonTicketScreen.id,
                  arguments: SeasonTicketScreenArguments(
                      widget.ePermanentkaValueObject));
            },
            child: Text(
              ' 12 vstupů ',
              style: kFontStyle0xFFF15124,
            ),
          ),
          SizedBox(
            width: 24.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'vyprší $exparing',
                style: kFontStyleBlack15,
              ),
              Container(
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1.0, color: Colors.black)),
                child: Text(
                  'zbývá $numberOfReceivedCheckboxes vstupů',
                  style: kFontStyleBlack15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
