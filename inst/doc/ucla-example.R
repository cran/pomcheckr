## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(pomcheckr)
library(ggplot2)
data(ologit)

## -----------------------------------------------------------------------------
head(ologit)

## ----desc---------------------------------------------------------------------
## one at a time, table apply, pared, and public
lapply(ologit[, c("apply", "pared", "public")], table)

## ----xtabs--------------------------------------------------------------------
## three way cross tabs (xtabs) and flatten the table
ftable(xtabs(~ public + apply + pared, data = ologit))

## ----out.width="50%"----------------------------------------------------------
ggplot(ologit, aes(x = apply, y = gpa)) +
  geom_boxplot() +
  geom_jitter(size=0.1, alpha = .5) +
  facet_grid(pared ~ public, margins = TRUE) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

## -----------------------------------------------------------------------------
plot(pomcheck(apply ~ pared + public + gpa, data=ologit))

