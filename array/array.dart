void main(List<String> args) {
  // Input array and target sum
  List<int> array = [1, 2, 3, 4, 5, 6];
  int target = 10;

  // Calling the function to find the pair
  List<int>? result = twoArraySum(array, target);

  // Output the result
  if (result != null) {
    print("Pair found: ${result[0]}, ${result[1]}");
  } else {
    print("No pair found.");
  }
}

/// Function to find two numbers in the list that sum up to the target.
/// Returns a list containing the pair if found, otherwise returns null.
///
/// Time Complexity: O(n²) - Due to the nested loop iterating through the array.
/// Space Complexity: O(1) - No extra space is used apart from variables.
List<int>? twoArraySum(List<int> array, int target) {
  // Iterating through the array
  for (int i = 0; i < array.length; i++) {
    for (int j = i + 1; j < array.length; j++) {
      // Check if the sum of the current pair equals the target
      if (array[i] + array[j] == target) {
        return [array[i], array[j]]; // Return the found pair
      }
    }
  }
  return null; // Return null if no pair is found
}
