# Load data
some_economics_data <- read.csv("some_economics_data.csv", sep= ",", header=T)

# To create a wireframe plot
library(lattice)
library(gridExtra)

trellis.par.set("axis.line",list(col=NA,lty=1,lwd=1)) # Removes the border of the plot if you want
jobsat_plot <- wireframe(z1 ~ x*y, data=some_economics_data, 
          xlab = "custom X label", # Custom label x
          ylab = "custom y label", # Custom label y
          main = "Jobsat", # Plot title
          drape = TRUE, # Whether you want to drape with color
          colorkey = TRUE, # Whether you want the color key on the side
          scales = list(arrows=FALSE,cex=.5, tick.number = 10, z = list(arrows=F), distance =c(1.5, 1.5, 1.5)), # Add ticks and adjust distance of axis labels
          light.source = c(10,0,10), # Aesthetics
          col.regions = rainbow(100, s = 1, v = 1, start = 0, end = max(1,100 - 1)/100, alpha = .8), # Set the colors
          screen = list(z = -60, x = -60) # Aesthetics
)
jobsat_plot

orgpractices_plot <- wireframe(z2 ~ x*y, data=some_economics_data, 
                         xlab = "X", 
                         ylab = "Y",
                         main = "orgpractices",
                         drape = TRUE,
                         colorkey = TRUE,
                         scales = list(arrows=FALSE,cex=.5, tick.number = 10, z = list(arrows=F), distance =c(1, 1, 1)),
                         light.source = c(10,0,10),
                         col.regions = colorRampPalette(c("red", "white",  "blue"))(100),
                         screen = list(z = -60, x = -60)
)
orgpractices_plot

# If you want to combine the plots into one figure
grid.arrange(jobsat_plot,orgpractices_plot, ncol=2, clip=TRUE) # Clip removes the border of the plot
