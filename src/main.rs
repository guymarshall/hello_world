const HELLO_WORLD: [char; 13] = ['H', 'e', 'l', 'l', 'o', ',', ' ', 'w', 'o', 'r', 'l', 'd', '!'];

fn main() {
    (0..12).for_each(|index: usize| print!("{}", HELLO_WORLD[index]));
    println!();
}
