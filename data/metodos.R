## Leer museos
museos<-function(){
url<-config$MUSEOS
resp<-url |>
        httr::GET(encode = "json") |>
        httr::content(as="text",type="application/json",encoding="UTF-8") |>
        jsonlite::fromJSON(simplifyVector = TRUE, flatten = TRUE)
}
exibiciones<-function(museo_id){
        url<-paste0(config$MUSEOS,museo_id,"/exhibitions")
        resp<-url |>
                httr::GET(encode = "json") |>
                httr::content(as="text",type="application/json",encoding="UTF-8") |>
                jsonlite::fromJSON(simplifyVector = TRUE, flatten = TRUE)
}
artworks<-function(exhibition_id){
        url<-paste0(config$EXIBICIONES,exhibition_id,"/artworks")
        resp<-url |>
                httr::GET(encode = "json") |>
                httr::content(as="text",type="application/json",encoding="UTF-8") |>
                jsonlite::fromJSON(simplifyVector = TRUE, flatten = TRUE)
}
unaexhibicion<-function(museo_id,exhibition_id){
        url<-paste0(config$MUSEOS,museo_id,"/exhibitions/",exhibition_id)
        resp<-url |>
                httr::GET(encode = "json") |>
                httr::content(as="text",type="application/json",encoding="UTF-8") |>
                jsonlite::fromJSON(simplifyVector = TRUE, flatten = TRUE)
}

sponsor<-function(){
        url<-config$SPONSOR
        resp<-url |>
                httr::GET(encode = "json") |>
                httr::content(as="text",type="application/json",encoding="UTF-8") |>
                jsonlite::fromJSON(simplifyVector = TRUE, flatten = TRUE)
}

#obrass<-obras(101)
# museo<-museos()
# exibicion<-exibiciones(100)
# una<-unaexhibicion(100,100)
# sponsors<-sponsor()
 # sponsor<- sponsor() %>%
 #         filter(exhibition.id==100)
