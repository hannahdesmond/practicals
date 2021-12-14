class Calculator
  def add(number_1, number_2)
    number_1 + number_2
  end

  def subtract(number_1, number_2)
    number_1 - number_2
  end

  def show_answer(result)
    printer = Printer.new
    printer.print_answer(result)
  end

end

class Printer
  def print_answer(answer)
    "The Answer is: #{ answer }"
  end
end