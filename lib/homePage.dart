import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List coffe = [
    {"img": "assets/Cappuccino.png", "name": "Cappuccino"},
    {"img": "assets/Espresso.png", "name": "Espresso"},
    {"img": "assets/latte.png", "name": "latte"},
    {"img": "assets/macciato.png", "name": "macciato"},
    {"img": "assets/Mocha.png", "name": "Mocha"},
  ];

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  getBody() {
    if (pageIndex == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage("assets/menu.png")),
                  Icon(
                    Icons.search,
                    size: 33,
                    color: Color.fromARGB(255, 122, 93, 50),
                  )
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                "Its Great",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
              ),
              Text(
                "Day For Coffe",
                style: TextStyle(
                    color: Color.fromARGB(255, 167, 126, 66),
                    fontWeight: FontWeight.w600,
                    fontSize: 26),
              ),
              Column(
                children: List.generate(coffe.length, (index) {
                  return Card(
                    child: Container(
                      width: double.infinity,
                      height: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image(
                            image: AssetImage(
                              coffe[index]["img"],
                            ),
                            height: 30,
                          ),
                          Text(coffe[index]["name"]),
                          Image(
                            image: AssetImage(
                              "assets/back.png",
                            ),
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      );
    } else if (pageIndex == 1) {
      return Center(
        child: Text("Roman"),
      );
    }
  }

  getFooter() {
    List icon = [
      'assets/home.png',
      'assets/loca.png',
      'assets/profile.png',
    ];
    return Container(
      width: double.infinity,
      height: 60,
      color: Color.fromARGB(255, 255, 249, 240),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(icon.length, (index) {
            return InkWell(
              onTap: () {
                selected(index);
              },
              child: Image(
                image: AssetImage(
                  icon[index],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  selected(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
