import 'package:anilquizapp/Model/ScoreModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreCard extends StatefulWidget {
  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  List<DataRow> _rowList;

  DataRow returnRowData(name, score, index) {
    return DataRow(cells: <DataCell>[
      DataCell(Text('$index')),
      DataCell(Text(name)),
      DataCell(Text(score)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<ScoreModel> _scoreList = Provider.of<List<ScoreModel>>(context);
    _rowList = List<DataRow>();
    if(_scoreList != null ){
    _scoreList.sort((a, b) {
      return b.score.compareTo(a.score);
    });
    for (var i = 0; i < _scoreList.length; i++) {
      _rowList
          .add(returnRowData(_scoreList[i].name, _scoreList[i].score, i + 1));
    }
    }
    
    return Scaffold(
      body: _scoreList == null ? Container() : ListView(
          physics: _scoreList.length <= 0
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(label: Text('Rank')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Score')),
              ],
              rows: List.generate(_rowList.length, (index) => _rowList[index]),
            ),
            _scoreList.length <= 0 ?SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Text("No Record Found!!!",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ) : Container()
          ]),
    );
  }
}
