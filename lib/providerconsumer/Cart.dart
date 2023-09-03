import 'package:flutter/cupertino.dart';

import 'package:hive/hive.dart';
import 'package:tager/adabteraddorder.dart';
import 'package:tager/adapter.dart';
// import 'package:jiffy/jiffy.dart';

class cart extends ChangeNotifier {
  late Box namebox1 = Hive.box("nameclients");
  late Box prodectbox1 = Hive.box<prodect>("prodect");
  late Box addorderbox1 = Hive.box<addorder>("addorder1");

  TextEditingController namecontroller = new TextEditingController();

  TextEditingController nameclientcontroler = new TextEditingController();
  TextEditingController prodectclientcontroler = new TextEditingController();
  TextEditingController prodectAmountclientcontroler =
      new TextEditingController();
  late int idclient;
  late int idprodect;
  late String price;

  TextEditingController nameprodect1 = new TextEditingController();
  TextEditingController priceprodect1 = new TextEditingController();

  late String name1;
  late String nameprodect2;
  late String priceprodect2;

  late String getnameclientorder;
  late String getnameprodectorder;
  late double gettotalpriceorder;
  late double getamountorder;

  //name
  void getname(int id) {
    name1 = namebox1.getAt(id);
    //notifyListeners();
  }

  void putname(String namein) {
    namebox1.add(namein);
    namecontroller.text = "";
    notifyListeners();
  }

  void deletename(int id) {
    namebox1.deleteAt(id);
    notifyListeners();
  }

  //prodect

  void putprodect(String nameprodect, String priceprodect) {
    prodectbox1
        .add(prodect(nameprodect: nameprodect, priceprodect: priceprodect));
    nameprodect1.text = "";
    priceprodect1.text = "";
    notifyListeners();
  }

  void getprodect(int i) {
    nameprodect2 = prodectbox1.getAt(i).nameprodect;
    priceprodect2 = prodectbox1.getAt(i).priceprodect;
  }

  void deleteprodect(int i) {
    prodectbox1.deleteAt(i);
    notifyListeners();
  }

  //add order
  void putorder(String fnameclient, String fnameprodect, int fidclient,
      int fidprodect, String fprice, String famount) {
    //add time and date to database hive type addorder

    double newprice = double.parse(fprice) * double.parse(famount);
    //DateTime dt = DateTime.now();
    String time = " ";
    String date = " ";

    addorderbox1.put(
        "$fidclient",
        addorder(
            nameclient: fnameclient,
            nameprodect: fnameprodect,
            idclient: fidclient,
            amount: double.parse(famount),
            idprodect: fidprodect,
            priceamount: newprice,
            time: time,
            date: date));

    nameclientcontroler.text = "";
    prodectclientcontroler.text = "";
    prodectAmountclientcontroler.text = "";

    notifyListeners();
  }

  void getorders(i) {
    getnameclientorder = addorderbox1.getAt(i).nameclient;
    getnameprodectorder = addorderbox1.getAt(i).nameprodect;
    getamountorder = addorderbox1.getAt(i).amount;
    gettotalpriceorder = addorderbox1.getAt(i).priceamount;
  }

  void deleteorders(i) {
    addorderbox1.deleteAt(i);
    notifyListeners();
  }
}
