source('runner.R')

sapply(list.files('methods', pattern = '.R', full.names = T), source)

martingale_result <- run_method(martingale())
nottingale_result <- run_method(nottingale())