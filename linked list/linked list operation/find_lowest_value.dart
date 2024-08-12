import 'dart:io';

class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
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
    }
  }

  void printList() {
    Node? current = head;
    while (current != null) {
      stdout.write('${current.data} -> ');
      current = current.next;
    }
    print('null');
  }

    int findLowestValue() {
    if (head == null) {
      throw Exception('List is empty');
    }

    int minValue = head!.data;
    Node? current = head;
    while (current != null) {
      if (current.data < minValue) {
        minValue = current.data;
      }
      current = current.next;
    }
    return minValue;
  }
}



void main() {
  LinkedList list = LinkedList();

  list.insert(3);
  list.insert(5);
  list.insert(13);
  list.insert(2);

  print('Linked List:');
  list.printList();
    print('The lowest value in Linked List ${list.findLowestValue()}');
}
