require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/home") do
  "<navbar>
  <a href=/dice/2/6>2d6</a>
  <a href=/dice/2/10>2d10</a>
  <a href=/dice/1/20>1d20</a>
  <a href=/dice/5/4>5d4</a>
  </navbar>

 <h1>Dice Roll</h1>
<ul>
  <li><a href='/dice/2/6'>Roll two 6-sided dice</a></li>
    <li><a href='/dice/2/10'>Roll two 10-sided dice</a></li>
    <li><a href='/dice/1/20'>Roll one 20-sided die</a></li>
    <li><a href='/dice/5/4'>Roll five 4-sided dice</a></li>
</ul>"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end
get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end


get("/dice/2/10") do
  first_one = rand(1..10)
  second_one = rand(1..10)
  total = first_one + second_one

  output = "You rolled a #{first_one} and a #{second_one} for a total of #{total}."

  "<h1>2d10</h1>
  <p>#{output}</p>"
end

get("/dice/1/20") do
only_one = rand(1..20)

output = "You rolled a total of #{only_one}."

"<h1>1d20</h1>
<p>#{output}</p>"
end

get("/dice/5/4") do
  first = rand(1..4)
  second = rand(1..4)
  third = rand(1..4)
  fourth = rand(1..4)
  fifth = rand(1..4)
 
  total = first + second + third + fourth + fifth
  output = "You rolled a #{first},  a #{second}, a #{third}, and two anothers #{fourth} and  #{fifth} for a total of #{total}."

  "<h1>5d4</h1>
<p>#{output}</p>"
end
