* different sites have different formats


Transactions:
Deposit(cash: Double)
Withdrawal(cash: Double)

Buy(ticker: String, count: Double, price: Double, commission: Double, fees: Double)
Sell(ticker: String, count: Double, price: Double, commission: Double, fees: Double)
Dividend(ticker: String, amount: Double)
Interest(amount: Double)


Account
Cash: Double
Holdings: [Holding]


* Site - I
  * Reader - I
    * foreach line:
      * Look at fields to determine transaction type

