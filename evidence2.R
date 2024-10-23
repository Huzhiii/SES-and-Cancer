library(readxl)
require(ggmap)
require(maps)
library(metafor)

d1 <- read_excel("air/55-6.xlsx")
colnames(d1)[1] <- "OR" #将第一列全部修改为OR
d1$logRR <- log(d1$OR)
d1$SE_logRR <- (log(d1$uci) - log(d1$lci)) / (2 * 1.96)

# 使用计算出的logHR和SE_logHR进行元分析
dat <- escalc(measure="GEN", yi=logRR, sei=SE_logRR, data=d1)
res <- rma(yi, vi, data=dat, method="REML")
cat("RR: ", format(exp(res$beta), digits=7), "\n")
cat("95% CI: [", format(exp(res$beta - 1.96 * res$se), digits=7), ", ", format(exp(res$beta + 1.96 * res$se), digits=7), "]\n")

# P值
cat("P-value: ", format(res$pval, digits=7), "\n")
# I²统计量
cat("I²: ", format(res$I2, digits=7), "%\n")

# Egger 测试
egger_res <- regtest(res, model="lm")
cat("Egger test P-value: ", format(egger_res$pval, digits=7), "\n")

#excess significance
excesss_res <- tes(res, H0=0, alternative="two.sided", alpha=.05)
cat("excesss P-value: ", format(excesss_res$pval, digits=7), "\n")

# 获取权重信息并找到权重最大的一项
max_weight_index <- which.max(weights(res))
#判断权重最大的一项是否包括0
ifelse(dat$lci[max_weight_index] <= 1 & dat$uci[max_weight_index] >= 1, "Yes", "No")
