from typing import List
from collections import defaultdict

class Solution:
    def canArrange(self, arr: List[int], k: int) -> bool:
        remainderMap = defaultdict(int)

        for num in arr:
            rem = num % k
            if rem < 0: rem += k

            remainderMap[rem] += 1

        for rem, count in remainderMap.items():
            if rem == 0:
                if count % 2 != 0: return False
            else:
                complement = k - rem
                if remainderMap[complement] != count: return False
        
        return True
