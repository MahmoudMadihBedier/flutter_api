import 'package:flutter/material.dart';
import 'package:session17/test/test_model/test_model.dart';
import 'package:session17/test/test_service/test_service.dart';
import 'package:session17/test/widgets/test_widget.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  TestService testService = TestService();
  Future<List<TestModel>>? testModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    testModel = testService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
        ),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return FutureBuilder(
                    future: testModel,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PostWidget(
                            title: snapshot.data![index].title,
                            body: snapshot.data![index].body);
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return CircularProgressIndicator();
                      }
                    });
              })),
    );
  }
}
