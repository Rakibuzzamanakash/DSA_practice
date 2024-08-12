import 'dart:io';

class Node {
  int data;
  Node? next;
  Node? prev;

  Node(this.data);
}

class DoublyLinkedList {
  Node? head;

  void insert(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      Node? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
      newNode.prev = current;
    }
  }

  void printListForward() {
    Node? current = head;
    while (current != null) {
      stdout.write('${current.data} ');
      current = current.next;
    }
    print('');
  }

  void printListBackward() {
    if (head == null) return;
    Node? current = head;
    while (current!.next != null) {
      current = current.next;
    }
    while (current != null) {
      stdout.write('${current.data} ');
      current = current.prev;
    }
    print('');
  }

  }

void main() {
  DoublyLinkedList list = DoublyLinkedList();

  list.insert(3);
  list.insert(5);
  list.insert(13);
  list.insert(2);

  print('List printed forward:');
  list.printListForward();

  print('List printed backward:');
  list.printListBackward();

  
}
