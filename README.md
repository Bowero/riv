# RIV: Reddit in V
RIV is a wrapper for the Reddit API that allows you to easily gather information from the Reddit API. It is written completely in V.

## Installation
To install RIV, you can use [VPM](https://vpm.vlang.io/).

```bash
$ v install Bowero.riv
```

Please note: Due to a bug, you will have to rename the folder to `bowero.riv`. So no uppercases.

## Quickstart
```v
module main

import bowero.riv

fn main() {
    r := riv.start('Bowero', '1234567890', 'a1b2c3d4e5','z26y25x24w23v22-u21') or {
        panic('AAAAH')
    }
    s := r.subreddit('jokes')
    posts := s.top(5) or {
        panic(err)
    }
    for post in posts {
        println('Title: ' + post.title())
    }
}
```

```
Title: The Dwayne Johnson Rule.
Title: A priest is sitting inside the church, when a guy comes in and asks to be confessed.
Title: NSFW my dick might not be 12 inches
Title: 50000 blondes met in a center for the first ever "Blondes are not stupid" convention
Title: If Queen Elizabeth accidentaly farted during dinner, the other guests are supposed to pretend like nothing happened.
```
