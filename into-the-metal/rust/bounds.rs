pub fn sum_array(arr: &[u32]) -> u32 {
    let mut sum = 0;
    for &val in arr {
        sum += val;
    }
    sum
}

fn main() {
    let arr = [1, 2, 3, 4, 5];
    println!("Sum: {}", sum_array(&arr));
}
