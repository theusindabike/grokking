void main() {
  final e = Exercicies();

  //print(mostFrequent(['a', 'b', 'b', 'b']) == 3);

  // print(topKFrequent([2, 4, 1, 5, 5, 5, 2], 2));

  //

  // print(e.codeToText([3, 5, 1, 6, 8, 10, 2, 5, 6, 6, 7]));
  // print(e.textToCode('matheusvoceemuitolegal'));
  // print(e.codeToText([
  //   12,
  //   0,
  //   19,
  //   7,
  //   4,
  //   20,
  //   18,
  //   21,
  //   14,
  //   2,
  //   4,
  //   12,
  //   20,
  //   8,
  //   19,
  //   14,
  //   11,
  //   4,
  //   6,
  //   0,
  //   11
  // ]));

  // print(e.sumByTarget([1, 5, 3, 6, 9, 8, 12], -38));

  // print(e.realWorldSum([1, 2, 3], [4, 5, 6]));
  // print(e.realWorldSum([8, 7, 2], [6, 1, 1]));

  // print(e.mostFrequentLetter(
  //     'ertyuikmnbvdtyguashdusgayvfyasbdasjjjjjjjjjjujksdfffas'));

  print(e.reverseText('oi, matheus, tudo bem?'));
}

class Exercicies {
  int mostFrequent(List<String> letters) {
    Map<String, int> frequency = {};

    for (var i = 0; i < letters.length; i++) {
      var letter = letters[i];

      frequency[letter] = frequency[letter]! + 1 ?? 1;
    }

    var maxValue = 0;
    for (var k in frequency.entries) {
      if (k.value > maxValue) {
        maxValue = k.value;
      }
    }
    return maxValue;
  }

  List<int> topKFrequent(List<int> nums, int k) {
    List<int> result = [];
    Map<int, int> frequency = {};
    List<List<int>> buckets = List.generate(nums.length + 1, (_) => <int>[]);

    for (var i = 0; i < nums.length; i++) {
      var number = nums[i];

      //frequency[number] = frequency.containsKey(number) ? frequency[number] + 1 : 1
      frequency[number] = 1 + (frequency[number] ?? 0);
    }

    for (int k in frequency.keys) {
      buckets[frequency[k]!].add(k);
    }

    for (int i = buckets.length - 1; i >= 0; i--) {
      for (var n in buckets[i]) {
        result.add(n);
        if (result.length == k) {
          return result;
        }
      }
    }
    return result;
  }

  final String letters = 'abcdefghijklmnopqrstuvwxz';

  final Map<String, int> lettersMap = {};

  List<String> codeToText(List<int> codes) {
    List<String> result = [];
    for (int c in codes) {
      result.add(letters[c]);
      //return a string, not a list of
    }
    return result;
  }

  List<int> textToCode(String texts) {
    for (int i = 0; i < letters.length; i++) {
      lettersMap[letters[i]] = i;
    }
    List<int> result = [];
    String l;
    for (int i = 0; i < texts.length; i++) {
      l = texts[i];
      //resolver com indexOf?
      result.add(lettersMap[l]!);
      // for (int j = 0; j < letters.length; j++) {
      //   if (l == letters[j]) {
      //     result.add(j);
      //   }
      // }
    }
    return result;
  }

  List<int> sumByTarget(List<int> nums, int target) {
    if (nums.isEmpty || target.isNegative) return [];

    int n, diff;

    for (int i = 0; i < nums.length; i++) {
      n = nums[i];
      diff = target - n;

      // pq fiz isso?
      if (diff.isNegative) return [-1];

      for (int j = 0; j < nums.length; j++) {
        if (diff == nums[j]) return [n, diff];
      }
    }

    return [];
  }

  //[1, 2, 3], [4, 5, 6]
  //[2, 7, 8], [1, 1, 5]
  List<int> realWorldSum(List<int> nums_1, List<int> nums_2) {
    // tornar input e output human readable (vir na ordem que lemos)

    List<int> result = [];
    int sum, diff;
    bool shouldIncrement = false;

    if (nums_1.isEmpty || nums_2.isEmpty || (nums_1.length != nums_2.length))
      return [];

    for (int i = 0; i < nums_1.length; i++) {
      sum = nums_1[i] + nums_2[i];

      if (shouldIncrement) {
        sum += 1;
        shouldIncrement = false;
      }

      if (sum >= 10) {
        shouldIncrement = true;
        diff = sum - 10;
        result.add(diff);
      } else {
        result.add(sum);
      }
    }

    // [5, 7, 9]
    // [3,9, 3]
    return result;
  }

  String mostFrequentLetter(String letters) {
    Map<String, int> frequency = {};
    String l, mostFrequentLetter = '';
    int highestFrequency = 0;

    //sort no map usando .map() and comparteTo()

    for (int i = 0; i < letters.length; i++) {
      l = letters[i];
      frequency[l] = 1 + (frequency[l] ?? 0);

      if (frequency[l]! > highestFrequency) {
        highestFrequency = frequency[l]!;
        mostFrequentLetter = l;
      }
    }
    print(frequency);
    print(highestFrequency);
    return mostFrequentLetter;
  }

  String reverseText(String text) {
    List<String> splitedText = text.split(' ');
    String result = '';
    String symbol = '';

    // tudo bem?
    // odut meb?

    for (int i = 0; i < splitedText.length; i++) {
      var s = splitedText[i];
      for (int j = s.length - 1; j >= 0; j--) {
        if (s[j] == '?' || s[j] == ',') {
          symbol = s[j];
        } else {
          result += s[j];
        }
        print('result: $result');
      }
      result += symbol;
      symbol = '';
      if (i < splitedText.length - 1) result += ' ';
    }

    return result;
  }
}
