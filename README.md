# transcoder

Transcode between common web formats and Ruby. 

## Scenario (Web->Ruby)
Say you'd pulled an API based resource using `rest-client`
  
  * All that you wanted was a ruby object.
  * You don't want to know anything about the format that the API serves. 
  * You're pretty sure its something pretty common.
  

## Example (Web->Ruby)
    $ irb -rubygems
    
    >> require 'restclient'
    >> require 'transcoder'
    
    >> rc = RestClient.get('http://vimeo.com/api/v2/benschwarz/likes.json')
    
    >> Transcoder.for(rc.headers[:content_type]).parse(rc.to_s)
    
What you'll get back is a Ruby object. Lovley.

## Scenario (Ruby→Web)

You have a Ruby array or a hash and you want to pack it up and post it off somewhere else

  * You have a target (content|mime)-type in mind 
    
    or
    
  * You have a named format eg: "json"

## Example (Ruby→Web)
    $ irb -rubygems
    
    >> require 'transcoder'
    

## Supported formats

* Json
* XML
* RSS / Atom
* Yaml

## Install

    gem install transcoder

### Notes about RSS / Atom parsing and generation

* Transcoder will return a SimpleRSS object rather than a straight up Ruby hash, this shouldn't be (much) of a reason for concern.
  
  This simply means that you'll want to call the properties of the returned object with method calls rather than hash access.
* There is no 'generate' method for feeds. This is simply because they require much more information than a raw feed.

## Future thoughts

* Add something to cast attributes to a native ruby object, eg - if its key is `created_at`, try to date parse it.


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
