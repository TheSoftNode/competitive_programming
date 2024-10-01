
public class Solution {

    public int[] TwoSum(int[] nums, int target){
        Dictionary<int, int> num_map = new();

        for (int i = 0; i < nums.Length; i++){
            int diff = target - nums[i];

            if (num_map.TryGetValue(diff, out var value))
                return new int[] { value, i };

            num_map[nums[i]] = i;
        }
        return new int[] { -1, -1 }; 
    }
}