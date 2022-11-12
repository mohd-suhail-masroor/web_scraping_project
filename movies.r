# creating a connection to a website

link = 'https://www.imdb.com/chart/top/?ref_=nv_mv_250'


#calling out the html file or source file

page = read_html(link)


#extracting data using css notations and storing them as a vector

    title <- page %>% 
      html_nodes('.titleColumn a') %>% 
      html_text()
    
    year <- page %>% 
      html_nodes('.secondaryInfo') %>% 
      html_text()
    
    IMDb_rating <- page %>% 
      html_nodes('strong') %>% 
      html_text()
  

#creating a data frame from the extracted vectors    
    
movies <-  data.frame(title,year,IMDb_rating,stringsAsFactors = FALSE)


# removing brackets from  year column

movies<-
  movies %>% 
  mutate(year,year = str_replace_all(string = year,pattern = '[()]',
                                     replacement = '')) 


# exporting the data frame as a csv file

write_csv(movies,file = 'movies.csv' )



