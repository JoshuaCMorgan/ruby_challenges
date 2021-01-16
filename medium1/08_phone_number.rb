=begin

Write a program that cleans up user-entered phone numbers so that they can be sent as SMS 
messages.

The rules are as follows:

    If the phone number is less than 10 digits assume that it is bad number
    If the phone number is 10 digits assume that it is good
    If the phone number is 11 digits and the first number is 1, trim the 1 and use the 
    last 10 digits
    If the phone number is 11 digits and the first number is not 1, then it is a bad 
    number
    If the phone number is more than 11 digits assume that it is a bad number

=end

=begin

  - given phone number
    - remove all but digits
    - unless size of string is 10, return string all zeros size 10

=end

class PhoneNumber
  attr_reader :number

  def initialize(number)
    @number = number
    @number = clean_number
  end

  def clean_number
    sms_num = convert_to_sms_number(@number)
    return "0000000000" unless valid?(sms_num)
     if sms_num.size == 11
      sms_num = sms_num[1..-1]
     end
    sms_num
  end

  def area_code
    @number[0..2]
  end

  def to_s
    "(#{@number[0..2]}) #{@number[3..5]}-#{@number[6..10]}"
  end

  def valid?(sms_num) 
    return false if sms_num.match?(/[A-Za-z]/)
    return true if sms_num.size == 10
    return false unless sms_num.size == 11
    return false unless sms_num[0] == "1"
    true
  end

  def convert_to_sms_number(phone_number)
    phone_number.gsub(/[^\h]/, '')
  end
end
