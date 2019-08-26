module riv

pub fn (p Post) title() string {
    return p.data.title
}

pub fn (p Post) content() string {
    return p.data.selftext
}

pub fn (p Post) upvotes() int {
    return p.data.ups
}

pub fn (p Post) subreddit() string {
    return p.data.subreddit
}