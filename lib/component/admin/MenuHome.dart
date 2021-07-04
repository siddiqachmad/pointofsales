import 'dart:io';

import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'package:smartpointofsales/component/model/menumakanan.dart';
import 'package:smartpointofsales/constants.dart';
import 'package:smartpointofsales/utility/Tools.dart';

class MenuHome extends StatefulWidget {
  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  TextEditingController nama = new TextEditingController();
  TextEditingController harga = new TextEditingController();
  String path="";
  List<DataColumn> myTableColumn=[
    myColumn("Id"),
    myColumn("Nama Makanan"),
    myColumn("Harga")
  ];
  List<DataRow> myTableRow=[];
  List<Menumakanan> dataMenu=[];
  getFile(){
    final file = OpenFilePicker();
    final result = file.getFile();
    if(result!=null){
      print(result.path);
      path=result.path;
    }else{
      print("gagal");
    }
    gambarFile();
    setState(() {

    });

  }

  Widget gambarFile(){
    if(path!=""){
      print("masuk file");
      return Image.file(File(path), width: 100.0, height: 100.0,);
    }else{
      return Image.asset("assets/images/asoftlogopos.png");
    }
  }
  populateRow(){
    for(int i=0;i<10;i++){
      Menumakanan objMenuMakanan=new Menumakanan(i.toString(), "Makanan "+i.toString(), "100000");
      dataMenu.add(objMenuMakanan);
    }
    
    for(int i=0;i<dataMenu.length;i++){
      myTableRow.add(DataRow(cells: [
        DataCell(Text(dataMenu[i].id)),
        DataCell(Text(dataMenu[i].nama)),
        DataCell(Text(dataMenu[i].harga)),
      ]));
    }
  }

  Widget formTambah(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Form Tambah Menu Makanan",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Expanded(
              child: Card(
                  elevation: 5.0,
                  color: secondaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomEditText("Nama Makanan", nama,TextInputType.text),
                          CustomEditText("Harga Makanan", harga,TextInputType.number),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: (){
                                  getFile();
                                },
                                child: Text("Pilih Gambar")
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Text(path),
                          )
                        ],
                      ),
                      Expanded(child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: generateTable(),
                          )
                      ))
                    ],
                  )
              )
          ),
          /*Expanded(
              child: SingleChildScrollView(
                child: generateTable(),

              )
          )*/
        ],
      ),
    );
  }
  Widget generateTable(){
    if(myTableRow.length>0){
      return MyTable(myTableColumn, myTableRow);
    }else{
      return Text("Loading...");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    this.populateRow();
    super.initState();
  }
 /* Widget loadingWait(){
    if(dataRow.length>0){
      return  PaginatedDataTable(
          header: Text('Header Text'),
          rowsPerPage: 4,
          columns: [
            DataColumn(label: Text("Data Header A")),
            DataColumn(label: Text("Data Header B")),
            DataColumn(label: Text("Data Header C")),
            DataColumn(label: Text("Data Header D")),
          ],
          source: DataSource(context, dataRow));
    }else{
      return Text("Loading...");
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: formTambah());
  }

}
