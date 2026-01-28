# DreamySleepR

<!-- badges: start -->
<!-- badges: end -->

**DreamySleepR** to pakiet w języku R służący do oceny i rankingu aplikacji do monitorowania snu dla studentów z wykorzystaniem metod wielokryterialnych w środowisku rozmytym (Fuzzy MCDA).

Pakiet stanowi narzędzie badawcze opracowane na potrzeby pracy licencjackiej pt.:

**„DreamySleepR: Pakiet R do oceny i rankingu aplikacji do monitorowania snu studentów z wykorzystaniem metod FuzzyTOPSIS i FuzzyMULTIMOORA.”**

Umożliwia on pełną ścieżkę analityczną: od danych eksperckich, przez ich agregację w postaci rozmytej, aż po wyznaczenie rankingów metodami **FuzzyTOPSISLinear**, **FuzzyMULTIMOORA** oraz ich **meta-ranking (konsensus)**.

---

## Funkcje pakietu

Pakiet **DreamySleepR** oferuje:

- przygotowanie i agregację **rozmytych ocen ekspertów** (np. 15 ekspertów)
- obsługę danych symulowanych (dummy variables) dla:
  - 3 alternatyw (aplikacje do monitorowania snu)
  - 5 kryteriów oceny
- **FuzzyTOPSISLinear** – ranking alternatyw w środowisku rozmytym
- **FuzzyMULTIMOORA** – ranking alternatyw metodą MULTIMOORA w ujęciu rozmytym
- **wizualizację wyników** rankingów i porównań
- **meta-ranking** – agregację wyników wielu metod w jeden ranking konsensusu

---

## Instalacja

Pakiet można zainstalować bezpośrednio z GitHuba:

```r
# install.packages("devtools")
devtools::install_github("TwojUser/DreamySleepR")
library(DreamySleepR)

# Load example (simulated) dataset: 3 apps, 5 criteria, 15 experts
data("sleep_apps_dummy")

# Inspect data
head(sleep_apps_dummy, 10)

# Prepare aggregated fuzzy decision matrix
fuzzy_matrix <- prepare_sleep_mcda(
  sleep_apps_dummy,
  alternative_col = "app",
  expert_col = "expert"
)

# Define criteria types (all benefits in this thesis setup)
criteria_types <- c("max", "max", "max", "max", "max")

# Run FuzzyTOPSISLinear
topsis_res <- run_fuzzy_topsis(
  fuzzy_matrix,
  criteria_types = criteria_types
)

# Run FuzzyMULTIMOORA
multimoora_res <- run_fuzzy_multimoora(
  fuzzy_matrix,
  criteria_types = criteria_types
)

# Show rankings
topsis_res$ranking
multimoora_res$ranking
library(DreamySleepR)

data("sleep_apps_dummy")

fuzzy_matrix <- prepare_sleep_mcda(
  sleep_apps_dummy,
  alternative_col = "app",
  expert_col = "expert"
)

criteria_types <- c("max", "max", "max", "max", "max")

topsis_res <- run_fuzzy_topsis(
  fuzzy_matrix,
  criteria_types = criteria_types
)

multimoora_res <- run_fuzzy_multimoora(
  fuzzy_matrix,
  criteria_types = criteria_types
)

# Ranking plots
plot_ranking(topsis_res)
plot_ranking(multimoora_res)

# Compare rankings across methods
plot_method_comparison(
  list(
    TOPSIS = topsis_res,
    MULTIMOORA = multimoora_res
  )
)
library(DreamySleepR)

data("sleep_apps_dummy")

fuzzy_matrix <- prepare_sleep_mcda(
  sleep_apps_dummy,
  alternative_col = "app",
  expert_col = "expert"
)

criteria_types <- c("max", "max", "max", "max", "max")

topsis_res <- run_fuzzy_topsis(
  fuzzy_matrix,
  criteria_types = criteria_types
)

multimoora_res <- run_fuzzy_multimoora(
  fuzzy_matrix,
  criteria_types = criteria_types
)

# Consensus ranking (example: mean rank aggregation)
meta_res <- meta_ranking(
  list(
    TOPSIS = topsis_res,
    MULTIMOORA = multimoora_res
  ),
  method = "mean_rank"
)

# Display meta-ranking
meta_res$ranking
# Package vignette (if available)
vignette("dreamysleepr", package = "DreamySleepR")

# Function references
?prepare_sleep_mcda
?run_fuzzy_topsis
?run_fuzzy_multimoora
?meta_ranking
?plot_ranking
?plot_method_comparison
c(
  "Anna Buszek"
)
"GPL-3"
