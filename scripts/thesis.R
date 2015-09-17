source('global.R')
source('pref.trajectories.R')

source('gantt.R')
trdat <- get.files.TRDAT('j.rnd', '4x5', 'ALL', useDiff = F)
gantt=get.gantt('4x5','j.rnd','SPT',1,trdat)
plot.gantt(gantt,10,TightTime = T, plotPhi = T,plotStep = T)

input=list(dimension='6x5',problem='j.rnd',problems=c('j.rnd','j.rndn','f.rnd','f.rndn','f.jc','f.mc','f.mxc','j.rnd_pj1doubled','j.rnd_p1mdoubled'))
SDR=subset(dataset.SDR,Problem %in% input$problems & Dimension %in% input$dimension)

tracks=c(sdrs,'ALL','OPT','CMAESMINRHO');
trainingDataSize=get.trainingDataSize(input$problems,input$dimension,tracks)
stat.trainingDataSize(trainingDataSize)
plot.trainingDataSize(trainingDataSize)
ggsave('../../Thesis/figures/trdat.size.6x5.pdf',width = Width,height = Height.full,units = units, dpi=dpi)

ranks=c('a','b','f','p')
preferenceSetSize=get.preferenceSetSize(input$problems,input$dimension,tracks,ranks)
plot.preferenceSetSize(preferenceSetSize)
ggsave('../../Thesis/figures/prefdat.size.6x5.pdf',width = Width,height = Height.full,units = units, dpi=dpi)

CDR.full=get.many.CDR(get.CDR.file_list(input$problems,input$dimension,tracks,ranks,input$timedependent),'train')
plot.rhoTracksRanks(CDR.full, SDR)
ggsave('../../Thesis/figures/prefdat.boxplot.6x5.pdf',width = Width,height = Height.full,units = units, dpi=dpi)



source('pref.exhaustive.R'); source('pref.settings.R')
prefSummary=get.prefSummary(input$problems,input$dimension,'OPT','p',F)
paretoFront=get.paretoFront(prefSummary)
bestPrefModel=get.bestPrefModel(paretoFront)

#FIGURE 8 \label{fig:stepwise_vs_classification}
plot.exhaust.acc(prefSummary,save,bestPrefModel$Summary)

#FIGURE 9 \label{fig:CDR:scatter}
plot.exhaust.paretoFront(prefSummary,paretoFront,T,save)

for(problem in input$problems){
  #FIGURE 10 \label{fig:CDR:weights}
  print(plot.exhaust.paretoWeights(subset(paretoFront,Problem == problem),F,save))
}

#FIGURE 11 \label{fig:CDR:opt}
plot.exhaust.bestAcc(all.StepwiseOptimality,bestPrefModel,save)
x=dcast(subset(bestPrefModel$Stepwise,Accuracy=='Optimality'),Problem+Step~variable+Accuracy,value.var = 'value')
x=ddply(x,~Problem+Step,mutate,diff.acc=abs(Max.Acc.Opt_Optimality-Min.Rho_Optimality))
print(paste('Max oscillating',round(mean(x$diff.acc)*100),'%'))

#FIGURE 12 \label{fig:boxplot:CDR}
SDR=subset(SDR, (substr(Problem,1,1)=='j' & SDR=='MWR') |
             (substr(Problem,1,1)=='f' & SDR=='LWR'))
plot.exhaust.bestBoxplot(bestPrefModel,SDR,save,F)

#TABLE 3 \label{tbl:CDR:pareto}
cat(print(table.exhaust.paretoFront(paretoFront),
          include.rownames=FALSE, sanitize.text.function=function(x){x}),
    file = paste0(subdir,'../tables/PREF-',input$bias,'.tex'))

ks.readable <- function(ks,alpha=0.05){
  ks=unique(round(ks>1-alpha))
  ks=ks[rowSums(ks)>1,]
  if(is.matrix(ks)) ks=ks[,colSums(ks)>0]
  print(ks)
}

clc()
for(problem in input$problems){
  print(problem)
  ks=suppressWarnings(get.pareto.ks(paretoFront, problem, onlyPareto = F, SDR=NULL))
  if(!is.null(ks)){
    ks.readable(ks$Rho.train)
    ks.readable(ks$Acc)
  }
}



