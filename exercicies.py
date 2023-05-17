import unittest

a = [2, 1, 5, 1, 3, 2]
b = [2, 3, 4, 1, 5]

class TestingStuff(unittest.TestCase):

    def maxSumOfContiguousSubArray(arr: list[int], k: int) -> int:
        maxSum, windowSum, windowStart = 0, 0, 0
        for i, v in enumerate(arr):
            windowSum += v
            if(i >= k - 1):
                maxSum = max(maxSum, windowSum)
                windowSum -= arr[windowStart]
                windowStart += 1
        return maxSum

    def test_smallestSubarrayWithGivenSum(self):
        c = [2, 1, 5, 2, 3, 2]
        d = [2, 1, 5, 2, 8]
        e = [3, 4, 1, 1, 6]

        def smallestSubarrayWithGivenSum(arr: list[int], s: int) -> int:
            minLength, windowStart, windowSum = 99, 0, 0

            for windowEnd, v in enumerate(arr):
                windowSum += v
                while(windowSum >= s):
                    minLength = min(minLength, windowEnd - windowStart + 1)
                    windowSum -= arr[windowStart]
                    windowStart +=1


            return minLength

        result = smallestSubarrayWithGivenSum(d, 7)
        self.assertEqual(result, 1)

    def test_longestSubstringWithKDistinctChars(self):
        f = 'araaci'
        g = 'cbbebi'

        def longestSubstringWithKDistinctChars(target_text: str, k: int) -> int:
            maxLength, windowStart = 0, 0
            result = {}

            for windowEnd, character in enumerate(target_text):
                result[character] = result[character] + 1 if character in result else 1
                print(result)

                while(len(result) > k):
                    result[target_text[windowStart]] -= 1

                    if(result[character] == 0):
                        del result[character]
                    windowStart += 1
                
                maxLength = max(maxLength, windowEnd - windowStart + 1)

            return maxLength


        self.assertEqual(longestSubstringWithKDistinctChars(g, 3), 5)


if __name__ == '__main__':
    unittest.main()