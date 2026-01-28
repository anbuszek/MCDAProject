# DreamySleepR

<!-- badges: start -->
<!-- badges: end -->

**DreamySleepR** to pakiet w języku **R** do oceny i rankingu aplikacji do monitorowania snu dla studentów z wykorzystaniem metod wielokryterialnych w środowisku rozmytym (Fuzzy MCDA).

Pakiet został przygotowany na potrzeby pracy licencjackiej:

**„DreamySleepR: Pakiet R do oceny i rankingu aplikacji do monitorowania snu studentów z wykorzystaniem metod FuzzyTOPSIS i FuzzyMULTIMOORA.”**

W projekcie wykorzystywane są dane symulowane (dummy variables) obejmujące:
- **3 alternatywy** (aplikacje do monitorowania snu),
- **5 kryteriów** oceny,
- **15 ekspertów**.

---

## Funkcje pakietu

Pakiet **DreamySleepR** umożliwia:

- przygotowanie danych do analizy MCDA w ujęciu rozmytym (fuzzy)
- agregację ocen wielu ekspertów do wspólnej macierzy decyzyjnej
- ranking alternatyw metodą **FuzzyTOPSISLinear**
- ranking alternatyw metodą **FuzzyMULTIMOORA**
- wizualizację wyników rankingów i porównań metod
- tworzenie **meta-rankingu** (konsensusu) z wielu metod

---

## Instalacja

Wersja deweloperska z GitHub:

```r
# install.packages("devtools")
devtools::install_github("TwojUser/DreamySleepR")
Jeśli pakiet korzysta z metod dostępnych w FuzzyMCDM:

r
Skopiuj kod
install.packages("FuzzyMCDM")
Szybki start
Poniżej minimalny przykład użycia na danych demonstracyjnych.

1) Wczytanie danych
r
Skopiuj kod
library(DreamySleepR)

data("sleep_apps_dummy")
sleep_apps_dummy
Przykładowe alternatywy (aplikacje):

Sleep Cycle

Pillow

Sleep as Android

Przykładowe kryteria:

accuracy – dokładność pomiaru

usability – intuicyjność obsługi

compatibility – zgodność systemowa

analytics – funkcje analityczne

awareness – wpływ na świadomość jakości snu

2) Przygotowanie rozmytej macierzy decyzyjnej (agregacja ekspertów)
r
Skopiuj kod
fuzzy_matrix <- prepare_sleep_mcda(
  sleep_apps_dummy,
  alternative_col = "app",
  expert_col = "expert"
)
3) Ranking metodą FuzzyTOPSISLinear
r
Skopiuj kod
topsis_result <- run_fuzzy_topsis(
  fuzzy_matrix,
  criteria_types = c("max", "max", "max", "max", "max")
)

topsis_result$ranking
4) Ranking metodą FuzzyMULTIMOORA
r
Skopiuj kod
multimoora_result <- run_fuzzy_multimoora(
  fuzzy_matrix,
  criteria_types = c("max", "max", "max", "max", "max")
)

multimoora_result$ranking
Wizualizacja
Pakiet pozwala na wizualizację rankingów oraz porównanie metod.

r
Skopiuj kod
# Ranking TOPSIS
plot_ranking(topsis_result)

# Ranking MULTIMOORA
plot_ranking(multimoora_result)

# Porównanie metod (np. zgodność rang)
plot_method_comparison(
  list(
    TOPSIS = topsis_result,
    MULTIMOORA = multimoora_result
  )
)
Jeśli generujesz obrazki do README, umieść je w man/figures/
i odwołuj się do nich np.:

![](man/figures/README-ranking.png)

Meta-ranking
Meta-ranking agreguje wyniki wielu metod w jeden ranking konsensusu, co zwiększa stabilność oceny.

r
Skopiuj kod
meta_result <- meta_ranking(
  list(
    TOPSIS = topsis_result,
    MULTIMOORA = multimoora_result
  ),
  method = "mean_rank"
)

meta_result$ranking
Przykładowe metody agregacji (zależnie od implementacji):

średnia ranga (mean_rank)

mediana rang (median_rank)

Borda count (borda) – opcjonalnie

Dokumentacja
Szczegółowa dokumentacja jest dostępna w:

Vignette:

r
Skopiuj kod
vignette("dreamysleepr", package = "DreamySleepR")
Pomoc do kluczowych funkcji:

?prepare_sleep_mcda

?run_fuzzy_topsis

?run_fuzzy_multimoora

?meta_ranking

?plot_ranking

Autorzy
Twoje Imię i Nazwisko

Licencja
GPL-3

yaml
Skopiuj kod

---

Jeśli chcesz, podeślij **listę realnych funkcji z Twojego pakietu** (np. wynik `ls("package:DreamySleepR")` albo nazwy plików z folderu `R/`), a ja w 2 minuty zrobię wersję README **idealnie zgodną z Twoim kodem** (bez placeholderów).
::contentReference[oaicite:0]{index=0}
