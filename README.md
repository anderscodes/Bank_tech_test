# **Bank Tech Test Version**


A practice tech test to create a bank app where a user can deposit money, withdraw money and view their statement. I will be completing this test in Ruby using Rspec as a testing framework and Rubocop as a linter. It will need to be run in a REPL such as IRB in order to use the application.

## **User Stories:**

The following user stories are derived from the specification of the project.

```
As a user,
So that I can store money,
I would like to be able to deposit money.
```
```
As a user,
So that I can spend my money,
I would like to be able to withdraw my money.
```
```
As a user,
So that I can keep track of my money,
I would like to be able to see an account statement.
```
## **Diagram**

![Diagram](https://github.com/anderscodes/bank_tech_test_version2/blob/master/Bank%20Diagram.jpg?raw=true)

## **Explanation**

This simple bank app uses three classes to allow the user to deposit and withdraw their money as well as printing a statement.
The account class keeps track of the balance and contains the logic for ensuring the input is entered into the transactions class in the right format before passing the data on. 
This dependency is managed by initializing the account class with a new instance of both the statement and the transactions class as arguments. 
The transactions class keeps track of the transactions and stores them in a transactions_list array. 
The statement class has one method which pretty prints the transactions and balance.

## **How to Run**

This program is designed to be run in irb or a similar REPL, to run the program, simply download the repo and run bundle install to install the gems. After doing this run rspec to run the tests or rubocop as a linter. In order to run the program in a REPL you will need to require the account class and then create a new instance as below:
 ```
account = Account.new
```
In order to deposit or withdraw you simply need to run the methods as below:
```
account.deposit(500)
account.withdraw(300)
```
The date defaults to today's date but can also be input by the user. If the date is in the wrong format, it will raise an error.
In order to print a statement, all you need to do is run the show_statement method as below:
```
account.show_statement
```
An example of the app running might look ike this:
```
require './lib/account.rb'
account = Account.new
account.deposit(500)
account.withdraw(400)
account.show_statement
Date     || Credit || Debit || Balance
2018-06-22 || 500 ||  || 500
2018-06-22 ||  || 400 || 100
```
