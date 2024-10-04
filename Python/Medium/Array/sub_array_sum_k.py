from typing import List
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        res = 0
        cur_sum = 0
        prefixSums = {0 : 1}

        for n in nums:
            cur_sum += n
            diff = cur_sum - k

            res += prefixSums.get(diff, 0)
            prefixSums[cur_sum] = 1 + prefixSums.get(cur_sum, 0)
            
        return res