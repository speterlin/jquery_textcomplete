# JqueryTextcomplete

JqueryTextcomplete can be used for autocompleting search fields, tags in textareas, and other textfield inputs! Compatible with Ruby on Rails applications, can be used in conjunction with [searchkick](https://github.com/ankane/searchkick) gem for returning autocomplete results and with [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on) gem for autocomplete tagging. Requires Jquery.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jquery_textcomplete'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jquery_textcomplete

## Usage

Include in your application.js file:

    //= require jquery.textcomplete

Include in your application.scss file:

    //= require jquery.textcomplete

Example usage:

In views:

    <script type="text/javascript">
      addTextCompleteForHashtagsAndUsertags($('.textcomplete'));
    </script>

In application.js:

    function addTextCompleteForHashtagsAndUsertags($textarea) {
      $textarea.textcomplete([
        {
          // Usertag strategy
          match: /(\s|^)@([^\s]+)$/,
          search: function (term, callback) {
            $.getJSON('/users/autocomplete_usertag', { query: term })
              .done(function (resp) { callback(resp); })
              .fail(function ()     { callback([]);   });
          },
          replace: function (value) {
            return '$1' + value + ' ';
          }
        },
        {
          // Hashtag strategy
          match: /(\s|^)#(\w+)$/,
          search: function (term, callback) {
            $.getJSON('/posts/autocomplete_hashtag', { query: term })
              .done(function (resp) { callback(resp); })
              .fail(function ()     { callback([]);   });
          },
          replace: function (value) {
            return '$1' + value + ' ';
          }
        }
      ]);
    }

In users_controller.rb:

    def autocomplete_usertag
      render json: User.search(params[:query], {
        fields: ["name"],
        limit: 10,
        load: false,
        misspellings: {below: 2}
      }).map{|user| user.name.downcase.prepend('@').split(' ').join('.')}
    end

In routes.rb:

    get 'autocomplete_usertag' => 'users#autocomplete_usertag', on: :collection


For more options and style customization, please, see [jQuery Textcomplete documentation](https://github.com/yuku-t/jquery-textcomplete).

<!-- ## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org). -->

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/speterlin/jquery_textcomplete. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
