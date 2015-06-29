require_relative 'config/environment'

class App < Sinatra::Base
  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  before do
    content_type :txt
  end

  get '/' do
    "Welcome to Sinatra Sessions! In this lab, we will be learning about the general principles behind a sessions cookie. In order to proceed, let's go to the '/first_exercise' path."
  end

  get '/first_exercise' do
    "Your first exercise will be to set your session key-value pair. You should be able to set the session key-value pair somewhere in the app.rb file, which is currently acting as our controller. When you navigate to the '/set' path, it should set session[:foo] equal to 'hello'."
  end

  get '/set' do
    # Implement your solution here!
    # session = params[:foo]
    session[:foo] = 'hello'

    if session[:foo] == 'hello'
      "Session value set. It's currently set to #{session[:foo]}"
      redirect '/fetch'
    else
      "Session value has not been set!"
    end
  end

  get '/fetch' do
    "session[:foo] value: #{session[:foo]}. Let's navigate to the next exercise at '/second_exercise'."
  end

  get '/second_exercise' do
    "Your second exercise will be to set your session id key-value pair. The methodology is very similar to the first exercise. When you navigate to the '/set_session' path, it should set session[:id] equal to 1."
  end

  get '/set_session' do
    # Implement your solution here!	
    session[:id] = 1

    if session[:id] == 1
      "Session ID set. It's currently set to #{session[:id]}."
      redirect '/fetch_session_id'
    else
      "Session ID has not been set!"
    end
  end

  get '/fetch_session_id' do
    "session[:id] value: #{session[:id]}."
  end

  get '/logout' do
    session.clear
    "Session has now been cleared: #{session.inspect}. Continue on to the '/finish' line!"
  end

  get '/finish' do
    "Hopefully that explains a little more about the concept of sessions. The session cookie is simply a way to store user data on a temporary basis. In any web application, a user ID is typically used as a session ID. This is because an ID attribute of a user is a unique identifier that will always be distinguishable from other user ID attributes."
  end
end
