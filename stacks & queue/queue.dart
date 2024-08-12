class Queue<T> {
  List<T> _queue = [];

  void enqueue(T data) {
    _queue.add(data);
  }

  T dequeue() {
    if (_queue.isEmpty) {
      throw Exception('Queue is empty');
    } else {
      return _queue.removeAt(0);
    }
  }

  T front() {
    if (_queue.isEmpty) {
      throw Exception('Queue is empty');
    }
    return _queue.first;
  }

  bool get isEmpty => _queue.isEmpty;
  int get size => _queue.length + 1;

  void printQueue() {
    print('Queue : ${_queue.join(' , ')}');
  }
}


void main() {
  Queue<String> myQueue = Queue<String>();

  myQueue.enqueue('A');
  myQueue.enqueue('B');
  myQueue.enqueue('C');

  print('Initial queue:');
  myQueue.printQueue();

  print('Dequeue: ${myQueue.dequeue()}');
  print('Peek: ${myQueue.front}');
  print('Is Empty: ${myQueue.isEmpty}');
  print('Size: ${myQueue.size}');

  print('Queue after operations:');
  myQueue.printQueue();
}
