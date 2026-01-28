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
devtools::install_github("anbuszek/MCDAProject")
