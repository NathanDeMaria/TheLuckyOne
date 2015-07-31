
# Nottingale ####
# Just made up this name...cuz not martingale
nottingale <- function(stop_threshold=2) {
	stopping <- function(start_cash, current_cash) {
		# no extra stopping defined
		current_cash > stop_threshold * start_cash
	}
	
	next_bet <- function(initial_bet, last_bet, last_result) {
		if (last_result) {
			return(last_bet * 2)
		}
		
		initial_bet
	}
	
	list(stopping = stopping, next_bet = next_bet)
}
