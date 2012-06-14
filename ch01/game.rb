require 'sinatra'

# before we process a route, we'll set the response as
# plain text and set up an array of viable moves that
# a player (and the computer) can perform
before do
  content_type :txt
  @defeat = { :rock => :scissors,
              :paper => :rock,
              :scissors => :paper
            }
  @throws = @defeat.keys
end

get '/throw/:type' do
  # the params[] hash stores querystring and form data
  player_throw = params[:type].to_sym
  
  # in the case of a player providing a throw that is not valid,
  # we halt with a status code of 403 (Forbidden) and let them
  # know they need to make a valid throw to play.
  unless @throws.include? player_throw
    halt 403, "You must throw one of the following: #{@throws.join ', '}"
  end
  
  # now we can select a random throw for the computer
  computer_throw = @throws.sample
  
  # compare the play and computer throws to determine a winner
  if player_throw == computer_throw
    "You tied with the computer. Try again!"
  elsif computer_throw == @defeat[player_throw]
    "Nicely done; #{player_throw} beats #{computer_throw}!"
  else
    "Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!"
  end
end