### Coach Feedback
For the calculator example, I would say your code has two classes, and responsibility is separated well, but in some ways the classes are so separated that they don't talk to each other.
Could you have the calculator class call on the printer class to display answers? this way the classes are separated but still work together.
also, a detail, but it's good practice for classes to have names that are nouns rather verbs (printer, calculator)
(check https://medium.com/swlh/an-opinionated-guide-to-naming-your-code-aimed-at-new-developers-6f769d60e098 for more on naming)
MediumMedium
An opinionated guide to naming your code, aimed at new developers
Good naming is one of the hardest problems in programming. Here I share some of the naming rules I use when coaching new developers.
https://medium.com/swlh/an-opinionated-guide-to-naming-your-code-aimed-at-new-developers-6f769d60e098
In secret diary spec
your tests for the secret diary are set up as if the defaults state for the diary was to be unlocked, which is not the case
I think you could have some tests that checke that you can lock, unlock, and also unlock then lock, etc.

Also, it's not good practice to set an instance variable from outside the class like in this line:
secretdiary.locked = true
Instance variables should be private by defaults, and only be exposed (for reading, sometimes writing) if really needed.
So I would instead use the methods from your interface (public class methods) to test the class, the same way a user would test it.
when the diary is locked, the test says it throws an error, but in fact the method returns a string. You could change it to actually throw and error using raise. Also check this matcher to write a test that makes sure an error is thrown.

The organisation of your classes is not optimal. One way to think of classes organisation is that a class looks after some state, and has method to change that state or display it in some way
Here, new entry and get entries are working on the state owned by the secret diary
Which makes you have to expose the entries variables to outside the secret diary class, which is the opposite of emcapsulation
A good way to think about class organisation is to think of what state you have (here, you have entries and lock status), and then see if that state can be separated.
Then, distribute the methods so that they live in the class that holds the state that they need / refer to.
Let me know if that makes sense and how you would refactor.

### My response
Thank you for this really helpful feedback Alice.
The article on naming is very useful, I am going to share it with the cohort.
“Could you have the calculator class call on the printer class to display answers? this way the classes are separated but still work together.” Do you mean do something like this within my calculator class?

  def show_answer(result)
    printer = Printer.new
    printer.print_answer(result)
  end
I feel like this adds an extra responsibility to the Calculator class and makes the Printer class a bit more redundant, could you explain a bit more how that is not the case? Or maybe I have not refactored this optimally. Thanks :slightly_smiling_face:
Thanks so much for the secret diary feedback, that is very helpful. I have updated the parts to properly raise_error, and the tests with the feedback above.
Re: refactoring, on the basis of what you’re saying about separating the states, it should look something more like this, right?
```
class SecretDiary 
  def initialize
    @entries = []
  end

  def add_entry(diary, string)
    diary.locked == false ? diary.entries << string : raise("This diary is locked. Keep out!")
  end

  def get_entries(diary)
    diary.locked == false ? diary.entries : raise("This diary is locked. Keep out!")
  end

end

class LockDiary
  attr_accessor :locked

  def initialize
    @locked = true
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end

end
```
Thank you!!

### Coach response
That looks a lot better already, great separation!
I would maybe call the security class above just "lock". After all, it;s only responsibility it to lock and unlock :slightly_smiling_face: the real diary is the one that keeps entries.
Also, I would remove the attr_accessor :locked. Maybe just make it a attr_reader. Otherwise, it means classes outside from the LockDiary can open the lock... when they really should go through that class methods
Ofcourse, for now this code is small, so it's not obvious why, but you could imagine that in the future, these lock and unlock methods would also check the identity of the user, for example. So they should be the only ones that can change the value of locked
On your other point: "I feel like this adds an extra responsibility to the Calculator class and makes the Printer class a bit more redundant,", which I think is valid also for the diary app, here's the idea:
Classes do have to work together - the user shouldn't have to remember to call each class separately. If you want, you can have an additional separate class called interface whose purpose is to interact with the user, and that's the one who delegates calculations to the calculator and printing the answer to the printer, but because this is a small example, we're not going that far.
The reason for extracting the printer is that the ways things are printed could change, eg you could decide that your app now needs to speak french, or german instead of english. For that reason, printing/ui is always separated from the logic, so the logic can be reused in different contexts. But just because the calculator would call the printer class doesn't mean it's not separated. It's calling it without having to know how the printer will print the answer, in what language, etc.
So if you only have two classes, it's typical to make your logic class the "main" one, and delegate the printing to a secondary class. If you have three classes, then you can have one interface, one logic, and one printer (you can almost see the mvc pattern forming...)
For the same reason, with the diary, I would initialise the secret diary with a lock from the lock class (instead of passing it a lock when I create or read entries).
But a third iteration of this programme is to have a diary class that just deals with entries (which could be used as a non secure diary), a lock class that just deals with locking (which could be reused by other classes) and then a "SecretDiary" class that gets initialised with both a diary and a lock, and then delegates the entry things to diary, and the locking to lock.
I think at the end of the day these programmes are quite simple, so breaking them down in three classes seems like a lot, but having options in you head about different ways classes can interact will be useful later on.
