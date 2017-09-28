require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end

  end
  def execute_transaction
    if valid? == true and status == "pending" and sender.balance > amount
      receiver.balance += self.amount
      sender.balance -= self.amount
      self.status = "complete"


    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if status == "complete" and valid? == true and receiver.balance > amount
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    end
  end
end
