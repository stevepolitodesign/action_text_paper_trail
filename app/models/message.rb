class Message < ApplicationRecord
  include HasPaperTrail

  has_rich_text :content
end
