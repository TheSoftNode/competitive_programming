using System;
using System.Collections.Generic;

namespace Batch_1
{
    public class TwoSumChallenge
    {
        /// <summary>
        ///     Finds the indexes of the first number pair (two numbers) in a given array that when
        ///     added (the number not their indexes) sums up to exactly the given target.
        /// </summary>
        /// <example>
        ///     Given an array: [8, 2, 9, 4, 5], and a target value: 13, The first pair
        ///     from the array that sums up to 13 is 9 and 4, i.e, 9 + 4 = 13. Then, the
        ///     function returns their indexes as (2, 3).
        /// </example>
        /// <remarks>
        ///     The approach is to use the algebra concept that if a + b = c; then a = c - b
        ///     or b = c -a, where c is the target; a and b are the array values. A dictionary
        ///     is created to keep track of values (as the key) and their indexes(as the value)
        ///     At the end, it returns the indexes of the values that add up to the target
        /// </remarks>
        /// <param name="nums">Array of numbers to be traversed</param>
        /// <param name="target">The target value to be checked</param>
        /// <returns> A Turple - Indexes of the two nums (that add up to the target)</returns>
        public static (int, int) TwoSum(int[] nums, int target)
        {
            // A dictionary to hold the value and their indexes
            var seen = new Dictionary<int, int>();

            // Loops through the given array of numbers
            for (int i = 0; i < nums.Length; i++) 
            {
                // Checks say; a = c - b starting from first value in array
                int diff = target - nums[i];

                // Checks if dictionary has a key <a> in it. If yes, it returns
                // the value of the <a> key and the index of b - the present index
                // Note that you can also use: if (seen.ContainsKey(diff)) to check
                if (seen.TryGetValue(diff, out var value))
                    return (seen[diff], i);

                // If the key <a> is not found in the dictionary, it populates it with <b> as the
                // key and the index of <b> as the value
                seen[nums[i]] = i;
            }

            // Returns (-1, -1) if not found
            return (-1, -1);
        }
    }
}
