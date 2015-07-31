
# Martingale ####
martingale <- function() {
	stopping <- function(start_cash, current_cash) {
		# no extra stopping defined
		FALSE
	}
	
	next_bet <- function(initial_bet, last_bet, last_result) {
		if (last_result) {
			return(initial_bet)
		}
		
		last_bet * 2
	}
	
	list(stopping = stopping, next_bet = next_bet)
}
