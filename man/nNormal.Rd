\name{nNormal}
\alias{nNormal}
\title{Normal distribution sample size (2-sample)}
\description{\code{nNormal()} computes a fixed design sample size for comparing 2 means where variance is known. T
The function allows computation of sample size for a non-inferiority hypothesis.
Note that you may wish to investigate other R packages such as the \code{pwr} package which uses the t-distr
}
\usage{
nNormal(delta1=1,sd=1.7,sd2=NULL,alpha=.025,beta=.1,ratio=1, sided=1,
n=NULL,delta0=0,outtype=1)
}
\arguments{
\item{delta1}{difference between sample means under the alternate hypothesis.}
\item{delta0}{difference between sample means under the null hypothesis; normally this will be left as the default of 0.}
\item{ratio}{randomization ratio of experimental group compared to control.}
\item{sided}{1 for 1-sided test (default), 2 for 2-sided test.}
\item{sd}{Standard deviation for the control arm.}
\item{sd2}{Standard deviation of experimental arm; this will be set to be the same as the control arm with the default of \code{NULL}.}
\item{alpha}{type I error rate. Default is 0.025 since 1-sided testing is default.}
\item{beta}{type II error rate. Default is 0.10 (90\% power). Not needed if \code{n} is provided.}
\item{n}{Sample size; may be input to compute power rather than sample size. If \code{NULL} (default) then sample size is computed.}
\code{delta0}{default value of 0 is set to test for superiority; negative values used for non-inferiority (assuming \code{delta1>0}).} 
\item{outtype}{controls output; see value section below.}
}
\details{
\code{nNormal()} computes sample size for comparing two normal means when the variance for observations in
}
\value{
If \code{n} is \code{NULL} (default), total sample size (2 arms combined) is computed. Otherwise, power is computed.
If \code{outtype=1} (default), the computed value (sample size or power) is returned in a scalar or vector.
If \code{outtype=2}, a data frame with sample sizes for each arm (\code{n1}, \code{n2})is returned; if \code{n} is not input as \code{NULL}, a third variable, \code{Power}, is added to the output data frame.
If \code{outtype=3}, a data frame with is returned with the following columns:
  \item{n}{A vector with total samples size required for each event rate comparison specified}
  \item{n1}{A vector of sample sizes for group 1 for each event rate comparison specified}
  \item{n2}{A vector of sample sizes for group 2 for each event rate comparison specified}
  \item{alpha}{As input}
  \item{sided}{As input}
  \item{beta}{As input; if \code{n} is input, this is computed}
  \item{Power}{If \code{n=NULL} on input, this is \code{1-beta}; otherwise, the power is computed for each sample size input}
  \item{sd}{As input}
  \item{sd2}{As input}
  \item{delta1}{As input}
  \item{delta0}{As input}
  \item{se}{standard error for estimate of difference in treatment group means}

}
\seealso{\link{gsDesign package overview}}
\author{Keaven Anderson \email{keaven_anderson@merck.com}}
\references{
Lachin JM (1981),
Introduction to sample size determination and power analysis for clinical trials. \emph{Controlled Clinical Trials} 2:93-113.

Snedecor GW and Cochran WG (1989),
Statistical Methods. 8th ed. Ames, IA:
Iowa State University Press.
}
\examples{
# EXAMPLES
# equal variances
nNormal(delta1=.5,sd=1.1,alpha=.025,beta=.2)
# unequal variances
nNormal(delta1=.5,sd=1.1,sd2=2,alpha=.025,beta=.2)
# unequal sample sizes
nNormal(delta1=.5,sd=1.1,alpha=.025,beta=.2, ratio=2)
# non-inferiority assuming a better effect than null
nNormal(delta1=.5,delta0=-.1,sd=1.2)
}
\keyword{design}
