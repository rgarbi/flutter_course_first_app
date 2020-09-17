void main() async {
  task1();
  task3(await task2());
}

void task1() {
  String result = 'task 1 data';
  print("Task 1 is complete");
}

Future<String> task2() {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  return Future.delayed(
    threeSeconds,
    () {
      print('Task 2 is complete');
      return 'task 2 data';
    },
  );
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 is complete with $task2Data');
}
