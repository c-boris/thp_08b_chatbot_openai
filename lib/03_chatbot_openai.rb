#Pré-requis de fonctionnement du programme
require 'http'
require 'json'
require 'dotenv'
Dotenv.load('.env')

def chatbot(conversation_history)
  #Création de la clé API
  api_key = ENV["OPENAI_API_KEY"]
  url = "https://api.openai.com/v1/engines/text-davinci-003/completions"

  #Demande d'autorisation d'utilisation envers OpenAI
  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
  }

  #Données vers OpenAI
  data = {
    "prompt" => conversation_history,
    "max_tokens" => 150,
    "n" => 1,
    "temperature" => 0
  }

  response = HTTP.post(url, headers: headers, body: data.to_json)
  response_body = JSON.parse(response.body.to_s)
  response_string = response_body['choices'][0]['text'].strip
end

conversation_history = "User :"
loop do
  print "User : "
  user_input = gets.chomp
  break if user_input == "QUIT"
  conversation_history += user_input + "\n"
  response = chatbot(conversation_history)
  puts "IA : " + response.to_s
  conversation_history += response + "\n"
end

