MoMPCA=function(X,L,d,eta=0.1,tmax,verbose=0){
  n=dim(X)[1]
  B=floor(n/L)
  X=X[1:(L*B),]
  n=dim(X)[1]
  p=dim(X)[2]
  s=sample(n,n)
  mu=median(X)
  f_val=numeric(tmax)
  mu=apply(X,2,'median')
  for(i in 1:n){
    X[i,]=X[i,]-mu
  }
  val=numeric(L)
  ind=numeric(tmax)
  I=s[((1-1)*B+1):(1*B)]
  S=t(X[I,])%*%X[I,]
  if(p>2){
    res = eigs_sym(S, d, which = "LM")
  }else{
    res=eigen(S)
  }
  V=res$vectors[,1:d]
  if(d==1){
    V=as.matrix(V)
  }
  for(t in 1:tmax){
    P=(V%*%t(V))
    for(l in 1:L){
      I=s[((l-1)*B+1):(l*B)]
      X_prime=X[I,]%*%P
      val[l]=sum((X[I,]-X_prime)^2)/B
    }
    val_prime=sort(val)
    m=val_prime[floor((L+1)/2)]
    f_val[t]=m
    
    index=which(val==m)
    ind[t]=index
    I=s[((index-1)*B+1):(index*B)]
    S=t(X[I,])%*%X[I,]
    V=V+eta*S%*%V
    g=gramSchmidt(V)
    V=g$Q
     if(d==1){
       V=as.matrix(V)
    
     }
    s=sample(n,n)
    if(verbose==1){
    if(t%%20==0){
    cat('Iteration no: ')
    cat(t)
    cat('\n')
    }
    }
  }
  Y=X%*%V
  l=list(V,mu, Y)#,f_val,ind,s)
  names(l)=c('V','mu','Y')#,'f_val','ind','s')
  return(l)
}