# README

Explores how to add [paper_trail](https://github.com/paper-trail-gem/paper_trail) to [Action Text](https://edgeguides.rubyonrails.org/action_text_overview.html).

Because `ActionText::RichText` is stored in the "action_text_rich_texts" table, it's not versioned by default, even if the associated record uses `has_paper_trail`.

One solution is to add `has_paper_trail` to `ActionText::RichText` by via a Concern through an initializer.

```ruby
# config/initializers/action_text.rb
Rails.application.config.to_prepare do
  ActionText::RichText.include HasPaperTrail
end

# app/models/concerns/has_paper_trail.rb
module HasPaperTrail
  extend ActiveSupport::Concern

  included do
    has_paper_trail
  end
end

# app/models/message.rb
class Message < ApplicationRecord
  include HasPaperTrail

  has_rich_text :content
end

message = Message.create!(content: "Version 1")
message.update!(content: "Version 2")
message.content.versions.last.reify.body.to_plain_text
# => Version 1
```

## Local Setup

Run `./bin/setup`