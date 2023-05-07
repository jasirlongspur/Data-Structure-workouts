mergeSort(List<int> arr) {
  int length = arr.length;
  if (length <= 1) {
    return;
  }

  int middle = arr.length ~/ 2;
  int i = 0;
  int j = 0;
  List<int> leftArray = List<int>.filled(middle, 0);
  List<int> rightArray = List<int>.filled(length - middle, 0);

  for (; i < arr.length; i++) {
    if (i < middle) {
      leftArray[i] = arr[i];
    } else {
      rightArray[j] = arr[i];
      j++;
    }
  }

  mergeSort(leftArray);
  mergeSort(rightArray);
  merge(arr, leftArray, rightArray);
}

void merge(List<int> array, List<int> leftArray, List<int> rightArray) {
  int i = 0, l = 0, r = 0;
  int leftSize = array.length ~/ 2;
  int rightSize = array.length - leftSize;
  while (l < leftSize && r < rightSize) {
    if (leftArray[l] < rightArray[r]) {
      array[i] = leftArray[l];
      i++;
      l++;
    } else {
      array[i] = rightArray[r];
      i++;
      r++;
    }
  }
  while (l < leftSize) {
    array[i] = leftArray[l];
    i++;
    l++;
  }
  while (r < rightSize) {
    array[i] = rightArray[r];
    i++;
    r++;
  }
}

void main(List<String> args) {
  List<int> arr = [6, 1, 9, 2, 8, 3, 7];
  mergeSort(arr);
  print(arr);
}
