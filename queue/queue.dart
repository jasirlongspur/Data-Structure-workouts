/// ****************** QUEUE USING LINKED LIST IN DSA ******************
///
/// A **Queue** is a linear data structure that follows the **FIFO (First In, First Out)** principle.
///
/// **Operations & Time Complexity:**
/// - **Enqueue (Insertion at Rear):** O(1)
/// - **Dequeue (Removal from Front):** O(1)
/// - **Peek (Getting Front Element):** O(1)
/// - **Checking if Queue is Empty:** O(1)
/// - **Display all Elements:** O(n)
///
/// ********************************************************************

/// Node class representing a single element in the queue
class Node {
  int data;
  Node? next;

  Node(this.data);
}

/// Queue class using a linked list
class Queue {
  Node? front; // Points to the first element
  Node? rear; // Points to the last element

  /// Adds an element to the rear of the queue (O(1) complexity)
  void enqueue(int data) {
    Node newNode = Node(data);

    if (rear == null) {
      // If the queue is empty, set front and rear to the new node
      front = rear = newNode;
      return;
    }

    // Insert new node at the end and update rear pointer
    rear!.next = newNode;
    rear = newNode;
  }

  /// Removes an element from the front of the queue (O(1) complexity)
  void dequeue() {
    if (front == null) {
      print("Queue is empty");
      return;
    }

    // Move front to the next node
    front = front!.next;

    // If front becomes null, reset rear as well (Queue is now empty)
    if (front == null) {
      rear = null;
    }
  }

  /// Displays all elements of the queue (O(n) complexity)
  void display() {
    if (front == null) {
      print("Queue is empty");
      return;
    }

    Node? current = front;
    print("Queue elements:");
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

/// Main function to test Queue operations
void main() {
  Queue queue = Queue();

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);

  queue.display(); // Print queue elements

  queue.dequeue();
  queue.dequeue();
  queue.dequeue();

  queue.display(); // Print remaining queue elements
}
