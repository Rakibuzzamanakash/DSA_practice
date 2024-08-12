class Stacks<T> {
  List<T> _stack = [];

  void push(T data) {
    _stack.add(data);
  }

  T? pop() {
    if (_stack.isEmpty) {
      print('Stack is empty');
      return null;
    } else {
      return _stack.removeLast();
    }
  }

  T? peek() {
    if (_stack.isEmpty) {
      print('Stack is empty');
      return null;
    } else {
      return _stack.last;
    }
  }

  bool isEmpty() {
    return _stack.isEmpty;
  }

  int size() {
    return _stack.length + 1;
  }

  void printStack() {
    print('Stack: ${_stack.join(' , ')}');
  }
}

int main() {
  Stacks<int> stack = Stacks<int>();

  stack.push(1);
  stack.push(3);
  stack.push(7);
  stack.push(8);

  print('Initial stack:');
  stack.printStack();

  print('Top element: ${stack.peek()}');

  print('Popped element: ${stack.pop()}');
  
  print('Stack after popping an element:');
  stack.printStack();

  print('Is stack empty? ${stack.isEmpty()}');

  print('Stack size: ${stack.size()}');

  return 0;
}
