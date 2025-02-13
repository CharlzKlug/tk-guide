#!/usr/bin/env tclsh

# 302. Write an application to play a game of war against the computer.
# 1. create a cards deck.
# 2. Shuffle cards in the deck.
# 3. Create two decks.
# 4. Move first half to 1-st deck.
# 5. Move second half to 2-nd deck.
# 6. Создаём две колоды для отыгранных карт. 1-я колода для первой, 2-я для второй.
# 7. У кого окажется карта старше, тот и забирает карты себе.
# 8. Если стоимость карт окажется одинаковой, то выкидываем ещё по одной карте и переходим к пункту 7.
# 9. Если ничего не осталось, то эти карты никому и не достаются.

source cardsdeck.tcl

proc notEmptyDeck {inputCardDeck} {
    if {[$inputCardDeck size] > 0} {
	return TRUE
    }
    return FALSE
}

proc printCard {inputCard} {
    puts "Card suit: [$inputCard getSuit], value: [$inputCard getValue]"
}

proc moveToDeck {inputCardsList cardDeck} {
    foreach someCard $inputCardsList {
	$cardDeck push $someCard
    }
}

proc calcDeck {someCardDeck} {
    set sum 0
    while {[notEmptyDeck $someCardDeck]} {
	set someCard [$someCardDeck pop]
	incr sum [$someCard getValue]
	$someCard destroy
    }
    return $sum
}

CardsDeck create startDeck

# Add cards to startDeck
foreach someSuit {Club Diamond Heart Spade} {
    foreach someValue {2 3 4 5 6 7 8 9 10 Jack Queen King Ace} {
	set someCard [Card new $someSuit $someValue]
	startDeck push $someCard
    }
}

# Shuffle startDeck cards
startDeck shuffle

# Create first player's card deck
CardsDeck create cardDeck1

# Create second player's card deck
CardsDeck create cardDeck2

# Give cards to the players
while {[startDeck size] > 1} {
    set cardOne [startDeck pop]
    cardDeck1 push $cardOne
    set cardTwo [startDeck pop]
    cardDeck2 push $cardTwo
}

# Колода для выигранных карт
CardsDeck create wins1
CardsDeck create wins2

set roundCardsList {}

while {[notEmptyDeck cardDeck1] && [notEmptyDeck cardDeck2]} {
    set card1 [cardDeck1 pop]
    set card2 [cardDeck2 pop]
    puts "Player 1"
    printCard $card1
    puts "Player 2"
    printCard $card2
    lappend roundCardsList $card1
    lappend roundCardsList $card2
    if {[$card1 getValue] > [$card2 getValue]} {
	moveToDeck $roundCardsList wins1
	set roundCardsList {}
    }
    if {[$card2 getValue] > [$card1 getValue]} {
	moveToDeck $roundCardsList wins2
	set roundCardsList {}
    }
}

# Очистка списка карт
foreach someCard $roundCardsList {
    puts "Destroying card"
    $someCard destroy
}

cardDeck1 destroy
cardDeck2 destroy

# Подсчёт выигрышей
set score1 [calcDeck wins1]
wins1 destroy
puts "Player 1 scores: $score1"
set score2 [calcDeck wins2]
wins2 destroy
puts "Player 2 scores: $score2"

if {$score1 > $score2} {
    puts "Player 1 wins!"
    exit
}
if {$score2 > $score1} {
    puts "Player 2 wins!"
    exit
}

puts "Draw!"
