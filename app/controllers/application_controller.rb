# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  before_action :authenticate_request

  private

  def authenticate_request
    
  end
end
