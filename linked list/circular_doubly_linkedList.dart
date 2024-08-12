import 'dart:io';

class Node {
  int data;
  Node? next;
  Node? prev;

  Node(this.data);
}

class CircularDoublyLinkedList {
  Node? head;

   void insert(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      head!.next = head;
      head!.prev = head;
    } else {
      Node? last = head!.prev;
      last!.next = newNode;
      newNode.prev = last;
      newNode.next = head;
      head!.prev = newNode;
    }
  }

  void printList() {
    if (head == null) return;
    Node? current = head;
    do {
      stdout.write('${current!.data} <-> ');
      current = current.next;
    } while (current != head);
    print('(head)');
  }

}

void main() {
  CircularDoublyLinkedList list = CircularDoublyLinkedList();

  list.insert(3);
  list.insert(5);
  list.insert(13);
  list.insert(2);

  print('Circular Doubly Linked List:');
  list.printList();

 
}
