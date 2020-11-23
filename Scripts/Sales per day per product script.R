#Poniendo el directorio de Downloads 
library(dplyr)
setwd("C:/Users/cloud/Downloads")

#Listando los archivos en una variable para luego leerlos
files <- list.files(pattern = paste("SALESPERDAYPERPRODUC-",(format(Sys.Date(),"%Y%m%d")),sep=""))

#Consolidando los archivos en un solo df
summary(files)
tmp <- vector(mode = "list", length = length(files))
summary(tmp)

#leyendo los archivos y agregandolos a tmp
for (i in seq_along(files)) {
  tmp[[i]] <- read.csv(files[[i]])
}
str(tmp)

#Se puede hacer lo mismo utilizando lapply
str(lapply(files, read.csv))

#Para pasar estas listas a un data frame se usa do.call()
output <- do.call(rbind, tmp)
output <- mutate(output,Date = as.Date(Date)) %>% filter(Date<Sys.Date())

#Escribiendo el archivo de Excel
write.csv(output,"C:/Users/cloud/OneDrive/Desktop/Amazon FBA/PowerBi/Sales per day per product.csv",row.names = TRUE)
