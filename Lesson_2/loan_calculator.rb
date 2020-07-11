def prompt(message)
  puts("=> #{message}")
end

prompt("Welcome to the loan calculator!")

loop do
  prompt("Please enter your desired loan amount.")

  loan_amount = ''
  loop do
    loan_amount = gets.chomp.delete(',').to_i

    if loan_amount <= 0
      prompt("Please enter a number greater than zero.")
    else
      prompt("Your loan amount is #{loan_amount}.")
      break
    end
  end

  prompt("Please enter how long your loan will be for, in years.")

  loan_duration = ''
  loop do
    loan_duration = gets.chomp.to_i

    if loan_duration <= 0
      prompt("Please enter a number greater than zero.")
    else
      prompt("You need a loan for #{loan_duration} years.")
      break
    end
  end

  prompt("Please enter your annual interest rate for the loan.")

  interest_rate = ''
  loop do
    interest_rate = gets.chomp.to_f

    if interest_rate <= 0
      prompt("Please enter a number greater than zero")
    else
      prompt("You're  interest rate is #{interest_rate} percent")
      break
    end
  end

  loan_duration_in_months = loan_duration * 12
  annual_interest_rate = interest_rate / 100
  monthly_interest_rate = annual_interest_rate / 12

  monthly_payment = loan_amount *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)
                    ))

  prompt("You're monthly payment will be: #{monthly_payment.round(2)}"\
  " It will take you #{loan_duration_in_months} months to pay it off. In"\
  " other words, about #{loan_duration} years.")

  prompt("Do you want to calculate another loan? (Type: Yes or No)")
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the loan calculator!")
