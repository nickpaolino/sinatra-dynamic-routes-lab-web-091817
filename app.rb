require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    name = params[:name]
    "#{name.reverse}"
  end

  get '/square/:number' do
    num = params[:number].to_i
    "#{num ** 2}"
  end

  get '/say/:number/:phrase' do
    phrase, number = params[:phrase], params[:number].to_i
    "#{phrase * number}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    string = ""
    params.each do |key, word|
      string += word + " "
    end
    string[-1] = "."
    string
  end

  get '/:operation/:number1/:number2' do
    num1, num2 = params[:number1].to_i, params[:number2].to_i
    case params[:operation]
    when "add"
      result = num1 + num2
    when "subtract"
      result = num1 - num2
    when "multiply"
      result = num1 * num2
    when "divide"
      result = num1 / num2
    end
    result.to_s
  end
end
