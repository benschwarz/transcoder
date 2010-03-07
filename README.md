# transcoder

Transcode from common web based formats into plain old Ruby.

## Scenario
Say you'd pulled an API based resource using `rest-client`
  
  * All that you wanted was a ruby object.
  * You don't want to know anything about the format that the API uses. 
  * You're pretty sure its something pretty common.
  
## Install

    gem install transcoder

## Example
    $ irb -rubygems
    
    >> require 'restclient'
    >> require 'transcoder'
    
    >> rc = RestClient.get('http://vimeo.com/api/v2/benschwarz/likes.json')
    
    >> Transcoder::Parser.for(rc.headers[:content_type]).parse(rc.to_s)
    
What you'll get back is a Ruby object. Lovley.

## Supported formats

* Json
* XML
* RSS / Atom

## Future thoughts

* Add something to cast attributes to a native ruby object, eg - if its key is created_at, try to date parse it.


## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Ben Schwarz. See LICENSE for details.
