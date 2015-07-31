
roulette <- 18 / 38  # probability of winning by betting on a color

run_method <- function(method, initial_bet=5, total_cash=50, max_rounds=100) {
	
	start_cash <- total_cash
	cash_log <- c()
	current_bet <- initial_bet
	
	round <- 0
	while (total_cash > current_bet & 
		   round < max_rounds & 
		   !method$stopping(start_cash, total_cash)) {
		
		round <- round + 1
		win <- runif(1) > roulette
		if (win) {
			total_cash <- total_cash + current_bet
		} else {
			total_cash <- total_cash - current_bet
		}
		cash_log <- c(cash_log, total_cash)
		
		current_bet <- method$next_bet(initial_bet, current_bet, win)
	}
	
	cash_log
}