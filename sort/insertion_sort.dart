class InsertionSort {
  void insertionSort(List<num> arr, int size) {
    for (int i = 1; i < size; i++) {
      int insertIndex = i;
      num currentValue = arr[insertIndex];
      int j = i - 1;

      while (j >= 0 && arr[j] > currentValue) {
        arr[j + 1] = arr[j];
        insertIndex = j;
        j--;
      }
      arr[insertIndex] = currentValue;
    }
  }
}
