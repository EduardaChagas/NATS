# NATS

NATS - Non-parametric Analyzes of Time Series package provides methods and functions to perform univariate time series analysis using the Bandt-Pompe methodology and its variants in conjunction with Information Theory descriptors.
We also include routines to visualize the data and results obtained.

The package will remain in its current state and will be maintained only for bug fixes.

## Functionalities

The reading of CSV data is allowed and the user can choose:

* Generate time series plot: `PlotSeries()`, `PlotPatterns()`.

* Calculate entropy measures: `MinEntropy()`, `TsallisEntropy()`, `RenyiEntropy()`, `ShannonEntropy()`, `FisherEntropy()`.

* Calculate stochastic distances and divergences: `JensenDivergence()`, `EuclidianDistance()`, `ManhattanDistance()`, `ChebyshevDistance()`, `KullbackDivergence()`, `HellingerDistance()`, `WoottersDistance()`, `BhattacharyyaDistance()`.

* Calculate statistical complexity: `StatisticalComplexity()`.

* Generate the Bandt-Pompe distribution and its variants: `BP()`, `WPE()`, `OPTG()`, `WATG()`.

* Plot Entropy-Complexity plane: `HCPlane()`, `HCPlaneZoom()`

* Plot Fisher-Shannon plane: `FSPlane()`.

## License

This package is free and open source software, licensed under GPL-3.

## BibTex

We open-source this package and tool to the community to facilitate the research of analysis and characterization of time series through ordinal patterns. If you do like our work and use the codebase or models for your research, please cite our work as follows.

```bibtex
@misc{nats2020,
  title =        {NATS - A non-parametric time series analysis tool},
  author=        {E. {Chagas} and O. {Rosso} and H. {S.Ramos} and A. C. {Frery}},
  howpublished = {\url{https://github.com/EduardaChagas/NATS/}},
  year =         {2020}
}
```
