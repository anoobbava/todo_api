# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :fetch_todo, only: %i[show update destroy]

  # GET /todos
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    json_response(@todo)
    # head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    # head :no_content
    json_response(message: 'success')
  end

  private

  def todo_params
    params.permit(:title, :is_completed)
  end

  def fetch_todo
    @todo = Todo.find(params[:id])
  end
end
