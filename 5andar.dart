void main() {
  // int mostFrequent(List<String> letters) {
  //   Map<String, int> frequency = {};

  //   for (var i = 0; i < letters.length; i++) {
  //     var letter = letters[i];

  //     frequency[letter] = frequency[letter]! + 1 ?? 1;
  //   }

  //   var maxValue = 0;
  //   for (var k in frequency.entries) {
  //     if (k.value > maxValue) {
  //       maxValue = k.value;
  //     }
  //   }
  //   return maxValue;
  // }

  //print(mostFrequent(['a', 'b', 'b', 'b']) == 3);

  // List<int> topKFrequent(List<int> nums, int k) {
  //   List<int> result = [];
  //   Map<int, int> frequency = {};
  //   List<List<int>> buckets = List.generate(nums.length + 1, (_) => <int>[]);

  //   for (var i = 0; i < nums.length; i++) {
  //     var number = nums[i];

  //     //frequency[number] = frequency.containsKey(number) ? frequency[number] + 1 : 1
  //     frequency[number] = 1 + (frequency[number] ?? 0);
  //   }

  //   for (int k in frequency.keys) {
  //     buckets[frequency[k]!].add(k);
  //   }

  //   for (int i = buckets.length - 1; i >= 0; i--) {
  //     for (var n in buckets[i]) {
  //       result.add(n);
  //       if (result.length == k) {
  //         return result;
  //       }
  //     }
  //   }
  //   return result;
  // }

  // print(topKFrequent([2, 4, 1, 5, 5, 5, 2], 2));
  final String letters = 'abcdefghijklmnopqrstuvwxz';

  final Map<String, int> lettersMap = {};

  for (int i = 0; i < letters.length; i++) {
    lettersMap[letters[i]] = i;
  }

  List<String> codeToText(List<int> codes) {
    List<String> result = [];
    for (int c in codes) {
      result.add(letters[c]);
    }
    return result;
  }

  List<int> textToCode(String texts) {
    List<int> result = [];
    String l;
    for (int i = 0; i < texts.length; i++) {
      l = texts[i];
      print(lettersMap[l]);
      result.add(lettersMap[l]!);
      // for (int j = 0; j < letters.length; j++) {
      //   if (l == letters[j]) {
      //     result.add(j);
      //   }
      // }
    }
    return result;
  }

  print(codeToText([3, 5, 1, 6, 8, 10, 2, 5, 6, 6, 7]));

  print(textToCode('matheusvoceemuitolegal'));

  print(codeToText([
    12,
    0,
    19,
    7,
    4,
    20,
    18,
    21,
    14,
    2,
    4,
    12,
    20,
    8,
    19,
    14,
    11,
    4,
    6,
    0,
    11
  ]));
}
