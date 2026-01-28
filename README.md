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
devtools::install_github("anbuszek/DreamySleepR")
``` 
## Szybki Start

Poniżej znajduje się podstawowy przykład użycia pakietu na danych symulowanych zgodnych z założeniami pracy:

3 alternatywy (aplikacje do snu)

5 kryteriów

15 ekspertów
{r example}
library(DreamySleepR)
```r
library(DreamySleepR)

# 1. Wczytaj dane
data("mcda_dane_surowe")
head(mcda_dane_surowe, 3)

# 2. Zdefiniuj składnię MCDA
skladnia <- list(
  alternative = "App",
  expert = "Expert",
  criteria = c(
    "Accuracy",
    "Usability",
    "Compatibility",
    "Analytics",
    "Sleep_Awareness"
  )
)

# 3. Przygotuj dane MCDA (ZGODNIE Z TWOJĄ FUNKCJĄ)
macierz <- przygotuj_dane_mcda(
  dane = mcda_dane_surowe,
  skladnia = skladnia,
  kolumna_alternatyw = "App",
  funkcja_agregacji = mean
)

# 4. Ranking metodą Fuzzy VIKOR
wynik_vikor <- fuzzy_vikor(
  macierz,
  criteria_types = c("max", "max", "max", "max", "max")
)

# 5. Wyświetl wyniki
print(wynik_vikor$results)
```
## Wizualizacja

Pakiet umożliwia graficzną analizę wyników rankingu:
```r
# Wizualizacja wyników (mapa decyzyjna)
plot(wynik_topsis)
```
## Meta-ranking

Wyniki z różnych metod można połączyć w ranking konsensusu, zwiększający stabilność decyzji:
```r
meta <- fuzzy_meta_ranking(
  results_list = list(
    TOPSIS = wynik_topsis,
    MULTIMOORA = wynik_multimoora
  ),
  method = "borda"
)

print(meta$ranking)
```
## Dokumentacja

Więcej informacji i przykładów:

Vignette:
vignette("dreamysleepr_guide", package = "DreamySleepR")

Pomoc dla funkcji:
?fuzzy_topsis_linear, ?fuzzy_multimoora, ?fuzzy_meta_ranking

## Autor

Anna Buszek

## Licencja

GPL-3
