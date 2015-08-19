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

blog_file<-readLines(con1,100000)
news_file<-readLines(con2,100000)
twitter_file<-readLines(con3,100000)
letter<-readLines(con3,9000)
letter<-letter[8600]
letter<-txt.to.words(letter)
close(con1)
close(con2)
close(con3)
vect<-c(blog_file,news_file,twitter_file)
words<-txt.to.words(vect)
grams_2<-make.ngrams(words,2)
grams_3<-make.ngrams(words,3)

search_index<-paste(letter[length(letter)-3],letter[length(letter)-2],letter[length(letter)-1]) #trigrams
index<-grep(search_index,grams_3)
next_letter<-grams_3[index+1]
if (!is.null(next_letter)){
new_dic<-NULL
for (i in 1:length(next_letter)){
  new_dic<-c(new_dic,txt.to.words(next_letter[i])[3])
}
print(max_index(new_dic))
}
#next_letter<-txt.to.words(next_letter)
if (is.null(next_letter)){
  search_index<-paste(letter[length(letter)-2],letter[length(letter)-1]) #bigrams
  index<-grep(search_index,grams_2)
  next_letter<-grams_2[index+1]
  new_dic<-NULL
  for (i in 1:length(next_letter)){
    new_dic<-c(new_dic,txt.to.words(next_letter[i])[2])
  }

 print(max_index(new_dic))
}