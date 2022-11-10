import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var _dataController = TextEditingController();
/* typedef Sort = int Function(dynamic a, dynamic b);
typedef SortF = Sort Function(String sortField);

SortF alphabetic = (String sortField) => (a, b) {
      return b[sortField].toLowerCase().compareTo(a[sortField].toLowerCase());
    };

SortF number = (String sortField) => (a, b) {
      return a[sortField].compareTo(b[sortField]);
    }; */

class _MyHomePageState extends State<MyHomePage> {
  List<String> iDListtoShow = [];
  /* @override
  void initState() {
    setState(() {});
  } */

  List<String> khra = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade300,
          title: const Text("Home"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: _dataController,
                  maxLength: 54,
                  maxLines: null,
                  minLines: null,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter employee identification codes',
                  ),
                ),
              ),
              ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pink.shade300)),
                  child: const Text(
                    "Sort",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    var splitVar = _dataController.text.split("\n");
                    setState(() {
                      funcSort(splitVar);
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: (iDListtoShow.isNotEmpty)
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: iDListtoShow.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              title: Text(iDListtoShow[index]),
                            ),
                          );
                        })
                    : Text(""),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> funcSort(List<String> iDList) {
    for (var i = 0; i < iDList.length; i++) {
      iDList.sort(((a, b) {
        return a.compareTo(b);
      }));
    }

    print(iDList);
    for (var i = 0; i < iDList.length - 1; i++) {
      String x = "";
      int j = i + 1;
      if ((iDList[i][0] == iDList[j][0])) {
        if (iDList[i][9].compareTo(iDList[j][9]) > 0) {
          x = iDList[i];
          iDList[i] = iDList[j];
          iDList[j] = x;
        }
      }
    }
    print(iDList);
    for (var i = 0; i < iDList.length - 1; i++) {
      String x = "";
      int j = i + 1;
      if ((iDList[i][9].compareTo(iDList[j][9]) == 0) &&
          (iDList[i][0] == iDList[j][0])) {
        if (iDList[i].compareTo(iDList[j]) > 0) {
          x = iDList[i];
          iDList[i] = iDList[j];
          iDList[j] = x;
        }
      }
    }
    print(iDList);
    iDListtoShow = iDList;
    return iDList;
  }
}
