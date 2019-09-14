# app.rb
require 'sinatra'

#hash1={}
def get_todos
  @@todos ||= []
end



def add_todo(todo1)
  get_todos().push(todo1)
  
end

def get_todo
  get_todos()[@id.to_i - 1]
  end

post "/todos" do
  hash1={"title" => params[:title] , "date" => params[:date]}
add_todo(hash1)
   redirect "/todos"
end

get "/todos/:id" do
  @id = params[:id]
  @todo = get_todo()
    erb :todo
end

get "/todos" do
  @todos = get_todos()
 # @date = get_date()
    erb :todos
end


def update_todo(title)
  get_todos()[@id.to_i - 1]["title"] = title
 end

put "/todos/:id" do
  @id = params[:id]
  update_todo(params[:title])
  redirect "/todos"
  end

def delete_todo
  get_todos().slice!(@id.to_i - 1)
end
delete "/todos/:id" do
  @id = params[:id]
  delete_todo()
  redirect "/todos"
end