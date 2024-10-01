use std:collections::HashMap;

struct Solution:

impl Solution {
    pub fn two_sum(nums: Vec<i32>, target: i32) -> Option<Vec<i32>> {
        // Create a hashmap to track the indices
        let mut num_map = HashMap::new();

        for (index, &num) in nums.iter().enumerate(){
            let diff = target - num;

            if let Some(&matched_index) = num_map.get(&diff){
                return Some(vec![matched_index as i32, index as i32]);
            }
            num_map.insert(num, index);
        }

        // if no pair is found, return None
        None
    }

    pub fn two_sum2(nums: Vec<i32>, target: i32) -> Vec<i32> {
        // Create a hash map to store the difference between target and each number in nums
        let mut hm = HashMap::with_capacity(nums.len());
        for (i, &num) in nums.iter().enumerate() {
            // Check if such a difference exists in the hash map
            match hm.get(&num) {
                // If it does, return the indices of the current number and the number with the difference
                Some(&j) => return vec![i as i32, j as i32],
                // If it doesn't, add the difference between target and the current number to the hash map
                None => {
                    hm.insert(target - num, i);
                },
            }
        }
        unreachable!();
    }

    // Below implementation 3 is what worked on leetcode because the return type is not optional and the implementation 2 still works
    pub fn two_sum3(nums: Vec<i32>, target: i32) -> Vec<i32> {
        let mut num_map = HashMap::new();

        for(i, &num) in nums.iter().enumerate(){
            let diff = target - num;

            if let Some(&num_index) = num_map.get(&diff){
                return vec![num_index as i32, i as i32];
            }
            num_map.insert(num, i);
        }
        nums
    }
}



fn main() {
    // Example usage:
    let nums = vec![2, 7, 11, 15];
    let target = 9;

    // Call the two_sum function
    if let Some(result) = Solution::two_sum(nums, target) {
        println!("Indices: {:?}", result);  // Output: Indices: [0, 1]
    } else {
        println!("No solution found");
    }
}
