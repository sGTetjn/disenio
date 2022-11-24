pacman::p_load(tidyverse, ggpubr, rstatix)

BD <- read.csv(file = "./resultados.csv")
str(BD)

a = function() {
ggboxplot(BD, x = "Grupo", y = "Digit.forw", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Digit Span Adelante")

ggboxplot(BD, x = "Grupo", y = "Digit.back", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Digit Span Reverso")

ggboxplot(BD, x = "Grupo", y = "Stroop.corr", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Stroop")

ggboxplot(BD, x = "Grupo", y = "Stroop.rt", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Tiempo", title = "Tiempo de reaccion Stroop")

ggboxplot(BD, x = "Grupo", y = "Go.forw", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Go primera instruccion")

ggboxplot(BD, x = "Grupo", y = "Nogo.forw", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Puntuacion", title = "No go primera instruccion")

ggboxplot(BD, x = "Grupo", y = "Go.back", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Go segunda instruccion")

ggboxplot(BD, x = "Grupo", y = "Nogo.back", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Puntuacion", title = "No go segunda instruccion")

ggboxplot(BD, x = "Grupo", y = "Gonogo.rt", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Tiempo", title = "Tiempo de respuesta go-nogo")

ggboxplot(BD, x = "Grupo", y = "Digit.forw", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Control", "Lectura", "Cuestionario"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Digit Span Adelante")}

graficar = function() {
ggboxplot(BD, x = "Grupo", y = "Digit.forw", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Pre", "Post"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Digit Span Adelante")

ggboxplot(BD, x = "Grupo", y = "Digit.back", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Pre", "Post"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Digit Span Reverso")


ggboxplot(BD, x = "Grupo", y = "Stroop.corr", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Pre", "Post"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Stroop")


ggboxplot(BD, x = "Grupo", y = "Stroop.rt", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Pre", "Post"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Tiempo de reaccion Stroop")


ggboxplot(BD, x = "Grupo", y = "Go.forw", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Pre", "Post"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Go primera instruccion")


ggboxplot(BD, x = "Grupo", y = "Nogo.forw", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Pre", "Post"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Nogo primera instruccion")

ggboxplot(BD, x = "Grupo", y = "Go.back", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Pre", "Post"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Go segunda instruccion")

ggboxplot(BD, x = "Grupo", y = "Nogo.back", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Pre", "Post"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Nogo segunda instruccion")

ggboxplot(BD, x = "Grupo", y = "Gonogo.rt", 
          color = "Grupo", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("Pre", "Post"),
          xlab = "Grupo", ylab = "Puntuacion", title = "Tiempo de respuesta Go Nogo")}

a()

BD <- read.csv(file = "./Lectura.csv")
str(BD)
graficar()

BD <- read.csv(file = "./Control.csv")
str(BD)
graficar()

BD <- read.csv(file = "./Cuestionario.csv")
str(BD)
graficar()

plots.dir.path <- list.files(tempdir(), pattern="rs-graphics", full.names = TRUE); 
plots.png.paths <- list.files(plots.dir.path, pattern=".png", full.names = TRUE)

file.copy(from=plots.png.paths, to="./plots")
