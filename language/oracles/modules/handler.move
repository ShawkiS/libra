address 0x1 {

module Handler {

use 0x1::Vector;
use 0x1::CoreAddresses;
use 0x1::Signer;

resource struct State {
	count: u64 // updated every 1000 blocks
}

struct Vote {
    voter: address,
    number: u64,
    count: u64
}

resource struct Votes {
    votes: vector<Vote>
}

public fun initializet_votes(account: &signer) {
        move_to<Votes>(account, Votes {
            votes: Vector::empty<Vote>()
        })
}

public fun voter_exists(account: &signer, count: u64): bool acquires State {
        let owner = Signer::address_of(account);
        let state_count = borrow_global<State>(owner).count;
        let list_of_votes = borrow_global_mut<Votes>(Signer::address_of(account));
        let number_of_votes = Vector::length(list_of_votes);
        let result = false;
        loop {
            if (i == number_of_votes) { 
                break 
            };
            if(list_of_votes[i].count == count && list_of_votes[i].voter ==owner) {
                result  = true
            }
        };
        result
}


public fun receive_vote (account: &signer, int: u64) acquires Votes {
    let owner = Signer::address_of(account);
	let t = borrow_global_mut<Votes>(owner); r
	Vector::push_back(&t.voter, owner);
    Vector::push_back(&t.number, int);
}

}

}