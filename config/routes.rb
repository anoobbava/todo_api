Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos
  post 'login', to: 'authentication#authenticate'
end

# get /todos/new
# post /todos
# get /todos
# get /todos/:id >> show
# get /todos/:id/edit >> edit
# put/patch /todos/:id >> update
# delete /todos/:id >> delete
