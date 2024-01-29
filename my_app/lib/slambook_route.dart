import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'friends_route.dart';
import 'ScreenArguments.dart';
import 'initial_route.dart';

class SlambookRoute extends StatefulWidget {
  static const routename = '/slambook';
  SlambookRoute({super.key});

  @override
  _SlambookRouteState createState() => _SlambookRouteState();
}

class _SlambookRouteState extends State<SlambookRoute> {
  bool showWidget = false;
  bool _inaRelationship = false;
  double _currentSliderValue = 5;
  String? _currentMotto = "Haters gonna hate";
  String? _dropDownValue = _dropdownOptions.first;
  static List<Map> summaries = [];

  static final List<String> _dropdownOptions = [
    "Makalipad",
    "Maging Invisible",
    "Mapaibig siya",
    "Mapabago ang isip niya",
    "Mapalimot siya",
    "Mabalik ang nakaraan",
    "Mapaghiwalay sila",
    "Makarma siya",
    "Mapasagasaan siya sa pison",
    "Mapaitim ang tuhod ng iniibig niya"
  ];

  static final Map<String, bool> _motto = {
    "Haters gonna hate": true,
    "Bakers gonna Bake": false,
    "If cannot be, borrow one from three": false,
    "Less is more, more or less": false,
    "Better late than sorry": false,
    "Don't talk to strangers when your mouth is full": false,
    "Let's burn the bridge when we get there": false
  };

  // controllers for textformfields
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(() {
      print("Latest Value: ${_nicknameController.text}");
    });
    _nameController.addListener(() {
      print("Latest Value: ${_nameController.text}");
    });
    _ageController.addListener(() {
      print("Latest Value: ${_ageController.text}");
    });
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('SlamBook'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Friends'),
              onTap: () {
                if (summaries.length == 0) {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    InitialRoute.routename,
                  );
                }
                else {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    FriendsRoute.routename,
                    arguments: ScreenArguments(
                        title: "Friends", message: summaries),
                  );
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Slambook"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "The Tita Slambook",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Name",
                          labelText: "Name"),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nickname",
                          labelText: "Nickname"),
                      controller: _nicknameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Age",
                              labelText: "Age"),
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text("In a relationship?"),
                              Switch(
                                // This bool value toggles the switch.
                                value: _inaRelationship,
                                activeColor: Colors.blue,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    _inaRelationship = value;
                                  });
                                },
                              ),
                            ],
                          ))
                    ]),
                  ),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(children: [
                        Text(
                          "Happiness Level",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "On a scale of 1-happy, gano kasaya ang adulting?",
                          style: TextStyle(fontSize: 12),
                        ),
                        Slider(
                          value: _currentSliderValue,
                          max: 10,
                          divisions: 10,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      ])),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(children: [
                        Text(
                          "Superpower",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "If you were to have a superpower, what would you choose?",
                          style: TextStyle(fontSize: 12),
                        ),
                        DropdownButtonFormField<String>(
                          value: _dropDownValue,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              _dropDownValue = value!;
                            });
                          },
                          items: _dropdownOptions.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onSaved: (newValue) {
                            print("Checkbox onSaved method triggered");
                          },
                        ),
                      ])),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      Text(
                        "Motto",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: <Widget>[
                          for (var v in _motto.keys)
                            ListTile(
                              title: Text("$v", style: TextStyle(fontSize: 13)),
                              leading: Radio<String>(
                                value: v,
                                groupValue: _currentMotto,
                                onChanged: (String? value) {
                                  setState(() {
                                    _currentMotto = value;
                                  });
                                },
                              ),
                            ),
                        ],
                      )
                    ]),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        setState(() {
                          showWidget = true;
                        });
                        Map<String, String> _summary = {
                          "Name": _nameController.text,
                          "Nickname": _nicknameController.text,
                          "Age": _ageController.text,
                          "In a Relationship": "$_inaRelationship",
                          "Happiness": "$_currentSliderValue",
                          "Super Power": "$_dropDownValue",
                          "Motto": "$_currentMotto"
                        };
                        summaries.add(_summary); // adding the summary map into the summaries list of maps
                      }
                    },
                    child: const Text('Done'),
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  showWidget
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Column(
                            children: [
                              Text(
                                "Summary",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 99),
                                    child: Text(
                                      "${_nameController.text}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Nickname",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 76),
                                    child: Text(
                                      "${_nicknameController.text}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Age",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 109),
                                    child: Text(
                                      "${_ageController.text}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "In a relationship?",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 37),
                                    child: Text(
                                      "${_inaRelationship}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Happiness",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 75),
                                    child: Text(
                                      "$_currentSliderValue",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Super Power",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 62),
                                    child: Text(
                                      "$_dropDownValue",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Motto in Life",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 60),
                                      child: Text(
                                        "$_currentMotto",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showWidget = false;
                        _nameController.text = "";
                        _nicknameController.text = "";
                        _ageController.text = "";
                        _inaRelationship = false;
                        _currentSliderValue = 5;
                        _currentMotto = "Haters gonna hate";
                        _dropDownValue = _dropdownOptions.first;
                      });
                    },
                    child: const Text('Reset'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
