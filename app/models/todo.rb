# frozen_string_literal: true

class Todo < ApplicationRecord
  validates_presence_of :title
end
