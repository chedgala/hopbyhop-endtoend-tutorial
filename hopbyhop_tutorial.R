# =============================================================================
# Hop-by-Hop ARQ Multi-hop Network Tutorial (R package: hopbyhop)
# CRAN: https://CRAN.R-project.org/package=hopbyhop
# =============================================================================

# Install the package from CRAN if not already installed
if (!requireNamespace("hopbyhop", quietly = TRUE)) {
  install.packages("hopbyhop")
}

# Load the package
library(hopbyhop)

# Main functions available:
#   HBH()            : Theoretical transmissions/receptions for an L-limited Hop-by-Hop model
#   MCHBH()          : Monte Carlo transmissions/receptions simulations
#   stochastic_HBH() : Random-probability Monte Carlo transmissions/receptions simulations

# Set random seed for reproducible Monte Carlo results
set.seed(1234)


# 1. Theoretical results ------------------------------------------------------

# N = 3 Hop-by-Hop system with limited L = 7 transmissions per hop
HBH(p1 = 0.65, p2 = 0.4, L = 7, N = 3)

# Unlimited (L = Inf) N = 3 Hop-by-Hop system
HBH(p1 = 0.65, p2 = 0.4, L = Inf, N = 3)


# 2. Monte Carlo simulations (fixed probabilities) ----------------------------

MCHBH(p1 = 0.65, p2 = 0.4, L = 7,   N = 3, M = 50000)
MCHBH(p1 = 0.65, p2 = 0.4, L = Inf, N = 3, M = 50000)


# 3. Monte Carlo simulations (random probabilities) ---------------------------

# N = 5 Hop-by-Hop system with limited L = 7 transmissions per hop
# Data success probability: p1 ~ Uniform(0.2, 0.6)
dist1 <- "uniform"
p11   <- 0.2
p12   <- 0.6

# ACK success probability: p2 ~ Beta(3, 1)
dist2 <- "beta"
p21   <- 3
p22   <- 1

# Note: by default plotspdf = TRUE exports plots as a PDF in the working directory.
# Set plotspdf = FALSE to skip PDF export.
out <- stochastic_HBH(dist1, p11, p12, dist2, p21, p22, L = 7, N = 5, M = 5e3)

head(out$data)  # Simulated values (first rows)
out$stats       # Descriptive summary statistics
