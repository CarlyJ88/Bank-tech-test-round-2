# Bank-tech-test

## User stories
```
As a customer, I want to be able to add money into my account, so I can keep track of it.
```
```
As a customer, I want to be able to withdraw money from my account, so that I can make payments.
```
```
As a customer, I want to be able to keep track of the date I made my transactions, so that I can track my activity
```
```
As a customer, I want to see a statement of all my transactions, so that I can review activity leading up to my current balance. 
```

## Example scenario
```
 Given a client makes a deposit of 1000 on 10-01-2012
 And a deposit of 2000 on 13-01-2012
 And a withdrawal of 500 on 14-01-2012
 When she prints her bank statement
 Then she would see
 ```

``` Expected return
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
```
## Testing

#### RSpec

`bundle` (if not installed)   
`rspec` to run all the RSpec feature and unit tests

#### Rubocop

`bundle` (if not installed)    
`rubocop` to run

#### Test Coverage with Simplecov