Mcds<- read.csv("C:/Users/Mayuri/Desktop/R/Mcd_Small.csv",header=TRUE)
txt<-Mcds$review


x<-as.character(txt)
#corpus
install.packages("tm")
library(tm)
x<-Corpus(VectorSource(x))
inspect(x[1])


# Data Cleansing 
x1<-tm_map(x,tolower) 
inspect(x1[1])
x1 <- tm_map(x, removePunctuation) 
inspect(x1[1]) 
x1 <- tm_map(x1, removeNumbers) 
x1 <- tm_map(x1, removeWords, stopwords('english')) 
inspect(x1[1]) 

#striping white spaces 
x1 <- tm_map(x1, stripWhitespace) 
inspect(x1[1]) 

# Term document matrix  # converting unstructured data to structured format using TDM

tdm <- TermDocumentMatrix(x1)
dtm <- t(tdm)
tdm <- as.matrix(tdm)
#############################
# Bar plot 
w<-rowSums(tdm) 
w 
w_sub <- subset(w, w >= 10) 
w_sub windows() 
barplot(w_sub, las=3, col = rainbow(20)) # Term mcdonalds repeats in all most all documents x1 <- tm_map(x1, removeWords, c('apple','air','can','mcds','macbook','product','windows')) 
x1 <- tm_map(x1, stripWhitespace) 
tdm <- TermDocumentMatrix(x1) 
tdm <- as.matrix(tdm) 




install.packages("syuzhet")
library(syuzhet) 
library(lubridate,ggplot2) 
library(ggplot2) 
library(scales) 
library(dplyr) 
library(reshape2) 

# Nokia lumia review dataset 
txt=readLines("C:/Users/Mayuri/Desktop/R/amazon nokia lumia reviews.txt")
txt <- iconv(txt, "UTF-8") #Unicode Transformation Format. The '8' means it uses 8-bit blocks to represent a character
x <- get_nrc_sentiment(txt) 
head(x,n=5)

txt[4] 
get_nrc_sentiment('happy') 
get_nrc_sentiment('boring')

get_sentiment('boring',method="afinn") 
get_sentiment('happy',method="afinn") #each sentences by eight  
example<-get_sentences(txt) 
nrc_data<-get_nrc_sentiment(example)

# Bar plot for emotion mining 
windows() 
barplot(colSums(nrc_data), las = 1, col = rainbow(10), ylab = 'Count', main = 'Emotion scores') 

sentiment_vector<-get_sentiment(example,method="bing") 
sentiment_afinn<-get_sentiment(example,method="afinn") 
sentiment_nrc<-get_sentiment(example,method="nrc") 

sum(sentiment_afinn)
mean(sentiment_afinn)
summary(sentiment_afinn)

windows() 
plot(sentiment_vector,type='l',main='Plot trajectory',xlab='Narative time',ylab='Emotional valence') 
abline(h=0,color='red')  
plot(
  sentiment_vector,
     type="h",
     main="Example Plot Trajectory",
     xlab = "Narrative Time",
     ylab= "Emotional Valence" 
     
)
##Shape smoothing and normalization using a Fourier based transformation and low pass filtering is achieved using the get_transformed_values function as shown below. 
ft_values <- get_transformed_values( 
  sentiment_vector,    
  low_pass_size = 3,   
  x_reverse_len = 100,  
  padding_factor = 2,   
  scale_vals = TRUE,   
  scale_range = FALSE
  ) 

plot(   
  ft_values, 
  type ="l",   
  main ="Nokia lumia reviews using Transformed Values",    
  xlab = "Narrative Time",    
  ylab = "Emotional Valence",  
  col = "red"
  ) 

#Most Negative and Positive reviews 
negative<-example[which.min(sentiment_vector)] 
positive<-example[which.max(sentiment_vector)] 
my_example_text <- "I begin this story with a neutral statement.     Basically this is a very silly test.   You are testing the Syuzhet package using short, inane sentences.   I am actually very happy today.  I have finally finished writing this package.   Tomorrow I will be very sad.  I won't have anything left to do.  I might get angry and decide to do something horrible.  
I might destroy the entire package and start from scratch.  
Then again, I might find it satisfying to have completed my first R package. 
Honestly this use of the Fourier transformation is really quite elegant.  
You might even say it's beautiful!"


s_v <- get_sentences(my_example_text)
s_v_sentiment <- get_sentiment(s_v)
plot(
  s_v_sentiment, 
  type="l", 
  main="Example Plot Trajectory", 
  xlab = "Narrative Time", 
  ylab= "Emotional Valence"
)

