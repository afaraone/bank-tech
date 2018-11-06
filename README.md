## Project Description
This is a CLI Bank Account app. Users can withdraw money, deposit money and print out a formatted bank statement.
It is part of Makers Academy Tech Test week, where the focus is on creating work that demonstrates knowledge of OOP and TDD.

## User Stories
 - [x] As a user, so that I can use my bank account, I can deposit money into it.
 - [x] As a user, so that I can buy things, I can withdraw money.
 - [x] As a user, so that I can see how much money I have, I can see my balance.
 - [x] As a user, so that I can keep track of my spending, I can see a statement of all of my transactions.

## Installation
 - Clone repository
 - Run `bundle` to install gems

## Testing
 - Run `rspec` to view test results
 - SimpleCov reports will be generated in `coverage/index.html`


## Instructions
 - In IRB/Pry enter `require './lib/account'` to import the relevant files
 - Instantiate an Account object

 ```
 2.5.1 :002 > account = Account.new
 => #<Account:0x00007f853080ecd0 @balance=0.0, @transaction_log=#<TransactionLog:0x00007f853080eca8 @list=[]>, @display=#<Display:0x00007f853080ec58>>
 ```

 - `deposit` adds the argument to the balance and records a deposit log
 ```
 2.5.1 :003 > account.deposit(100.00)
 => [{:date=>"06/11/2018", :balance=>"100.00", :credit=>"100.00"}]
 ```
 
 - `withdraw` deducts the argument from the balance and records a withdrawal log
 ```
 2.5.1 :004 > account.withdraw(30.00)
 => [{:date=>"06/11/2018", :balance=>"70.00", :debit=>"30.00"}, {:date=>"06/11/2018", :balance=>"100.00", :credit=>"100.00"}]
 ```
 
 - `statement` prints out a formatted statement of all transactions
 ```
 2.5.1 :005 > account.statement
date || credit || debit || balance
06/11/2018 || || 30.00 || 70.00
06/11/2018 || 100.00 || || 100.00
```
