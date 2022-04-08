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


#obrass<-obras(101)


#museo<-museos()