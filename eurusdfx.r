#########################################
############ EUR-USD FX  ################
#########################################

eurofxref.hist <- read.csv("/Users/arianne/Desktop/eurofxref-hist.csv", stringsAsFactors=F)
selector<-(eurofxref.hist$Date <= as.Date('2015-11-13')) & (eurofxref.hist$Date >= as.Date('2010-01-01'))
eurofxref.hist <- eurofxref.hist[selector,]
euro_usd <- ts(rev(eurofxref.hist$USD))

library("fGarch")
euro_usd_garch <- garchFit(~ 1 + garch(1, 1), data  = euro_usd, trace = FALSE)
predict(euro_usd_garch, n.ahead = 20, plot = TRUE)
