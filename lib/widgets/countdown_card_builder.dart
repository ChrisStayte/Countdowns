import 'package:countdowns/utilities/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

/// This is the countdown card that is used to show a preview on the 'add countdown page'
class CountdownCardBuilder extends StatelessWidget {
  final String? title;
  final DateTime? eventDate;
  final IconData? icon;
  final Color? color;
  final String? fontFamily;
  final Color? contentColor;

  const CountdownCardBuilder({
    Key? key,
    this.title,
    this.eventDate,
    this.icon,
    this.color,
    this.fontFamily,
    this.contentColor,
  }) : super(key: key);

  List<Widget> getStatus() {
    List<Widget> widgets = [];

    DateTime currentDate = DateTime.now();

    if (eventDate == null) return widgets;

    int numberOfDays = eventDate!.difference(currentDate).inDays;

    if (numberOfDays < 0) {
      widgets = [
        Icon(
          Icons.done,
          color: contentColor != null
              ? contentColor
              : color != null
                  ? color!.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white
                  : null,
        ),
        Text(
          '${eventDate?.month}.${eventDate?.day}.${eventDate?.year}',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: contentColor != null
                ? contentColor
                : color != null
                    ? color!.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white
                    : null,
            fontFamily: fontFamily,
          ),
        )
      ];
    } else if (numberOfDays > 0) {
      widgets = [
        Text(
          numberOfDays.toString(),
          style: TextStyle(
            fontSize: 16,
            color: contentColor != null
                ? contentColor
                : color != null
                    ? color!.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white
                    : null,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
          ),
        ),
        Text(
          numberOfDays == 1 ? 'DAY' : 'DAYS',
          style: TextStyle(
            color: contentColor != null
                ? contentColor
                : color != null
                    ? color!.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white
                    : null,
            fontSize: 12,
            fontWeight: FontWeight.w300,
            fontFamily: fontFamily,
          ),
        ),
      ];
    } else {
      widgets = [
        Icon(
          Icons.done,
          color: contentColor != null
              ? contentColor
              : color != null
                  ? color!.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white
                  : null,
        ),
        Text(
          'TODAY',
          style: TextStyle(
            fontSize: 12,
            color: contentColor != null
                ? contentColor
                : color != null
                    ? color!.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white
                    : null,
            fontWeight: FontWeight.w300,
            fontFamily: fontFamily,
          ),
        )
      ];
    }

    return widgets;
  }

  Widget getRow() => Row(
        children: [
          SizedBox(
            width: 44,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                icon ?? Icons.calendar_today,
                color: contentColor != null
                    ? contentColor
                    : color != null
                        ? color!.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white
                        : null,
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                title ?? '',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  // color: color != null ? Colors.white : null,
                  color: contentColor != null
                      ? contentColor
                      : color != null
                          ? color!.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white
                          : null,
                  fontFamily: fontFamily,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: getStatus(),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return color != null
        ? SizedBox(
            height: 74,
            child: Card(color: color, child: getRow()),
          )
        : Container(
            decoration: BoxDecoration(
              border: Border.all(
                //UPDATE: whenever the app changes with system settings we need to update this to watch maybe?
                color: context.read<SettingsProvider>().settings.darkMode
                    ? Colors.white
                    : Colors.black,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            height: 74,
            child: getRow(),
          );
  }
}
