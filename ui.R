ui <- fluidPage(
        title="Catálogo Museos",
        theme = bslib::bs_theme(version = 5, bootswatch = "minty"),
        #includeCSS("www/style.css"),
        #shiny::includeScript("script.js"),
        titlePanel(h1(id="title","RMuseums", align = "center")),
        column(12,align="center",h5("!!!Bienvenido a RMuseums!!")),
        column(12,align="center",h5("La app que te permite encontrar las obras de tus museos favoritos")),
        #column(12,hr()),
        sidebarLayout(
                sidebarPanel(
                        selectUI('museos','Museos'),
                        conditionalPanel("input['museos-select'] != ''",
                                         fluidRow(
                                         column(12,textUI('descripcion',"Descripción")),
                                         column(6,textUI('direccion',"Dirección")),
                                         column(6,textUI('ciudad',"Ciudad"))
                                         )
                        ),
                        hr(),
                        conditionalPanel("input['museos-select'] != ''",selectUI('exhibicion','Exhibición'),column(12,textUI('descripcion2',"Descripción"))),
                        conditionalPanel("input['exhibicion-select'] != ''",selectUI('artwork','Obras'))
                ),
                mainPanel(
                        column(12,imageUI('foto')),
                        column(12,hr())
                        
                )
                
                
        )
                
        
        
)
#“cerulean”, 
#“cosmo”, “cyborg”, “darkly”, “flatly”, “journal”, 
#“litera”, “lumen”, “lux”, “materia”, “minty”, “pulse”, 
#“sandstone”, “simplex”, “sketchy”, “slate”, “solar”, 
#“spacelab”, “superhero”, “united”, “yeti”