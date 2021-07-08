class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    # you should use the instance variable instead of the method - style choice, but you should keep it consistent. It might also be faster since you're calling the variable not the method. If you're going to use @guess then you should use @card.answer
    @guess == card.answer
  end

  def feedback
    # you don't need the `== true` here
    correct? == true ? "Correct!" : "Incorrect."
  end
end
