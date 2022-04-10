server <- function(input, output) {
df<-reactiveValues(reload=NULL)

museums<-reactive({
        resp<-museos()
})
museoSeleccionado<-reactive({
        req(input$`museos-select`)
        resp<-museums() |>
                filter(name == input$`museos-select`)
})
exhibition<-reactive({
        req(input$`museos-select`)
        resp<-exibiciones(museoSeleccionado()$id)
})
sponsors<-reactive({
        resp<-sponsor()
})

exhibitionSeleccionada<-reactive({
        req(input$`exhibicion-select`)
        resp<-exhibition() |>
                filter(name == input$`exhibicion-select`)
})
sponsorseleccionado<-reactive({
        req(input$`exhibicion-select`)
        resp<-sponsors() |>
                filter(exhibition.name == input$`exhibicion-select`)
        
})
obras<-reactive({
        req(input$`exhibicion-select`)
        resp<-artworks(exhibitionSeleccionada()$id)
})


selectServer("museos",c("Seleccione uno" = "",museums()$name))
observe({
        print(input$`museos-select`)
})
observeEvent(museoSeleccionado(),{
        textServer("descripcion",museoSeleccionado()$description)
        textServer("direccion",museoSeleccionado()$address)
        textServer("ciudad",museoSeleccionado()$city)
        imageServer("foto",museoSeleccionado()$image)
        selectServer("exhibicion",c("Seleccione una" = "",exhibition()$name))
})
observeEvent(exhibitionSeleccionada(),{
        textServer("descripcion2",exhibitionSeleccionada()$description)
        selectServer("artwork",c("Seleccione una" = "",obras()$name))
        textServer("sponsor",sponsorseleccionado()$name)
        textServer("descripcion3",sponsorseleccionado()$description)
        
})
        
}