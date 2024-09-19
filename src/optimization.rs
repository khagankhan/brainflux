pub struct Profiler{}

impl Profiler {
    pub fn print_profile(count_vector: &Vec<(char, u32)>) {
        print!("\n");
        let mut index = 0;
        while index < count_vector.len(){
            println!("{:<5}|  {:<3}|  {:<5}",  index, count_vector[index].0 as char, count_vector[index].1);
            index += 1;
        }
    }
    pub fn do_profile(count_vector: &mut Vec<(char, u32)>, index: usize, token: char) {
        count_vector[index].0 = token;
        count_vector[index].1 += 1;
    }
    pub fn simple_loop(simple_loop: &mut Vec<(char, u32)>, index: usize) {
        simple_loop.sort_by(|a, b| a.1.cmp(&b.1));
        println!("Loop at {} executed {} times", index, simple_loop[index].1);
    }
}
