module riv

import http
import json

pub fn (r Reddit) me() ?User {
    url := '$base_url/api/v1/me'
    mut req := http.new_request('GET', url, '') or {
        panic('Error requesting subreddit')
    }
    req.add_header('Authorization', 'bearer ' + r.access_token)
    response := req.do() or {
        panic(err)
    }
    user := json.decode(User, response.text) or {
        panic('Error decoding JSON')
    }
    return user
}

pub fn (u User) name() string {
    return u.subreddit.display_name
}

pub fn (u User) title() string {
    return u.subreddit.title
}

pub fn (u User) description() string {
    return u.subreddit.public_description
}

pub fn (u User) coins() int {
    return u.subreddit.coins
}