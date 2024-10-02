#include <vector>

using namespace std;

class Solution {
public:
    bool canArrange(vector<int>& arr, int k) {
        // Create a map to store the frequency of each remainder
        unordered_map<int, int> remainderMap;

        // Iterate over the array and calculate the remainder of each element mod k
        for (int i = 0; i < arr.size(); ++i){
            // Calculate the remainder (ensure it is non-negative by adding k if negative)
            int rem = arr[i] % k;
            if (rem < 0) rem += k; //Handle negative remainders

            // Increment the frequency of the remainder
            remainderMap[rem]++;
        }

        // Now check if all remainders can be paired correctly
        for (auto& [rem, count] : remainderMap){
            // Special case: remainder 0 must have an even count to pair within
            if (rem == 0){
                if (count % 2 != 0) return false;
            }
            // For any remainder rem, its pair should be k - rem
            else {
            }
                int complement = k - rem;
                // Check if the count of remainder rem matches the count
                if (remainderMap[rem] != remainderMap[complement]) return false;
        }

        return true;
    }
};