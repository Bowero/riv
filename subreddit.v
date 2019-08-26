module riv

pub fn (s Subreddit) top(l int) ?[]Post {
    return s.sort(l, 'top')
}

pub fn (s Subreddit) hot(l int) ?[]Post {
    return s.sort(l, 'hot')
}

pub fn (s Subreddit) new(l int) ?[]Post {
    return s.sort(l, 'new')
}

pub fn (s Subreddit) controversial(l int) ?[]Post {
    return s.sort(l, 'controversial')
}

pub fn (s Subreddit) rising(l int) ?[]Post {
    return s.sort(l, 'rising')
}

fn (s Subreddit) sort(l int, t string) ?[]Post { 
    url := '$base_url/r/$s.name/$t?limit=$l'
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