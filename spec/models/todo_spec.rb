# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do

  describe 'todo' do
    let!(:todo) {FactoryBot.create(:todo)}

    context 'check the instance' do
      it 'be valid' do
        expect(todo).to be_valid
      end

      it 'not valid' do
        invalid_todo = Todo.new(title: nil)
        expect(invalid_todo).to be_invalid
      end

      it 'has the timestamp columns' do
        expect(todo.created_at).not_to be_nil
        expect(todo.updated_at).not_to be_nil
      end
    end
  end
end
