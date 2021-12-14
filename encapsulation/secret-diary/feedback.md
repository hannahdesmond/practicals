# Feedback on Secret Diary

### Feedback received from coach:
In secret diary spec
your tests for the secret diary are set up as if the defaults state for the diary was to be unlocked, which is not the case

I think you could have some tests that checke that you can lock, unlock, and also unlock then lock, etc.

Also, it's not good practice to set an instance variable from outside the class like in this line:
secretdiary.locked = true

Instance variables should be private by defaults, and only be exposed (for reading, sometimes writing) if really needed.

So I would instead use the methods from your interface (public class methods) to test the class, the same way a user would test it.
when the diary is locked, the test says it throws an error, but in fact the method returns a string. You could change it to actually throw and error using raise. Also check this matcher to write a test that makes sure an error is thrown.
(edited)
relishapp.comrelishapp.com
`raise_error` matcher - Built in matchers - RSpec Expectations - RSpec - Relish
Relish helps your team get the most from Behaviour Driven Development. Publish, browse, search, and organize your Cucumber features on the web.
The organisation of your classes is not optimal. One way to think of classes organisation is that a class looks after some state, and has method to change that state or display it in some way
Here, new entry and get entries are working on the state owned by the secret diary
Which makes you have to expose the entries variables to outside the secret diary class, which is the opposite of emcapsulation
A good way to think about class organisation is to think of what state you have (here, you have entries and lock status), and then see if that state can be separated.
Then, distribute the methods so that they live in the class that holds the state that they need / refer to.
Let me know if that makes sense and how you would refactor.

### Action taken based on feedback
* Updated tests to throw error properly.
* Added further tests for multiple locks and unlocks of diary.
* Made a plan for how I would refactor the code (see refactor.rb) based on separating states and including methods in each class that acted on the particular state. 
