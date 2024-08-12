import 'sort/binary_search.dart';
import 'sort/bubble_sort.dart';
import 'sort/insertion_sort.dart';
import 'sort/linear_search.dart';
import 'sort/merge_sort.dart';
import 'sort/quick_sort.dart';
import 'sort/selection_sort.dart';

void main() {
  List<num> myList = [3, 7, 6, -10, 15, 23.5, 55, -13];
  //List<num> myList = [1,2,3,4,5];

//#########
  //var mergeSort = MergeSorts();
  // mergeSort.mergeSort(myList, 0, myList.length - 1);
  // print('Sorted array: $myList');
//#########

//#########
  // var bubbleSort = BubbleSort();
  // bubbleSort.bubbleSort(myList, myList.length);
  // print('Sorted array: $myList');
//#########

//#########
  // var selectionSort = SelectionSort();
  // selectionSort.selectionSort(myList, myList.length);
  // print('Sorted array: $myList');
//#########

//#########
  // var insertionSort = InsertionSort();
  // insertionSort.insertionSort(myList, myList.length);
  // print('Sorted array: $myList');
//#########

//#########
  var quickSort = QuickSort();
  quickSort.quickSort(myList, 0, myList.length - 1);
  // print('Sorted array: $myList');
//#########

//#########
  // var linearSearch = LinearSearch();
  // int result = linearSearch.linearSearch(myList, myList.length, 6);
  // print('${myList[result]} found at $result index');
//#########

//#########
  var binarySearch = BinarySearch();
  int result = binarySearch.binarySearch(myList, myList.length, 6);
  print('${myList[result]} found at $result index');
  

//#########
}
