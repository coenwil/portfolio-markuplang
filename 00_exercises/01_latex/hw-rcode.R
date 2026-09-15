#load package lattice
library(lattice)
library(xtable) # generate the LaTeX code for tables
#fix the random generator seed
set.seed(123)
#create data
data <- rnorm(1000)

#plot histogram
png("histogram.png", width = 800, height = 600)
print(histogram(data))
dev.off()

#plot density 
png("densityplot.png", width = 800, height = 600)
print(
    densityplot(
        data^12 / data^10, 
        xlab = expression(data^12/data^10)
    )
)
dev.off()

#plot stripplot
png("stripplot.png", width = 800, height = 600)
print(
    stripplot(
        data^2, 
        xlab = expression(data^2)
        )
)
dev.off()

#plot boxplot
png("boxplot.png", width = 800, height = 600)
print(
    bwplot(exp(data))
)
dev.off()

#matrix with all data used
data.all <- cbind(data = data, 
                  squared1 = data^12 / data^10,
                  squared2 = data^2,
                  exponent = exp(data))

# creating latex table with only first 9 rows
print(
    xtable(data.all[1:9,],
    caption = "The same data, but now in a table. 
    Only the first nine rows are displayed.",
    label = "tab:data"),
    file = "data.all.tex"
)
