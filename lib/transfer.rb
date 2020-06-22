require "pry"

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if valid?
      binding.pry
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    elsif @sender.balance < amount
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end
end
