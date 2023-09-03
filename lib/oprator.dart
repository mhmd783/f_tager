import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:tager/providerconsumer/Cart.dart';

class oprator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _oprator();
  }
}

class _oprator extends State<oprator> {
  late Box namebox;

  name() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("chose name"),
              content: Container(
                width: 200,
                height: 300,
                child: Consumer<cart>(builder: ((context, value, child) {
                  return ListView.builder(
                      itemCount: value.namebox1.length,
                      itemBuilder: (context, i) {
                        value.getname(i);
                        return Container(

                            //names in listTile
                            child: ListTile(
                                onTap: () {
                                  value.getname(i);
                                  value.nameclientcontroler.text = value.name1;
                                  value.idclient = i;
                                  Navigator.of(context).pop();
                                },
                                title: Text("${i + 1}-${value.name1}")));
                      });
                })),
              ));
        });
  }

  prodect() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("chose name"),
              content: Container(
                width: 200,
                height: 300,
                child: Consumer<cart>(builder: ((context, value, child) {
                  return ListView.builder(
                      itemCount: value.prodectbox1.length,
                      itemBuilder: (context, i) {
                        value.getprodect(i);
                        return Container(

                            //names in listTile
                            child: ListTile(
                                onTap: () {
                                  value.getprodect(i);
                                  value.prodectclientcontroler.text =
                                      value.nameprodect2;
                                  value.idprodect = i;
                                  value.price = value.priceprodect2;
                                  Navigator.of(context).pop();
                                },
                                title: Text("${i + 1}-${value.nameprodect2}")));
                      });
                })),
              ));
        });
  }

  @override
  void initState() {
    //namebox = Hive.box("nameclients");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        title: Text("oprator"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // types prodect and add prodect
            //input name,price prodect
            Expanded(
                flex: 2,
                child: Consumer<cart>(builder: ((context, value, child) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 103, 100, 100),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.greenAccent,
                          Colors.black12,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),

                    //child contaner contain prodect in listview.builder

                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "prodect",
                              style: TextStyle(fontSize: 20),
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              controller: value.nameprodect1,
                              decoration: InputDecoration(
                                hintText: "add prodect",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              controller: value.priceprodect1,
                              decoration: InputDecoration(
                                hintText: "add price",
                                // suffixIcon: IconButton(
                                //     onPressed: () {}, icon: Icon(Icons.add)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: CircleAvatar(
                                backgroundColor: Colors.greenAccent,
                                child: IconButton(
                                    onPressed: () {
                                      //add name price prodect
                                      if (value.nameprodect1.text != "" &&
                                          value.priceprodect1.text != "") {
                                        value.putprodect(
                                            value.nameprodect1.text,
                                            value.priceprodect1.text);
                                      }
                                    },
                                    icon: Icon(Icons.add)))),
                        Expanded(
                          flex: 16,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: double.infinity,
                            height: double.infinity,
                            child: ListView.builder(
                                itemCount: value.prodectbox1.length,
                                itemBuilder: (context, i) {
                                  value.getprodect(i);
                                  return Container(

                                      //names in listTile
                                      child: ListTile(
                                    onTap: () {},
                                    trailing: IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                    title: Text(
                                                        "do you sure delete prodect"),
                                                    content: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 50),
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                      ),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            value.deleteprodect(
                                                                i);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            "delete",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )),
                                                    ));
                                              });
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          size: 15,
                                        )),
                                    title:
                                        Text("${i + 1}-${value.nameprodect2}"),
                                    subtitle: Text("${value.priceprodect2}\$"),
                                  ));
                                }),
                          ),
                        )
                      ],
                    ),
                  );
                }))
                ////////////////////////////////////////////////////////////////
                ),

            //center of page
            //details container add order
            Expanded(
                flex: 5,
                child: Consumer<cart>(
                  builder: ((context, value, child) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(left: 50),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: TextFormField(
                                          controller: value.nameclientcontroler,
                                          onTap: () {
                                            name();
                                          },
                                          decoration: InputDecoration(
                                            hintText: "name",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: TextFormField(
                                          controller:
                                              value.prodectclientcontroler,
                                          onTap: () {
                                            prodect();
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Type selaa",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: TextFormField(
                                          controller: value
                                              .prodectAmountclientcontroler,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Amount",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.greenAccent,
                                        child: IconButton(
                                            ////////////////////////////////////////////////////////////////////////////////////////////////////////
                                            onPressed: () {
                                              if (value.nameclientcontroler
                                                          .text !=
                                                      "" &&
                                                  value.prodectclientcontroler
                                                          .text !=
                                                      "" &&
                                                  value.prodectAmountclientcontroler
                                                          .text !=
                                                      "") {
                                                value.putorder(
                                                  value
                                                      .nameclientcontroler.text,
                                                  value.prodectclientcontroler
                                                      .text,
                                                  value.idclient,
                                                  value.idprodect,
                                                  value.price,
                                                  value
                                                      .prodectAmountclientcontroler
                                                      .text,
                                                );
                                              }
                                            },
                                            icon: Icon(Icons.add)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),

                          //details to day
                          Expanded(flex: 1, child: Text("to day")),
                          //
                          Expanded(
                            flex: 15,
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: ListView.builder(
                                  itemCount: value.addorderbox1.length,
                                  itemBuilder: (context, i) {
                                    value.getorders(i);
                                    return Container(
                                      //decoration
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 103, 100, 100),
                                            spreadRadius: 0,
                                            blurRadius: 10,
                                            offset: Offset(0, 0),
                                          )
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blue,
                                            Colors.greenAccent,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),

                                      /////////////////////////

                                      margin: EdgeInsets.all(10),
                                      child: ListTile(
                                        trailing: Text(
                                            "${value.gettotalpriceorder}\$"),
                                        title: Text(
                                            "${i+1}${value.getnameclientorder}"),
                                        leading: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 50),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        child: TextButton(
                                                            onPressed: () {
                                                              value
                                                                  .deleteorders(
                                                                      i);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              "delete",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                      ),
                                                      title: Text(
                                                          "do you sure delete order?"),
                                                    );
                                                  });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              size: 15,
                                            )),
                                        subtitle: Text(
                                            "${value.getamountorder} pices of ${value.getnameprodectorder}"),

                                        //put time and date in here
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                )),

            //names container
            Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 103, 100, 100),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.greenAccent,
                        Colors.black12,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),

                  //child contaner contain names in listview.builder

                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            "names",
                            style: TextStyle(fontSize: 20),
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                            //margin: EdgeInsets.only(left: 10, right: 10),
                            child: Consumer<cart>(
                                builder: ((context, value, child) {
                          return TextFormField(
                            controller: value.namecontroller,
                            decoration: InputDecoration(
                              hintText: "add name",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    //add name to hive
                                    if (value.namecontroller.text != "") {
                                      //add name whene donot use changenotifier
                                      //namebox.add(namecontroller.text);
                                      value.putname(value.namecontroller.text);
                                    }
                                  },
                                  icon: Icon(Icons.add)),
                            ),
                          );
                        }))),
                      ),
                      Expanded(
                        flex: 16,
                        child: Container(
                            //margin: EdgeInsets.all(10),
                            width: double.infinity,
                            height: double.infinity,
                            child: Consumer<cart>(
                                builder: ((context, value, child) {
                              return ListView.builder(
                                  itemCount: value.namebox1.length,
                                  itemBuilder: (context, i) {
                                    //String namedata = namebox.getAt(i);
                                    value.getname(i);
                                    return Container(
                                      //names in listTile
                                      child: ListTile(
                                        onTap: () {},
                                        title: Text("${i + 1}- ${value.name1}",
                                            maxLines: 1),
                                        trailing: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                        title: Text(
                                                            "do you sure delete name"),
                                                        content: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                value
                                                                    .deletename(
                                                                        i);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                "delete",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              )),
                                                        ));
                                                  });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              size: 15,
                                            )),
                                      ),
                                    );
                                  });
                            }))),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
