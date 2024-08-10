import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class ReaderStats extends StatefulWidget {
  const ReaderStats({super.key});

  @override
  State<ReaderStats> createState() => _ReaderStatsState();
}

class _ReaderStatsState extends State<ReaderStats> {
  int? progressNumber;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProgressNumber();
  }

  Future<void> fetchProgressNumber() async {
    const url =
        'https://www.randomnumberapi.com/api/v1.0/random?min=100&max=1000&count=1';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          progressNumber = data[0];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load progress number');
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/avatar6.jpg"),
                radius: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Amy's reader stats",
                style: TextStyle(
                  fontSize: isLargeScreen ? 24 : 18,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isLargeScreen ? 32.0 : 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'War and Peace',
                      style: TextStyle(
                        fontSize: isLargeScreen ? 32 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    splashRadius: 50,
                    color: Colors.white,
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      //call api
                      fetchProgressNumber();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.yellow[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            'PROGRESS',
                            style: TextStyle(
                              fontSize: isLargeScreen ? 22 : 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.upload_sharp, color: Colors.white70),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.book,
                            size: 30,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          isLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                  progressNumber.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isLargeScreen ? 56 : 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Out of 1,225 pages\n#5 among friends',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: 543 / 1225,
                        color: Colors.black,
                        backgroundColor: Colors.grey[300],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar1.jpg'),
                            radius: 15,
                          ),
                          SizedBox(width: 15),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar2.jpg'),
                            radius: 15,
                          ),
                          SizedBox(width: 25),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar3.jpg'),
                            radius: 15,
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar4.jpg'),
                            radius: 15,
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar5.jpg'),
                            radius: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(isLargeScreen ? 24.0 : 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  'TIME',
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 22 : 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.upload_sharp,
                                    color: Colors.white70),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '6:24',
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 48 : 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Global avg. read time\nfor your progress 7:28\n23% faster',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.green[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(isLargeScreen ? 24.0 : 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'STREAK',
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 22 : 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.upload_sharp,
                                    color: Colors.white70),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.light_mode_outlined,
                                    size: 30, color: Colors.black),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '7',
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 48.sp : 40.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Day streak, come back\ntomorrow to keep it up!\n19% more consistent',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.purple[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(isLargeScreen ? 24.0 : 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'LEVEL',
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 22 : 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.upload_sharp,
                                    color: Colors.white70),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.emoji_events,
                                    size: 30, color: Colors.black),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 48 : 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              '145 reader points to\nlevel up!\nTop 5% for this book',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(isLargeScreen ? 40.0 : 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'BADGES',
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 22 : 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.upload_sharp,
                                    color: Colors.white70),
                              ],
                            ),
                            const SizedBox(height: 60),
                            const Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                Icon(Icons.lightbulb_outline,
                                    size: 30, color: Colors.black),
                                Icon(Icons.check_circle_outline,
                                    size: 30, color: Colors.black),
                                Icon(Icons.center_focus_strong,
                                    size: 30, color: Colors.black),
                                Icon(Icons.hourglass_empty,
                                    size: 30, color: Colors.black),
                                Icon(Icons.book_outlined,
                                    size: 30, color: Colors.black),
                                Icon(Icons.thumb_up_alt_outlined,
                                    size: 30, color: Colors.black),
                              ],
                            ),
                            const SizedBox(height: 60),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add_rounded),
                    const SizedBox(width: 10),
                    const Text('Add friends'),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.upload_sharp, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const SizedBox(height: 10),
              const Text('Leaderboard',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
