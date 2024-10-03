class Solution
{
public:
    vector<int> arrayRankTransform(vector<int> &arr)
    {
        int n = arr.size();

        if (n == 0) // If the array is empty, return an empty vector
            return {};

        set<int> uniqueElements(arr.begin(), arr.end());

        unordered_map<int, int> ranks;
        int rank = 1; // Rank starts from 1

        for (const int &ele : uniqueElements)
            ranks[ele] = rank++; // Increment the rank for the next element

        vector<int> ans;

        for (int &ele : arr)
            ans.push_back(ranks[ele]);

        return ans; // Return the rank-transformed array
    }
}