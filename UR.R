library(forestplot)
library(readxl)
#rate
result <- read_excel("Figure 3.xlsx",col_names = FALSE )
result[,c(8:10)] <- apply(result[,c(8:10)], 2, as.numeric)
png("forest_total_rate.png", res=315, width=8012, height=2828)
forestplot(result[,c(3:7,11:15)],           # {1:3，7:8指Excel中的列号，这个是你除了森林图要放在文章的列}
           mean=result[,8],          # RR/HR在Excel的列
           lower=result[,9],
           upper=result[,10],
           zero=0,                       #  {表示我们以坐标x轴=1为中心}
           boxsize=0.2,              #森林图点的大小
           graph.pos = 6,        #图放在表格的第几列
           is.summary=c(T,       #T就是加粗 F就是不加  这个是第一列加粗
                        F,F,F,
                        F,F,F,
                        F,F,F,F,
                        F,F,F,
                        F,F,F,
                        F,F,F,F,F,
                        F,F,F,
                        F,F,F,
                        F,F,F,F),
           #  xticks=c(0,1,1.5,2,2.5), 
           xticks=c(0,10,20,30,40,50,60,70,80,90,100),                     # {此处定义横坐标，因为的HR较集中，so就设了1,2,3,4}
           
           txt_gp=fpTxtGp(label = gpar(cex=1),
                          ticks = gpar(cex=1.1),
                          xlab = gpar(cex=1),
                          title = gpar(cex=2)),
           lwd.zero=2,
           lwd.ci=2,
           lwd.xaxis=2, xlab='Effect Size',             #{横坐标坐标轴名称}
           lty.ci=1,
           ci.vertices=T,
           ci.vertices.height=0.2,        
           graphwidth = unit(15, "cm"),  #图的大小
           ineheight=unit(8,'mm'),
           line.margin=unit(8,'mm'),
           colgap=unit(6,'mm'),
           col=fpColors(zero = '#4D4D4D',
                        box = '#6b58a6',
                        lines = '#a7a9ac'),
           
           fn.ci_norm='fpDrawCircleCI'
)
dev.off()
dev.new()

#ratio
result <- read_excel("Figure 2.xlsx",col_names = F )
result[,c(10:12)] <- apply(result[,c(10:12)], 2, as.numeric)
png("Figure 2.png", res=315, width=8512, height=2828)
forestplot(result[,c(2:9,13:16)],           # {1:3，7:8指Excel中的列号，这个是你除了森林图要放在文章的列}
           mean=result[,10],          # RR/HR在Excel的列
           lower=result[,11],
           upper=result[,12],
           zero=1,                       #  {表示我们以坐标x轴=1为中心}
           boxsize=0.2,              #森林图点的大小
           graph.pos = 6,        #图放在表格的第几列
           is.summary=c(T,       #T就是加粗 F就是不加  这个是第一列加粗
                        F,F,F,
                        F,F,F,
                        F,F,F,F,
                        F,F,F,
                        F,F,F,
                        F,F,F,F,F,
                        F,F,F,
                        F,F,F,
                        F,F,F,F),
           xticks=c(0,1,1.5,2,2.5), 
           # {此处定义横坐标，因为的HR较集中，so就设了1,2,3,4}
           
           txt_gp=fpTxtGp(label = gpar(cex=1),
                          ticks = gpar(cex=1.1),
                          xlab = gpar(cex=1),
                          title = gpar(cex=2)),
           lwd.zero=2,
           lwd.ci=2,
           lwd.xaxis=2, xlab='Effect Size',             #{横坐标坐标轴名称}
           lty.ci=1,
           ci.vertices=T,
           ci.vertices.height=0.2,        
           graphwidth = unit(15, "cm"),  #图的大小
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
result <- read_excel("famine1.xlsx",col_names = FALSE )
result[,c(20:22)] <- apply(result[,c(20:22)], 2, as.numeric)
png("forest_famine.png", res=315, width=8012, height=2828)
forestplot(result[,c(2,5:8,10,14:16,17,33)],           # {1:3，7:8指Excel中的列号，这个是你除了森林图要放在文章的列}
           mean=result[,20],          # RR/HR在Excel的列
           lower=result[,21],
           upper=result[,22],
           zero=1,                       #  {表示我们以坐标x轴=1为中心}
           boxsize=0.2,              #森林图点的大小
           graph.pos = 9,        #图放在表格的第几列
           is.summary=c(T,       #T就是加粗 F就是不加  这个是第一列加粗
                        F,F,F,
                        F,F,F,
                        F,F,F,F,
                        F,F,F,
                        F,F,F,
                        F,F,F,F,F,
                        F,F,F,
                        F,F,F,
                        F,F,F,F),
           xticks=c(0,1,1.5,2,2.5,3,3.5,4), 
           #xticks=c(0,10,20,30,40,50,60,70,80,90,100),                     # {此处定义横坐标，因为的HR较集中，so就设了1,2,3,4}
           
           txt_gp=fpTxtGp(label = gpar(cex=1),
                          ticks = gpar(cex=1.1),
                          xlab = gpar(cex=1),
                          title = gpar(cex=2)),
           lwd.zero=2,
           lwd.ci=2,
           lwd.xaxis=2, xlab='Effect Size',             #{横坐标坐标轴名称}
           lty.ci=1,
           ci.vertices=T,
           ci.vertices.height=0.2,        
           graphwidth = unit(15, "cm"),  #图的大小
           ineheight=unit(8,'mm'),
           line.margin=unit(8,'mm'),
           colgap=unit(6,'mm'),
           col=fpColors(zero = '#4D4D4D',
                        box = '#6b58a6',
                        lines = '#a7a9ac'),
           
           fn.ci_norm='fpDrawCircleCI'
)
dev.off()