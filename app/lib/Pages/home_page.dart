import 'package:app/Constant.dart';
import 'package:app/Provider/Service_provider.dart';
import 'package:app/Widget/Quarn_Soar_List.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = '0';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ServiceProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: !provider.isDark ? Colors.white : kPrimaryColor,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              provider.isClickedSearch();
            },
            child: Icon(
              Icons.search,
              color: !provider.isDark ? Colors.white : Colors.black,
              size: 35,
            ),
            backgroundColor: Colors.green[300]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Quran App',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: provider.isDark ? Colors.grey :Colors.green[400],
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            provider.isDarkMode();
                          },
                          icon: Icon(
                            Icons.mode_night_sharp,
                            size: 30,
                            color: provider.isDark ? Colors.white : Colors.black,
                          )),
                    ),
                  )
                ],
              ),
              if (provider.isSearched)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextField(
  onChanged: (value) {
    provider.updateSearchQuery(value);
  },
  style: TextStyle(
    color: provider.isDark ? Colors.white : Colors.black, // Set text color
  ),
  decoration: InputDecoration(
    labelText: 'Search',
    hintStyle: TextStyle(
      color:  Colors.green,
    ),
    labelStyle: TextStyle(
      color: Colors.green,
    ),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: provider.isDark ? Colors.white : kPrimaryColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: provider.isDark ? Colors.white : kPrimaryColor,
      ),
    ),
  ),
),

                ),
              const Text(
                'Asslamualakim',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                'Read Quran Every Day',
                style: TextStyle(
                    color: provider.isDark ? Colors.white : kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Image.network(image),
              QuranSourList()
            ],
          ),
        ),
      ),
    );
  }
}

const String image =
    'data:image/png;base64,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';
