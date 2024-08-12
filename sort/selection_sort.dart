class SelectionSort {
  void selectionSort(List<num> arr, int size) {
    for (int i = 0; i < size; i++) {
      int minIndex = i;

      for (int j = i + 1; j < size; j++) {
        if (arr[j] < arr[minIndex]) {
          minIndex = j;
        }

        num temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
      }
    }
  }
}
