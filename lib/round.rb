class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    # current_card <---- you don't need to call this again. Because it is called as an argument on line 14, it will already make the method happen

    @turns.last
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      if turn.card.category == category
        turn.correct?
      end

      # turn.correct? if turn.card.category == category
    end
  end

  def percent_correct
    (number_correct.to_f / @turns.size) * 100
  end

  def percent_correct_by_category(category)
    category_count = @turns.select { |turn| turn.card.category == category }

    (number_correct_by_category(category).to_f / category_count.size) * 100
  end
end
