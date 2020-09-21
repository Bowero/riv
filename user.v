module riv

import net.http
import json

pub fn (r Reddit) me() ?UserData {
    url := '$base_url/api/v1/me'
    mut req := http.new_request(.get, url, '') or {
        panic('Error requesting subreddit')
    }
    req.add_header('Authorization', 'bearer ' + r.access_token)
    response := req.do() or {
        panic(err)
    }
    user := json.decode(UserWrapper, response.text) or {
        panic('Error decoding JSON')
    }
    return user.subreddit
}

pub fn (r Reddit) user(n string) ?UserData {
    url := '$base_url/user/$n/about'
    mut req := http.new_request(.get, url, '') or {
        panic('Error requesting subreddit')
    }
    req.add_header('Authorization', 'bearer ' + r.access_token)
    response := req.do() or {
        panic(err)
    }
    user := json.decode(UserSearchWrapper, response.text) or {
        panic('Error decoding JSON')
    }
    return user.data.subreddit
}

pub fn (u UserData) name() string {
    return u.user_name
}

pub fn (u UserData) title() string {
    return u.user_title
}

pub fn (u UserData) description() string {
    return u.user_description
}

pub fn (u UserData) coins() int {
    return u.user_coins
}