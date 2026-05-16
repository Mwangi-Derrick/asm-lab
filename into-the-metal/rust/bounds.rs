#[no_mangle]
#[inline(never)]
pub fn add_arrays(a: &[f64], b: &[f64], res: &mut [f64]) {
    for i in 0..a.len() {
        res[i] = a[i] + b[i];
    }
}

fn main() {
    let a = [1.0, 2.0, 3.0, 4.0];
    let b = [10.0, 20.0, 30.0, 40.0];
    let mut res = [0.0; 4];

    add_arrays(&a, &b, &mut res);
    println!("{:?}", res);
}
