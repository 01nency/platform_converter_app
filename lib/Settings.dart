import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:convert_platform/misc/color.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String ampm = "AM";
  TimeOfDay? time = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 20, color: AppColors.commonColor),
                        ),
                      ),
                      Text(
                        DateFormat('dd,MMM yyyy').format(_dateTime),
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.commonColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: OutlinedButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: _dateTime,
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));
                              if (pickedDate != null) {
                                pickedDate;
                                setState(() {
                                  _dateTime = pickedDate;
                                });
                              }
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 124),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.commonColor),
                            ),
                            child: const Text(
                              'Change Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              "Time",
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.commonColor),
                            ),
                          ),
                          Text(
                            time!.format(context),
                            style: const TextStyle(
                              fontSize: 20,
                              color: AppColors.commonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          Center(
                            child: OutlinedButton(
                              onPressed: () async {
                                var pickedtime = await showTimePicker(
                                    context: context, initialTime: time!);
                                if (pickedtime != null) {
                                  // ignore: use_build_context_synchronously
                                  pickedtime.format(context);
                                  setState(() {
                                    time = pickedtime;
                                  });
                                }
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 118),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.commonColor),
                              ),
                              child: const Text(
                                '  Change Time  ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
