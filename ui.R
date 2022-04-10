ui <- fluidPage(
        title="Catálogo Museos",
        #theme = bslib::bs_theme(version = 5, bootswatch = "minty"),
        theme = bslib::bs_theme(version = 5,
                                bg = "#28293D",
                                fg = "#8F90A7",
                                base_font = bslib::font_google("Merriweather"),
                                heading_font = bslib::font_google("Lato"),
                                primary = "#00CFDD", 
                                secondary = "#73E0E6",
                                success = "#39DA8A", 
                                info = "#5B8DEE", 
                                warning = "#FEDD49",
                                danger = "#FF5C5C"),
        # bs_theme_update(theme, primary = "#00CFDD", secondary = "#73E0E6", 
        #                 success = "#39DA8A", info = "#5B8DEE", warning = "#FEDD49", 
        #                 danger = "#FF5C5C")
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
                                         column(12,textUI('descripcion',"Descripción:")),
                                         column(6,textUI('direccion',"Dirección")),
                                         column(6,textUI('ciudad',"Ciudad"))
                                         )
                        ),
                        hr(),
                        conditionalPanel("input['museos-select'] != ''",
                                         selectUI('exhibicion','Exhibición')
                                         ),
                        conditionalPanel("input['exhibicion-select'] != ''",
                                         column(12,textUI('descripcion2',"Descripción:")),
                                         column(12,textUI('sponsor',"Sponsor:")),
                                         column(12,textUI('descripcion3',"Descripción Sponsor:")),
                                         selectUI('artwork','Obras')
                                         
                                         )
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