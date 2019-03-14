workout01: GSW Shot Charts
================
Shelby Bons
March 10, 2019

``` r
effective_2
```

    ## # A tibble: 5 x 4
    ##   player         total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

``` r
effective_3
```

    ## # A tibble: 5 x 4
    ##   player         total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Draymond Green   232    74     0.319

``` r
effective_total
```

    ## # A tibble: 5 x 4
    ##   player         total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

Golden State Warriors: Shot Charts
----------------------------------

### Motivation

It'd be quite the fun if you were to walk into the RSF courts and ask any of the willing sunday league superstars if they could tell you correctly, who they thought would be the best active 2 point shooter in the Golden State Warriors. Chances are they would probably pick either Steph, Klay, or KD. Chances are they would probably be wrong! It's Andre Iguodala in case you are wondering.

All fun aside, in this brief write-up I wanted to discuss the main discovery that I have made while exploring the basketball statistics data related to the Golden State Warriors of its key members: Klay Thompson, Steph Curry, Kevin Durant, Draymond Green and Andre Iguodala. It being that given Andre Iguodala shoots the highest two point field goal percentage with a high volume of shoots taken in the GSW team, why is he not commanding more 2 point shots? Does Curry not like him? What's the deal here.

### Analysis

In this section, we will briefly take a look at Andre Iguodala's shooting percentages relative to the rest of his teammates in order to push forward our petition for him to take more shots as part of the GSW team! Looking at the two point table data below:

``` r
effective_2
```

    ## # A tibble: 5 x 4
    ##   player         total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

We can see that Andre Iguodala has a 2 point field goal percentage of almost 64% and when compared to his teammates KD, Steph, Klay, and Draymond Green he outperforms each of his teammates in the category. As I previously asked and to reconsider again, why is he not afforded more two point shot attempts? At least in the bare minimum, it seems that he should be afforded more opportunities than Draymond Green who is shooting at 49% with Andre having taken 210 shots to Draymond's 346.

To answer my dilemma, I believe that taking a look at the basketball shot selection of both players may hold the answer. When looking at Andre Iguodala's shot selection it is clear that he is not in particular a high volume shooter (210 shots taken), and if we were to take a closer look at the shot selection picture, Andre seems to only be selecting shots near the baseline (right by the rim) and doesn't actually perform well when he is forced to shot outside of this area.

I would say that contrary to my initial efforts of him taking more two point shots, if Andre was to take more shots his shots would probably be pushed out outside of the baseline and into the mid-range where most of his shot attempt misses occur. Given that observation in the data, it is safe to conclude that if Andre was to take more shots he would most likely have a lower field goal percentage for two pointers.

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />
