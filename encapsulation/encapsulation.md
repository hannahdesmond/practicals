Object Oriented Code 1, Encapsulation & Cohesion
================================================

[Makers Practical](https://github.com/makersacademy/skills-workshops/blob/main/practicals/object_oriented_design/encapsulation.md)

*Goals worked towards: *
* Describe some basic OO principles like encapsulation and SRP.
* Test-drive a simple program using objects and methods.
* Encapsulate program behaviour into cohesive classes.

## Introduction

We break our programs up into multiple objects to control complexity. So how do we decide which methods and variables should live in which objects?

As programmers we strive for "low coupling and high cohesion". This practical is about achieving cohesion.
### Cohesion

Each class should have one purpose or job, sometimes referred to as its responsibility.

A class has high cohesion when everything inside of it relates to that purpose, without anything extraneous. Perfection is achieved when there is nothing left to take away.


## Exercise 1

**Use a diagram to group** the methods in these examples:

```
Bank
  - get_balance
  - credit_account(date, amount)
  - debit_account(date, amount)
  - print_statement
```

```
SecretDiary
  - lock
  - unlock
  - add_entry
  - get_entries
```

## Exercise 2

**Use a diagram to group** the methods in this example:

```ruby
class Calculator
  def add(number_1, number_2)
    number_1 + number_2
  end

  def subtract(number_1, number_2)
    number_1 - number_2
  end

  def print_answer(answer)
    "The Answer is: #{ answer }"
  end
end
```

## Exercise 3

**Refactor** the methods in the Calculator example into two classes as you see fit.
```
class Calculate
  def add(number_1, number_2)
    number_1 + number_2
  end

  def subtract(number_1, number_2)
    number_1 - number_2
  end
end

class PrintCalculation
  def print_answer(answer)
    "The Answer is: #{ answer }"
  end
end
```

## Exercise 4

**Test-drive** the secret diary example:

```
SecretDiary
  - lock
  - unlock
  - add_entry
  - get_entries

Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.

When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.

When the user locks the diary, by calling `lock`, `add_entry` and `get_entries` should, again, throw an error.
```

**First** organise it into one class only.

**Then**, when all your tests are green, reorganise it into classes with high cohesion.

This will also involve reorganising your tests!

