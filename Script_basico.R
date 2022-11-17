# Carga las librerias necesarias para el script -------
pacman::p_load(tidyverse, nortest, ggplot2,car, ggpubr)

# Lee los datos ordenados
BD <- read.csv(file = "./resultados.csv")
str(BD)

# Comprobación de los supuestos de normalidad y homogeneidad de varianzas -----------
## Normalidad de cada grupo -----------
    # Prueba de hipótesis: Kolmogorov Smirnov con modificación de Lilliefors
    lillie.test(BD$Digit.forw.1[BD$Grupo=="Lectura"])
    lillie.test(BD$Digit.forw.1[BD$Grupo=="Control"])
    lillie.test(BD$Digit.forw.1[BD$Grupo=="Cuestionario"])
  
    # Visualización
    ggplot(BD, aes(x=Digit.forw.1, color=Grupo)) +
      geom_density() +
      scale_color_manual(values = c("#42D9C8","#D63230", "#0000FF"))+
      theme_minimal()+
      labs(title = 'Distribución por tipo de estudiante',
           color = 'Grupo',
           x = 'Puntuación total memoria de trabajo', 
           y='Densidad',
           caption="Prueba de Lilliefors:
           Control: p=0.20
           Lectura: p=0.68
           Cuestionario: p=0.40")
## Homogeneidad de varianzas/Homocedasticidad ---------------
    # Prueba de hipótesis: Barlett
    bartlett.test(BD$Digit.forw.1~BD$Grupo)
    
    # Visualización
    ggplot(data = BD, aes(x = Grupo, y = Digit.forw.1, colour = Grupo)) +
      geom_boxplot() +
      labs(title = 'Puntuación total memoria de trabajo por grupo.',
           x = 'Grupo',
           y = 'Puntuación total memoria de trabajo',
           caption = "Memoria de trabajo medida por Digit Span
           Test de Barlett: p=0.33") +
      theme_bw() +
      theme(legend.position = "none")

# Comparación entre grupos -----------------------------------
    # Se guardan los datos de cada grupo en un vector
    wm_lec <- BD$Digit.forw.1[BD$Grupo =="Lectura"]
    wm_con   <- BD$Digit.forw.1[BD$Grupo =="Control"]
    wm_cue   <- BD$Digit.forw.1[BD$Grupo =="Cuestionario"]
    
    # Prueba de hipótesis:T de student
    t.test(x=wm_lec, y=wm_cue, alternative = "two.sided", mu=0, var.equal = T, conf.level = 0.95)
    
    # Prueba de hipótesis:T de student
    t.test(x=wm_lec, y=wm_con, alternative = "two.sided", mu=0, var.equal = T, conf.level = 0.95)
    
    # Prueba de hipótesis:T de student
    t.test(x=wm_con, y=wm_cue, alternative = "two.sided", mu=0, var.equal = T, conf.level = 0.95)
    
    # Tamaño del efecto: D de Cohen
    effsize::cohen.d(formula=Digit.forw.1~Grupo, data=BD, paired=F)
    
    # Visualización
    ggplot(data = BD[1:10,], aes(x = Grupo, y = Digit.forw.1, colour = Grupo)) +
      geom_boxplot() +
      labs(title = 'Puntuación total memoria de trabajo por grupo.',
           x = 'Grupo',
           y = 'Puntuación total memoria de trabajo',
           caption = "Memoria de trabajo medida por Digit Span") +
      stat_compare_means(method = "t.test")+ # Agrega p-values comparando grupos
      theme_bw() +
      theme(legend.position = "none")
    
    # Visualización
    ggplot(data = BD[6:15,], aes(x = Grupo, y = Digit.forw.1, colour = Grupo)) +
      geom_boxplot() +
      labs(title = 'Puntuación total memoria de trabajo por grupo.',
           x = 'Grupo',
           y = 'Puntuación total memoria de trabajo',
           caption = "Memoria de trabajo medida por Digit Span") +
      stat_compare_means(method = "t.test")+ # Agrega p-values comparando grupos
      theme_bw() +
      theme(legend.position = "none")
    
    # Visualización
    ggplot(data = BD[-6:-10,], aes(x = Grupo, y = Digit.forw.1, colour = Grupo)) +
      geom_boxplot() +
      labs(title = 'Puntuación total memoria de trabajo por grupo.',
           x = 'Grupo',
           y = 'Puntuación total memoria de trabajo',
           caption = "Memoria de trabajo medida por Digit Span") +
      stat_compare_means(method = "t.test")+ # Agrega p-values comparando grupos
      theme_bw() +
      theme(legend.position = "none")
    