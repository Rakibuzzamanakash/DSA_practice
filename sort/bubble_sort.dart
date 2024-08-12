class BubbleSort {
  void bubbleSort(List<num> arr, int size) {
    for (int i = 0; i < size - 1; i++) {
      bool swaped = false;

      for (int j = 0; j < size - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {

          num temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;

          swaped = true;
        }
      }
      if (swaped.toString() == false) {
        break;
      }
    }
  }
}
