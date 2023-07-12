import unittest


class TestingStuff(unittest.TestCase):

    a = [2, 1, 5, 1, 3, 2]
    b = [2, 3, 4, 1, 5]

    def maxSumOfContiguousSubArray(arr: list[int], k: int) -> int:
        maxSum, windowSum, windowStart = 0, 0, 0
        for i, v in enumerate(arr):
            windowSum += v
            if(i >= k - 1):
                maxSum = max(maxSum, windowSum)
                windowSum -= arr[windowStart]
                windowStart += 1
        return maxSum
    # https://dvpr.gitbook.io/coding-interview-patterns/1.-pattern-sliding-window/1.2-smallest-subarray-with-a-given-sum-easy
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

    # https://dvpr.gitbook.io/coding-interview-patterns/1.-pattern-sliding-window/1.3-longest-substring-with-k-distinct-characters-medium
    def test_longestSubstringWithKDistinctChars(self):
        f = 'araaci'
        g = 'cbbebi'
        def longestSubstringWithKDistinctChars(target_text: str, k: int) -> int:
            maxLength, windowStart = 0, 0
            d = {}

            for windowEndCharacter, character in enumerate(target_text):
                d[character] = d[character] + 1 if character in d else 1
                print('d: ', d)
                print('character: ', character)
                print('maxLength: ', maxLength)

                while(len(d) > k):
                    windowStartCharacter = target_text[windowStart]
                    d[windowStartCharacter] -= 1

                    print('[before][while-treatement] d: ', d)
                    if(d[character] == 0):
                        del d[character]
                    windowStart += 1
                    print('[after][while-treatement] d: ', d)
                    print('windowStart: ', windowStart)
                
                maxLength = max(maxLength, windowEndCharacter - windowStart + 1)
                print('--------end_for--------')

            return maxLength


        self.assertEqual(longestSubstringWithKDistinctChars(g, 3), 5)


if __name__ == '__main__':
    unittest.main()