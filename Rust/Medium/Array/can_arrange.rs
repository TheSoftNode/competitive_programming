use std::collections::HashMap;

struct Solution;

impl Solution {
    pub fn can_arrange(arr: Vec<i32>, k: i32) -> bool {
        let mut remainder_map = HashMap::new();

        // Iterate over the array and calculate the remainder of each element mod k
        for &num in &arr {
            let mut rem = num % k;
            if rem < 0 {
                rem += k; // Handle negative remainders
            }

            // Increment the frequency of the remainder
            *remainder_map.entry(rem).or_insert(0) += 1;
        }

        // Now check if all remainders can be paired correctly
        for (&rem, &count) in &remainder_map {
            // Special case: remainder 0 must have an even count to pair within
            if rem == 0 {
                if count % 2 != 0 {
                    return false;
                }
            } else {
                // For any remainder rem, its pair should be k - rem
                let complement = k - rem;
                // Check if the count of remainder rem matches the count of its complement
                if remainder_map.get(&complement).unwrap_or(&0) != &count {
                    return false;
                }
            }
        }

        true
    }
}
