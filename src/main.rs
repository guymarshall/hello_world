use rayon::prelude::*;

struct Letter {
    letter: char
}

impl Letter {
    fn new(letter: char) -> Letter {
        Letter {
            letter
        }
    }
}

fn main() {
    let letters: Vec<Letter> = vec![
        Letter::new('h'),
        Letter::new('e'),
        Letter::new('l'),
        Letter::new('l'),
        Letter::new('o'),
        Letter::new(','),
        Letter::new(' '),
        Letter::new('w'),
        Letter::new('o'),
        Letter::new('r'),
        Letter::new('l'),
        Letter::new('d'),
        Letter::new('!')
    ];

    let secret_message: String = letters
        .par_iter()
        .map(|letter| letter.letter)
        .collect();

    println!("{}", secret_message);
}