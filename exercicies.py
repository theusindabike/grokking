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

result = maxSumOfContiguousSubArray(b, 2)
print(result)