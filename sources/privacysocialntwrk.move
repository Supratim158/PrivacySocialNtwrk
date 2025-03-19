module MyModule::PrivacySocialNetwork {

    use aptos_framework::signer;

    /// Struct representing a private post.
    struct Post has store, key {
        content: vector<u8>, // Post content stored as bytes for privacy
    }

    /// Function to create a private post.
    public fun create_post(owner: &signer, content: vector<u8>) {
        let post = Post {
            content,
        };
        move_to(owner, post);
    }

    /// Function to get the content of the private post.
    public fun get_post(owner: address): vector<u8> acquires Post {
        let post = borrow_global<Post>(owner);
        post.content
    }
}
