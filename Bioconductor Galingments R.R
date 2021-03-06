#instalar paquete  "GenomicAlignments"
## try http:// if https:// URLs are not supported
source("https://bioconductor.org/biocLite.R")

#Instalar especifico
biocLite("GenomicAlignments")

#Activar el paquete
library("GenomicAlignments")
#Librerias extras requeridas
library("GenomicRanges", lib.loc="~/R/win-library/3.2")
library("GenomeInfoDb", lib.loc="~/R/win-library/3.2")
library("BiocParallel", lib.loc="~/R/win-library/3.2")
library("BiocInstaller", lib.loc="~/R/win-library/3.2")
library("BiocGenerics", lib.loc="~/R/win-library/3.2")
library("Biobase", lib.loc="~/R/win-library/3.2")
library("parallel")

#Datos de ejemplo
aln1_file <- system.file("extdata", "ex1.bam", package="Rsamtools")
aln1 <- readGAlignments(aln1_file)
aln1
#Leer Datos propios

bamfile<-file.path("C:/Users/Leon/Desktop/bioinfo/BioinfInvRepro2016-II-master/Practicas/Uni7/IonXpressnel_60.bam.bam")
project<-readGAlignments(bamfile)
project

#Funciones principales
length(project)
strand(project)
table(strand(project))
browseVignettes("IRanges")

#Dar rangos de lectura a las secuecias
scanBamWhat()
ranges(project)[1:10]
gr<-GRanges(seqnames = "ch14", ranges=ranges (project)[1:5])

##Observar los rangos de aliniacion
rangos_project<-readGAlignments(bamfile,param = ScanBamParam(which = gr,what = c("seq","qual")))


