#!/usr/bin/ruby

#if number between 0..10 then add
#if number between 11-21 then subtract
#if number between 22-30 then multiply
#elseif number > 30 then divide

#require 'pry'

loop do
  def say(msg)
    puts "------#{msg}--------"
  end
  def result(result)
    puts "result is #{result}"
  end
  say("please enter the first number")
  num1 = gets.chomp
  say("please enter the second number")
  num2 = gets.chomp
  say("please enter: 1)add, 2)subtract, 3)multiply, 4)divide, 5)STOP ")
  operator = gets.chomp
  if operator.to_i == 1
     puts "Add"
     result = num1.to_i + num2.to_i
  elsif operator.to_i == 2
     result = num2.to_i - num1.to_i
  elsif operator.to_i == 3
    result = num1.to_f * num2.to_f
  #binding.pry
  elsif operator.to_i == 4
    result = num2.to_f / num1.to_f
  elsif operator.to_i == 5
    break
  end
  result(result)
end