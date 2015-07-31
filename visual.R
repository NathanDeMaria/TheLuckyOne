library(ggplot2)

source('runner.R')

sapply(list.files('methods', pattern = '.R', full.names = T), source)

# classic
martingale_results <- sapply(1:1e4, function(x) {
	result <- run_method(martingale(stop_threshold = 1000))
	result[length(result)]
})

martingale_stop_results <- sapply(1:1e4, function(x) {
	result <- run_method(martingale(stop_threshold = 2))
	result[length(result)]
})

nottingale_results <- sapply(1:1e4, function(x) {
	result <- run_method(nottingale(stop_threshold = 2))
	result[length(result)]
})

results <- rbind(
	data.frame(result = martingale_results, method = 'martingale'),
	data.frame(result = martingale_stop_results, method = 'martingale_stop'),
	data.frame(result = nottingale_results, method = 'nottingale')
)

g <- ggplot(results, aes(x = result, fill = method)) + 
	geom_density(alpha = .5)
print(g)
