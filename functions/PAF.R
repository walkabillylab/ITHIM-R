PAF <- function(pop, cn, mat){
  ##!! hard coding of indices: 1=sex, 2=age or age_cat
  paf <- apply(mat,1,function(x)sum(pop[[cn]][pop[[1]]==x[1]&pop[[2]]==x[2]]))
  paf
}
