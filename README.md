# Hop-by-Hop and End-to-End ARQ Multi-hop Network Models — R Tutorials

Companion tutorials for the CRAN R packages [**`hopbyhop`**](https://CRAN.R-project.org/package=hopbyhop) and [**`endtoend`**](https://CRAN.R-project.org/package=endtoend), implementing full stochastic models for ARQ-based (Automatic Repeat reQuest) semi-reliable and fully reliable multi-hop networks with known and uncertain success probabilities.

## Overview

The two scripts in this repository provide minimal, self-contained examples covering:

1. **Theoretical expectations** (closed-form success probability and expected data/ACK/total transmissions and receptions) under both limited ($L < \infty$) and unlimited ($L = \infty$) retransmission policies.
2. **Monte Carlo simulations** with fixed success probabilities ($p_1, p_2$).
3. **Stochastic Monte Carlo simulations** with uncertain success probabilities modeled via Uniform or Beta distributions.

## Requirements

- [R](https://cloud.r-project.org/) (any recent version)
- CRAN packages `hopbyhop` and `endtoend`

Install both packages directly from CRAN:

```r
install.packages(c("hopbyhop", "endtoend"))
```

## Repository Contents

| File | Description |
| :--- | :--- |
| `hopbyhop_tutorial.R` | Tutorial for the `hopbyhop` package (`HBH`, `MCHBH`, `stochastic_HBH`) |
| `endtoend_tutorial.R` | Tutorial for the `endtoend` package (`ETE`, `MCETE`, `stochastic_ETE`) |

## Quick Start

Run either script from your terminal:

```bash
Rscript hopbyhop_tutorial.R
Rscript endtoend_tutorial.R
```

Or open the files in R / RStudio and execute them interactively:

```r
source("hopbyhop_tutorial.R")
source("endtoend_tutorial.R")
```

> **Note:** By default (`plotspdf = TRUE`), `stochastic_HBH()` and `stochastic_ETE()` export summary plots as PDF files in the current working directory. Set `plotspdf = FALSE` if you only want the numerical output.

## Available Functions

### Hop-by-Hop (`hopbyhop`)

| Function | Description |
| :--- | :--- |
| `HBH(p1, p2, L, N)` | Theoretical success probability and expected transmissions/receptions |
| `MCHBH(p1, p2, L, N, M)` | Monte Carlo transmissions/receptions simulations |
| `stochastic_HBH(dist1, p11, p12, dist2, p21, p22, L, N, M, ...)` | Monte Carlo simulations with random success probabilities (`"uniform"` or `"beta"`) |

### End-to-End (`endtoend`)

| Function | Description |
| :--- | :--- |
| `ETE(p1, p2, L, N)` | Theoretical success probability and expected transmissions/receptions |
| `MCETE(p1, p2, L, N, M)` | Monte Carlo transmissions/receptions simulations |
| `stochastic_ETE(dist1, p11, p12, dist2, p21, p22, L, N, M, ...)` | Monte Carlo simulations with random success probabilities (`"uniform"` or `"beta"`) |

### Key Arguments

- `p1`: Data packet success probability, $p_1 \in (0, 1)$.
- `p2`: Acknowledgment (ACK) packet success probability, $p_2 \in (0, 1)$.
- `L`: Maximum number of transmissions per hop / end-to-end attempt (use `L = Inf` for unlimited retransmissions).
- `N`: Number of hops.
- `M`: Number of Monte Carlo replicates.
- `dist1`, `dist2`: Probability distributions for random $p_1$ and $p_2$ (`"uniform"` or `"beta"`).
- `p11`, `p12` / `p21`, `p22`: Distribution parameters — lower/upper bounds for `"uniform"`, or `shape1` ($\alpha$) and `shape2` ($\beta$) for `"beta"`.
- `printout`: Logical (`TRUE` by default); prints numerical summaries and displays plots.
- `plotspdf`: Logical (`TRUE` by default); exports plots as a PDF file in the working directory.

## Citation

If you use these packages or tutorials in your research, please cite:

```bibtex
@misc{hopbyhopCRAN,
  author       = {Galarza, Christian E. and Palma, Jonathan M.},
  title        = {{hopbyhop}: Transmissions and Receptions in a Hop by Hop Network},
  howpublished = {\url{https://CRAN.R-project.org/package=hopbyhop}},
  year         = {2019}
}

@misc{endtoendCRAN,
  author       = {Galarza, Christian E. and Palma, Jonathan M.},
  title        = {{endtoend}: Transmissions and Receptions in an End to End Network},
  howpublished = {\url{https://CRAN.R-project.org/package=endtoend}},
  year         = {2019}
}
```

## License

This repository is released under the [MIT License](LICENSE).
