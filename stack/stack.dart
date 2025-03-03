/// ****************** STACK IN DATA STRUCTURES & ALGORITHMS ******************
///
/// A **Stack** is a linear data structure that follows the **LIFO (Last In, First Out)** principle.
///
/// - **Push:** Adds an element to the top of the stack.
/// - **Pop:** Removes the top element from the stack.
/// - **Peek (Optional):** Returns the top element without removing it.
/// - **Display:** Prints all elements in the stack.
///
/// **Common Use Cases:**
/// - Function calls (Recursion uses stacks internally)
/// - Undo/Redo operations in text editors
/// - Backtracking algorithms (e.g., Maze solving)
/// - Expression evaluation (e.g., Postfix evaluation)
///
/// **Time Complexity:**
/// - **Push:** O(1) → Insert at the head of the linked list.
/// - **Pop:** O(1) → Remove the head of the linked list.
/// - **Display:** O(n) → Traverse the linked list.
/// - **Space Complexity:** O(n) → Stores `n` elements in the stack.
///
/// ***************************************************************************

/// Class representing a single node in the linked list
class Node {
  int data;
  Node? next; // Pointer to the next node

  Node(this.data);
}

/// Class representing a Stack using a Linked List
class Stack {
  Node? top; // Points to the top of the stack

  /// Push operation - Adds an element to the stack (O(1) time complexity)
  void push(int data) {
    Node newNode = Node(data);
    newNode.next = top; // New node points to the previous top
    top = newNode; // Update the top pointer
  }

  /// Pop operation - Removes the top element from the stack (O(1) time complexity)
  void pop() {
    if (top == null) {
      print("Stack Underflow - No elements to pop.");
      return;
    }
    top = top!.next; // Move the top pointer to the next node
  }

  /// Display operation - Prints all elements in the stack (O(n) time complexity)
  void display() {
    if (top == null) {
      print("Stack is empty.");
      return;
    }
    Node? current = top;
    print("Stack elements:");
    while (current != null) {
      print(current.data); // Print current node data
      current = current.next; // Move to the next node
    }
  }
}

/// Main function to test the stack implementation
void main(List<String> args) {
  Stack stack = Stack();
  stack.push(10);
  stack.push(20);
  stack.push(30);
  stack.pop();
  stack.display(); // Expected Output: 20, 10
}
