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

  void deleteNode(int data) {
    if (head == null) {
      print('List is empty');
      return;
    }

    if (head!.data == data) {
      head = head!.next;
      return;
    }

    Node? current = head;
    Node? previous = null;

    while (current != null && current.data != data) {
      previous = current;
      current = current.next;
    }

    if (current == null) {
      print('Node with value $data not found');
      return;
    }

    previous!.next = current.next;
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
  list.deleteNode(13);
  print('After delete Linked List:');
  list.printList();
}
