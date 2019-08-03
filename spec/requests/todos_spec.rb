require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
    let(:todo) { FactoryBot.create(:todo) }

    describe 'GET /todos' do
        context 'valid case' do
            before { get '/todos' }
            it 'check for response' do
                expect(response.body).not_to be_empty
            end
            it 'check the response code' do
                get '/todos'
                expect(response.status).to eq 200
            end
        end
    end

    describe 'POST /todos' do
        let(:valid_data) { { title: 'Test' } }
        let(:invalid_data) { { title: nil } }
        context 'valid case' do
            before do
                post '/todos/', params: valid_data
                @data = JSON.parse(response.body)
            end
            it 'check for response' do
                post '/todos/', params: valid_data
                expect(@data['title']).not_to be_empty
                expect(@data['title']).to eq 'Test'
            end
            it 'check the response code' do
                expect(response.status).to eq 201
            end
        end

        context 'invalid case' do
            before do
                post '/todos/', params: invalid_data
                @data = JSON.parse(response.body)
            end
            it 'check for response' do
                expect(@data['message']).to include("Title can't be blank")
            end
            it 'check the response code' do
                expect(response.status).to eq 422
            end
        end
    end

    describe 'GET /todos/:id' do
        let (:valid_todo) { FactoryBot.create(:todo)}
        context 'valid case' do
            before do
                get "/todos/#{valid_todo.id}"
                @data = JSON.parse(response.body)
            end
            it 'check for response' do
                expect(@data['title']).not_to be_empty

            end
            it 'check the response code' do
                expect(response.status).to eq 200
            end
        end

        context 'invalid case' do
            before do
                get "/todos/fff"
                @data = JSON.parse(response.body)
            end
            it 'check for response' do
                expect(@data['message']).to include("Couldn't find Todo")
            end
            it 'check the response code' do
                expect(response.status).to eq 404
            end
        end
    end
end
