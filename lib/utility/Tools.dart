import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {
  String title;
  TextEditingController inputControl;
  TextInputType inputType;
  CustomEditText(this.title, this.inputControl,this.inputType);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: inputType,
            style: TextStyle(
                color: Colors.black
            ),
            controller: inputControl,
            decoration: InputDecoration(
              labelText: title,
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              focusColor: Colors.black,
              labelStyle: TextStyle(
                  color: Colors.black
              ),

            ),
          ),
        )
    );
  }
}

class DataSource extends DataTableSource{
  final BuildContext context;
  List<List<String>> dataRow;


  DataSource(this.context, this.dataRow);

  @override
  DataRow getRow(int index) {
    List<DataCell> dataCells=[];
    List<String> stringCell=dataRow[index];
    for(int i=0;i<stringCell.length;i++){
      DataCell cell=new DataCell(Text(stringCell[i]));
      dataCells.add(cell);
    }
    print("Banyak Data Cell:"+dataCells.length.toString());
    return DataRow.byIndex(
        index:index,
        cells: [
          DataCell(Text(stringCell[0])),
          DataCell(Text(stringCell[1])),
          DataCell(Text(stringCell[2])),
          DataCell(Text(stringCell[3])),
        ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => dataRow.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}


class MyTable extends StatelessWidget {
  List<DataColumn> dataColumn;
  List<DataRow> dataRow;
  MyTable(this.dataColumn, this.dataRow);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: dataColumn,
        rows: dataRow,

    );
  }

}

DataColumn myColumn(String title){
  return DataColumn(label: Text(title,style: TextStyle(fontStyle: FontStyle.italic),));

}
