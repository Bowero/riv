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
    user_name string [json:display_name]
    user_title string [json:title]
    user_description string [json:public_description]
    user_coins int [json:coins]
}

struct UserWrapper {
    subreddit UserData
}

struct UserSearchWrapper {
    data UserWrapper
}