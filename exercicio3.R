#Exercício 3 - SRCR

#se necessário instalar...
#install.packages("neuralnet")

#Usar:
library("neuralnet")


#ler dataset de um ficheiro txt
#header é para informar que a 1º linha é o "nome" da coluna
#sep é o separador, que no caso é a virgula
#dec é o caracter dos decimais, no caso o ponto
#Rafa : D:\\Rafa\\Escola\\GitHub\\SRCR-Exercicio3\\exercicio3.txt
dados <- read.csv("D:\\Rafa\\Escola\\GitHub\\SRCR-Exercicio3\\exercicio3.txt",
                     header=TRUE,
                     sep=",",
                     dec=".")
#mostrar a "cabeça" do dataset
#head(trainset)

#criar a rede
rede<-neuralnet(FatigueLevel ~ KDTMean+MAMean+MVMean+TBCMean+DDCMean+DMSMean+AEDMean+ADMSLMean,
                dados,
                hidden=c(15,10),
                threshold=0.05)

#mostrar a rede
plot(rede)

#criar uma matriz de teste
teste<-data.frame(KDTMean=0.003348521404442, #Fadiga = 1
                 MAMean=-0.033404750237223,
                 MVMean=-0.025152220755905,
                 TBCMean=0.16703901845170,
                 DDCMean=-0.039538593130319,
                 DMSMean=0.01458038388061,
                 AEDMean=0.046126139282830,
                 ADMSLMean=0.0121196527185)


teste[2,]<-data.frame(KDTMean=0.001747651084306, #Fadiga = 6
                     MAMean=0.097482878651944,
                     MVMean=0.115366961041514,
                     TBCMean=-0.07807993361726,
                     DDCMean=-0.064426638328348, 
                     DMSMean=-0.01281824370211,
                     AEDMean=-0.038354975497981,
                     ADMSLMean=0.0522370512802)

teste[3,]<-data.frame(KDTMean=0.001569498070280, #Fadiga = 3
                     MAMean=0.038427963994892,
                     MVMean=0.042207642284009,
                     TBCMean=-0.08706136653531,
                     DDCMean=0.034277394962323, 
                     DMSMean=-0.00879804916891,
                     AEDMean=0.052910995943371,
                     ADMSLMean=-0.0205040507122)


#correr os  testes na rede
rede.results<-compute(rede,teste)

#imprimir respostas
print(round(rede.results$net.result))
print(rede.results$net.result)




#If needed
#teste[3,]<-data.frame(KDTMean=, #Fadiga = 3
 #                     MAMean=,
  #                    MVMean=,
   #                   TBCMean=,
    #                  DDCMean=, 
     #                 DMSMean=,
      #                AEDMean=,
       #               ADMSLMean=)