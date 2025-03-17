SMODS.Atlas {
	key = 'pear',
	path = 'pear.png',
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'pear',
	rarity = 1,
	loc_txt = {
		name = 'Pear',
		text = {
			'Earn {C:money}$#1#{} for each {C:attention}#2#{}',
			'in played poker hand'
		}
	},
	config = {
		extra = {dollars = 2, poker_hand = 'Pair'}
	},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.dollars, card.ability.extra.poker_hand}}
	end,
	atlas = 'pear',
	pos = {x = 0, y = 0},
	cost = 4,
	calculate = function(self, card, context)
		if context.joker_main then
			local earned = card.ability.extra.dollars * #context.poker_hands[card.ability.extra.poker_hand]
			return {
				dollars = earned,
				card = card
			}
		end
	end
}