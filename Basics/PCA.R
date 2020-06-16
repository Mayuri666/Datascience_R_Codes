install.packages("gdata")
library(gdata)

Universities <- read.csv("C:/Users/Mayuri/Desktop/Universities.csv")
pca<-princomp(Universities[,2:7], cor = TRUE,scores = TRUE, covmat = NULL) 

summary(pca) 
pca$scores 
pca$loadings  
plot(pca$scores[,1:2],col="Blue",pch=18,cex = 0.3, lwd = 3) 
text(pca$scores[,1:2], labels=c(1:25), cex= 1)

install.packages("jpeg")
library(jpeg) 
install.packages("imager")
library(imager) 
install.packages("pixmap")
library(pixmap)
cat<-readJPEG("C:\\Users\\Mayuri\\Desktop\\cat.jpg")
ncol(cat)
nrow(cat) 
r <- cat[,,1]
g <- cat[,,2]
b <- cat[,,3]  
cat.r.pca <- prcomp(r, center = FALSE) 
cat.g.pca <- prcomp(g, center = FALSE) 
cat.b.pca <- prcomp(b, center = FALSE) 
rgb.pca <- list(cat.r.pca, cat.g.pca, cat.b.pca) 
pca.img <- sapply(rgb.pca, function(j) {  compressed.img <- j$x[,1:100] %*% t(j$rotation[,1:100])}, simplify = 'array')
a<-pixmap::pixmapRGB(pca.img)
windows()
plot(a)

