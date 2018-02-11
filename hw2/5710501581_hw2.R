df <- read.csv('hw2_data.csv')

df.observe <- t(data.matrix(df[,-1]))
df.sumrows <- t(matrix(rowSums(df.observe)))

dim.i <- 3
dim.j <- 10
dof <- (dim.i-1)*(dim.j-1)
alpha = 0.05

combiSel <- combn(5, 3)

for (i in 1:ncol(combiSel)) {
  book.observe <- df.observe[combiSel[,i],]
  book.sumrows <- matrix(df.sumrows[combiSel[,i]])
  book.sumcols <- t(matrix(colSums(book.observe)))
  book.total <- sum(book.sumrows)
  
  book.expected <- (book.sumrows %*% book.sumcols)/book.total
  book.testStat <- sum((book.observe - book.expected)^2/book.expected)
  book.pvalue <- 1-pchisq(book.testStat, df=dof)
  
  cat("Book:", combiSel[,i], "\n")
  cat("Test Statistic:", book.testStat, "\n")
  cat("P-value:", book.pvalue, "\n")
  if(book.pvalue > alpha) cat("[+] Not reject\n")
  else cat("[-] Reject\n")
  cat("\n")
}

