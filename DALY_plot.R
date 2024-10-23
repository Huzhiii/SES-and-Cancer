
library(ggplot2)
library(viridis)
dat5 <- read_excel("DALY.xlsx")


cairo_pdf("sex.pdf", width = 12, height = 10,family="Arial")
dat5$category <- factor(dat5$category, levels = c("Male", "Female"))
p5 <- ggplot(dat5, aes(x = as.numeric(as.character(year)), y = Daly, fill = category))

p_cancer <- ggplot(dat5, aes(x = year, y = Daly, fill = category)) +
  geom_area(alpha=0.8)+ 
  scale_fill_brewer(palette="RdPu", direction = 1, labels=c( "Male", "Female")) +
  scale_x_continuous(name = "\nTime (year)", breaks = c(2010,2019)) +
  scale_y_continuous(name="High SES Increased DALYs\n", limits=c(0,26000),breaks=c(0, 10000, 20000,26000))+
  theme_light()+
  
  labs(fill="Category")+
  theme(legend.position = "bottom",
        panel.grid.major = element_blank(),  
        panel.grid.minor = element_blank(),  
        axis.line = element_line(color = "black"))
        

print(p_cancer)
dev.off()

dat5$Category <- factor(dat5$Category, levels = c("Breast","Prostate","Colorectum","Lung", 
                                                  "Pancreas","Bladder",
                                                  "Melanoma of skin","Leukemia",
                                                  "Non-Hodgkin lymphoma","Kidney",
                                                  "Ovary", "Brain, CNS","Lip, oral cavity",
                                                  "Thyroid", "Larynx",
                                                  
                                                  "Liver",
                                                  "Stomach",
                                                  
                                                  "Esophagus",
                                                  
                                                  "Uteri"))
cairo_pdf("cancer.pdf", width = 12, height = 10,family="Arial")

my_colors <- c("#712274", "#bc388b", "#df639c", "#ec9ab4", "#efb1bb", "#f5d4ce", 
               "#2d66a5", "#4b8dbc", "#97cebf", "#bfe3c1", "#dbedd3", "#e5f3dd", 
               "#df7976", "#d72d35", "#b95645", "#b0393e", "#ef6547", "#f0bc81", 
               "#e0a075", "#dfa15d")


ggplot(dat5, aes(x = as.numeric(as.character(Year)), y = DALY, fill = Category, color = Category)) +
  

geom_area(position = 'stack', alpha = 0.8) +
  scale_fill_manual(values=my_colors) +  
  scale_x_continuous(name = "\nTime (year)", breaks = c(2010,2019)) +
  scale_y_continuous(name = "High SES Increased DALYs\n", limits=c(-1000,26000),breaks=c(0, 10000, 20000,26000)) +
  theme_minimal() +
  labs(fill = "Category") +
  theme(legend.position = "bottom",
        panel.grid.major = element_blank(),  
        panel.grid.minor = element_blank(),  
        axis.line = element_line(color = "black"))

dev.off()