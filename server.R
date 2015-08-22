library(shiny)
library(stylo)
max_index<-function(my_list){
  max_length<-0
  last_index<-0
  new_list<-unique(my_list)
  for (i in 1:length(new_list)){
    if (length(grep(new_list[i],my_list))>max_length){
      max_length<-length(grep(new_list[i],my_list))
      last_index<-i
    }
  }
  return (new_list[last_index])
}
con1<-file('final/en_US/en_US.blogs.txt')
con2<-file('final/en_US/en_US.news.txt')
con3<-file('final/en_US/en_US.twitter.txt')

blog_file<-readLines(con1,10)
news_file<-readLines(con2,10)
twitter_file<-readLines(con3,10)

close(con1)
close(con2)
close(con3)
vect<-c(blog_file,news_file,twitter_file)
rm(blog_file)
rm(news_file)
rm(twitter_file)
words<-txt.to.words(vect)
rm(vect)
grams_2<-make.ngrams(words,2)
grams_3<-make.ngrams(words,3)


shinyServer(
  
  function (input , output){
    
    
  
    txt.to.words(input$text1)
    search_index<-paste(txt.to.words(input$text1)[length(txt.to.words(input$text1))-3],txt.to.words(input$text1)[length(txt.to.words(input$text1))-2],txt.to.words(input$text1)[length(txt.to.words(input$text1))-1]) #trigrams
    index<-grep(search_index,grams_3)
    next_txt.to.words(input$text1)<-grams_3[index+1]
    if (!is.null(next_txt.to.words(input$text1))){
      new_dic<-NULL
      for (i in 1:length(next_txt.to.words(input$text1))){
        new_dic<-c(new_dic,txt.to.words(next_txt.to.words(input$text1)[i])[3])
      }
      output$output1<-renderPrint({22})
    }
    next_txt.to.words(input$text1)<-txt.to.words(next_txt.to.words(input$text1))
    if (is.null(next_txt.to.words(input$text1))){
    search_index<-paste(txt.to.words(input$text1)[length(txt.to.words(input$text1))-2],txt.to.words(input$text1)[length(txt.to.words(input$text1))-1]) #bigrams
    index<-grep(search_index,grams_2)
    next_txt.to.words(input$text1)<-grams_2[index+1]
    new_dic<-NULL
    for (i in 1:length(next_txt.to.words(input$text1))){
      new_dic<-c(new_dic,txt.to.words(next_txt.to.words(input$text1)[i])[2])
    }
    output$output1<-renderPrint({22})
    }

  }
 
  
)  
    
  
  