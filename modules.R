### Select ----
selectUI<-function(id,label='select'){
        tagList(
                column(12,br()),
                column(12,selectInput(NS(id,"select"),label=label,choices=NULL))
        )
}
selectServer<-function(id,data){
        moduleServer(id,function(input,output,session){
                observeEvent(data,{updateSelectInput(session,"select",choices=data)})
        })
}
### Text ----
textUI<-function(id,nombre=''){
        tagList(
        h4(nombre),
        textOutput(NS(id,"text"))
        )
}
textServer<-function(id,data){
        moduleServer(id,function(input,output,session){
                observeEvent(data,{
                        output$text <- renderText({data})
                })
        })
}
### Imagen ----
imageUI<-function(id){
        htmlOutput(NS(id,"imagen"))
}
imageServer<-function(id,data){
        moduleServer(id,function(input,output,session){
                observeEvent(data,{
                        output$imagen <- renderText({c('<img src=',data,' width= "700">')})
                })
        })
}

botonUI<-function(id,label="Botón",icon=NULL,width=NULL){
        actionButton(NS(id,"but"),label=label,icon=icon,width = width,class = "btn-primary")
}
# textoUI<-function(id,label="Texto"){
#         textInput(NS(id,"tx"),label=label,width = "100%")
# }
# ModalCarrera<-function(nombre){
#         showModal(modalDialog(
#                 title = "Añadir Carrera",
#                 fluidPage(
#                         fluidRow(
#                                 column(3,br()),
#                                 column(6,textInput('newcarr','Nombre:',value=nombre)),
#                                 column(3,br()),
#                                 #column(12,br()),
#                                 column(12,h3(strong("Competidores"))),
#                                 column(12,DTOutput("competidorestemp")),
#                                 column(12,br()),
#                                 column(12,br())
#                         )
#                 ),
#                 footer = tagList(
#                         modalButton("Volver",icon=icon('arrow-circle-left')),
#                         botonUI('bt42',"Añadir Competidor",width = NULL,icon=icon('plus-circle')),
#                         botonUI('bt3',"Guardar Carrera",width = NULL)
#                 )
#         ))
# }
# 
# 
# ModalUI<-function(){
#         showModal(modalDialog(
#                 title = "Apostadores",
#                 column(12,DTOutput("apostadores")),
#                 footer = tagList(
#                         modalButton("Volver",icon=icon('arrow-circle-left')),
#                         botonUI('bt4',"Añadir Apostador",width = NULL,icon=icon('plus-circle'))
#                 )
#         ))
# }
# ModalEdit<-function(title,nombre){
#         showModal(
#                 modalDialog(title=title,
#                             easyClose = TRUE,
#                             size = "xl",
#                             fluidPage(
#                                     # div(style="display:inline-block;vertical-align:top;",
#                                     #     fluidRow(column(6,textInput('newnombre',label="Nombre",value=nombre)),
#                                     #              column(6,br(),botonUI('bt32',"Cambiar Nombre"))
#                                     #              
#                                     #     )),
#                                     # column(12,br()),
#                                     # botonUI('bt4',"Añadir Competidor",width = NULL,icon=icon('plus-circle')),
#                                     # column(12,DTOutput("competidores")),
#                                     fluidRow(
#                                             column(3,br()),
#                                             column(6,textInput('newnombre','Nombre:',value=nombre)),
#                                             column(3,br()),
#                                             #column(12,br()),
#                                             column(12,h3(strong("Competidores"))),
#                                             column(12,DTOutput("competidores")),
#                                             column(12,br()),
#                                             column(12,br())
#                                             )
#                                     ),
#                                     footer = tagList(
#                                             modalButton("Volver",icon=icon('arrow-circle-left')),
#                                             botonUI('bt4',"Añadir Competidor",width = NULL,icon=icon('plus-circle')),
#                                             botonUI('bt32',"Guardar Carrera",width = NULL)
#                                             )
#                             )
#                 )
# }