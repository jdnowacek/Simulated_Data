n.reps <- 1000
beta0 <- c(1, 2, 3, 4, 5)
beta1 <- c(1, 2, 2, 2, 3)

run.simulation <- FALSE
show.results <- TRUE

n.beta0 <- length(beta0)
n.beta1 <- length(beta1)

make study area
make population description
make design

results<- list()

if(run.simulation) {

  for (i in 1:n.beta0) {
    for(j in 1:n.beta1) {
      
      det.func <- make.detectability(key.function = "hn", 
                                     scale.param = beta0[i], 
                                     cov.param = list(size = beta1[j]),
                                     truncation = w)
      sim.specification <- make.simulation
      run.simultion <- sim.specification n.reps times
      sim.summary <- summary(run.simulation)
      results <- append(sim.summary)
          
    }
  }
  
  save results to an Rds file
} else {
  read in results from Rds file
}

if(show.results) {
  
  #pull out percentage bias into a matrix
  abs.rel.bias <- matrix(NA, n.beta0, n.beta1)
  rownames(abs.rel.bias) <- beta0
  colnames(
  
  k <- 1  
  for(i in 1:n.beta0){
    for(j in 1:n.beta1){
      abs.rel.bias <- abs(results[[k]]@individuals$N$percent.bias)
      k <- k + 1
    }
  }  

}

