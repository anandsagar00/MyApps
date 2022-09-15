
// We can wait (using await keyword) only for future objects

import 'dart:io';

void main() {
  performTask();
}

void performTask() async{
  task1();
  await task2();
  task3();
}

void task1() {
  print('T1');
}

Future task2() async{
  Duration dur = Duration(seconds: 3);
  await Future.delayed(dur, () {
    print('T2');
  });
}

void task3() {
  print('T3');
}
