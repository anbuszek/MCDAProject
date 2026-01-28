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

# install.packages("devtools")
devtools::install_github("anbuszek/MCDAProject")

##Szybki Start

Poniżej znajduje się podstawowy przykład użycia pakietu na danych symulowanych zgodnych z założeniami pracy:

3 alternatywy (aplikacje do snu)

5 kryteriów

15 ekspertów
{r example}
library(DreamySleepR)
```r
# 1. Wczytaj dane
data("sleep_apps_data")
head(sleep_apps_data, 3)
# 2. Przygotuj macierz rozmytą
macierz <- prepare_fuzzy_mcda_data(
  data = sleep_apps_data,
  alternative_column = "App",
  expert_column = "Expert",
  criteria_columns = c(
    "Accuracy",
    "Usability",
    "Compatibility",
    "Analytics",
    "Sleep_Awareness"
  ),
  fuzzy_scale = "triangular"
)
# 3. Ranking metodą Fuzzy TOPSIS (Linear)
wynik_topsis <- fuzzy_topsis_linear(
  macierz,
  criteria_types = c("max", "max", "max", "max", "max")
)
# 4. Ranking metodą Fuzzy MULTIMOORA
wynik_multimoora <- fuzzy_multimoora(
  macierz,
  criteria_types = c("max", "max", "max", "max", "max")
)
# 5. Wyświetl wyniki
print(wynik_topsis$results)
print(wynik_multimoora$results)
