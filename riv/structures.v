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