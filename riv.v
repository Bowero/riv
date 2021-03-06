module riv

import net.http 
import json
import encoding.base64

const (
    base_url = 'https://oauth.reddit.com/'
)

pub fn start(username string, password string, client_id string, client_secret string) ?Reddit {
    url := 'https://www.reddit.com/api/v1/access_token'
    args := 'grant_type=client_credentials&username=$username&password=$password'

    mut req := http.new_request(.post, url, args) or {
        panic('Creating a new request failed')
    }
    req.add_header('Authorization', 'Basic ' + base64.encode('$client_id:$client_secret'))
    req.add_header('User-Agent', 'App by Bowero')
    response := req.do() or {
        panic(err)
    }
    r := json.decode(Reddit, response.text) or {
        panic(err)
    }
    return r
}

pub fn (r Reddit) subreddit(s string) Subreddit {
    sr := Subreddit {
        name: s
        reddit: r
    }
    return sr
}