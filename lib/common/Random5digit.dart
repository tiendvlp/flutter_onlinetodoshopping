import 'dart:math';

class Random5digit {
  int random() {
    int min = 10000; //min and max values act as your 6 digit range
    int max = 99999;
    final randomizer = new Random();
    return min + randomizer.nextInt(max - min);
  }
}
