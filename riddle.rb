require "byebug"

class String
  def red;    "\e[31m#{self}\e[0m" end
  def green;  "\e[32m#{self}\e[0m" end
  def blue;   "\e[34m#{self}\e[0m" end

  def bold;   "\e[1m#{self}\e[22m" end
  def italic; "\e[3m#{self}\e[23m" end
end

def highlight(message)
  message.gsub(/\w+:(bold)/) do |str|
    word = str.split(":").first

    word.bold.italic
  end
end

def assert(statement, success_message:, error_message:)
  if statement
    puts highlight(success_message).green
  else
    puts highlight(error_message).red
  end
end
