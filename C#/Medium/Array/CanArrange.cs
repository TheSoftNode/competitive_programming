public class Solution {
    public bool CanArrange(int[] arr, int k){
        Dictionary<int, int> remainderMap = new();

        for (int i = 0; i < arr.Length; i++){
            int rem = arr[i] % k;
            if (rem < 0 )rem += k;

            if (remainderMap.TryGetValue(rem, out var value)) remainderMap[rem]++;
            else{
                remainderMap[rem] = 1;
            }
        }

        foreach (var (rem, count) in remainderMap){
            if (rem == 0) {
                if (count % 2 != 0)
                    return false;
            else{
                int complement = k - rem;
                if (!remainderMap.ContainsKey(complement) || remainderMap[complement] != count)
                    return false;
            }
        }

        return true;
    }
}