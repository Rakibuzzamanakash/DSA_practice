import 'dart:io';

class Node {
  int data;
  Node? next;

  Node(this.data);
}

class CircularSinglyLinkedList {
  Node? head;


  void insert(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      head!.next = head; 
    } else {
      Node? current = head;
      while (current!.next != head) {
        current = current.next;
      }
      current.next = newNode;
      newNode.next = head; 
    }
  }

  
  void printList() {
    if (head == null) return;
    Node? current = head;
    do {
      stdout.write('${current!.data} -> ');
      current = current.next;
    } while (current != head);
    print('(head)'); 
  }

}

void main() {
  CircularSinglyLinkedList list = CircularSinglyLinkedList();

  list.insert(3);
  list.insert(5);
  list.insert(13);
  list.insert(2);

  print('Circular Singly Linked List:');
  list.printList();


}
