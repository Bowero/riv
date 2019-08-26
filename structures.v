module riv

struct Reddit {
    access_token   string  
}

struct Subreddit {
    reddit  Reddit
    name    string
}

struct PostData {
    title       string
    selftext    string
    ups         int
    subreddit   string
}

struct Post {
    data PostData
}

struct PostList {
    children []Post
}

struct Result {
    data PostList
}

struct UserData {
    display_name string
    title string
    public_description string
    coins int
}

struct User {
    subreddit UserData
}