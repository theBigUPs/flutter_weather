import 'package:flutter/material.dart';

Widget customCard(String text, String temp, Icon i) {
  return SizedBox(
    width: 60,
    height: 70,
    child: Column(
      children: [
        i,
        Text(
          temp,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

Widget customWeatherCard(String temp, String pic, String day) {
  return Card(
    color: const Color(0x776148a3),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 29,
          width: 110,
          child: Image.asset(
            "assets/images/$pic.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        Text(
          temp,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          day,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

Widget customCityWeatherCard(
    String temp, String pic, String name, String status) {
  return Card(
    color: const Color(0x776148a3),
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: 70,
          child: Image.asset(
            "assets/images/$pic.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                status,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          width: 50,
          child: Text(
            temp,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
