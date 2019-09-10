# README

This is simply a rails API only APP which deals with authentication which has Swagger only. Will add a Vue front end on top of this App.


* authentication

* jwt token

* cred todo API

* swagger

# Api Testing with httpie with Login API

## first create a user using the httpie

`User.create(email: 'test@gmail.com', password: '123456', password_confirmation: '123456', name: 'test')`

## create the auth token,

`http POST :3000/login email=test@gmail.com password=123456`

Response will be like below

`{
    "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjgxODUyNTJ9._Zps86KAwzn7ODX8MG3POYaFqaxzgJZ01vmY4oOcrBQ"
}`

## Fetch all todos

  `http GET :3000/todos 'Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjgxODUyNTJ9._Zps86KAwzn7ODX8MG3POYaFqaxzgJZ01vmY4oOcrBQ'`

## Fetch single one

`http GET :3000/todos/3 'Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjgxODUyNTJ9._Zps86KAwzn7ODX8MG3POYaFqaxzgJZ01vmY4oOcrBQ'`

## to create todo 

`http POST :3000/todos title=latest is_completed=true 'Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjgxODUyNTJ9._Zps86KAwzn7ODX8MG3POYaFqaxzgJZ01vmY4oOcrBQ'`

## to update todo

`http PUT :3000/todos/3 title=updated is_completed=true 'Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjgxODUyNTJ9._Zps86KAwzn7ODX8MG3POYaFqaxzgJZ01vmY4oOcrBQ'`

## to delete todo

`http DELETE :3000/todos/3 'Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjgxODUyNTJ9._Zps86KAwzn7ODX8MG3POYaFqaxzgJZ01vmY4oOcrBQ'`
