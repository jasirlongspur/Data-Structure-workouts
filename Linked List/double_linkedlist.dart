/// ****************** DOUBLY LINKED LIST (DLL) IN DSA ******************
///
/// A **Doubly Linked List** is a linear data structure where each node has:
/// - A `data` field to store values.
/// - A `next` pointer pointing to the next node.
/// - A `prev` pointer pointing to the previous node.
///
/// **Operations & Time Complexity:**
/// - **Insertion at End:** O(1) (Directly updating tail pointer)
/// - **Insertion at Beginning:** O(1) (Directly updating head pointer)
/// - **Insertion After a Node:** O(n) (Traverse to find the node)
/// - **Deletion of a Node:** O(n) (Traverse to find & remove the node)
/// - **Search for an Element:** O(n) (Linear traversal)
/// - **Reversing Display:** O(n) (Traverse from tail to head)
/// - **Space Complexity:** O(n) (Each node requires extra space for two pointers)
///
/// ********************************************************************

/// Node class representing a single element in the doubly linked list
class Node {
  int data;
  Node? next; // Pointer to the next node
  Node? prev; // Pointer to the previous node

  Node(this.data);
}

/// Doubly Linked List class
class DoubleLinkedList {
  Node? head; // Head pointer to the first node
  Node? tail; // Tail pointer to the last node

  /// Adds a new node at the end of the list (O(1) complexity)
  void addNode(int data) {
    Node newNode = Node(data);

    if (head == null) {
      // If the list is empty, set new node as head and tail
      head = newNode;
      tail = newNode;
    } else {
      // Update links to insert at the end
      newNode.prev = tail;
      tail!.next = newNode;
      tail = newNode;
    }
  }

  /// Removes a node with the given [value] (O(n) complexity)
  void removeNode(int value) {
    if (head == null) {
      print("Linked List is empty.");
      return;
    }

    Node? current = head;

    // Traverse to find the node
    while (current != null && current.data != value) {
      current = current.next;
    }

    if (current == null) {
      print("Node with value $value not found.");
      return;
    }

    // If it's the only node in the list
    if (current == head && current == tail) {
      head = tail = null;
    }
    // If the node to remove is the head
    else if (current == head) {
      head = head!.next;
      head!.prev = null;
    }
    // If the node to remove is the tail
    else if (current == tail) {
      tail = tail!.prev;
      tail!.next = null;
    }
    // If the node is in the middle
    else {
      current.prev!.next = current.next;
      current.next!.prev = current.prev;
    }

    print("Node with value $value deleted.");
  }

  /// Displays all nodes from head to tail (O(n) complexity)
  void display() {
    if (head == null) {
      print("Linked List is empty.");
      return;
    }

    Node? current = head;
    print("Doubly Linked List (Forward):");
    while (current != null) {
      print(current.data); // Print current node data
      current = current.next; // Move to the next node
    }
  }

  /// Displays all nodes from tail to head (O(n) complexity)
  void reverseDisplay() {
    if (tail == null) {
      print("Linked List is empty.");
      return;
    }

    Node? current = tail;
    print("Doubly Linked List (Reverse):");
    while (current != null) {
      print(current.data); // Print current node data
      current = current.prev; // Move to the previous node
    }
  }
}

/// Main function to test Doubly Linked List operations
void main() {
  DoubleLinkedList dll = DoubleLinkedList();

  dll.addNode(10);
  dll.addNode(20);
  dll.addNode(30);
  dll.addNode(40);
  dll.addNode(50);

  dll.display(); // Print in normal order
  dll.reverseDisplay(); // Print in reverse order

  dll.removeNode(30); // Remove node with value 30
  dll.display(); // Print again after deletion
}
