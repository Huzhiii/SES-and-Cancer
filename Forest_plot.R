library(forestplot)
library(readxl)
#total
result <- read_excel("Figure 3.xlsx",col_names = FALSE )
result[,c(7:9)] <- apply(result[,c(7:9)], 2, as.numeric)
#png("forest_total_rate.png", res=315, width=8012, height=2828)
width_in_inches <- 8012 / 315
height_in_inches <- 2828 / 315
cairo_pdf("forest_rate.pdf", width = width_in_inches, height = height_in_inches,family="Arial")
forestplot(result[,c(1:6,10:13)],          
                  mean=result[,7],          
                  lower=result[,8],
                  upper=result[,9],
                  zero=0,                      
                  boxsize=0.2,             
                  graph.pos = 7,       
                  is.summary=c(T,      
                               F,F,F,
                               F,F,F,
                               F,F,F,F,
                               F,F,F,
                               F,F,F,F,
                               F,F,F,F,
                               F,F,F,
                               F,F,F,
                               F,F,F,F),
           #  xticks=c(0,1,1.5,2,2.5), 
           xticks=c(0,10,20,30,40,50,60,70,80,90,100),                     
           
                  txt_gp=fpTxtGp(label = gpar(cex=1),
                                 ticks = gpar(cex=1.1),
                                 xlab = gpar(cex=1),
                                 title = gpar(cex=2)),
                  lwd.zero=2,
                  lwd.ci=2,
                  lwd.xaxis=2, xlab='Effect Size',            
                  lty.ci=1,
                  ci.vertices=T,
                  ci.vertices.height=0.2,        
                  graphwidth = unit(15, "cm"),  
                  ineheight=unit(8,'mm'),
                  line.margin=unit(8,'mm'),
                  colgap=unit(6,'mm'),
                  col=fpColors(zero = '#4D4D4D',
                               box = '#6b58a6',
                               lines = '#a7a9ac'),
         
                  fn.ci_norm='fpDrawCircleCI'
)
dev.off()


#rate
result <- read_excel("Figure 2.xlsx",col_names = FALSE )
result[,c(7:9)] <- apply(result[,c(7:9)], 2, as.numeric)
width_in_inches <- 8512 / 315
height_in_inches <- 2828 / 315

cairo_pdf("forest_total.pdf", width = width_in_inches, height = height_in_inches,family="Arial")
#png("forest_total.png", res=315, width=8512, height=2828)
forestplot(result[,c(1:6,10:14)],          
           mean=result[,7],         
           lower=result[,8],
           upper=result[,9],
           zero=1,                     
           boxsize=0.2,             
           graph.pos = 7,        
           is.summary=c(T,F,
                        T,
                        F,F,F,
                        F,F,F,F,
                        F,F,T,F,
                        F,F,F,
                        F,F,F,F,
                        F,F,T,F,F,
                        F,F,F,
                        F,F,F,
                        F,F,T,F),
           xticks=c(0,1,1.5,2,2.5), 
                              
           
           txt_gp=fpTxtGp(label = gpar(cex=1),
                          ticks = gpar(cex=1.1),
                          xlab = gpar(cex=1),
                          title = gpar(cex=2)),
           lwd.zero=2,
           lwd.ci=2,
           lwd.xaxis=2, xlab='Effect Size',             
           lty.ci=1,
           ci.vertices=T,
           ci.vertices.height=0.2,        
           graphwidth = unit(15, "cm"),  
           ineheight=unit(8,'mm'),
           line.margin=unit(8,'mm'),
           colgap=unit(6,'mm'),
           col=fpColors(zero = '#4D4D4D',
                        box = '#6b58a6',
                        lines = '#a7a9ac'),
           
           fn.ci_norm='fpDrawCircleCI'
)
dev.off()

