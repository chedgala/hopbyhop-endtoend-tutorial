# =============================================================================
# End-to-End ARQ Multi-hop Network Tutorial (R package: endtoend)
# CRAN: https://CRAN.R-project.org/package=endtoend
# =============================================================================

# Install the package from CRAN if not already installed
if (!requireNamespace("endtoend", quietly = TRUE)) {
  install.packages("endtoend")
}

# Load the package
library(endtoend)

# Main functions available:
#   ETE()            : Theoretical transmissions/receptions for an L-limited End-to-End model
#   MCETE()          : Monte Carlo transmissions/receptions simulations
#   stochastic_ETE() : Random-probability Monte Carlo transmissions/receptions simulations

# Set random seed for reproducible Monte Carlo results
set.seed(1234)


# 1. Theoretical results ------------------------------------------------------

# N = 3 End-to-End system with limited L = 7 transmissions
ETE(p1 = 0.65, p2 = 0.4, L = 7, N = 3)

# Unlimited (L = Inf) N = 3 End-to-End system
ETE(p1 = 0.65, p2 = 0.4, L = Inf, N = 3)


# 2. Monte Carlo simulations (fixed probabilities) ----------------------------

MCETE(p1 = 0.65, p2 = 0.4, L = 7,   N = 3, M = 50000)
MCETE(p1 = 0.65, p2 = 0.4, L = Inf, N = 3, M = 50000)


# 3. Monte Carlo simulations (random probabilities) ---------------------------

# N = 5 End-to-End system with limited L = 7 transmissions
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
out <- stochastic_ETE(dist1, p11, p12, dist2, p21, p22, L = 7, N = 5, M = 5e3)

head(out$data)  # Simulated values (first rows)
out$stats       # Descriptive summary statistics
