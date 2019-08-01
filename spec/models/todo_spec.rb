# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should validate_presence_of(:title) }
end
