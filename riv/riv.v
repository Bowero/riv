module riv

import json
import http
import encoding.base64

const (
    base_url = 'https://oauth.reddit.com/'
)

pub fn init(username string, password string, client_id string, client_secret string) ?Reddit {
    url := 'https://www.reddit.com/api/v1/access_token'
    args := 'grant_type=password&username=$username&password=$password'

    mut req := http.new_request('POST', url, args) or {
        panic('Creating a new request failed')
    }
    req.add_header('Authorization', 'Basic ' + base64.encode('$client_id:$client_secret'))
    req.add_header('User-Agent', 'App by Bowero')
    response := req.do() or {
        panic(err)
    }
    r := json.decode(Reddit, response.text)
    return r
}

pub fn (r Reddit) subreddit(s string) Subreddit {
    sr := Subreddit {
        name: s
        reddit: r
    }
    return sr
}

pub fn (s Subreddit) top(l int) ?[]Post {
    url := '$base_url/r/$s.name/top?limit=$l'
    mut req := http.new_request('GET', url, '') or {
        panic('Error requesting subreddit')
    }
    req.add_header('Authorization', 'bearer ' + s.reddit.access_token)
    response := req.do() or {
        panic(err)
    }
    p := json.decode(Result, response.text) or {
        panic(err)
    }
    return p.data.children
}

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