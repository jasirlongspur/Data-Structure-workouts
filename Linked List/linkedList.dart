/// ****************** LINKED LIST IN DSA ******************
///
/// A **Linked List** is a linear data structure where elements (nodes) are stored in memory with a pointer to the next node.
///
/// **Types:**
/// - **Singly Linked List:** Each node points to the next node.
/// - **Doubly Linked List:** Each node points to both the next and previous node.
/// - **Circular Linked List:** The last node connects back to the first node.
///
/// **Operations & Time Complexity:**
/// - **Insertion at End:** O(n) (Traverse to the last node)
/// - **Insertion at Beginning:** O(1) (Update head pointer)
/// - **Insertion After a Node:** O(n) (Traverse to find the node)
/// - **Deletion of a Node:** O(n) (Traverse to find & remove the node)
/// - **Search for an Element:** O(n) (Linear traversal)
/// - **Space Complexity:** O(n) (Each node requires extra space for a pointer)
///
/// ********************************************************

/// Node class representing a single element in the linked list
class Node {
  int data;
  Node? next; // Pointer to the next node

  Node(this.data);
}

/// Linked List class
class LinkedList {
  Node? head; // Head pointer to the first node

  /// Adds a new node at the end of the list (O(n) complexity)
  void addNode(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode; // If the list is empty, set new node as head
    } else {
      Node? current = head;
      while (current!.next != null) {
        current = current.next; // Traverse to the last node
      }
      current.next = newNode; // Attach new node at the end
    }
  }

  /// Inserts a node with [value] after the node with [nextTo] value (O(n) complexity)
  void insertAfter(int nextTo, int value) {
    Node? current = head;

    // Traverse to find the target node
    while (current != null && current.data != nextTo) {
      current = current.next;
    }

    if (current == null) {
      print("Node with value $nextTo not found.");
      return;
    }

    Node newNode = Node(value);
    newNode.next = current.next;
    current.next = newNode;
  }

  /// Removes a node with the given [value] (O(n) complexity)
  void removeNode(int value) {
    if (head == null) {
      print("Linked list is empty.");
      return;
    }

    // If head node itself needs to be deleted
    if (head!.data == value) {
      head = head!.next;
      print("Node with value $value deleted.");
      return;
    }

    Node? current = head;
    Node? prev = null;

    // Search for the node to be deleted
    while (current != null && current.data != value) {
      prev = current;
      current = current.next;
    }

    // If node was not found
    if (current == null) {
      print("Node with value $value not found.");
      return;
    }

    // Unlink the node from the list
    prev!.next = current.next;
    print("Node with value $value deleted.");
  }

  /// Displays all nodes in the linked list (O(n) complexity)
  void display() {
    if (head == null) {
      print("The list is empty.");
      return;
    }

    Node? current = head;
    print("Linked List:");
    while (current != null) {
      print(current.data); // Print current node data
      current = current.next; // Move to the next node
    }
  }
}

/// Main function to test Linked List operations
void main() {
  LinkedList linkedList = LinkedList();

  linkedList.addNode(10);
  linkedList.addNode(20);
  linkedList.addNode(50);
  linkedList.addNode(80);
  linkedList.addNode(30);

  linkedList.removeNode(80); // Delete node with value 80
  linkedList.insertAfter(30, 100); // Insert 100 after node with value 30

  linkedList.display();
}
