class QuickSort {
  void quickSort(List<num> arr, int low, int high) {
    if (low < high) {
      int pivotIndex = partition(arr, low, high);
      quickSort(arr, low, pivotIndex - 1);
      quickSort(arr, pivotIndex + 1, high);
    }
  }

  int partition(List<num> arr, int low, int high) {
    num pivot = arr[low];
    int i = low + 1;
    int j = high;

    while (i <= j) {
      while (i <= j && arr[i] <= pivot) {
        i++;
      }

      while (i <= j && arr[j] > pivot) {
        j--;
      }

      if (i < j) {
        num temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }

    arr[low] = arr[j];
    arr[j] = pivot;

    return j;
  }
}
