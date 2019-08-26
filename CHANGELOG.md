# Changelog

## V 0.0.2
*26 aug 2019*

+ Added more sorting options for subreddits
  + `.new(limit int)`
  + `.hot(limit int)`
  + `.controversial(limit int)`
  + `.rising(limit int)`
+ Initialize a `User` object with `reddit.user('name')`
  + You can also select the user itself with `reddit.me()`
+ Get information from a user
  + Display name
  + Title
  + Descriptions
  + Coins

## V 0.0.1
*25 aug 2019*

+ Intialize a `Reddit` object to generate a token
+ Initialize a `Subreddit` object with `reddit.subreddit('jokes')`
+ Get posts from a subreddit
  + Currently only `.top(limit int)`
+ Get information from a post
  + Title
  + Content
  + Upvotes
  + Subreddit