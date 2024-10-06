class Solution(object):
    def containsNearbyDuplicate(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: bool
        """
        hashset = set()
        l = 0

        for r in range(len(nums)):
            if (r-l) > k:
                hashset.remove(nums[l])
                l += 1
            
            if nums[r] in hashset:
                return True
            hashset.add(nums[r])
        return False
        