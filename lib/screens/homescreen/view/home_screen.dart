import 'package:bmianimation/screens/homescreen/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation? alignTween;
  Animation? alignTweenage;
  Animation? alignTween2;

  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    alignTween = Tween<double>(begin: -1, end: 0).animate(animationController!);
    alignTweenage =
        Tween<double>(begin: -1, end: 1).animate(animationController!);
    alignTween2 =
        Tween<double>(begin: 1, end: -1).animate(animationController!);
    animationController!.forward();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF0F1537),
        appBar: AppBar(
          backgroundColor: Color(0XFF0F1537),
          title: Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.white70, fontSize: 20),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(alignTweenage!.value, -0.75),
                child: Container(
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0XFF3D406D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            homeController.female.value = true;
                            print("Hello");
                          });
                        },
                        child: Icon(
                          Icons.female,
                          color: homeController.female.value
                              ? Colors.pink
                              : Colors.white70,
                          size: 100,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "FEMALE",
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(alignTween2!.value, -0.75),
                child: Container(
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0XFF3D406D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            homeController.male.value = true;
                            print("Hello");
                          });
                        },
                        child: Icon(
                          Icons.male,
                          color: homeController.male.value
                              ? Colors.pink
                              : Colors.white70,
                          size: 100,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "MALE",
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(alignTween!.value, 0),
                child: Container(
                  height: 150,
                  width: 350,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0XFF3D406D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(color: Colors.white60, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${homeController.sliderValue.toInt()}",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "cm",
                            style:
                                TextStyle(color: Colors.white60, fontSize: 22),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Slider(
                        min: 0,
                        max: 200,
                        divisions: 200,
                        value: homeController.sliderValue.value,
                        onChanged: (value) {
                          setState(() {
                            homeController.sliderValue.value = value;
                          });
                        },
                        inactiveColor: Colors.white54,
                        activeColor: Colors.pink,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(alignTweenage!.value, 0.75),
                child: Container(
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0XFF3D406D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(color: Colors.white60, fontSize: 20),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "${homeController.age.value}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  homeController.age.value += 1;
                                });
                              },
                              child: Icon(Icons.add),
                              backgroundColor: Color(0XFF0F1537),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  homeController.age.value -= 1;
                                });
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: Color(0XFF0F1537),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(alignTween2!.value, 0.75),
                child: Container(
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0XFF3D406D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(color: Colors.white60, fontSize: 20),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "${homeController.weight.value}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  homeController.weight.value += 1;
                                });
                              },
                              child: Icon(Icons.add),
                              backgroundColor: Color(0XFF0F1537),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  homeController.weight.value -= 1;
                                });
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: Color(0XFF0F1537),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "CALCULATE YOUR BMI",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {
                      double height = homeController.sliderValue.value / 100;
                      double weight = homeController.weight.value.toDouble();
                      double heightSquare = height * height;
                      double result = weight / heightSquare;
                      Get.dialog(
                        Dialog(
                          backgroundColor: Color(0XFF0F1537),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "YOUR BMI RESULT",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 30),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                if (result.toInt() >= 18 &&
                                    result.toInt() <= 25)
                                  Text(
                                    "YOU HAVE A NORMAL BODY",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 20),
                                  ),
                                if (result.toInt() >= 25 &&
                                    result.toInt() <= 30)
                                  Text("YOU HAVE A OVER WEIGHT"),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  "${result.toInt()}",
                                  style: TextStyle(color: Colors.white,fontSize: 35),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.pink),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
