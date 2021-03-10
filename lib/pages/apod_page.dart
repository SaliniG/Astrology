import 'package:astrology/view%20models/planetary_data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class APODPage extends StatefulWidget {
  @override
  _APODPageState createState() => _APODPageState();
}

class _APODPageState extends State<APODPage> {
  final TextEditingController _controller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    Provider.of<PlanetaryDataViewModel>(context, listen: false).fetchAstroDetails(
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}");
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        Provider.of<PlanetaryDataViewModel>(context, listen: false)
            .fetchAstroDetails("${picked.year}-${picked.month}-${picked.day}");
      });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PlanetaryDataViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("APOD"),
          actions: [
            GestureDetector(
              onTap: () => {_selectDate(context)},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.calendar_today),
              ),
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Expanded(
                  child: !vm.loading
                      ? AspectRatio(
                          child: Image.network(
                            vm.data.planetary.url,
                            fit: BoxFit.contain,
                          ),
                          aspectRatio: 3 / 2,
                        )
                      : Center(
                          child: Container(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator())))
            ])));
  }
}
