source('global.R')
source('pref.trajectories.R')

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


