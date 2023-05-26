import 'package:flutter/material.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/provider/profile/agenda_event_provider.dart';
import 'package:lft_new_project/widgets/profile/tab_bar/event_snippet.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common/utils/colors.dart';

class AgendaProfileWidget extends StatefulWidget {
  const AgendaProfileWidget({super.key});

  @override
  State<AgendaProfileWidget> createState() => _AgendaProfileWidgetState();
}

class _AgendaProfileWidgetState extends State<AgendaProfileWidget> {
  var _isInit = true;
  var _loading = false;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _loading = true;
      });
      context.read<AgendaEventProvider>().getEventsFct().then((_) {
        context.read<AgendaEventProvider>().eventsByDateFct(DateTime.now());
        setState(() {
          _loading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              const Gap(height: 10),
              Container(
                color: CommonColors.bluePale,
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 1, 1),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    // Provider
                    context
                        .read<AgendaEventProvider>()
                        .eventsByDateFct(selectedDay);
                    //
                    setState(() {
                      print('onDaySelected');
                      _selectedDay = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                ),
              ),
              const Gap(height: 15),
              const Text('Mes évènement'),
              const Gap(height: 15),
              const EventSnippet(),
            ],
          );
  }
}
