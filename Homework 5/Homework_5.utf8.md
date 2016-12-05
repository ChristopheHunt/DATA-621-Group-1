---
title: "Homework 5"
author: "Group 1"
date: ''
output:
  pdf_document:
    includes:
      in_header: header.tex
    number_sections: yes
    toc: yes
    toc_depth: 2
  html_document:
    toc: yes
    toc_depth: '2'
---





\begin{center}
\bigskip
\bigskip
\bigskip
Prepared for:\\
\medskip
Dr. Nathan Bastian\\
\smallskip
City University of New York, School of Professional Studies - Data 621\\
\bigskip
Prepared by:\\
\medskip
Group 1\\ 
\medskip
Senthil Dhanapal\\ 
\smallskip
Yadu Chittampalli\\
\smallskip
Christophe Hunt\\  

\end{center}

\newpage

# Introduction

The wine industry was valued at \$257.5 billion in 2012 and is predicted to be valued at \$303.6 billion by 2016.[^1] As wine is a consumer product, accommodating consumer preference is critical to maintaining a competitive advantage. By understanding the factors involved in wine sales we can better understand consumer behavior and adjust our strategies accordingly. 


[^1]: "Research and Markets: Wine: 2012 Global Industry Almanac - The Global Wine Market Grew by 3.1% in 2011 to Reach a Value of \$257.5 Billion." Research and Markets: Wine: 2012 Global Industry Almanac - The Global Wine Market Grew by 3.1% in 2011 to Reach a Value of $257.5 Billion | Business Wire. N.p., 21 May 2012. Web. 20 Nov. 2016.

# Statement of the Problem

The purpose of this report is to develop statistical models to make inference into the factors associated with the number of cases of wine sold.

# Data Exploration  

## Variables Explained

The variables provided in the `Wine Training Data Set` are explained below:




----------------------------------------------------
    Variable Code     Definition                    
--------------------- ------------------------------
      **INDEX**       **Identification Variable (do 
                      not use)**                    

       TARGET         Number of Cases Purchased     

    **AcidIndex**     **Proprietary method of       
                      testing total acidity of wine 
                      by using a weighted averag**  

       Alcohol        Alcohol Content               

    **Chlorides**     **Chloride content of wine**  

     CitricAcid       Citric Acid Content           

     **Density**      **Density of Wine**           

    FixedAcidity      Fixed Acidity of Wine         

**FreeSulfurDioxide** **Sulfur Dioxide content of   
                      wine**                        

     LabelAppeal      Marketing Score indicating the
                      appeal of label design for    
                      consumers. High numbers       
                      suggest customers like the    
                      label design. Negative numbers
                      suggest customes don't like   
                      the design.                   

  **ResidualSugar**   **Residual Sugar of wine**    

        STARS         Wine rating by a team of      
                      experts. 4 Stars = Excellent, 
                      1 Star = Poor                 

    **Sulphates**     **Sulfate content of wine**   

 TotalSulfurDioxide   Total Sulfur Dioxide of Wine  

 **VolatileAcidity**  **Volatile Acid content of    
                      wine**                        

         pH           pH of wine                    
----------------------------------------------------




\newpage

## Variables Summary Statistics

### Discrete Variables

Interestingly, we can see some general sense of the make up of our data set. In this set, most wines sell between 3 and 5 cases, have no label appeal, and very few received 4 stars with most wines receiving 2 or 1 stars. Additionally, we should note that `21.4%` of our wines had no case sales. 

\begingroup\footnotesize
\begin{longtable}{ll|rrr}
\caption{Wine Training Data Table of Discrete Variables} \\ 
 \textbf{Variable} & \textbf{Levels} & $\mathbf{n}$ & $\mathbf{\%}$ & $\mathbf{\sum \%}$ \\ 
  \hline \endhead  \hline
TARGET & 0 & 2734 & 21.4 & 21.4 \\ 
   & 1 & 244 & 1.9 & 23.3 \\ 
   & 2 & 1091 & 8.5 & 31.8 \\ 
   & 3 & 2611 & 20.4 & 52.2 \\ 
   & 4 & 3177 & 24.8 & 77.0 \\ 
   & 5 & 2014 & 15.7 & 92.8 \\ 
   & 6 & 765 & 6.0 & 98.8 \\ 
   & 7 & 142 & 1.1 & 99.9 \\ 
   & 8 & 17 & 0.1 & 100.0 \\ 
   \hline
 & all & 12795 & 100.0 &  \\ 
   \hline
\hline
LabelAppeal & -2 & 504 & 3.9 & 3.9 \\ 
   & -1 & 3136 & 24.5 & 28.5 \\ 
   & 0 & 5617 & 43.9 & 72.3 \\ 
   & 1 & 3048 & 23.8 & 96.2 \\ 
   & 2 & 490 & 3.8 & 100.0 \\ 
   \hline
 & all & 12795 & 100.0 &  \\ 
   \hline
\hline
STARS & 1 & 3042 & 32.2 & 32.2 \\ 
   & 2 & 3570 & 37.8 & 70.1 \\ 
   & 3 & 2212 & 23.4 & 93.5 \\ 
   & 4 & 612 & 6.5 & 100.0 \\ 
   \hline
 & all & 9436 & 100.0 &  \\ 
   \hline
\hline
\hline
\label{tab: nominal}
\end{longtable}
\endgroup


### Continous Variables

We see that Density is a very narrow measurement, the minimum value is 0.9 and the maximum is 1.1. The remaining continuous variables appear to have a larger range of variability, with the largest being `TotalSulfurDioxide` which has a range from -823 to 1057. In our models, this variability will provide some insights to our coefficients and the impact to the dependent variable. 

\begingroup\footnotesize
\begin{longtable}{lrrrrrrrrrr}
\caption{Wine Training Data Table of Continuous Variables} \\ 
 \textbf{Variable} & $\mathbf{n}$ & \textbf{Min} & $\mathbf{q_1}$ & $\mathbf{\widetilde{x}}$ & $\mathbf{\bar{x}}$ & $\mathbf{q_3}$ & \textbf{Max} & $\mathbf{s}$ & \textbf{IQR} & \textbf{\#NA} \\ 
  \hline
FixedAcidity & 12795 &  -18.1 &  5.2 &   6.9 &   7.1 &   9.5 &   34.4 &   6.3 &   4.3 &    0 \\ 
  VolatileAcidity & 12795 &   -2.8 &  0.1 &   0.3 &   0.3 &   0.6 &    3.7 &   0.8 &   0.5 &    0 \\ 
  CitricAcid & 12795 &   -3.2 &  0.0 &   0.3 &   0.3 &   0.6 &    3.9 &   0.9 &   0.5 &    0 \\ 
  ResidualSugar & 12179 & -127.8 & -2.0 &   3.9 &   5.4 &  15.9 &  141.2 &  33.7 &  17.9 &  616 \\ 
  Chlorides & 12157 &   -1.2 &  0.0 &   0.0 &   0.1 &   0.2 &    1.4 &   0.3 &   0.2 &  638 \\ 
  FreeSulfurDioxide & 12148 & -555.0 &  0.0 &  30.0 &  30.8 &  70.0 &  623.0 & 148.7 &  70.0 &  647 \\ 
  TotalSulfurDioxide & 12113 & -823.0 & 27.0 & 123.0 & 120.7 & 208.0 & 1057.0 & 231.9 & 181.0 &  682 \\ 
  Density & 12795 &    0.9 &  1.0 &   1.0 &   1.0 &   1.0 &    1.1 &   0.0 &   0.0 &    0 \\ 
  pH & 12400 &    0.5 &  3.0 &   3.2 &   3.2 &   3.5 &    6.1 &   0.7 &   0.5 &  395 \\ 
  Sulphates & 11585 &   -3.1 &  0.3 &   0.5 &   0.5 &   0.9 &    4.2 &   0.9 &   0.6 & 1210 \\ 
  Alcohol & 12142 &   -4.7 &  9.0 &  10.4 &  10.5 &  12.4 &   26.5 &   3.7 &   3.4 &  653 \\ 
  \hline
\label{}
\end{longtable}
\endgroup

\newpage

## Imputting Missing Values

In order to address the missing values in our variables we used a non-parametric imputation method (Random Forest) using the `missForest` package. The function is particularly useful in that it can handle any type of input data and it will make as few assumptions about the structure of the data as possible.[^2]

[^2]: Stekhoven, Daniel J., and Peter B?hlmann. ["MissForest-non-parametric missing value imputation for mixed-type data." Bioinformatics 28.1 (2012): 112-118](http://bioinformatics.oxfordjournals.org/content/28/1/112.short).





\begin{spacing}{0.7}
\begin{center}\textbf{ Table 4 : Imputed Descriptive Statistics \\ 13 Variables~~~~~ 12795 ~Observations}\end{center}
\smallskip\hrule\smallskip{\small
\noindent\textbf{FixedAcidity}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&470&1&7&7&-4&-1& 5& 7&10&16&18 \end{tabular}
\begin{verbatim}
lowest : -18.1 -18.0 -17.7 -17.5 -17.4, highest:  32.4  32.5  32.6  34.1  34.4 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{VolatileAcidity}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&815&1&0.3&0.8&-1.0&-0.7& 0.1& 0.3& 0.6& 1.4& 1.6 \end{tabular}
\begin{verbatim}
lowest : -2.790 -2.750 -2.745 -2.730 -2.720, highest:  3.500  3.550  3.565  3.590  3.680 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{CitricAcid}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&602&1&0.3&0.9&-1.16&-0.84& 0.03& 0.31& 0.58& 1.43& 1.79 \end{tabular}
\begin{verbatim}
lowest : -3.24 -3.16 -3.10 -3.08 -3.06, highest:  3.63  3.68  3.70  3.77  3.86 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{ResidualSugar}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&2685&1&5&34&-52.0&-38.4& -0.5&  4.1& 15.0& 48.9& 62.1 \end{tabular}
\begin{verbatim}
lowest : -127.80 -127.10 -126.20 -126.10 -125.70
highest:  136.50  137.60  138.00  140.65  141.15 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{Chlorides}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&2285&1&0.05&0.3&-0.48&-0.36&-0.01& 0.05& 0.13& 0.47& 0.59 \end{tabular}
\begin{verbatim}
lowest : -1.171 -1.170 -1.158 -1.156 -1.155, highest:  1.260  1.261  1.270  1.275  1.351 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{FreeSulfurDioxide}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&1626&1&31&150&-220&-165&   3&  30&  66& 223& 281 \end{tabular}
\begin{verbatim}
lowest : -555 -546 -536 -535 -532, highest:  613  617  618  622  623 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{TotalSulfurDioxide}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&2039&1&121&238&-266&-175&  33& 123& 200& 412& 507 \end{tabular}
\begin{verbatim}
lowest : -823 -816 -793 -781 -779, highest: 1032 1041 1048 1054 1057 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{Density}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&5933&1&1&0.03&0.9&1.0&1.0&1.0&1.0&1.0&1.0 \end{tabular}
\begin{verbatim}
lowest : 0.88809 0.88949 0.88978 0.88983 0.89167
highest: 1.09658 1.09679 1.09695 1.09791 1.09924 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{pH}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&863&1&3&0.7&2&2&3&3&3&4&4 \end{tabular}
\begin{verbatim}
lowest : 0.48 0.53 0.54 0.58 0.59, highest: 5.91 5.94 6.02 6.05 6.13 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{Sulphates}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&1695&1&0.5&0.9&-1.0&-0.6& 0.3& 0.5& 0.8& 1.7& 2.1 \end{tabular}
\begin{verbatim}
lowest : -3.13 -3.12 -3.10 -3.07 -3.03, highest:  4.11  4.16  4.19  4.21  4.24 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{Alcohol}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
12795&0&1036&1&10&4& 4& 6& 9&10&12&15&17 \end{tabular}
\begin{verbatim}
lowest : -4.7 -4.5 -4.4 -4.3 -4.1, highest: 25.4 25.6 26.0 26.1 26.5 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{LabelAppeal}

{\smaller
\begin{tabular}{ rrrrrr }
n&missing&distinct&Info&Mean&Gmd \\
12795&0&5&0.887&-0.009&1 \end{tabular}
\begin{verbatim}
lowest : -2 -1  0  1  2, highest: -2 -1  0  1  2 

-2 (504, 0.039), -1 (3136, 0.245), 0 (5617, 0.439), 1 (3048, 0.238), 2 (490, 0.038)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{STARS}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
12795&0&4 \end{tabular}
\begin{verbatim}

1 (5305, 0.415), 2 (4569, 0.357), 3 (2309, 0.180), 4 (612, 0.048)
\end{verbatim}
}
\smallskip\hrule\smallskip
}\end{spacing}
\newpage
## Correlation of Variables

### Correlation Matrix

If we modify our data frame to a matrix in our evaluation data set we can further plot a correlation matrix. There are surprisingly few interesting correlations in the data, but the lack of correlation in the data set is in itself interesting. 

* `STARS` has the most positive correlation and strongest correlation with our dependent variable `TARGET`. It is intuitive that the greater the `STARS` value the more cases our wine would sell.

* `LabelAppeal` is the second most correlated with our dependent variable to our dependent variable. It is interesting that the two most correlated variables have less to do with wine quality and more to do with the appearance of a sophisticated wine. 

* The lack of strong correlations is interesting in itself. It is concerning that most variables have nearly no correlation with our dependent variable but represent the actual quality of the wine. We see that public perception of wine is more important than the actual quality of the wine as measured by these variables.    

![Correlation Plot of Training Data Set](Homework_5_files/figure-latex/correlation matrix-1.pdf) 
\newpage

# Data Transformation

## Outliers Treatment

### Box Plots of Variables for Winsorizing

Box Plots provide a visualization of the quartiles and outliers of our data set.[^3] Using the box plots, we are can conclude that the variables to be winsorized are Free Sulfur Dioxide, Residual Sugar, and Total Sulfur Dioxide. 

[^3]: "Box Plot." Wikipedia. Wikimedia Foundation, n.d. Web. 24 Nov. 2016.

![](Homework_5_files/figure-latex/boxplots-1.pdf)<!-- --> 


### Winsorizing

We chose winsorizing as the method to address outliers. Instead of trimming values, winsorizing uses the interquantile range to replace values that are above or below the interquantile range multiplied by a factor. Those values above or below the range multiplied by the factor are then replaced with max and min value of the interquantile range. Using the factor 2.2 for winsorizing outliers is a method developed my Hoaglin and Iglewicz and published Journal of American Statistical Association in 1987[^4].  

[^4]:Hoaglin, D. C., and Iglewicz, B. (1987), Fine tuning some resistant rules for outlier labeling, Journal of American Statistical Association, 82, 1147-1149.

The below table is the summary results of the winsorizing of the data. 


\begin{table}[!htbp] \centering 
  \caption{} 
  \label{} 
\begin{tabular}{@{\extracolsep{5pt}}lccccc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
Statistic & \multicolumn{1}{c}{N} & \multicolumn{1}{c}{Mean} & \multicolumn{1}{c}{St. Dev.} & \multicolumn{1}{c}{Min} & \multicolumn{1}{c}{Max} \\ 
\hline \\[-1.8ex] 
FreeSulfurDioxide & 12,796 & 31.978 & 99.033 & $-$135.000 & 204.000 \\ 
TotalSulfurDioxide & 12,796 & 120.521 & 203.181 & $-$333.000 & 565.000 \\ 
ResidualSugar & 12,796 & 5.927 & 23.816 & $-$34.600 & 49.100 \\ 
TARGET & 12,796 & 3.029 & 1.926 & 0 & 8 \\ 
FixedAcidity & 12,796 & 7.075 & 6.317 & $-$18.100 & 34.400 \\ 
VolatileAcidity & 12,796 & 0.324 & 0.784 & $-$2.790 & 3.680 \\ 
CitricAcid & 12,796 & 0.308 & 0.862 & $-$3.240 & 3.860 \\ 
Chlorides & 12,796 & 0.055 & 0.313 & $-$1.171 & 4.000 \\ 
Density & 12,796 & 0.994 & 0.032 & 0.888 & 3.000 \\ 
pH & 12,796 & 3.208 & 0.670 & 0.480 & 6.130 \\ 
Sulphates & 12,796 & 0.527 & 0.888 & $-$3.130 & 4.240 \\ 
Alcohol & 12,796 & 10.489 & 3.636 & $-$4.700 & 26.500 \\ 
LabelAppeal & 12,796 & $-$0.009 & 0.891 & $-$2 & 3 \\ 
\hline \\[-1.8ex] 
\end{tabular} 
\end{table} 

\newpage

## BoxCox Transformations 

Even after Winsorization we see non-constant variance in the Pearson Residuals for `FreeSulferDioxide`, `TotalSulfurDioxide`, and `ResidualSugar`. The Box-Cox evaluation was completed on these variables, based on the residual plots. In the residual plots, these three variables showed a great deal of non-constant variance because the plots were hyperbolic-shaped. 

![](Homework_5_files/figure-latex/residual plots-1.pdf)<!-- --> ![](Homework_5_files/figure-latex/residual plots-2.pdf)<!-- --> 

```
##                    Test stat Pr(>|t|)
## FreeSulfurDioxide     -1.892    0.058
## TotalSulfurDioxide    -1.751    0.080
## ResidualSugar         -2.101    0.036
## FixedAcidity          -1.881    0.060
## VolatileAcidity       -1.694    0.090
## CitricAcid            -1.092    0.275
## Chlorides             -2.370    0.018
## Density               -2.286    0.022
## pH                    -1.500    0.134
## Sulphates             -1.616    0.106
## Alcohol                1.408    0.159
## LabelAppeal            3.071    0.002
## STARS                     NA       NA
## Tukey test            17.998    0.000
```

\newpage

### Determing BoxCox Transformations 

Using the `BoxCox.lambda` function from the `forecast` package we are able to determine our necessary transformations to our independent variables. 


    $\lambda$             Variables       
------------------  ----------------------
 1.22449234379866    Free Sulfur Dioxide  
 1.0182875042235     Total Sulfur Dioxide 
 1.18389893233879       Residual Sugar    

Utilizing transformations based on the lambda value of the BoxCox and rounding to the nearest tenth we further transform our independent variables for our regression models. We see that the `TotalSulfurDioxide` variable does not require further transformation

\centering

Box-Cox Transformations [^5]

\setlength{\tabcolsep}{12pt}

\begin{tabular}{ c c }
\hline
$\lambda$ & Y' \\ \hline
0	& $\log(Y)$ \\
.25  & $\sqrt[4]{Y}$\\  
0.5	& $Y^{0.5}~=~\sqrt{(Y)}$ \\
1	& $Y^{1}~=~Y$ \\
1.25 & $Y^{1.25}$ \\

\end{tabular}

\justifying

\centering

\begin{tabular}{ c c }
\hline
variable & variable transformation \\ \hline
ResidualSugar & $ResidualSugar^{1.25}$ \\
FreeSulfurDioxide & $FreeSulfurDioxide^{1.25}$ \\
\end{tabular}

\justifying

\setlength{\tabcolsep}{6pt}

[^5]: Osborne, Jason W. "Improving your data transformations: Applying the Box-Cox transformation." Practical Assessment, Research & Evaluation 15.12 (2010): 1-9.

\newpage

# Models Built

## Poisson Regression Models



First, we investigate the unconditional variance is slightly > unconditional mean. Which we do see in the below table so there may be some over-dispersion.


     mean        var
---------  ---------
 3.029074   3.710895

### Poisson Regression Model 1

We build out first Poisson Regression model but we need to verify the confidence levels are appropriate. After producing the Confidence level for ResidualSugar we see it runs through 1 and and its P(z) value is clearly not significant. Based on both items we can remove ResidualSugar from the model.


\begin{table}[!htbp] \centering 
  \caption{Poisson Regression Model 1} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & TARGET \\ 
\hline \\[-1.8ex] 
 Constant & 0.406$^{***}$ (0.018) \\ 
  STARS2 & 0.825$^{***}$ (0.013) \\ 
  STARS3 & 1.064$^{***}$ (0.015) \\ 
  STARS4 & 1.229$^{***}$ (0.021) \\ 
  Alcohol & 0.005$^{***}$ (0.001) \\ 
  ResidualSugar & 0.00005 (0.0002) \\ 
 \hline \\[-1.8ex] 
Observations & 12,795 \\ 
Log Likelihood & $-$23,658.340 \\ 
Akaike Inf. Crit. & 47,328.690 \\ 
Residual Deviance & 15,374.670 (df = 12789) \\ 
Null Deviance & 22,860.890 (df = 12794) \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 




----------------------------------------
      &nbsp;               2.5%   97.5% 
------------------- ----- ------ -------
  **(Intercept)**    1.5  1.447   1.555 

    **STARS2**      2.283 2.224   2.344 

    **STARS3**      2.898 2.816   2.982 

    **STARS4**      3.419 3.284   3.559 

    **Alcohol**     1.005 1.002   1.008 

 **ResidualSugar**    1   0.9997    1   
----------------------------------------

Table: Confidence intervals

\newpage

We removed ResidualSugar and Model with the independent variables STARS and Alcohol. We can see how great the STARS variable has on our model, 2 STARS is 2.28 times wine case sales when compared to one STAR. Furthermore, 3 Stars will have wiine case sales of 2.90 times more than one STAR, and four STARS  will be 3.42 times more than one STAR. Alcohol = For one unit increase in Alcohol, Wine sales will be 1.004 times more


\begin{table}[!htbp] \centering 
  \caption{Poisson Regression Model 1 without ResidualSugar} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & TARGET \\ 
\hline \\[-1.8ex] 
 Constant & 0.406$^{***}$ (0.018) \\ 
  STARS2 & 0.825$^{***}$ (0.013) \\ 
  STARS3 & 1.064$^{***}$ (0.015) \\ 
  STARS4 & 1.229$^{***}$ (0.021) \\ 
  Alcohol & 0.005$^{***}$ (0.001) \\ 
 \hline \\[-1.8ex] 
Observations & 12,795 \\ 
Log Likelihood & $-$23,658.390 \\ 
Akaike Inf. Crit. & 47,326.790 \\ 
Residual Deviance & 15,374.760 (df = 12790) \\ 
Null Deviance & 22,860.890 (df = 12794) \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 



-----------------------------------------
     &nbsp;        &nbsp;   2.5%   97.5% 
----------------- -------- ------ -------
 **(Intercept)**   1.501   1.448   1.555 

   **STARS2**      2.283   2.224   2.344 

   **STARS3**      2.898   2.816   2.983 

   **STARS4**      3.419   3.284   3.559 

   **Alcohol**     1.005   1.002   1.008 
-----------------------------------------

Table: Confidence intervals

#### Poisson Regression Model 1 Metrics

##### Dispersion 

dispersion 
 0.9730167 

Our dispersion results are very close to 1. So, we can say it is not over or under dispersed. However, we can further test for overdispersion by dividing the deviance of our model by the residuals. The result of this test is 1.2020925 and since this result is not greater than 1.5, we can claim that the data is not over-dispersed.[^7]

[^7]: ["Multiple Logistic Regression." R Companion: Multiple Logistic Regression.](http://rcompanion.org/rcompanion/e_07.html) N.p., n.d. Web. 04 Dec. 2016.

\newpage

##### Influential Points

We further test for influential points in the data set. This test indicates that rows 10328, 9714, and 3891, have great influence on our model. It would be important to discuss these rows with the appropriate data steward to understand if these are accurate measurements and should be included in the analysis. Due to time limitations, we are not able to verify these rows and they have been included in this analysis.  

![](Homework_5_files/figure-latex/unnamed-chunk-9-1.pdf)<!-- --> 

```
##           StudRes          Hat       CookD
## 3891   2.59248567 0.0005804453 1.31210e-03
## 9714  -2.76735034 0.0013458546 1.03277e-03
## 10328  0.07597296 0.0041037245 4.80641e-06
```

##### Verifying Predictions

We also verify predicted values for the training dataset, in order to verify the output of our model against the training data set. 


-----------------------------------
 TARGET   STARS   Alcohol   Fitted 
-------- ------- --------- --------
   3        2       9.9     3.596  

   3        3      10.07    4.569  

   5        3       22      4.844  

   3        1       6.2     1.547  

   4        2      13.7     3.663  

   0        1      15.4     1.618  
-----------------------------------

The predictions are close in value, we can further see the prediction quality of the model by reviewing the frequency table for observed vs predicted values. 


--------------------------
 Target   Obs   Predicted 
-------- ----- -----------
   0     2734       0     

   1      244      51     

   2     1091     5254    

   3     2611      262    

   4     3177     4574    

   5     2014     2553    

   6      765      101    

   7      142       0     

   8      17        0     
--------------------------

Goodness of Fit Test

Goodness of Fit Test using Pearson Chi square test gives us the result of 0 shows that our model is good. 

\newpage

### Poisson Regression Model 2 

As in our first Poisson model, we build our second Poisson Regression model and we need to verify the confidence levels are appropriate. After producing the Confidence level for Confidence level for CitricAcid and pH, we see that they run through 1 and and their P(z) values are clearly not significant. Based on both info we can remove CitricAcid and pH from the model.


\begin{table}[!htbp] \centering 
  \caption{Poisson Regression Model 2} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & TARGET \\ 
\hline \\[-1.8ex] 
 Constant & 0.461$^{***}$ (0.044) \\ 
  LabelAppeal-1 & 0.383$^{***}$ (0.038) \\ 
  LabelAppeal0 & 0.685$^{***}$ (0.037) \\ 
  LabelAppeal1 & 0.909$^{***}$ (0.037) \\ 
  LabelAppeal2 & 1.092$^{***}$ (0.042) \\ 
  CitricAcid & 0.004 (0.006) \\ 
  pH & $-$0.011 (0.008) \\ 
 \hline \\[-1.8ex] 
Observations & 12,795 \\ 
Log Likelihood & $-$26,380.660 \\ 
Akaike Inf. Crit. & 52,775.320 \\ 
Residual Deviance & 20,819.300 (df = 12788) \\ 
Null Deviance & 22,860.890 (df = 12794) \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 



---------------------------------------------
      &nbsp;         &nbsp;   2.5 %   97.5 % 
------------------- -------- ------- --------
  **(Intercept)**    1.585    1.455   1.726  

 **LabelAppeal-1**   1.467    1.363   1.581  

 **LabelAppeal0**    1.983    1.846   2.133  

 **LabelAppeal1**    2.481    2.309   2.671  

 **LabelAppeal2**     2.98    2.747   3.236  

  **CitricAcid**     1.004   0.9926   1.016  

      **pH**         0.9894  0.9747   1.004  
---------------------------------------------

Table: Confidence intervals

\newpage

We removed CitricAcid and pH then created a new Model with only LabelAppeal. The impact of LabelAppeal is very significant since this variable is explaining a great deal of variation in our dependent variable. A neutral LabelAppeal of 0 will have wine sales 1.98 times greater than a very negative LabelAppeal of -2. Also, a great LabelAppeal of 2 will have 2.98 times greater wine sales than a than a very negative LabelAppeal of -2.


\begin{table}[!htbp] \centering 
  \caption{Poisson Regression Model 2 with LabelAppeal} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & TARGET \\ 
\hline \\[-1.8ex] 
 Constant & 0.428$^{***}$ (0.036) \\ 
  LabelAppeal-1 & 0.383$^{***}$ (0.038) \\ 
  LabelAppeal0 & 0.685$^{***}$ (0.037) \\ 
  LabelAppeal1 & 0.909$^{***}$ (0.037) \\ 
  LabelAppeal2 & 1.092$^{***}$ (0.042) \\ 
 \hline \\[-1.8ex] 
Observations & 12,795 \\ 
Log Likelihood & $-$26,381.890 \\ 
Akaike Inf. Crit. & 52,773.780 \\ 
Residual Deviance & 20,821.760 (df = 12790) \\ 
Null Deviance & 22,860.890 (df = 12794) \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 



-------------------------------------------
      &nbsp;         &nbsp;   2.5%   97.5% 
------------------- -------- ------ -------
  **(Intercept)**    1.534   1.428   1.644 

 **LabelAppeal-1**   1.467   1.363   1.582 

 **LabelAppeal0**    1.983   1.847   2.133 

 **LabelAppeal1**    2.482    2.31   2.672 

 **LabelAppeal2**    2.979   2.747   3.235 
-------------------------------------------

Table: Confidence intervals

#### Poisson Regression Model 2 Metrics

dispersion 
  1.035287 

Our dispersion results are very close to 1. So, we can say it is not over or under dispersed. However, we can further test for overdispersion by dividing the deviance of our model by the residuals. The result of this test is 1.6279715 and since this result is greater than 1.5, we can claim that the data is over-dispersed.

\newpage

##### Influential points

We further test for influential points in the data set. This test indicates that rows 7140, 14, and 74, have great influence on our model. It would be important to discuss these rows with the appropriate data steward to understand if these are accurate measurements and should be included in the analysis. Due to time limitations, we are not able to verify these rows and they have been included in this analysis.  

![](Homework_5_files/figure-latex/unnamed-chunk-17-1.pdf)<!-- --> 

```
##        StudRes         Hat        CookD
## 14    1.054918 0.002040816 0.0005298851
## 74   -3.024586 0.002040816 0.0018726921
## 7140  2.213682 0.001984127 0.0031210472
```

\newpage

##### Verifying Predictions

We also verify predicted values for the training dataset, in order to verify the output of our model against the training data set. 


-----------------------------------------
 TARGET   LabelAppeal   Alcohol   Fitted 
-------- ------------- --------- --------
   3           0          9.9     3.042  

   3          -1         10.07     2.25  

   5          -1          22       2.25  

   3          -1          6.2      2.25  

   4           0         13.7     3.042  

   0           0         15.4     3.042  
-----------------------------------------

The predictions are close in value, we can further see the prediction quality of the model by reviewing the frequency table for observed vs predicted values. 


--------------------------
 Target   Obs   Predicted 
-------- ----- -----------
   0     2734       0     

   1      244       0     

   2     1091     3640    

   3     2611     5617    

   4     3177     3048    

   5     2014      490    

   6      765       0     

   7      142       0     

   8      17        0     
--------------------------

Goodness of fit test

The goodness of fit test using pearson Chisquare test results are 0 which shows that our model is good and statistically significant.

\newpage

## Binomial Regression Models

### Binomial Regression Model 1

In the first binomial regression model, all of the coefficients are positive. The variable that had to be removed was wine rating, due to the fact that it led to an error in the model, stating that the iteration limit was reached. Even though this categorical variable guarantees high significance and also higher coefficients (0.4 for STARS = 2, 0.6 for STARS = 3, and 0.7 for STARS = 4), this variable would not be appropriate to use for negative binomial regression. The alcohol content is also an equally significant variable but does not have a coefficient as high as those of the wine rating. However, this variable and residual sugar can be used for negative binomial regression because the resulting overdispersion is not so high. 


\begin{table}[!htbp] \centering 
  \caption{Binomial Regression Model 1} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lcc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{2}{c}{\textit{Dependent variable:}} \\ 
\cline{2-3} 
\\[-1.8ex] & \multicolumn{2}{c}{TARGET} \\ 
\\[-1.8ex] & (1) & (2)\\ 
\hline \\[-1.8ex] 
 Constant & 0.405$^{***}$ (0.018) & 0.987$^{***}$ (0.019) \\ 
  STARS2 & 0.825$^{***}$ (0.013) &  \\ 
  STARS3 & 1.064$^{***}$ (0.015) &  \\ 
  STARS4 & 1.229$^{***}$ (0.021) &  \\ 
  Alcohol & 0.005$^{***}$ (0.001) & 0.011$^{***}$ (0.002) \\ 
  ResidualSugar & 0.0002 (0.0002) & 0.001$^{**}$ (0.0003) \\ 
 \hline \\[-1.8ex] 
Observations & 12,795 & 12,796 \\ 
Log Likelihood & $-$23,659.120 & $-$27,142.350 \\ 
$\theta$ & 39,834.370  (37,787.650)  (p = 0.292) & 7.521$^{***}$  (0.435)  (p = 0.000) \\ 
Akaike Inf. Crit. & 47,330.240 & 54,290.700 \\ 
Residual Deviance & 15,373.240 (df = 12789) & 18,163.620 (df = 12793) \\ 
Null Deviance & 22,859.700 (df = 12794) & 18,214.010 (df = 12795) \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{2}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

#### Binomial Regression Model 1 Evaluation

In the model-fitting criterion, the chi-squared p-value is close to 0. This implies that the model is valid.


-----------------------------------------------------------------
 residual.deviance   residual.degrees.of.freedom   chisq.p.value 
------------------- ----------------------------- ---------------
       15374                    12790                2.201e-52   
-----------------------------------------------------------------

\newpage

### Binomial Regression Model 2

In the second negative binomial regression model, all of the coefficients are positive except for that of pH. The only significant variable is the label appeal. Except for the score of 3, all of the other scores for label appeal, yield significant results. Most of the coefficients for label appeal are close to 1 or slightly greater than 1 (0.7 for Label Appeal = 0, 0.9 for Label Appeal = 1, 1.09 for Label Appeal = 2, and 0.7 for Label Appeal = 3). The only score that yeilds a coefficient that is less than 1 is -1. The coefficient for this is 0.4. The standard error is 3.5. The theta value is 23.46, guaranteeing a lower level of overdispersion. 


\begin{table}[!htbp] \centering 
  \caption{Binomial Regression Model 2} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lcc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{2}{c}{\textit{Dependent variable:}} \\ 
\cline{2-3} 
\\[-1.8ex] & \multicolumn{2}{c}{TARGET} \\ 
\\[-1.8ex] & (1) & (2)\\ 
\hline \\[-1.8ex] 
 Constant & 0.462$^{***}$ (0.045) & 0.428$^{***}$ (0.037) \\ 
  CitricAcid & 0.004 (0.006) &  \\ 
  pH & $-$0.011 (0.008) &  \\ 
  LabelAppeal-1 & 0.383$^{***}$ (0.039) & 0.383$^{***}$ (0.039) \\ 
  LabelAppeal0 & 0.685$^{***}$ (0.038) & 0.685$^{***}$ (0.038) \\ 
  LabelAppeal1 & 0.909$^{***}$ (0.038) & 0.909$^{***}$ (0.038) \\ 
  LabelAppeal2 & 1.092$^{***}$ (0.044) & 1.092$^{***}$ (0.044) \\ 
  LabelAppeal3 & 0.703 (0.615) & 0.671 (0.614) \\ 
 \hline \\[-1.8ex] 
Observations & 12,796 & 12,796 \\ 
Log Likelihood & $-$26,356.870 & $-$26,358.000 \\ 
$\theta$ & 23.465$^{***}$  (3.501)  (p = 0.000) & 23.422$^{***}$  (3.489)  (p = 0.000) \\ 
Akaike Inf. Crit. & 52,729.730 & 52,728.000 \\ 
Residual Deviance & 19,237.720 (df = 12788) & 19,237.400 (df = 12790) \\ 
Null Deviance (df = 12795) & 21,051.280 & 21,048.310 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{2}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 


#### Binomial Regression Model 2 Evaluation

Like the previous model, the chi-squared p-value for this model is close to 0. This model is also valid. 


-----------------------------------------------------------------
 residual.deviance   residual.degrees.of.freedom   chisq.p.value 
------------------- ----------------------------- ---------------
       19237                    12790               4.356e-269   
-----------------------------------------------------------------

\newpage

## Multiple Linear Regression

### Linear Regression with All Variables

The first linear regression we generate includes all variables from our data set. The intercept is at `3.139` cases and `Density` shows a large negative impact on cases sold but with its narrow range its difficult to tell how meaningful this variable is in cases sold. The `STARS` variable shows an expected impact on cases sold, the difference between 1 Star and 4 Stars is an added `3.36` cases in sales.


\begin{table}[!htbp] \centering 
  \caption{Linear Model with all variables} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & TARGET \\ 
\hline \\[-1.8ex] 
 Constant & 3.139$^{***}$ (0.606) \\ 
  FixedAcidity & $-$0.008$^{***}$ (0.003) \\ 
  VolatileAcidity & $-$0.125$^{***}$ (0.020) \\ 
  CitricAcid & 0.013 (0.019) \\ 
  I(ResidualSugar$\hat{\mkern6mu}$1.25) & $-$0.001$^{**}$ (0.0002) \\ 
  Chlorides & $-$0.234$^{***}$ (0.052) \\ 
  I(FreeSulfurDioxide$\hat{\mkern6mu}$1.25) & 0.0001$^{***}$ (0.00003) \\ 
  TotalSulfurDioxide & 0.0002$^{**}$ (0.0001) \\ 
  Density & $-$1.480$^{**}$ (0.602) \\ 
  pH & $-$0.003 (0.024) \\ 
  Sulphates & $-$0.046$^{**}$ (0.018) \\ 
  Alcohol & 0.016$^{***}$ (0.004) \\ 
  LabelAppeal & 0.427$^{***}$ (0.019) \\ 
  STARS2 & 1.905$^{***}$ (0.037) \\ 
  STARS3 & 2.697$^{***}$ (0.046) \\ 
  STARS4 & 3.355$^{***}$ (0.080) \\ 
 \hline \\[-1.8ex] 
Observations & 7,256 \\ 
R$^{2}$ & 0.501 \\ 
Adjusted R$^{2}$ & 0.500 \\ 
Residual Std. Error & 1.356 (df = 7240) \\ 
F Statistic & 485.267$^{***}$ (df = 15; 7240)  (p = 0.000) \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

\newpage

#### Linear Model Metrics with all Variables

##### Multicollinearity

We square `GVIF^(1/(2*Df))` [^6] in order to use the VIF threshold of 5 for multicollinearity. Fortunately, we find that no variable exceeds our pre-established threshold of 5 for multicollinearity.


rn                             GVIF      Df    GVIF^(1/(2*Df))    Adjusted_GVIF 
--------------------------  ----------  ----  -----------------  ---------------
FixedAcidity                 1.003005    1        1.001501          1.003005    
VolatileAcidity              1.004193    1        1.002095          1.004193    
CitricAcid                   1.003311    1        1.001654          1.003311    
I(ResidualSugar^1.25)        1.001823    1        1.000911          1.001823    
Chlorides                    1.002043    1        1.001021          1.002043    
I(FreeSulfurDioxide^1.25)    1.003812    1        1.001904          1.003812    
TotalSulfurDioxide           1.005073    1        1.002533          1.005073    
Density                      1.002075    1        1.001037          1.002075    
pH                           1.002538    1        1.001268          1.002538    
Sulphates                    1.003861    1        1.001929          1.003861    
Alcohol                      1.006806    1        1.003397          1.006806    
LabelAppeal                  1.106042    1        1.051685          1.106042    
STARS                        1.121941    3        1.019362          1.039098    

\newpage

##### Diagnositic Plots

The Normal Q-Q plots show a linear relationship so the data suggest that the data is normally distributed.

![](Homework_5_files/figure-latex/linear regression model metrics-1.pdf)<!-- --> 

[^6]: ["Which Variance Inflation Factor Should I Be Using: $GVIF$ or $text{GVIF}^{1/(2cdottext{df})}$?"](http://stats.stackexchange.com/a/96584) R. N.p., n.d. Web. 13 Nov. 2016.

\newpage

### Linear Regression Selection using AIC

#### Variable Selection 

Using the R package `MASS` we can utilize the `stepAIC` function with the parameter of `direction` set to `both` to select our best subset of variables for a new model. 

The method effectively removed `pH` and `CitricAcid` which were both shown to be not significiant in the previous linear model using all variables. 


```
## Stepwise Model Path 
## Analysis of Deviance Table
## 
## Initial Model:
## TARGET ~ FixedAcidity + VolatileAcidity + CitricAcid + I(ResidualSugar^1.25) + 
##     Chlorides + I(FreeSulfurDioxide^1.25) + TotalSulfurDioxide + 
##     Density + pH + Sulphates + Alcohol + LabelAppeal + STARS
## 
## Final Model:
## TARGET ~ FixedAcidity + VolatileAcidity + I(ResidualSugar^1.25) + 
##     Chlorides + I(FreeSulfurDioxide^1.25) + TotalSulfurDioxide + 
##     Density + Sulphates + Alcohol + LabelAppeal + STARS
## 
## 
##           Step Df   Deviance Resid. Df Resid. Dev      AIC
## 1                                 7240   13311.93 4435.174
## 2         - pH  1 0.03552113      7241   13311.97 4433.193
## 3 - CitricAcid  1 0.94340380      7242   13312.91 4431.707
```
\newpage

#### Model using Variable Selection

We see slight variation in our intercept and some variable coefficients which is expected with the reduced number of variables. However, we don't see any large changes, one benefit with the reduced variables is our model interpretability is improved and our F Statistic has increased with the reduced degrees of freedom. 

Additionally, we see that the adjusted $R^2$ has not changed which is expected since we removed variables that were not considered significant. 


\begin{table}[!htbp] \centering 
  \caption{Linear Model with select variables} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
 & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
\cline{2-2} 
\\[-1.8ex] & TARGET \\ 
\hline \\[-1.8ex] 
 Constant & 3.134$^{***}$ (0.601) \\ 
  FixedAcidity & $-$0.008$^{***}$ (0.003) \\ 
  VolatileAcidity & $-$0.126$^{***}$ (0.020) \\ 
  I(ResidualSugar$\hat{\mkern6mu}$1.25) & $-$0.001$^{**}$ (0.0002) \\ 
  Chlorides & $-$0.235$^{***}$ (0.052) \\ 
  I(FreeSulfurDioxide$\hat{\mkern6mu}$1.25) & 0.0001$^{***}$ (0.00003) \\ 
  TotalSulfurDioxide & 0.0002$^{**}$ (0.0001) \\ 
  Density & $-$1.482$^{**}$ (0.602) \\ 
  Sulphates & $-$0.046$^{**}$ (0.018) \\ 
  Alcohol & 0.016$^{***}$ (0.004) \\ 
  LabelAppeal & 0.427$^{***}$ (0.019) \\ 
  STARS2 & 1.906$^{***}$ (0.037) \\ 
  STARS3 & 2.697$^{***}$ (0.046) \\ 
  STARS4 & 3.355$^{***}$ (0.080) \\ 
 \hline \\[-1.8ex] 
Observations & 7,256 \\ 
R$^{2}$ & 0.501 \\ 
Adjusted R$^{2}$ & 0.500 \\ 
Residual Std. Error & 1.356 (df = 7242) \\ 
F Statistic & 559.996$^{***}$ (df = 13; 7242)  (p = 0.000) \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\end{tabular} 
\end{table} 

\newpage

#### Linear Model Metrics with select Variables


##### Diagnositic Plots

The Normal Q-Q plots show a linear relationship so the data suggest that the data is normally distributed.

![](Homework_5_files/figure-latex/linear regression model metrics with select variables-1.pdf)<!-- --> 

##### Multicollinearity

We square `GVIF^(1/(2*Df))` in order to use the VIF threshold of 5 for multicollinearity. Fortunately, we find that no variable exceeds our pre-established threshold of 5 for multicollinearity.


rn                             GVIF      Df    GVIF^(1/(2*Df))    Adjusted_GVIF 
--------------------------  ----------  ----  -----------------  ---------------
FixedAcidity                 1.002826    1        1.001412          1.002826    
VolatileAcidity              1.004095    1        1.002045          1.004095    
I(ResidualSugar^1.25)        1.001601    1        1.000800          1.001601    
Chlorides                    1.001750    1        1.000875          1.001750    
I(FreeSulfurDioxide^1.25)    1.003762    1        1.001879          1.003762    
TotalSulfurDioxide           1.004725    1        1.002360          1.004725    
Density                      1.002057    1        1.001028          1.002057    
Sulphates                    1.003403    1        1.001700          1.003403    
Alcohol                      1.006586    1        1.003288          1.006586    
LabelAppeal                  1.105763    1        1.051553          1.105763    
STARS                        1.118645    3        1.018862          1.038080    

\newpage

# Selected Model

In order to select our most appropriate model we will use the AIC as our selection criteria. This method was outlined by Snipes & Taylor for their similar research in selecting models from wine ratings and prices.[^8] As per Snipes & Taylor - "The best model is then the model with the lowest AICc (or AIC) score". Therefore, based on the results of our AIC table below, Linear Regression 2 is our best model. However, for deployment we will need to use one of the count regressions. Therefore, the count regression with the lowest AIC is Poisson Regression 1 which we will use for our predictions.




------------------------------
        model           AIC   
--------------------- --------
Poisson Regression 1  47326.78

Poisson Regression 2  52773.78

Binomial Regression 1 54290.7 

Binomial Regression 2  52728  

 Linear Regression 1  25028.81

 Linear Regression 2  25025.34
------------------------------

Model for Deployment - Poisson Model 1: 
$$
\begin{aligned}
TARGET = &2.28*(STARS="2") + 2.9*(STARS="3") + 3.42*(STARS="4") + 1.004*Alcohol + 1.50
\end{aligned}
$$

[^8]: Snipes, & Taylor. (2014). Model selection and Akaike Information Criteria: An example from wine ratings and prices. Wine Economics and Policy, 3(1), 3-9.

\newpage

## Predictions

Due to several missing values in the evaluation data set we will use the missForest package again to impute the missing values before predictions. 





\tiny


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 TARGET   IN    FixedAcidity   VolatileAcidity   CitricAcid   ResidualSugar   Chlorides   FreeSulfurDioxide   TotalSulfurDioxide   Density   pH    Sulphates   Alcohol   LabelAppeal   AcidIndex   STARS 
-------- ----- -------------- ----------------- ------------ --------------- ----------- ------------------- -------------------- --------- ----- ----------- --------- ------------- ----------- -------
   1       3        5.4             -0.86           0.27          -10.7         0.092            23                  398           0.9853   5.02     0.64       12.3         -1            6         2   

   1       9        12.4            0.385          -0.76          -19.7         1.169            -37                  68           0.9905   3.37     1.09        16           0            6         2   

   0      10        7.2             1.75            0.17           -33          0.065             9                   76            1.046   4.61     0.68       8.55          0            8         1   

   0      18        6.2              0.1            1.8             1          -0.179            104                  89           0.9888    3.2     2.11       12.3         -1            8         1   

   1      21        11.4            0.21            0.28           1.2          0.038            70                   53            1.029   2.54     -0.07       4.8          0           10         2   

   2      30        17.6            0.04           -1.15           1.4          0.535           -250                 140           0.9503   3.06     -0.02      11.4          1            8         4   

   2      31        15.5            0.53           -0.53           4.6          1.263            10                   17              1     3.07     0.75        8.5          0           12         3   

   2      37        15.9            1.19            1.14          31.9         -0.299            115                 381            1.034   2.99     0.31       11.4          1            7         3   

   0      39        11.6            0.32            0.55          -50.9         0.076            35                   83              1     3.32     2.18       -0.5          0           12         1   

   1      47        3.8             0.22            0.31          -7.7          0.039            40                  129           0.9061   4.72     -0.64      10.9          0            7         2   

   0      60        6.8             1.68            0.44          -13.3         0.046           65.67                583            1.008   3.198    1.64       12.6          0            8         1   

   2      62         9              -0.21           0.04          51.4          0.237           -213                 -527          0.9952   3.16      0.7       14.7          1           10         3   

   1      63        24.6            0.03            -1.2           1.3          0.035            241                 297           0.9923   2.22      0.5        9.8          0            9         2   

   1      64         13             0.21            0.32          -3.2         -0.263            111                 141           0.9592    3.2    0.5719       4.2          0            8         2   

   0      68        17.9            -0.42          -0.91           7.1          0.045           -177                 169           0.9531   3.17     -1.12      13.2         -1            9         1   

   1      75         10              0.2            1.27          30.9          0.05             19                  152            0.994   3.153    0.42       13.8         -1           11         2   

   0      76        7.4             0.29            0.5            8.5          -0.48            178                 647           0.9728   3.45      0.5       10.2         -1            8         1   

   1      83        11.7            1.18           -0.94           -62          0.675             7                  -393          0.9997   3.96     0.69        5.2          1           13         2   

   1      87        9.7             0.41             -1           1.101        -0.235            24                  113           0.9977   3.44     0.53        9.8          0            7         2   

   2      92        -5.2            -0.98          -0.08           6.4          0.046            180                 166            0.994    3.3     2.18        9.9          1            5         3   

   1      98        7.3             0.19            0.49         -35.55         0.38             -75                 343           0.9998   3.42     0.36       13.3         -2            8         2   

   0      106       6.7             -0.78           0.31          16.4          -0.03            20                  -16           0.9983   3.11     -0.57       9.1          0            7         1   

   2      107       4.1             0.54            -0.3           2.2          0.088             9                  427           0.9972   3.98     2.06       11.4          2            8         3   

   0      113       6.5             1.53            0.84          -14.4         0.047            54                  184           0.9461   3.17     -0.56       9.2         -1            7         1   

   1      120       11.8            0.27            0.46          11.75         0.316            61                  794            1.02     2.2     0.07        5.4          0            7         2   

   1      123        -5             0.16            0.78           1.4         -0.898            10                   67           0.9461    2.5     0.41        9.4          2            7         2   

   1      125       8.3             0.26            1.93          -12.7         0.042            41                  479           0.9987    3.1     1.66        12          -1            9         2   

   2      126       3.3             0.23           -1.39           1.8          0.043           -183                  69           0.9933   3.38     0.31       10.8          1            6         4   

   2      128       8.7              0.3            0.3           -4.5          0.053           48.5                 314           0.9474   2.73       2        10.3          0            8         4   

   0      129       1.2             1.01            0.32          14.75         0.038           -345                 277           0.9907   4.29     -1.02        9          -1            7         1   

   2      131        7              0.21            0.49         -1.481        -0.066            400                 -239          0.9591   3.293   0.6206      10.8          0            8         3   

   1      135       7.9             0.16            1.32           7.4          0.05             109                 152           0.9961   3.12     1.28        3.8          1            8         2   

   2      141       -5.4            0.345           0.27          10.1          0.056            38                  187           0.9949   2.14     0.12       14.4          0            7         3   

   0      147       -3.9            0.74           -0.95          11.7           0.4             293                 185           0.9927   3.28     -2.01      16.4          0            7         1   

   0      148        8              -0.41           0.57          10.4          0.585            176                 134           0.9841   3.12     -0.35      10.7         -1            9         1   

   1      151       6.7             0.14            0.49           1.4         -0.233             6                  -77            1.017   2.92     0.42       10.8          0            7         2   

   0      156       6.4             0.29            0.18            3           0.04             21                  -102          0.9974   4.39     1.42        9.2          1            7         1   

   2      157       6.9             -2.34           1.33          -28.4         0.039            -30                  98            1.013   4.64     0.46        9.2         -1            7         3   

   1      174       5.6             0.12            0.24           4.8         -0.465            24                   72            1.024   3.23     3.32       12.6         -1            6         2   

   0      186       7.9             -0.42           -1.2           1.6          0.582            201                 -205          0.9568    4.2     0.69       11.2          1            9         1   

   0      193       6.8             1.19            0.98           1.2          0.034             6                   68            1.027   3.14     0.37       16.8         -1            7         1   

   1      195       1.2              0.3            0.21         -27.85       -0.01562           33                  153           0.9924   3.96     1.06       11.14         0            8         2   

   0      212       8.4             0.725           0.11           1.9         -0.296            35                   63           0.9965   3.19     2.05        9.6          0            9         1   

   0      213        8               1.2           -0.26          12.6         -0.351            -98                 213           0.9784   3.66     0.56        9.3          0            9         1   

   1      217       6.8             1.36            0.3           20.7          0.043           -263                63.26           1.033   3.17     0.46       24.4          0            7         1   

   1      223       14.3            0.32            0.25          -2.3          0.013            13                  349           0.9957   4.65     -1.19      12.2          0            6         2   

   0      226       6.6             0.82            0.24          23.8          0.048            55                  347           0.9751    3.2     0.38       15.2          0            7         1   

   1      228        -4             0.16            0.27          44.4          0.607            227                  98            1.031   2.24     0.34        7.9          1            6         2   

   2      230       28.3            0.645           0.03          -7.9          0.086            195                  39           0.9969   2.93     -0.53      11.6          0            8         3   

   0      241       4.7             0.98            0.35          24.7          0.235            11                   -9           0.9926   2.19     0.38       12.4          0            9         1   

   1      243       5.8             0.21            0.25          -50.5         0.038            -33                 -135          0.9647   3.28     0.49        9.4          0            7         2   

   0      249       8.9             0.33            -0.5          61.55         0.038           -234                 138           0.9637   3.03     0.09       10.66         0            8         1   

   2      281       10.6            -1.02          -0.61           1.1         -0.422            -25                 107           0.9923   2.45     -0.34      10.2          0            9         3   

   0      288       10.9             1.2            1.22          27.9          0.12             207                  17              1      4.2     -1.31      11.7          0           12         1   

   0      294       8.8              0.2           -0.59          92.4          0.053            167                 214            1.026   3.263    0.79        8.8         -2            9         1   

   0      295       6.3             1.15            0.24          91.4          0.052            36                  135           0.9937   2.52     -1.13      11.08        -2            7         1   

   1      300       6.5             0.62            1.82            8          -0.179           46.48                431           0.9732   2.68     0.47        7.4          2            7         2   

   1      302       9.3             0.31            0.31          59.8          0.379            15                   89           0.9976   2.48     0.57        6.3          1            8         2   

   1      303       0.3             -0.87           -0.8          69.5          0.54             170                  83           0.9887   3.09     -0.44      11.7          0            7         2   

   0      308        6              0.25            0.28          -37.7        -0.468            37                  132           0.9949   4.01     -1.96       9.4         -1            7         1   

   1      319        9              0.35            1.5           51.9          0.252            282                131.7          0.9912   3.35     -0.31      11.63         1            6         2   

   1      320       8.7             0.31            0.27           5.6         -0.331            91                 148.2          0.9693   3.65     0.52       13.3          0            9         2   

   0      324       -0.1            0.32            0.37           1.8         -0.286            13                  -184          0.9945   4.55    0.3083      10.5          0            7         1   

   0      331       6.6             0.24            0.35          -13.7         0.031            36                  135           0.9938   3.24     -1.81      14.5         -1            7         1   

   0      343       7.2             0.21            1.15          25.4          0.043            186                 213           0.9837   3.21      0.5        9.6          0            8         1   

   0      347       7.4             -1.14           0.62            6           0.022            40                  125           0.9928   3.13     2.31        5.2         -1            8         1   

   1      348       10.6            0.34            0.35          10.01        -0.657           -229                 179            0.998   2.87     -2.56       8.3          0            7         2   

   1      350       4.6             0.24           -0.66           1.3          0.043            71                  462           0.9543   3.19     -1.32      14.7          1            8         2   

   0      357       3.9             0.53            1.21            2           0.058            243                 -144           1.016   3.21     -0.86      12.4         -2            8         1   

   1      358        16             0.43            0.34          2.439         0.068           -166                 104            1.025   3.19     2.03        9.3          0            7         2   

   2      360       15.8            0.86            0.38           41           0.625           70.12                132           0.9889   3.28     -0.07      12.4          0            6         3   

   0      366      -14.7            -0.42           0.31          22.3          0.035           -201                  99           0.9891   3.26     -1.28      12.44         1            7         1   

   0      367       13.6            0.56            0.93           10           0.037            38                  379           0.9964   4.53     0.35       15.7         -1            7         1   

   1      368       6.7             0.41            0.15          41.1          0.033            25                  -30           0.9497   3.05     -0.4        0.1          1            7         3   

   0      376       0.5             0.98            0.53           2.1         -0.487            152                 -149           1.019   2.19     -0.8        6.3         -1            9         1   

   0      380       5.8             -0.49           1.78          62.3          0.044           -208                 152           0.9961   3.31     -2.01       9.4          0            6         1   

   0      388       2.8             0.46            0.44           -66          0.052             4                   8             1.053   3.33     1.67        6.9         -2           11         1   

   1      396       12.5            0.43            1.78           3.6         0.00168            7                   45            0.968   3.57     0.79        6.4          1            7         2   

   2      398       7.4             0.18            0.29          52.2         -0.171            260                 366           0.9644   3.54      0.6       10.5          0            8         4   

   1      403       7.1             -0.49            -1           46.7          0.033            16                   78            0.993   2.91    0.2766       5.4          0            8         3   

   0      410        3              -1.52           0.46          29.2          0.05              5                   13           0.9974   4.32     0.79       10.2          0           11         1   

   1      412       8.1             0.24            1.86           11           0.043            41                  586           0.9886   3.104    -1.38       10           2            9         2   

   0      420       17.1            0.41            0.66          -10.4        -0.983            77                  194           0.9976   3.05     0.46        8.7         -1            8         1   

   0      434       7.7             -0.96           1.58           1.4          0.608            15                  102           0.9929   3.26     0.53       10.4         -1            8         1   

   0      440       12.4            0.27            1.42           1.6          0.04             -47                  86            1.014   2.82     -0.22       7.8          0            7         1   

   1      450       0.6             2.09           -0.56          1.05          0.054            225                  16            1.01    2.97     0.63        9.6          0            8         2   

   0      453       6.7             1.21            0.28           29           0.286            21                  105           0.9949   3.27     0.37        8.6          0            8         1   

   2      464       -5.1            0.23            0.36          46.8          0.197            37                  130           0.9519    5.1     0.43       10.1          0            7         4   

   1      465       7.5             -1.17           0.32          19.8          0.036            25                  113           0.9962   2.06    0.3993      9.166         1            8         2   

   2      466       7.3              0.3            0.29           2.1          0.048            -3                  -261          0.9896   5.01     1.36       12.6          0            7         4   

   0      473       6.3             1.24            0.32          -18.9         0.04             155                 -287           1.024   3.24     2.18       11.3         -1            7         1   

   1      476       10.9            -0.98          -0.74           5.9          0.003            35                   88           0.9714   2.88     0.46        8.4          0            7         2   

   1      478       1.7             0.41            0.3            3.2          0.03             49                  357           0.9927   4.44     -0.39      11.7          0            7         2   

   1      479        -4             -1.1            1.35           2.4         -0.808            35                  115           0.9894   3.19     0.44       18.8         -1            8         2   

   0      493       0.2             0.43            0.11           1.1          0.029           -233                  51           0.9307   2.57     0.48       15.5         -1            6         1   

   2      497       15.9            1.05            0.35          10.7          0.551            26                  239           0.9984    3.6    0.4626       9.1         -1            9         3   

   1      503       6.8             0.25            2.5           -2.6          0.547            92                  123           0.9951   3.03     -2.71       8.6          0            7         2   

   1      504       -3.2            1.92            0.42           5.5         -0.334            29                  -636          0.9973   3.42     1.31       10.5          0            8         2   

   1      505       6.8             0.18            0.3           138.2        -0.195            88                  443           0.9981    3.6      0.8        3.6         -2            7         2   

   0      507       17.5            0.34           -1.05           3.7          0.174             6                   12            0.997   3.19      0.7       12.1          1           11         1   

   0      513       7.2             1.74           -0.92          -41.4         0.787            46                  121            1.002   3.44     0.61       10.49         0            7         1   

   0      519       9.5             0.88            1.43           6.4          0.057            25                  -86           0.9753   3.364    0.45       10.5         -1            7         1   

   1      521       12.7            -0.25           0.32          50.1         -0.515           -211                 102           0.9796   3.41     0.79        6.1          0            7         2   

   1      522       6.2             -1.09           1.68            1           0.031            198                  73           0.9903   3.42     0.98        8.7          0            7         2   

   0      545       9.1             0.55            0.45          23.9          0.049           -161                93.38          0.9974   2.11      0.5        6.1          0            7         1   

   1      549       -4.4            -0.05           1.46          -9.7          0.047            46                  144           0.9888   2.31     -1.28      17.9          0            7         2   

   0      551       2.3             -0.03          -1.13           2.1          0.227             8                  -266           1.034   4.09     0.74        9.6          0            8         1   

   2      556       0.5             0.23            0.31          -46.7        -0.286            312                  96           0.9861   2.56    0.3694      15.6          2            7         3   

   2      557       8.4             -0.44           0.56           2.2          0.026            108                 104           0.9678   3.38     -1.43      17.1          1            7         4   

   0      559       6.8             0.56            0.41          -61.8         0.22            79.5                 183           0.9974   2.41     0.78        4.7         -1            7         1   

   0      560       10.9            1.13            0.96           1.1          0.556            286                  84           0.9927   2.58    0.3346      14.4         -1            7         1   

   1      566       6.7             1.62            1.33          7.839         0.639            127                 150           0.9968   3.22     0.51        9.9          0            7         2   

   1      569       7.1             0.32            0.29          43.2          -0.1             20                   31           0.9946   3.27     0.64        7.8          1            8         2   

   0      573       6.6             -1.14           0.86          -7.9          0.169            -55                 -193          0.9973   3.25    0.3997      16.2         -1            7         1   

   1      578       8.3             -0.48           0.1           67.1          0.081            45                  202           0.9983   2.61     0.53        10           0            9         2   

   2      579       -1.7            0.01            0.25          -49.4        -0.319            58                   54           0.9642   3.27    0.4688      15.5          1            8         3   

   2      582       -1.7            2.38            0.24          -44.6         0.122            18                  147           0.9931   3.42     0.62       10.4          1            8         3   

   2      596       7.4             -1.2           -1.02           2.7         -0.355            30                  107           0.9813   3.31    0.3591       9.9          0            8         3   

   0      598       9.2             0.19            0.46            2           0.047            16                   49           0.9952   3.09    0.4882       10          -1           10         1   

   0      599        8              -1.14          -0.73          65.5         -0.034            41                  103            0.99      3      -0.77      16.4         -1            9         1   

   0      602       0.2             0.26            0.26          -40.2         0.036            578                 214           0.9986   4.65      0.5        10           0            8         1   

   1      605       15.5             0.2            1.37           -42          0.015            -82                 -307          0.9849    4.2     0.55       12.05        -1            6         2   

   0      617       4.8             0.75            0.28          -24.8         0.134           -239                 322           0.9692   3.38     0.409      11.3         -1            5         1   

   2      619       8.2             0.22            0.3            1.8          0.432           -173                 185           0.9933   3.08      0.5       14.4          1            9         4   

   0      630       7.3             -1.09           0.26           61           0.09              7                  135           0.9944   3.01     -0.89       5.6          1            8         1   

   1      634       -0.4            0.21            0.41          -38.6         -0.43            14                  543           0.9657   2.96     0.53       13.4          0           10         2   

   0      643        7              0.87            0.4            1.1          0.058            30                   93            1.023   2.23    0.3263       12          -1            8         1   

   0      645       9.4             2.085           0.2            2.4          0.355           -144                 143           0.9729   3.28     0.58        6.8         -1           10         1   

   1      647       3.4             0.42           -0.03           2.4          0.061            19                   74           0.9918   4.46     -0.27      10.9          1            7         2   

   0      649       6.7             0.42            0.46           9.7          0.054            67                  -228           1.006   2.22      0.5         9           1            8         1   

   1      656       7.2             0.31            0.26          11.18         0.05             37                  157           0.9962    2.7     0.01        11           0            8         2   

   2      657       -7.1            0.23            0.56          73.15         0.063           204.5                693            1.004   4.35     2.11        9.3          1           10         3   

   0      658       6.1             -0.23           0.25           6.9         0.02632           -25                  21           0.9955   3.19      0.4       10.09         0            7         1   

   2      667       7.4             -0.43           1.2           43.6          0.037            290                  -7           0.9687   3.25     0.37       10.4         -1            8         3   

   0      692       6.8              0.3            0.95          84.2         -0.409            45                  150           0.9488   3.04    0.4209      11.8          0            7         1   

   2      693       6.6             0.88            -0.9          3.787         0.138            41                  168           0.9567    3.2     1.08        8.7          0            7         3   

   1      698       16.4            1.32           -0.28           41           0.315           -218                 -97           0.9986   2.89      0.5        8.2          1           12         2   

   1      699       7.3             1.44            2.04          12.8         -0.173            73                  253           0.9488   4.19     0.71       13.6          0            8         2   

   2      700       7.1             1.85            0.98          33.3          0.045            88                  587           0.9659   3.16    0.7019       1.4          2            8         4   

   1      704       6.5             0.33            0.3            3.8          0.036            190                  88           0.9442   3.25     2.01       12.5         -1            7         2   

   0      707       7.2             0.92           -0.09          10.4         -0.169           -240                163.8          0.9459   2.96     -2.32      9.614         1            8         1   

   1      708        7              -0.59          -0.62            2           0.364            10                  203           0.9809    3.4     0.47       16.6          1            8         2   

   0      709       6.5             0.46            0.41          16.8          0.084           -110                 233           0.9923   4.41     -0.98      13.8          0            7         1   

   0      713       8.9             1.84            0.51          -45.5         0.052            403                  27            0.995   4.33     0.14        9.9         -1           10         1   

   1      714       6.8             1.285           1.48           8.5         -0.327            10                  -87            1.017   2.67     1.97        9.5         -1            8         2   

   0      716       8.2             1.42            -0.4           1.8          0.047            71                  187            1.039   3.13      0.5       16.8         -1            9         1   

   1      718       6.4             0.31            0.66          18.3         -0.258           -152                 101           0.9934   3.29     0.38         9           0            7         2   

   2      722       19.2            1.84            0.32          -12.4         0.035           -169                 -253          0.9914   2.45      0.6       12.9          0            8         3   

   2      729       22.7            -0.33           2.56          -46.5         0.054            40                  400            1.034   4.73    0.5399      10.8          2            7         3   

   0      731       0.4             1.45            0.71           2.3          0.045            295                 115            1.008   3.17     0.43        8.8          0            9         1   

   1      733       0.5             0.17            0.31          -19.7        -0.129            13                  -233           0.993   2.79     0.37        9.3          0            9         2   

   0      746       17.5            -0.07          -0.14          -36.2         0.317            29                  113           0.9919   3.13      1.2       18.6          0            7         1   

   1      747        8              0.22            0.42          -33.4         0.894            73                  589              1     3.81     0.69        8.6          0            9         2   

   1      748       11.5            -0.6            0.73           -63          0.052            19                  -16           0.9923    3.6    0.6327      11.2         -1            8         2   

   0      753       9.3             1.03            0.26          -33.8        0.09436           -17                 408            1.021   3.29     1.99        9.8         -1            8         1   

   1      757        7              0.21           -0.09           8.5          0.033            31                  177           0.9953   3.22     0.56        2.3         -1            8         2   

   1      763       7.8             0.16            0.25           1.4         -0.286            214                 -42           0.9476   2.82     0.44       11.1         -1            7         2   

   2      767       17.1            0.14            0.76          -35.6         0.625            26                  -284           1.018   3.25     0.45       18.1          1            6         3   

   0      774       2.3             0.53            0.93          35.6         -0.454           -251                 163            1.038   5.76     0.83       10.3          0            7         1   

   1      776       18.1            0.705           0.96           1.8         -0.213            15                   63            0.999     3      1.59        9.5          1            8         2   

   0      788       11.4            1.375           0.04            2           0.087            12                   67           0.9957   3.61     1.61        9.4          0            8         1   

   1      794       6.4             -0.21           3.19           5.3          0.409            57                  -15           0.9953   3.31      1.3        9.8          0            7         2   

   0      799      -15.4            0.52            0.36          35.9          0.138            41                  536           0.9545   3.98     0.38        5.8          0            7         1   

   2      803        16             -0.17          -0.18          -85.6         0.282            18                  156           0.9967   5.03     1.84         9           0            7         3   

   2      806       16.1            0.24            0.29          -61.5        -0.018            17                  117           0.9941   3.36     0.68        6.9          0            8         3   

   1      807        7              0.42            0.19          3.385         0.071            177                 -232          0.9948   3.39     0.56       10.9          0            8         2   

   2      811       6.2             0.25            1.97          -13.5         0.046           -196                 831           0.9945   3.19     0.58        9.3          0            7         3   

   1      816        3              -1.22           1.36          19.3          0.049           -149                161.8           0.96    5.54     1.25        2.5          2            7         3   

   1      818       -0.8            1.18           -0.33          -5.4          0.04             83                   96           0.9912   3.06     0.61       12.1          0            9         2   

   1      819        -7             -0.74           0.33           1.8         -0.298           -232                 -279           1.04    2.66      0.4       11.14        -1            7         2   

   2      831       6.9             -1.17           0.38          104.1         0.039           -266                 -263          0.9943   4.25     0.42       14.3          1            7         3   

   2      835        1              0.23            0.33          7.107         0.049            153                 183            1.049   4.41      0.9        9.8          1            8         3   

   0      837       6.3             0.25            0.44          12.1          0.041            48                  -142          0.9968   3.18     0.52        9.5         -1            7         1   

   2      841       19.7            -0.79           0.36          17.2          0.039           22.79                130           0.9995   4.36     -1.11      12.4          1            7         3   

   0      846       6.3             -0.33          -0.61          4.099         0.048            35                  161            1.008   3.14     0.56       10.6         -1            8         1   

   2      856       6.1             0.23            0.37           7.9          0.02            41.06                150           0.9949   2.86     0.49        5.4          1            7         4   

   1      861        5               0.7           -1.47          14.35         0.552           -216                 -82           0.9988   2.93     -0.63      12.8          1            8         2   

   2      862       5.3             0.38            0.26           3.5          0.035           46.4                 111           0.9424   3.18     0.47       14.1          2            7         4   

   1      863       7.3              1.7            0.07          -0.8         -0.161            25                  369           0.9948   2.66     -0.92       9.1         -1            8         2   

   1      865       6.2             0.25           -2.79          -29.7         0.049           49.63                568           0.9972   3.19     -0.06       9.9          0            7         2   

   0      871        6              0.86            1.81          -23.9         0.038            56                 189.5          0.9964   3.59     0.43       10.6         -1            6         1   

   0      879       7.5             -0.39           0.56           2.7          0.067           -208                  25            1.024   3.24     -1.18      13.6          0            8         1   

   0      880       6.4             0.775           1.24           1.1         -0.244            44                  140            1.005   3.17     -0.34      16.7         -1            7         1   

   1      881       2.8             2.74           -0.21          46.1          0.045            -12                 -157          0.9866   3.45     -0.21      13.2          0            9         2   

   1      885       7.6             -0.46           0.33            2          -0.459            78                  483           0.9795   3.39     0.56        5.9          0            8         2   

   0      887       0.4             -1.11          -1.13          14.3          -0.1             45                 149.1          0.9982   4.08     0.63         4           0            8         1   

   1      892       7.2             1.69           -0.98          -23.1           0               9                  343           0.9972   2.65    0.4037       9.6          1            8         2   

   1      898       10.4            0.15            0.36          60.5         -0.425           -247                 134            1.016   3.28     -0.18       9.8          0            7         2   

   0      900       1.5             0.16            0.27          -41.3         0.496            25                  135           0.9771   4.02     -1.07       8.7         -2            8         1   

   0      904       6.1             0.34            0.46           2.4          0.029            21                  -215           1.024   3.29    0.6334       9.2          0            7         1   

   2      906        4              -0.8            3.41          -4.8         -0.496            146                 136           0.9932    3.3     0.96        9.8          1            8         3   

   1      910        -4             -0.49           0.43           0.9          0.038            149                 729            0.986   3.24     0.46       10.6          0            6         2   

   2      912       7.3             1.24            0.08           25           0.057            145                 -166           1.045   2.54     0.36       10.3          0            9         3   

   0      913       6.8             -1.89           1.3           46.1          0.531            38                  153           0.9785   3.24     -0.22       0.9         -1            7         1   

   2      919       7.7             0.44            -1.1          11.2          0.031            343                 167           0.9788    3.4     0.43       11.3          0            8         4   

   0      924       6.9              0.2            1.88          -22.4        0.1043            78                  167           0.9993   3.32    0.5718      12.8         -1            8         1   

   0      925       11.6            0.585           0.09          61.7         -0.496            14                   86           0.9926   3.64     0.94       11.09         0            6         1   

   1      930       28.9            -1.28           -1.1          13.7          0.056            119                  76           0.9825    2.1     0.44        8.7         -1            8         2   

   0      940       7.4              0.3            0.61          -12.5         0.377           43.95                116           0.9953   4.27     0.59       10.2         -2            7         1   

   0      941       14.7             0.3            0.52           7.5          0.05             467                 191           0.9937   3.17     -1.08       6.9          1            7         1   

   0      946       10.4            1.01            0.5            2.3          0.297            13                   19            0.996    3.1     0.87       11.4          0           11         1   

   2      949       5.8              0.6            0.22           1.3          0.046            18                   66           0.9931   4.87     0.55       10.3          1            7         3   

   0      951       6.1             1.76            -1.1            5           0.042            17                  133            1.029   2.55     -1.13       9.4         -1            7         1   

   1      962       5.8             0.19            0.37           1.1          0.279            31                  451           0.9894   3.53     0.48       11.4          0            6         2   

   0      966       7.4             0.05            0.78          -56.1         0.082            258                  82           0.9807   4.52     1.57       14.7         -1            8         1   

   2      967       4.9             -1.14           1.25           57           -0.38            31                   40           0.9849   3.33     0.44       6.433         0            6         4   

   1      971       6.2             0.45            1.63          13.1          -0.07             3                  -87           0.9566   4.52     0.76         9           1            7         2   

   2      981        8              0.43            1.12          12.4          0.168            29                  190            1.016   2.41      2.3        9.2         -1            9         3   

   1      982       9.4            -0.585           0.68          -16.3        0.08484            3                   10           0.9561   2.21     0.71       17.2         -1           10         2   

   1      983       17.8            0.61             0            -55.8         0.625            168                  8            0.9635   2.54     0.37       10.4          0            7         2   

   1      984       6.1              0.3            0.58          119.3         0.049            258                 187           0.9927   1.99     0.85        9.5          1            7         2   

   1      989       11.6            1.59            0.34           1.6          0.311            33                  176           0.9946   2.55     0.98        9.7         -2           10         2   

   1      990       9.7             -0.18           0.29          14.4         -0.548            54                  -91           0.9991   3.17     1.07        8.9          1            7         2   

   0      992       12.6            -1.04           0.28           4.9          0.042            21                  155           0.9939   3.36     0.57       10.9          0            8         1   

   2      995       7.4             0.18           -0.54           1.5          0.003           -159                 316           0.9614   3.43     0.85       16.8          1            7         3   

   0      996       0.9             0.34            0.57          4.352        -0.157            29                  134           0.9946   4.04      1.1       10.7         -1            7         1   

   0      998       12.6            1.62           -0.46          60.6          0.065             5                  253           0.9646   3.27     3.75       11.2         -1            9         1   

   2     1001       4.6             -2.56           1.41         -61.15         0.045            -86                 131            1.003   4.21       1        11.7         -1            8         4   

   1     1007       6.8             -0.15          -0.24           3.8         -0.254            16                  458           0.9969   3.28     1.93        9.5          0            8         2   

   0     1008       -0.8            0.28            0.29          42.4          0.051           -121                162.5           1.069   3.07     0.99         6          -1            7         1   

   0     1016       5.9             0.51            1.3            1.4          0.141            52                  119           0.9931   4.19     1.73       10.5         -1            6         1   

   0     1022       6.9             0.24            0.39          55.9         -0.087            223                 136           0.9928   2.66    0.3063       15          -1            8         1   

   2     1027       10.4            0.27           -2.71           7.6          1.228            35                  432            1.035   4.62     -0.81      16.1          1            7         3   

   1     1032       9.2             -0.37           0.28          -39.5         0.043            17                  -196           1.015   3.99    0.5173      13.2          1            7         2   

   1     1033        17             1.44            0.83           6.1         -0.602           -445                 -167          0.9905   3.19     2.57       13.7          0            7         2   

   1     1041       11.1            1.43            1.74          -38.5         0.28             -3                  141           0.9962   3.25     0.51        3.3          1            9         3   

   1     1065       5.6             0.64            1.25          48.1          0.043            21                  159           0.9948   3.52    0.5834      18.1         -1            8         2   

   1     1074       -0.1            0.24            0.31           2.8         -0.427           -122                 330            1.018   2.53     -2.37      11.7          0            7         2   

   0     1075       11.8            -0.25          -0.93          -1.1          0.076             5                   17           0.9622   3.36     0.49        3.3          0           10         1   

   1     1081       -1.7            0.44            1.09          12.1          0.056            68                  210           0.9855   4.26     1.19       14.2         -1            8         2   

   2     1094       5.9             2.83            0.36          -38.2         -0.05            213                 805            0.97    3.41     1.25       11.9          0            7         3   

   1     1099       7.3             0.04            0.3           40.2          0.044            15                  144           0.9967   3.49     -0.2        5.8         -1            7         2   

   0     1105       8.3             0.25            0.19          50.2          0.048            154                 654              1     3.03     0.52       9.937         0            9         1   

   1     1123       17.8            1.62           -1.28          -1.4          0.053            31                 696.5          0.9924    2.5     0.72        9.8          1            7         2   

   1     1135       -2.9             2.1            0.28          11.25         0.305            215                  87           0.9922   3.02     0.746      12.4          0            7         2   

   0     1142       10.7            1.33            1.16           -40          0.29             138                  57              1      3.3     0.37        8.8         -1            7         1   

   0     1155       19.7            0.55            0.28           1.7          0.073            21                  165            1.004   2.97     0.82        9.1         -1            8         1   

   0     1169       7.2             -1.26          -1.17          -37.6         0.049             3                   94           0.9506    3.2    0.6125       4.7          0            8         1   

   0     1176        6              -0.5            0.92          27.7          0.042           -198                61.18           1.014   3.322    0.54       10.8          1            7         1   

   1     1178      -16.3            -1.21           1.87           1.7          0.034            41                  193            1.041   3.25     -0.93      10.4          0            7         2   

   1     1180        7              1.63            0.24           1.9          0.04             -11                 144           0.9739   3.35     0.38        5.6          0            8         2   

   0     1184       8.9             0.48            0.53            4           0.101             3                  -370          0.9959   3.74     0.59       12.1          0           10         1   

   0     1185       7.8             0.55            0.25           12           0.454            112                 186           0.9829   3.11     -0.81       9.3         -1            7         1   

   0     1193       10.8            0.54            1.36          35.5         -0.317           -195                  31            1.019   4.19     0.44       10.6          0           10         1   

   1     1196       17.6            1.45           -0.11          -35.1         0.444             2                  151           0.9946   3.06      0.6       16.3         -1            7         2   

   1     1199      -13.8            -0.96           0.28            5           -0.48            14                  491            0.975   2.19     0.36        9.1         -2            7         2   

   1     1203       8.6             0.68            0.18          -60.5         0.088            22                  -328          0.9979   3.29      1.4         5          -1           11         2   

   0     1205       11.5            -0.58           1.49           2.2          0.11             14                  138           0.9932   3.67      0.5        9.1         -1            7         1   

   0     1207       6.7             0.15            1.36         -0.757        -0.507           -208                 -657          0.9946   3.97     -1.31      10.2         -1            7         1   

   0     1208       6.4             0.31           -0.61           2.5          0.039           -494                 192           0.9895   3.22     0.38       12.7          0            7         1   

   0     1212       13.3            0.73            0.43          56.9         0.03632           -20                 269           0.9966   3.15     0.62        11          -2           11         1   

   1     1213       7.3             0.59            0.26           7.2          0.046            35                 105.6           1.017   3.37    0.5191       8.7          0            8         2   

   0     1222       7.3             0.17           -0.85          -22.9        -0.111           -116                 352           0.9951   3.23     -1.11       12          -1            8         1   

   0     1223       6.6             0.21             0              3           0.115            -44                 421           0.9853   3.45     -0.86       5.2          0            7         1   

   2     1226       8.5             0.19            0.49           -36         -0.362           -218                 117           0.9938   3.171    0.51       12.8          0            9         3   

   2     1227       8.3             2.26            -1.2           1.8         -0.427            28                  230           0.9907   2.09     1.96        9.3          2            7         3   

   0     1229       14.5            0.29           -1.09          30.2          -0.37            86                  160           0.9944   3.14     0.47       10.69        -1            8         1   

   2     1230       5.3             -0.71          -0.14          -27.9        -0.513            36                  -215           1.038   3.26     0.33       14.6          0            6         3   

   0     1231       6.3             1.59            0.23           2.9          0.047            127                 365            1.02    3.28     0.48        8.5          0            7         1   

   0     1241        0              2.17            1.43            2           0.083            17                  242           0.9962   4.35     0.08        9.8         -1            8         1   

   2     1243       6.1             0.64            0.27          -50.9         0.048            30                  298            0.995   3.21     0.51        9.9          0            7         3   

   2     1244        7              -0.7            0.23           5.7          0.123           -108                 312           0.9954   3.04     0.54        9.4          1            7         4   

   2     1246       6.9             -1.03           0.28           2.2         -0.378            39                   93           0.9891   3.31     0.43       11.29         0            7         3   

   0     1248       6.8             -0.4            0.01          16.1          0.444            330                 196           0.9862   3.15     -0.58       9.3         -1            7         1   

   1     1249       13.5            -1.09           0.22          -23.4         0.025           -169                 216           0.9522   3.33      0.6        9.6          0            7         2   

   1     1252       8.1             -1.02            0            10.44         0.043            57                  176            1.012   3.86     0.55        6.3          0            9         2   

   0     1261       6.7             -0.8            0.44          24.4          0.048            39                  137           0.9942   3.24     0.35       11.4          1            7         1   

   2     1275        7              0.15            1.05          -23.9         0.051            29                  149            1.029   2.96     0.92         9          -1            7         3   

   0     1281       8.4             0.35            0.24          27.3          0.034            531                 133           0.9906   3.34     -0.87       12           0            7         1   

   2     1285       8.3             0.19            2.04           48           0.037           -152                 180           0.9926   3.06    0.4644       10           0            9         3   

   2     1288       12.8            1.52           -0.16          59.4          0.065            56                 235.5          0.9568   4.48     0.41       12.7          1            8         3   

   1     1290       7.4              0.4           -0.86          10.1          0.112            37                  194           0.9834    3.2     0.63       11.7          0            8         2   

   1     1291       0.1             -0.96           0.31           1.3          0.448            47                   98           0.9891   3.42      0.5       10.1          0            8         2   

   1     1304       7.8             0.57           -0.99           9.9          0.577            108                 181            1.042   3.19     0.04       10.9          1            8         2   

   2     1305       8.6             0.26           -0.66           2.2          0.254             6                  169           0.9903   4.64     0.42       12.9         -2            8         3   

   1     1323       -1.3            0.23            0.35          -12.1         0.174            128                 212            1.011   3.34     1.41        8.9          1            8         2   

   1     1342       6.7             1.74            0.66           8.9         -0.334            75                  111           0.9968   3.25    0.6442       11           0            7         2   

   0     1348       6.5             0.09           -0.99          -32.2        0.09875           -12                 166           0.9849   4.46    0.2228       3.2         -1            7         1   

   1     1353       -4.5            0.03            0.41           1.3          0.044            -25                 171           0.9929   3.28     -0.93      10.3          0            8         2   

   1     1363       7.9             0.705           0.26          29.2          0.057            40                  190           0.9932   2.76     0.39       17.4         -1            8         2   

   1     1371       3.3             -0.39           0.58           8.2          0.359           -252                 -251          0.9928   3.28     1.27       12.2          0            8         2   

   1     1372       7.7             0.22           -1.19          -44.8         0.029            41                   -7            1.021   3.22     0.99       15.5         -1            8         2   

   1     1378       8.3             1.18            0.38           1.1          0.038            249                  75           0.9625   2.06     0.43        9.2          0            9         2   

   2     1381       10.2            1.57            0.64          -22.6         -0.41            251                  41            1.01    3.23     0.66       12.5          0           11         3   

   2     1382       6.8             0.11            0.34          45.9          0.02             38                   66           0.9921    2.8     -0.48       12           0            8         3   

   1     1393       4.8             -0.15          -0.17          -17.1         0.552           -180                 171           0.9971   3.03    0.5891      10.3          1            8         2   

   2     1394       3.8             0.18            1.56          -0.2          0.038            70                  415            1.001   3.32     -0.19      11.2          1            7         3   

   2     1398       13.8            1.16           -0.18          6.558         0.027            -70                 143           0.9469   2.49     1.16        6.9          2            7         3   

   0     1404       17.2            0.17           -1.05         -102.4         0.059           35.07                331           0.9932   4.31     0.46        11           1            8         1   

   1     1405       11.8            0.19            0.34           1.8         -0.248            -22                 -151           1.024   2.87     0.66       11.1          0            8         2   

   0     1419       -3.4            0.29            0.56          11.9          0.103            148                 230            1.02    3.02     -0.8        9.3          0            8         1   

   1     1421       6.4             0.06            0.28          -40.4         0.039            53                  124            1.029    3.2     0.43       12.7         -2            7         2   

   0     1426       14.7            1.45            1.81          55.2          0.354            -57                 400            0.992   3.25     0.15       14.6         -1            8         1   

   1     1431       7.3             -0.32           1.49           -19         -0.122           44.34                185            1.032   3.07     0.62       10.6          0            8         2   

   1     1435       4.2             1.56            0.25          28.5          0.191             8                  120            0.937   4.38    0.6915       9.8         -1            7         2   

   0     1437        5              0.33            0.16          69.7          0.049            10                  -223           1.015   4.74     0.44       10.7          0            5         1   

   1     1438       -3.6            1.53            0.06          35.7         0.07909           165                 852            1.002   3.81      0.5       -1.85         1            7         3   

   0     1442       9.2             0.21           -0.86          28.1         0.1093           -131                 151            1.082   3.04     1.13       10.2         -2           10         1   

   0     1464       6.2             -1.83          -0.02          -0.5          0.036            38                  -22           0.9962   2.73    0.6173       9.4         -1            7         1   

   0     1471       -0.7            1.82            1.81           2.1          0.108            272                  52           0.9742    3.4    0.6298       11           1            8         1   

   1     1473       6.2             1.69           -1.17          138.2         0.05             295                  54           0.9874   3.33     0.46        6.2          1            7         2   

   1     1476       -3.1            0.415           0.32          25.1          0.047            -20                 152            1.023   3.88     0.42       -4.2         -1            6         2   

   0     1478       8.1            -0.235          -1.25          32.3          0.08            -103                 339           0.9777    3.3     -1.18        9          -1            9         1   

   1     1479       5.6             0.26             0             24           0.038            48                  111           0.9445   3.01     0.46       12.4          0            6         2   

   2     1487       11.6            -1.15          -1.24           1.1          0.032            113                 843           0.9921   2.73     0.36       12.5          1            7         3   

   1     1492       7.6             -1.15           1.37           4.3          0.054            297                 105           0.9956   3.12     0.49         6           1            8         2   

   1     1496       6.5             -0.08           0.23           9.4          0.207            112                 381           0.9732   4.37     1.16        9.9         -1            7         2   

   2     1497       -3.1            1.56            0.23         -0.316         0.258            -43                  9            0.9637   4.04     2.12       13.1          1            8         3   

   0     1515       -0.2            -0.63           0.24          17.8          0.643           21.09                124           0.9731    4.3     0.45       10.1          0            6         1   

   0     1519       -1.4            0.43            0.41          -34.3        -0.542            103                 167            1.042   3.16     0.53        8.9          0            8         1   

   1     1522       7.4             0.32            0.55           7.7          0.056           -183                 238           0.9135   2.96     0.58        8.7         -1            8         2   

   0     1526       5.8             0.17            0.34          44.7          0.602            96                  377           0.9823   3.94     1.62       10.2          1            6         1   

   0     1537       5.3             -0.96          -1.06           1.2         -0.979            48                  119            1.042   2.89     2.38       14.1          0            8         1   

   2     1538       6.5             0.24            0.29          4.776        -0.147            -9                  424           0.9681   3.13      0.7       10.1          0            7         3   

   0     1540       17.3            0.33            0.34           1.4          0.056           -161                 528           0.9946   5.01     0.47        5.4         -1           10         1   

   1     1543      -14.5            0.28            0.1           33.5          -0.17            29                  -224          0.9774   3.27    0.6137      10.6          0            8         2   

   1     1548       18.2            -0.67           0.29          3.974         0.05             41                   89           0.9956   1.37     -0.54       9.8         -1            8         2   

   0     1549       16.5            0.18            0.48          -6.9          0.186            64                   -6           0.9945   2.39      0.4        17           0            7         1   

   1     1556        13             1.37            1.14           8.6          0.06             112                 -164          0.9935   3.08     0.26        8.5         -1            8         2   

   0     1564       7.4             -0.87           0.42          59.6         -0.169            48                  280           0.9979   1.98     0.42       13.8          0            8         1   

   1     1570       5.6              0.3           -0.65          -8.3          0.419            -94                 142           0.9878    4.8     -0.07       4.5         -1            6         3   

   0     1577       7.2             0.95            0.18           2.1         -0.413           -171                  31           0.9976   3.66     0.83        9.6         -1            8         1   

   2     1585       6.3             1.28            1.44           6.6         -0.097            203                 356           0.9948    3.1      0.4        8.4          0            7         3   

   1     1590       7.5             0.26            0.59          11.8          0.046            59                  -140           1.033     3      0.46        6.2          1            8         2   

   1     1592       6.5             0.31            0.14          13.5          0.044            34                  -255          0.9797   2.98     1.07       11.7         -1            7         2   

   0     1594       11.9            1.57            1.42          22.5         -0.062            155                 -37           0.9953   3.12     0.55        6.6         -1            8         1   

   2     1596       -4.1            0.37            1.37           1.9          0.024            -64                 106           0.9899   3.45      0.6       12.6          2            7         4   

   2     1598       16.4            0.24            1.93            2           0.041            14                  -102          0.9601   3.04     0.45       11.6          0            6         4   

   0     1603      -16.1            -0.15          -1.47            5           0.33            -183                 526           0.9586   3.171    0.71        3.7          0            6         1   

   0     1607       13.7            -0.46          -1.24         -109.2         0.054             7                  -276          0.9951   2.26     1.06       11.5         -1            8         1   

   2     1612       7.2             -0.53           0.39          30.2          0.053            26                  393           0.9917   3.31     3.55        10           1            8         4   

   1     1627       -0.8            0.26            2.65          -8.1          0.121            322                 119            1.025   2.65     0.61       10.94         1            7         2   

   0     1629       6.5             -0.32          -0.36           3.4         -0.532            34                  186           0.9937   3.14     0.76        10           1            7         1   

   1     1630       6.2             -0.74           1.07            1          -0.289           -232                 148           0.9927   3.207    0.45       14.3         -1            7         2   

   2     1640       16.3            1.09            0.36          6.237         0.031            144                 268            1.038   3.28     2.59       10.68         1            8         4   

   2     1641       4.4              0.3            1.66           1.4          0.032            -1                  161            1.012    2.9     0.42       15.4          0            8         3   

   1     1646       5.5             -0.5            0.03           1.8          0.573            14                   87            1.024   3.69     1.49        14           0            6         2   

   0     1662       10.3            1.26            0.31          8.454        -0.238            245                 -17           0.9982   2.93     0.32       11.5          1            9         1   

   2     1668       11.1            1.39            0.08           4.4          0.373           14.89                 32           0.9965   3.56     1.56       11.8          0            7         3   

   1     1671       9.7             0.69            1.7            40           0.088            -56                  91           0.9968   2.82     0.62       10.1          1           11         2   

   2     1672        -1             0.27            0.42          48.6          0.097            45                  444            1.045   2.13     -0.67      12.3          0            7         3   

   2     1673       24.4            0.27            0.48          -46.8        -0.551            17                  132           0.9914   3.19    0.5266      16.5          1            8         4   

   1     1686       -4.2            -1.19           0.17           1.6         -0.144            -78                 129           0.9763   3.22     0.84       11.4          0            6         2   

   2     1688       6.8             0.75            0.49          44.1          0.142            52                  -225          0.9937   3.49     2.11         9           0            8         3   

   2     1696      -11.6            0.18           -0.88          -16.6         0.047            60                  -142          0.9597   3.93     2.49       10.5         -1            7         3   

   2     1701       1.5             -0.22           1.6          -115.8         0.573            30                   96            1.039   4.18     1.94       13.1          0            7         4   

   1     1707       5.8             -0.53          -1.32          -50.1         0.038            49                  133           0.9641   3.16    0.5293      11.7          0            6         2   

   0     1708       10.3            0.18            0.3            6.4         -0.026            243                 251           0.9956   2.99     0.52        8.6          1            7         1   

   1     1713        6              1.67            1.51          -46.4         0.422            50                   48            1.016    3.3     1.67        8.5          0            6         2   

   2     1715       2.2             -0.31          -1.38            4           0.023           46.72                237            1.008   2.68    0.4217      11.6         -1            7         3   

   0     1717       6.7             1.67           -1.15          49.05         0.041           118.5                216           0.9949   2.27     0.66       15.5          0            7         1   

   1     1721       6.6             0.26            0.29           0.5          -0.42            82                  114           0.9929    1.7     0.38       10.5         -1            7         2   

   0     1724       7.2             0.16           -1.09         -3.663         0.16            42.92                 84           0.9901   3.33     1.61       13.9          0            8         1   

   1     1725       6.6             0.17            1.35          109.7         0.416           -106                 -123          0.9921   3.13     0.45       10.2         -1            7         2   

   1     1730       6.2             0.89            1.92           4.6          0.031            261                  73           0.9903   3.37     0.52       11.3          0            7         2   

   2     1731       6.8             3.17            0.14           6.9          0.118            32                  133           0.9625   3.27     -1.23       7.7          0            7         3   

   0     1734       -0.2            0.33            0.32           4.6          0.041            31                  227            0.983   3.05     0.74       15.1          2            9         1   

   0     1740       6.7             0.27           -1.28          -23.9         0.036            44                  179            1.099   2.88     2.09        9.6          1            7         1   

   0     1748       14.1            0.21            0.28          36.5         -0.535            29                  -132          0.9928    4.9     1.53        11           0            7         1   

   1     1749       17.5            0.47            0.99           2.4          0.074            515                  29           0.9979   3.08     -0.87       9.5          1           10         2   

   2     1750       7.4             0.21            0.3            8.1          0.047            13                  -128           1.031   1.95     0.35       12.1          1            8         4   

   0     1763       0.8             -0.71          -0.49           2.5         -0.512            31                  -137          0.9901     2       0.5       11.3          0            7         1   

   2     1768       3.5              0.2           -0.76          -34.1         0.382            450                 -116          0.9899   4.61     0.16       10.8          0            6         3   

   0     1773      -15.8            0.32            0.41           2.2         0.1014            24                  260           0.9978   2.21     -2.47       9.5         -1            9         1   

   1     1777       2.2             0.13           -0.73          16.1          0.037            13                  101           0.9317   3.17     2.05       17.9          1            7         2   

   0     1778        11             0.48            0.24          -15.7         0.102            13                   35              1     3.08     0.56        10           0           11         1   

   0     1780       11.5            -0.19           0.31          51.9         -0.251            446                 510            0.99    3.06     0.45       11.8          0            7         1   

   1     1782       20.5            1.46           -1.27          -27.2         0.499            12                   7            0.9833   3.16      0.7       13.9          0           10         2   

   1     1784       11.8            0.24            0.41           8.7         -0.115            306                 -271          0.9735   3.22     0.62       12.5          1            7         2   

   1     1786       7.9             0.63            0.99          14.1         -0.756            238                 148            1.029   3.16      0.5       10.09         0            8         2   

   1     1787       11.2            0.255           0.65          -22.7         0.627           -237                 253           0.9931     4     0.4484      10.4          1            7         2   

   1     1792       7.1             1.53            0.4            6.3          0.172            -72                 -188          0.9957   3.28     1.57        12           0            9         2   

   0     1800        6              0.05            0.95           1.8          0.03            27.99                105           0.9895   3.31     -0.16      10.7         -1            6         1   

   1     1801       8.4             -0.43           1.94          14.9          0.032            60                  339            1.02    4.16     0.61        8.6         -1            8         2   

   0     1803       6.9             0.35            0.98          -10.9         0.076            238                 137            1.047   2.94     0.81        11           0            9         1   

   2     1804       6.9             -0.59           0.5           19.25         0.043           -169                 590           0.9995   2.93     1.83        9.1         -1            7         3   

   0     1807       6.3             2.93           -0.91           2.5          0.035            281                 830           0.9468   2.46     0.47       13.3         -1            7         1   

   2     1818       7.5             -0.05           0.47           -36          0.058            26                  111           0.9983   2.56     0.34       10.7          2            8         3   

   0     1821       15.3            0.27            0.19          48.7          0.085            147                 169           0.9506   2.36     2.32        7.2          1            7         1   

   2     1822      -12.4            -1.15           0.22          53.8          0.046            18                   66           0.9657   5.06     -0.51      10.3          0            7         3   

   0     1828       17.2            0.26            0.3             2           0.453            13                  930            1.011   3.61     0.49        15           0            8         1   

   1     1833       14.1            0.67            0.86           61           -0.41           -199                 115           0.9909   4.13     2.14       11.56         0            6         2   

   2     1844       6.2             2.82            0.2            1.6          0.069           -214                 196           0.9899   3.41     0.56        6.4          0            7         3   

   0     1847       5.8             0.26            0.24          65.6          0.044            55                  -67           0.9719   4.11     1.41       10.5          0            6         1   

   0     1850       15.6            0.21            0.28          66.7          0.159            288                 241            0.954   3.25     0.72        8.5         -1            7         1   

   1     1854       7.6             0.22           -0.32           12           0.056            221                 495            1.017   2.99      0.3        9.2          0            8         2   

   2     1858       -1.3             0.5            0.38           7.5          0.81             -10                 -252           1.004   3.87     -0.07       9.1          1            8         3   

   2     1864        7              1.98            0.17          3.925         0.123            15                  -263          0.9951   3.44     1.07       10.55         0            8         3   

   0     1867       8.7             0.38            1.32          27.3          0.272            -81                110.4           1.047   3.17     0.68        9.8          0           14         1   

   0     1876       5.9             0.445           1.23          56.8          0.071           15.24                109           0.9453    3.5     0.36       10.5          0            7         1   

   1     1880       -1.7            1.44            0.34          -38.5        -0.012            445                 428           0.9963   2.43    0.5443       3.2          0            8         3   

   0     1881       8.8             0.55           -1.04          -10.2         0.601           -272                 -135          0.9966    3.3    0.7755       5.5         -1           10         1   

   0     1891       -0.3            -1.03           0.28          9.198        -0.062            191                 158           0.8934   3.17     -0.9        6.8          0            8         1   

   1     1894       10.7             0.4            0.47           2.1          0.125           55.67                 49            0.998   3.03     0.81        9.7          0           12         2   

   1     1895       -0.7            1.41            0.19           5.1         -0.178             6                  114           0.9994   3.25     3.05        6.8          1            7         2   

   2     1901       23.6            0.29           -2.02          14.6          0.528           62.91                386            1.082   3.51     4.01       11.4          1            7         3   

   1     1905       6.9             1.43           -0.27           15          -0.268           -117                 -209          0.9753   3.14     3.22        9.2          1            7         2   

   2     1912       7.9             0.18           -0.66          48.9          0.262            25                  267            0.995   0.95     -0.53       10           2            8         3   

   1     1918        9              0.34           -0.21          12.6          0.359            38                   41           0.9942     4      -1.11      11.7         -1            8         2   

   1     1921       6.8             -0.08           0.24           7.8         -0.514            54                  214           0.9961   3.89     -0.38       7.6          0            7         2   

   1     1923       4.4             0.32           -0.41           7.9          0.413           -146                 109           0.9906   2.91     0.46       14.8         -1            8         2   

   1     1924       16.7            0.28            0.31         -37.45         0.133            48                  161            1.041   2.86     1.65        3.6          1            7         3   

   0     1931       16.5            0.87            0.31           5.2          0.099            36                   77            1.004   3.35    0.6994      12.3         -1            8         1   

   2     1941       6.3            -0.025           0.08           16          -0.285            26                  141           0.9982   3.08      0.5       10.4          0            7         3   

   0     1950       6.4             -0.65           0.44          56.5          0.043            96                  201           0.9523   2.85     0.48        9.5         -2            7         1   

   2     1951      -15.8            0.25            0.3            1.6         -0.001            226                 134            0.993   2.09     0.49       10.1          0            7         3   

   1     1954        5              0.17            1.8           -46.7         0.183           -150                 499            1.041   2.93     0.57       12.8          1            6         2   

   1     1961       6.6             0.895           0.77          27.6          0.068            289                  13           0.9958   2.92     0.58       10.8          0            8         2   

   1     1966       6.5             -1.14           1.79           7.6          0.508            180                 109           0.9502    2.8     0.61        9.7          0            7         2   

   1     1979       5.3             0.36           -0.69         -13.25         0.034            377                 475           0.9952   3.82     -0.78      13.4          0            6         2   

   0     1982        8              -0.76          -1.11           3.1          0.363            509                 -116          0.9583   3.18    0.6314      10.8          0            9         1   

   0     1987       -0.7            0.32            0.26          12.3          0.044            140                 205           0.9961   3.11     1.99        9.9          0            7         1   

   0     1997      -11.6            -0.44            0             2.1          0.132           38.96                -321           0.995   3.02     -0.91      10.7          0            7         1   

   2     2004        11             0.25            0.36           2.1          0.034            30                  189            1.003   3.25     -0.6        6.3          0            8         3   

   2     2011       6.9             0.36            0.35           8.6         -0.131            37                  -315           1.028   3.81     0.32       12.4          0            8         4   

   0     2015        16             -0.45          -0.11          44.5          0.402            -3                  111           0.9601   2.07     0.62        7.6          1            7         1   

   2     2025       8.7             0.26            0.29           2.1          0.033            211                  17           0.9909   3.33     -0.26      16.4          2            8         4   

   1     2033       8.1             -0.87           1.69           1.2         0.02825           49                  -64           0.9809   3.13     0.98        9.7          0            9         2   

   1     2034        2               0.3           -0.19          45.7          0.042            21                  582           0.9917   3.046    0.57       11.4          1            8         2   

   0     2035       6.2             -0.4            0.63           30          0.01884           -29                 362           0.9952   2.64     0.37       10.7          0            7         1   

   0     2036        6              -0.48          -0.96           1.2         -0.354            192                 124           0.9918   3.08     0.46       13.6         -2            6         1   

   0     2053       6.7             0.58            0.62           1.8          0.893            -33                  65            0.974   3.28     0.54        1.9          0            7         1   

   2     2059       11.5            0.54            0.24          10.6          0.124           45.37                132            0.985   2.62      1.7       11.8         -1           13         3   

   1     2060       5.2             0.44            0.02          62.2          0.036            43                  257           0.9938   2.88     0.13       18.7         -1            6         2   

   0     2073       7.3             0.25           -0.04           69          -0.704            35                  200           0.9628   3.04    0.4356       8.9          0            8         1   

   0     2084       6.9             0.91           -0.33          -48.8        -0.067            334                 190            0.996   3.22     0.48        9.4          0            7         1   

   2     2089       8.6             1.84            -0.1          66.5          0.035            49                  804            1.021   0.62     0.34       10.5         -1            6         3   

   1     2092       6.8             0.24            0.95           3.2          0.049           -265                 161           0.9526    3.1     0.69        7.9         -1            7         2   

   2     2109       5.5             0.31           -0.97          -33.3        -0.348            36                  148           0.9928   3.28     0.41       13.3          0            7         4   

   2     2129        10             0.35            1.46         -119.9         0.069           -157                 281           0.9994   3.15     0.43        13           1           11         3   

   2     2134        8              1.55           -0.69          79.9          0.285            13                   18           0.9987   2.83     0.55        9.5          2            9         3   

   1     2135       4.4             0.32            0.39          -54.8        -0.026            31                  559            0.989   2.96     -0.49      15.6          1            5         2   

   0     2148       7.4             0.31           -0.65          -20.8        0.09979           273                 204            1.013   3.55     -0.06      13.2          1            8         1   

   1     2149       11.8            0.58            0.2           19.3          0.642            34                   44           0.9949    3.1    0.7101       9.3          1            8         2   

   0     2150       7.6             -0.22           0.28          27.9          0.398            29                  451            1.044   2.86     -0.03       4.2         -1            8         1   

   0     2165       7.1             0.86            0.35          -97.8         0.046            60                  590            0.999   3.16     0.59        9.1          0            8         1   

   0     2166       1.5             0.18            0.74          66.6          1.071           68.47                528            1.012   3.89     0.67       12.4          0            8         1   

   2     2168       6.6             0.78           -0.35          14.4         -0.0388           264                 183            1.034   3.02      0.5        2.9          0            7         4   

   0     2170       8.4             -0.65           0.42          58.8          0.554             7                   77           0.9932   2.48     0.45       11.7         -2            9         1   

   0     2171       6.7             0.24            0.33          12.3          0.046            -53                 -177          0.9983   2.93      0.4        9.5         -1            7         1   

   0     2172        -2             0.33            0.36          -40.4         0.034            19                  -219           0.986   3.65     0.98       12.7          1            9         1   

   2     2176       6.3              0.4           -0.38          -3.1         -0.342           -112                 220           0.9575    3.8     0.55       11.3          1            7         3   

   1     2182       5.8             -0.18           0.66            2           0.039           -185                  88            1.028   4.03     0.93       11.5         -1            7         2   

   0     2189       7.9             0.37            0.31          0.35          0.042            36                  -246           1.006   3.49     0.36        12          -1            9         1   

   1     2191       0.3             0.26           -1.23           2.6        -0.01483           112                 -79           0.9902   3.46     0.38       11.5          1            6         2   

   0     2197       5.9             0.22            0.27          11.5          0.312            81                  157           0.9928   3.05     2.24       14.9          0            7         1   

   2     2202        8              1.08            0.1           -47.7        -0.139            284                  68           0.9839   2.43     -0.28      17.1          1            9         3   

   1     2203       8.2             -0.08           0.44          -27.1         0.089            358                 -247          0.9975   3.53     0.61       10.5          0            9         2   

   0     2204       11.9             0.4            1.7           2.15          0.068            44                  411           0.9988   3.72     0.68        6.8         -1           13         1   

   1     2206       5.8             1.34            0.32          6.06          0.037            111                 119            1.001   3.78     1.82       10.2          1            6         2   

   0     2218       6.2             1.69            0.65          44.6          0.102            32                  284           0.9666   3.87     0.71        9.8          0           11         1   

   1     2219       11.4            1.37            0.32          15.6          0.249           -200                  90            1.012   3.37     0.92        11           0            7         2   

   0     2221       6.8             -0.7           -0.13          11.3          0.017            16                   61           0.9605   4.57      0.6        9.3          0            8         1   

   0     2226       1.6             0.69            0.41           2.3          0.079            24                   37           0.9951   2.33     -0.24      14.9          0            8         1   

   1     2228       5.1             0.41            0.33          73.8          0.043           37.23                152           0.9697    3.2     1.75        9.4         -1            8         2   

   1     2232       13.9             0.7            0.38           1.2          0.029            73                  132           0.9397     4     0.3263       7.3          0            6         2   

   1     2236       9.4             1.55            1.86          -21.5         0.494           -339                 445              1     3.28     2.75        4.1          0           12         2   

   0     2241       6.2            -1.815            0             2.1          0.06              6                   60           0.9968   4.41     0.35        10          -1            7         1   

   2     2245       7.1             0.29           -0.25           1.2         -0.442            183                 406           0.9893   3.24     -1.02      11.8          1            8         3   

   2     2251       3.8             -1.11           1.26          21.7         -0.308           58.01                 90           0.9944   2.76     0.42       10.5         -1            9         3   

   2     2255        7              0.55            0.22         0.6935         0.154            88                  801            1.012   3.66     0.49       16.7          1            7         3   

   1     2256       6.7             0.23            -1.2           9.3          0.172            63                  -112          0.9937   2.48     0.96       12.9          0            7         2   

   2     2259       6.4             1.41            -0.7           9.1          0.044            35                  -129           1.007   1.83     1.78        11           0            7         3   

   1     2263       7.2             -0.49           0.32          8.622         0.022           -120                 116           0.9922   3.04     0.67        5.3          0            8         2   

   1     2264       4.2             0.39            0.35          2.867         0.044            251                 421           0.9941   3.17    0.5621      10.17         0            8         2   

   1     2267        7              1.09            1.31           2.1         -0.451            15                   31            0.993    3.2     3.31       14.7          0            8         2   

   0     2273       7.8             0.59            0.18           2.3          0.097           -238                 131           0.9975   3.43     1.66        10          -1            9         1   

   1     2277       6.9             1.11           -1.08          14.2          -0.2             40                   94            1.018   3.47     -1.22       9.6          1            7         2   

   2     2287       2.6             -0.67          -0.53           1.6          0.333             9                  458           0.9967   3.07     0.95       11.2          0           11         3   

   1     2289        5              0.255           1.46           2.7         -0.483            46                  153           0.9924   2.96     0.76       10.4         -1            5         2   

   1     2291       7.9             0.03           -0.91           4.9          -0.01            31                  519           0.9966   2.85     0.51        9.7         -1            9         2   

   0     2296       8.9             1.23            0.26          30.2          0.041            -90                 187           0.9953   4.18     0.61        9.5         -1           10         1   

   0     2299        6              0.14           -0.75          5.683       -0.00957           138                 168           0.9919   2.45     0.44       11.39        -1            7         1   

   1     2306       3.8             1.13            1.38           9.6          0.027           -102                 243           0.9528   3.99     -0.85      13.1         -1            7         2   

   2     2314       -3.7            -0.48           0.38          -15.4         0.324           -444                  4            0.9966    3.4     -1.15      15.9          1            9         3   

   0     2317       3.7             1.32            0.38          0.95          0.033            89                  159           0.9753   3.34     0.42         8          -1            5         1   

   2     2318        -4             1.58            -1.1           6.3          0.051            26                  229            0.994   3.36     0.87        6.3          0            8         3   

   2     2321       1.9             -0.47           0.61           7.9          0.536            53                  -128          0.9769   2.57     1.67        9.6          0            7         3   

   1     2324       7.2             1.59            0.24          42.8        -0.03961           19                  -114          0.9918   3.14     0.59       12.8          1            8         2   

   1     2340       6.4             0.26           -0.06           7.1          0.04             35                  509           0.9494   3.39     3.83        3.3         -1            7         2   

   1     2343       8.1             -0.51           2.12          -86.7         0.055            58                 146.8          0.9968   2.46      0.8       13.4         -2            8         2   

   0     2349       2.1             -0.82           1.07          51.6         -0.418            31                   12            0.996   3.52     0.47       12.7         -1            9         1   

   2     2352        7               0.3            0.49          4.577         -0.19            -18                  49           0.9655   3.23     -0.45      12.4          1            8         3   

   0     2353       6.2              0.6           -1.04           0.7          0.051           -254                 111           0.9916   3.37     2.85        11          -1            7         1   

   0     2365       0.6             -1.88           0.33           2.7         -0.247            195                 121            1.025   3.22     0.68        10           0           11         1   

   1     2370      -15.8            0.18            0.34          63.3          0.066           -139                164.6          0.9788   2.81      1.8       11.8          0            8         2   

   1     2378       5.8               1             0.2            2.6          0.027           39.96                123           0.9615   3.36     0.78       13.9         -1            6         2   

   0     2390       8.9             1.18            0.91           4.6          0.032            -13                 -212          0.9946   3.15     -0.28      11.5         -1           10         1   

   1     2399       25.8            -0.49          -0.96          44.8         -0.751            13                  289           0.9623    4.4     0.84        4.9          1            8         3   

   1     2402       11.1            0.13            0.92           -26          0.474            -46                 172           0.9938   3.23     0.39        7.4          0            8         2   

   1     2403       6.9             0.41           -0.93           9.9          0.079            54                  -278          0.9668   3.47     0.55       12.9          1            8         2   

   2     2404       6.8             0.26           -0.34          34.7          0.06             42                  162            0.997   2.11     -1.19      13.2          0            7         3   

   2     2414       6.3             0.17            0.32          54.2          0.43             267                  92            1.064   3.24     0.43       15.4          1            7         3   

   1     2422        14             0.13            1.33         -39.65         0.315            36                  105            0.96    4.08     0.55        8.5          0            8         2   

   1     2424       8.4             0.75            1.96          11.8          0.646            51                  170            1.061   5.35     0.82        7.4          1            9         2   

   1     2430       6.5             -0.05           0.61          -44.2        -0.258            31                  123           0.9971   3.41     -2.94      9.857         0            7         2   

   1     2435       2.2             0.32            0.28          -22.7         0.034            -15                 100           0.9903   3.08     0.47        8.4         -1            7         2   

   0     2439       2.2             1.02            1.42          34.7         0.03355           41                  294           0.9961   3.33     0.48       15.9          0            6         1   

   1     2442       -3.4            0.19            1.35          54.2         -0.202            85                  -207           1.032   2.99     0.59       21.8          1            8         2   

   1     2445       6.1             -0.48           0.25          -21.4         0.526            24                  115           0.9921   3.39     2.34       12.1          0            7         2   

   2     2449       3.1             -0.9            0.04           1.7         -0.251            219                 241           0.9942   3.96     1.81       15.7          1            6         3   

   0     2451       -1.6            0.61            0.01            2          -0.176            13                   38            1.04    2.18     0.65        8.2          0            8         1   

   0     2461       15.5            0.84           -1.96          -23.1        -0.369            16                   65            0.997   3.57     0.72       15.95         1            8         1   

   1     2464       6.7             -0.58           1.15          10.6          0.035            42                  523           0.9931   3.08    0.8624       9.8          0            7         2   

   1     2465       6.7             0.47            0.5           61.5          0.052            24                  -166          0.9053     2      -1.02       8.5          0            7         2   

   1     2472       -4.4            0.22            0.31           2.3          -0.49            -28                 -40            1.033   3.267    -0.76      14.1         -1            8         2   

   0     2476       -0.3             0.6           -0.51          70.8          0.047             4                  224            1.005   2.45     2.23        8.9         -1            7         1   

   0     2482       -0.2            -0.54          -0.91          -51.7        -0.004            198                 191            0.993    2.8     1.02        9.5          0            7         1   

   2     2487       6.7             0.18           -0.52          -54.5        -0.459            42                  -227          0.9957   3.08     -0.35       9.8          1            7         3   

   1     2498       6.5             0.82            0.3          -40.65         0.051            -10                 -260           1.027   3.24     -1.13      12.15         1            7         2   

   1     2501       6.6             0.29           -0.34            9           0.553           33.41                253           0.9634    2.9     0.45        8.9          0            7         2   

   0     2504       4.2             2.49           -1.01          -33.5         0.029            53                  160           0.9852   3.03     0.46        7.3          0            8         1   

   0     2511       9.8             -0.66           0.49          -25.4         0.088            15                  -205          0.9947   3.42     1.84       16.8          0           11         1   

   1     2518       12.7            0.23            1.38          -8.1          0.592           -235                 151           0.9444   3.18      0.4        5.4          1            7         3   

   2     2521       8.2             -0.8            0.42          2.749        -0.335            117                103.2          0.9624   3.43     1.34        13           1            7         3   

   1     2530       16.7            1.47            0.31          53.8          0.036            45                  342           0.9922   4.17     1.15        14          -1            8         2   

   1     2543       6.3             0.23            0.49          8.486         0.145            67                  210           0.9703   2.16     1.06       11.3          1            7         2   

   1     2545       7.6              1.1            0.6           -57.7         0.368            23                  381            1.04    3.38     -0.98      10.5          1            9         2   

   2     2561       5.8             0.18            1.87          27.4         0.00902           222                 418           0.9887   2.96     0.34       12.1         -1            6         3   

   1     2566       7.4             1.59            0.24          -38.2         0.31             255                150.2          0.9953   3.13     0.51        12           0            8         2   

   0     2572       14.3            1.48            0.26          -14.9         0.127            -40                 255           0.9951   3.72     0.37       12.9          0            7         1   

   0     2577       6.8             0.19            2.1            50           0.038            124                 164           0.9849   3.12     0.48        4.9          1            8         1   

   1     2578       0.4             0.69            1.49          60.3          0.069            35                  182           0.9939   3.11     0.46       12.73         0            6         2   

   0     2580       8.4             2.41            0.4           -40.9         0.067           -214                  20            0.996   4.22     -0.29      10.5          1            9         1   

   2     2581       11.8             0.2            0.31           3.6          0.036            22                  183           0.9599   3.41      0.5        9.8          0            6         3   

   1     2582       0.8             0.44            0.36          -25.7         0.116           -112                 178           0.9976   3.01     0.48       13.4          1            8         2   

   0     2584       7.3             0.18           -1.25          13.5          0.055            -45                 197              1     4.01    0.4199      14.4          0            8         1   

   2     2590       3.1             0.27            0.32           4.5         -0.231            29                  178            1.008   3.45     -0.42      12.1          0            6         3   

   1     2598        4              -0.61           0.3           27.1          1.201            18                  275           0.9266   3.88     1.94        9.6         -1            8         2   

   0     2602       6.2             -0.97           0.29           2.1         -0.225            123                  98            1.068    4.3    0.6649       9.8          0            7         1   

   2     2605       1.2             -1.22          -0.61          -16.1         0.052            38                  231            0.998   2.82     1.53       10.33         1            8         3   

   1     2616       13.8            0.36            0.38           -27          0.028            107                 318           0.9927   2.74     0.43       12.1          0            7         2   

   1     2618       7.2             0.35           -1.26           28           1.145            -16                  75            1.019    3.4     3.41        9.5          0            8         2   

   0     2619       6.3            -0.015           0.22          2.144        -0.109            26                  141           0.9982   2.88      0.5        10          -1            7         1   

   1     2624       9.6             1.65            1.94          -26.2        -0.241            -11                 156            1.04    3.25     0.36        4.1          1            7         3   

   1     2632       6.5             -0.88          -0.43           1.5          0.062            44                  -51           0.9928   2.66     0.44       13.3          0            7         2   

   1     2640      -10.1            0.26            0.21          57.9         -0.142            237                 125            0.997   3.06     0.73       10.7          0            7         2   

   2     2646       6.7             -0.78           0.29           5.3          0.586            31                  122           0.9895   3.44     0.79       16.5          0            7         3   

   2     2651       7.2             -2.07          -0.97           1.4          0.316             5                 85.69          0.9662   4.26     0.12        7.3          1            8         3   

   1     2660       9.1              0.3            0.74           19           0.265            293                 -188          0.9945   3.21     0.46        9.9          0            8         2   

   2     2661       7.1             -0.33           1.47          -6.4          0.129           -135                  87           0.9821   3.26     0.81       25.6         -1            8         3   

   1     2668       15.4            1.87            1.61           2.7          0.119            304                  80            1.004   3.03     0.37       11.3         -2            7         2   

   2     2670       -1.3            0.21           -0.38          35.4         -0.358            49                  115            1.043   4.13     1.26       -0.2          1            7         4   

   0     2680       18.8            0.31           -0.27           1.6          0.021           -138                  67           0.9924   3.08     0.25       10.5          1            9         1   

   1     2681       28.6            -1.17          -0.49          -49.4         0.029            168                 474           0.9585   2.34     0.42       12.9         -1            6         2   

   1     2689       6.5             -0.81          -1.02          6.682         0.053            119                 176            1.01     3.4     0.553       7.2          0            9         2   

   1     2694       10.9            1.37            0.26          13.2          0.046            57                  553           0.9869   3.17     0.41        14           2            7         2   

   0     2695       10.5            1.52           -0.35          11.9          -0.4             244                 145            1.08      4     0.6441       8.4          0            7         1   

   0     2696       6.2             0.34            0.28           7.5         0.03524           40                  197           0.9949   3.04      0.6        9.7          0            7         1   

   0     2702       11.5            0.75            0.13           6.3          0.467            19                   46           0.9521   2.84     0.25       11.1          0            8         1   

   1     2704       17.3            -0.53          -0.65           -20          0.36             30                  -261          0.9917   1.97     0.39       11.4          0            9         2   

   2     2708       7.8             0.41            0.73          -7.1          0.24             25                   56            1.045   2.08     1.67       10.5          1           10         4   

   0     2709       9.5             -0.62           0.34           6.7          0.621            21                  162            1.035   3.67     1.56       10.6          1           10         1   

   2     2714       8.1             0.91            0.62          -26.6         0.034            30                  177           0.9909   2.44    0.5011      11.07         0            8         3   

   1     2716       15.9            1.69            2.14           7.5          0.558            22                   71           0.8974   2.32    0.7564       8.8          1           17         2   

   0     2723        7              0.58            1.41          -41.3         0.091            35                  -112          0.9956    3.7     0.48        8.8          0            8         1   

   1     2725       5.4             -1.17           2.32            3           0.052           51.14                -123           0.993   3.71     0.75        5.4         -1            6         2   

   2     2738       13.8             0.9           -0.81          20.7          0.093            94                 132.5          0.9543   3.73     1.88        12           2           15         3   

   1     2750       14.9            0.32            0.2            1.1         -0.166            155                  8            0.9928   3.24     1.24       11.3          0            7         2   

   1     2756       11.8            -1.09           0.53          -49.5         0.051           -158                 247            1.011     3       1.1       12.1          0            7         2   

   2     2758       1.9             0.27           -0.77          -10.7         0.05             41                  143            0.99    3.063    1.77       12.4          0            9         3   

   0     2766       7.3             0.175          -0.56           2.5         -0.491            165                 184           0.9966   3.36    0.1641       11           0            8         1   

   2     2767       1.4             -0.95          -0.93          -7.2          0.104            10                   22           0.9612   3.39     0.68       10.6          1            9         3   

   1     2771       6.4             1.65             1            56.9          0.046            53                  149            1.024   3.21     0.89       10.8         -2            7         2   

   1     2775       7.9             0.17            0.32          -61.1         0.053            68                  138            1.04    2.93     1.86        9.6          0            8         2   

   1     2776       8.2             -0.51          -0.26           53           0.062           35.76                 80           0.9897    3.1     0.53         7          -1            9         2   

   0     2779       5.8             0.42            0.31          -19.9         0.052            55                  230           0.9949   4.12     0.46        9.8          0            6         1   

   0     2780       16.1            -0.45           0.87          -25.7         0.053            51                  202           0.9955   3.24     -0.03       1.2          0            7         1   

   2     2781       15.9            -0.9            1.2            2.4          0.086           -100                 439           0.9585    3.4     0.53       10.1          0            8         3   

   2     2782       5.7              0.7            0.32           8.2          0.043            28                  -50           0.9411   3.31     -0.5       12.6          0            6         3   

   1     2783       6.9             0.17            0.54          67.1          0.064           -153                 -198           0.999   3.29     0.37        9.3          0            7         2   

   1     2796       17.2             0.2            0.49           30          -0.473           -236                 421            1.038   3.26     -0.68      18.4          0            9         2   

   1     2798       9.2             1.55            0.27           0.9          0.185           -150                  61           0.9977   3.59     -0.88       6.3          2           10         2   

   0     2800       -0.6           -0.385           0.36          32.5          0.414           -117                 120           0.9931   2.02     0.518      14.1          1            8         1   

   2     2803       6.3             0.21            0.58          -50.3         0.081            34                   -1            1.022   3.16     -1.15      11.25         2            7         4   

   2     2806        4              -0.58           0.4            -59          0.034           -137                150.3          0.9914   3.21     1.21       12.1          1            6         3   

   1     2813       -1.8            -0.4            0.43           11           0.155            225                 132           0.9907    1.9     -0.91       8.8         -1            8         2   

   0     2818       2.6             0.21            0.31          -69.3         -0.46            -95                  61           0.9461   4.48     1.29        12          -1            6         1   

   2     2821       1.5             0.45            0.27           0.8         -0.286           -115                 335           0.9838   2.21     -0.37      11.82         1            7         3   

   2     2825        6              0.28            0.38           1.3          0.111            37                  104           0.9887    3.2     -0.86      12.3          0            7         3   

   0     2829       3.9             0.33            1.24          -28.8         0.567           -157                 200           0.9671   2.17     -2.86       2.6         -1           10         1   

   0     2830       6.7             0.18           -1.23          10.2          0.039            17                  296           0.9573   3.11     0.53        4.6          0            7         1   

   1     2833       7.8             0.21            1.47          -45.6         0.039            181                 140           0.9959   2.32     0.31        4.2          0            8         3   

   1     2839       7.2             0.57            0.06          44.4          0.082            -55                129.4          0.9972   3.36     -0.59      21.6         -1            8         1   

   2     2843       7.6             1.64            1.05           1.4         -0.195            41                  142           0.9934   3.88     0.53       10.1          0            8         4   

   1     2846       7.3            -0.475           0.2           10.2          0.631            296                 212            1.012   2.96     0.58        9.2          1            8         2   

   0     2847       7.2             0.16            0.05          5.399         0.037            164                 104           0.9924   3.23     1.73       16.2          1            8         1   

   2     2848       18.1           -0.215           0.4           9.037         -0.49            301                 154              1     3.35    0.6588      14.5          1            8         4   

   0     2856       8.5             0.12            0.26           4.3          0.038            284                  97           0.9948   2.38    0.5772       9.2          1            6         1   

   1     2863       7.1             1.32            0.95          -4.6          0.621           -185                 -37            1.073    3.1     0.49       14.2          1            8         2   

   2     2867       -3.3            0.22            1.56          1.669         0.052           -288                 373            0.991   3.96     0.35         8           1            8         3   

   1     2869       7.2             -0.69           0.27           5.8          0.243            46                  149            1.004    2.6     0.59        9.3          0            8         2   

   2     2873       7.5             0.81           -0.31            2          -0.333            201                  39           0.9895   3.36     1.58       13.6          0            6         3   

   1     2874        7              -0.52           0.41          18.75         0.042           -227                 157            1.03    2.49      0.5       10.87         0            8         2   

   1     2875       7.5             0.27            1.77          -23.6        -0.141            180                 -127           0.924   2.04     -1.15      11.9         -1            8         2   

   0     2880       5.8             1.55            0.4            1.2          0.076            47                  -113           1.015   3.13     0.45       10.3         -1            6         1   

   2     2886       6.7             0.24           -2.27         -25.45         0.432            350                 -101          0.9919    4.3     0.59        8.3         -1            7         3   

   1     2887       21.1            0.52           -0.55          -48.5         0.055            -71                55.95           1.022   3.27      0.5         8           0            8         2   

   1     2888       11.3            -0.96          -0.49          -8.8          0.084             7                  250           0.9983   3.08     -0.13      14.7          0           12         2   

   0     2889       7.5             0.28            1.46           1.6          0.071            33                   -6           0.9985   3.19     2.11       10.2         -1            7         1   

   2     2890       5.6             0.18           -0.48          -6.1          0.549            -68                  47           0.9472   3.94     -0.23      14.7          1            6         3   

   0     2892       -4.2            0.27            0.33          -3.1          0.042            224                 183           0.9921    4.1     -0.84      10.7         -1            7         1   

   0     2901       7.2             0.69            0.72           1.2         -0.514            32                  180           0.9898   2.04    0.2672      10.5          1            8         1   

   0     2902       1.9             1.68            0.08          61.2          0.374            28                   46           0.9988   3.32     1.68        9.7          0           11         1   

   0     2905       8.2             0.345          -0.37          18.2         -0.344           -104                 205           0.9997   1.72     -0.62       6.2         -1           10         1   

   0     2917        10             0.49            0.2            11          -0.277            13                   50            1.002   3.16    0.5819      14.5          0           11         1   

   0     2922       -4.2            0.68            0.87         -2.833         0.078            256                  39            1.04    3.26     2.24        9.9          0            8         1   

   0     2924       1.1             1.43            0.56          71.2         -0.471            -95                 412           0.9802   3.14     0.46        8.7          2            8         1   

   2     2930       7.7             0.66            0.04          -26.9         0.039             4                  709           0.9962   0.83     0.47        9.4          2            8         3   

   2     2931       11.3            1.44            1.38           3.5          0.039            29                  191           0.9908   3.34     0.52       16.1          1            8         3   

   0     2946       5.6             0.245           0.32           1.1          0.197            242                 -12            1.031   4.11      1.2        6.5         -1            6         1   

   1     2955       6.5             -1.15          -0.68           8.5          0.047           -105                 210           0.9962   2.82     -1.19       8.9          0            7         2   

   1     2962        7              0.38            0.45          13.65        -0.162           -136                 460            1.036     3     0.4479       2.6         -1            8         2   

   0     2964       2.9             0.57            0.08           2.6          0.089            14                   27            1.038   4.01     1.53       10.4          0            8         1   

   0     2965       8.5             0.46            0.89           1.4         -0.056            246                  45            0.997   3.03     1.35       15.6          0           10         1   

   1     2967       6.9             -0.17           0.66          -25.6         0.063           -143                 -136          0.9957   3.54     0.02         8           2            8         2   

   2     2970       7.4             0.12            0.22           1.4          0.467            16                  -146           1.038   3.98     0.77       23.6          1            8         4   

   2     2973       2.8             -0.25           0.59           12           0.053            55                  177           0.9614   3.52     0.44        9.9          2            7         3   

   1     2974       7.4             0.19            0.31          -7.9          0.045            39                  421            1.038    3.1      0.5       13.4         -1            8         2   

   0     2976       6.6              0.5           -0.39           9.2         -0.516            240                  92           0.9921   3.07     0.35       11.7          0            7         1   

   0     2977       -1.9             0.3            0.38          61.7          0.046            -96                 235           0.9955    3.2     -0.06       2.8          0            7         1   

   1     2978       8.8             0.41            0.64          -81.1         0.281           87.33                 9            0.9661   2.39     0.78       15.5          0           10         2   

   2     2986       6.1              0.1            1.31           2.1          0.031            50                  416           0.9517   3.39     0.72       18.6          0            7         3   

   2     2988       6.7             0.22           -0.35           1.2          0.394           -313                  86            1.001    3.1     0.33       16.6          1            7         3   

   1     2989       6.8             0.31           -0.09          -20.9         0.052            35                  143           0.9959   3.14    0.6282        9           1            7         2   

   1     2995       5.4            -2.265          -0.55          43.5          0.292            36                  110           0.9944   3.26     0.41        9.5          0            6         2   

   2     3005       7.8             1.76            1.01          -90.5         0.033            37                  427            0.994   1.14     0.35        6.4          1            9         3   

   2     3011        22             -1.15           1.41          10.5          0.043            49                  228           0.9974   3.83     -0.84      10.4          1           10         3   

   0     3013       6.4             -0.5           -0.48          -38.6         0.152            23                  480           0.9814   4.29     0.56       12.4          0            7         1   

   1     3019       -4.6            0.23           -0.23          67.3          0.044           52.26                -54           0.9983   3.22     0.62        6.6          0            8         2   

   0     3021       6.8             -0.33          -1.25          21.9          0.052            583                 127           0.9933   3.04     0.54        8.9         -2            7         1   

   2     3022       6.4             0.18            0.33            4           0.186            98                  -16            0.943   3.06      0.4        9.3          1            7         3   

   0     3029       0.8             0.25           -0.62           2.5          0.541             5                  210            1.011   3.52     0.94        5.6         -1            8         1   

   1     3037       7.7             0.26            0.3          -2.752         0.287            20                   38           0.9258   3.29     1.61        7.6          0            8         2   

   0     3042       4.4             0.45            0.07          11.16         0.331            10                  123            1.007   2.97     -0.68      10.8         -1            7         1   

   1     3043       16.1            0.125           0.07          54.6          0.044            361                  68           0.9901    2.1      0.5       12.4          0            7         2   

   1     3049       -4.5            0.21           -1.15          121.2         0.046            237                 216           0.9837   3.25      1.9       17.5          0            8         2   

   2     3050       16.6            -0.17           1.18           2.6          0.238            12                   60            1.025   4.05     -0.39        9           1            6         4   

   0     3053       6.2             1.47            0.28          67.3          -0.54           -218                 111           0.9469    3.5     -0.16      10.2         -1            8         1   

   0     3058       3.3             1.75            0.35            2           0.059            19                  552           0.9944   4.42     -1.19       9.9          0            8         1   

   1     3062       7.3             0.29            0.3            13          -0.309            52                  312           0.9986   3.06     0.41        8.7          1            8         2   

   2     3063       1.4             0.27            0.58          75.6          0.036            44                  476           0.9686   3.06    0.4218       8.9          0            9         3   

   2     3065       8.7             0.15           -0.78          -27.1         0.364            -84                 456           0.9905   2.05    0.5238      17.4          1            7         3   

   0     3080       6.3             0.39            0.32           5.9         -0.479           352.5                260           0.9768   3.12     -0.99      10.1         -1            7         1   

   2     3088       7.4             0.16            0.49           1.2         0.01136           164                 -72            1.011   4.23    0.4994      12.5          1            8         3   

   0     3093       9.4             1.045           0.35           -7          -0.296            226                  95           0.9882   3.44     0.46       17.3         -1            7         1   

   2     3096      -14.5            -0.16          -1.24          -1.3         -0.678            13                 143.2          0.9904   3.79     -0.82      15.6          1            7         3   

   2     3101       7.1             0.29            0.34           7.8         -0.886            49                  128            1.016   4.39      0.4       10.7          1            8         4   

   1     3103       4.4             0.45            3.19           1.3         -0.107            152                  79           0.9937    4.4     0.38       11.6         -2            7         2   

   2     3107       11.8            0.78            0.74           2.8          0.088            74                  410           0.9928   3.51     0.93       18.4          2            8         3   

   2     3109        8              0.58            0.08           1.9          0.059            20                   31            0.973   2.24     0.64       10.2          0            6         3   

   2     3111       3.9             0.38            0.36            3           0.081            119                 770           0.9638   3.04     -0.42      14.7          1            9         4   

   1     3113       2.9             1.09            2.02          10.51         0.039            151                 397           0.9906   3.08     0.38        6.5          1            7         2   

   2     3116       9.2             0.42           -0.78          2.209         0.04             535                 172            1.042   2.98     0.67        12           1            9         3   

   0     3132       9.3             0.13            0.25          15.18        -0.291            262                 314            1.028   3.05    0.2961      10.4          0            7         1   

   1     3141       6.8             0.27            0.36            7           0.043            74                  207           0.9876   2.56     0.49        3.8          1            7         3   

   1     3153       10.4            1.65           -1.09           2.8          0.44            40.41                420           0.9962   2.51     0.49        10           0            8         2   

   0     3154       7.5             0.33            0.48          81.55        -0.237            55                  -129           1.001     2      1.56        15           0            8         1   

   2     3160       6.8             0.68            1.46           1.4         -0.154            38                  108            0.97    2.07     0.98        12           0            7         3   

   1     3167       6.5              0.3           -1.07          129.7         0.029            35                  138           0.9911   2.64      0.6        5.7          1            7         3   

   1     3170       5.9             0.42             0            44.7          0.048             4                   0            0.9543   3.71     0.74       19.5         -1            5         2   

   0     3173       7.6             -1.27           1.87          28.5          0.033            26                  146           0.9908   2.98     0.49       14.7         -1            8         1   

   1     3174       -2.7            0.25            0.27          -51.2        -0.075            222                 141           0.9959   1.95      0.5        9.8          0            6         2   

   2     3177       13.6            0.27            0.32          5.552         0.435            18                   93           0.9904   3.11     2.07       12.25         1            7         3   

   2     3179       3.9             -0.59          -0.82           3.2         0.0072            15                  126            1.033   1.82     0.51        6.7          0           10         3   

   0     3184       7.8              0.6            0.82          52.8          0.08             14                   3             1.048    2.6     0.52        9.9         -1            9         1   

   0     3190       -1.1            -0.98           0.37           1.7         0.07974           31                  243           0.9769     4     0.2472      11.8          0            9         1   

   2     3193       16.1            -1.52           1.54           2.4         -0.281           25.57                100           0.9913   3.08     0.28       11.19         0            8         3   

   2     3199       5.8             0.26            0.3            9.3          0.172            35                  531           0.9958   4.31     -1.21      10.55         0            8         3   

   1     3201       8.1             -0.71          -0.87          15.1          0.081            12                 125.2          0.8968   3.53     0.23        9.6          0            9         2   

   0     3202        5              0.24            0.48          -39.2         0.039            48                  236            1.013   3.69     0.62       13.3         -1            5         1   

   0     3203       9.1             1.51            0.24          17.6          0.113            279                 117           0.9928   3.16     0.05       13.4          1            8         1   

   1     3206       13.9            0.27            0.6           -54.2         -0.81            36                 129.4          0.9705   2.26     0.55        11          -1            8         2   

   1     3209        6              1.72           -1.14          -27.7        -0.399            36                  174            1.036   3.14      0.5         9          -1            7         2   

   0     3210        12              0.6            0.08           2.6          0.592             3                  -237           1.032   1.99     -0.05       7.8          0            9         1   

   2     3217       12.9            -0.84           0.43          43.6          0.057            32                  181            0.986   3.41     0.51       10.5          0            7         3   

   2     3220       12.5            1.21            1.77          -52.9         0.593            47                  -94            1.045   4.32    0.3843      13.4          0            7         3   

   0     3228       5.9             1.36            0.28           1.9         -1.083           34.52                 78           0.9918   2.52     -0.47      12.91        -1            6         1   

   0     3232       27.9            -0.3           -0.69          -12.1        -0.102           -199                 276            1.027    3.1     0.76       10.27         0            7         1   

   0     3239       -12             0.635          -1.59           1.8          0.97             183                 218           0.9732   2.39    0.4139       9.3          0           10         1   

   1     3243       7.2              0.5           -1.04           0.8          0.555            132                 -52           0.9932    4.7     -0.48      14.3          0            8         2   

   0     3245        3              -0.26           0.52          47.1          0.219            312                 382           0.9755   3.08     0.56        8.7          0            8         1   

   1     3246       11.8            0.24            0.33          21.1          0.613            45                  101            1.018    3.8    0.6313      11.7          1            9         2   

   2     3251       7.3             -0.18           0.41          14.6          0.048            73                  223           0.9986   4.01     0.71        9.4          0            8         4   

   2     3253       6.2             1.02           -0.01          2.57          0.417            39                  -224          0.9931   2.66     1.91       10.8          0            7         4   

   2     3257       7.9             0.29            0.16          -31.8        -0.507            -23                 177           0.9971   3.13    0.3351      10.6          0           10         3   

   1     3260       10.7            -0.12          -0.68         -46.95         0.456            -50                 276            1.019   1.83     0.32         8           0            9         2   

   1     3261       0.4             0.22            2.13          26.9          0.042            301                 168            1.02    2.47     0.36       20.5          1            7         1   

   2     3263       6.6             1.06           -0.36          -3.3          0.042            249                 101           0.9919   4.08     0.41       10.5          1            7         3   

   1     3278        14             0.17            0.76          -47.5        -0.213            -77                 122           0.9011   2.26     0.52        8.5          0            7         2   

   0     3281       6.4            -1.645          -1.07           3.3         -0.208           -338                 547           0.9948   3.42     -0.35      13.7          0            6         1   

   2     3283       7.1             0.38            0.71           3.5         -0.031            38                  -489          0.9887   4.18     0.47       12.2          1            7         3   

   0     3290       3.5             -0.43           0.49           1.3          1.176            27                  372           0.9936   2.49     -1.01      10.2         -1            9         1   

   1     3297        9              1.48            1.84          23.8         -0.287            20                  -256           1.026   3.16     -0.04       7.1          0            8         2   

   2     3304       12.5             0.4            1.08           2.1          0.339            15                  230            0.998    2.2     0.81        9.7          0           12         3   

   1     3305        14             0.42            0.27            2           0.142            252                  55            1.034   3.78     0.64       12.3         -1            6         2   

   1     3307       7.5             1.46            1.64           5.8          0.564            23                  401            1.031   3.18     0.59       10.5          2            8         2   

   0     3308       7.3             0.42           -1.35           2.7          0.084           -219                 -250          0.9805   3.21     -0.73       6.5          1            8         1   

   0     3313       19.3            0.52            1.7            2.3         -0.338             8                   38           0.9853    4.6     0.61       10.01         1            8         1   

   0     3314       10.4            -1.16           0.14          51.4          0.06             12                  113           0.9934   3.32     0.34         5           0            7         1   

   2     3317       7.5             2.34            2.11          125.5        -0.363            31                  159           0.9656   4.56     0.44        7.8          2            9         3   

   2     3348        8              -0.81          -0.89            2           0.108            133                 -341          0.9973   3.222    0.61        10           1            9         3   

   0     3350       -2.9            0.05            0.32           4.6          0.041           -220                 370           0.9918   3.04     0.03       13.7         -1            9         1   

   1     3359       4.9            -1.365           0.34            1           0.068            32                  143           0.9605   3.24     -0.06      16.7          0            6         2   

   2     3367       13.4            0.14           -0.07         -0.6915        0.362            83                  -103           1.015   4.27     0.55        8.5          0           10         3   

   0     3376       10.8            -0.68           0.37          23.5          0.073            79                  200            1.034   3.29     -0.88      11.9          0            7         1   

   2     3378       7.9             0.58           -1.55          17.4          0.442            23                   94           0.9969   3.49     0.58        9.5         -1            9         3   

   0     3384       6.5             1.69           -0.68          15.3          0.038           -110                 107            1.009   3.32     0.41       11.6          0            7         1   

   0     3386       7.3             0.56             0            -55.8         -0.46             6                  185           0.9948   3.59     -0.45      13.3          0            7         1   

   1     3387       5.4             -0.18            0             1.2          0.041           -167                 152            1.027   3.09    0.5989      12.5          0            6         2   

   1     3388       6.9              0.3            0.49          3.068         0.057            25                  156            1.039   4.61     0.63       12.9         -1            8         2   

   1     3390       6.6             1.57            0.25          -50.5         0.038           -237                 121            1.018   0.93     0.71       12.6          1            7         2   

   0     3391       6.2             0.39            0.09          4.189         0.393            15                   26            1.042   3.57     0.63        8.2          0            7         1   

   0     3396        11             1.18            0.44           2.2         -0.092            247                  24              1     1.84     1.72        9.2         -1           16         1   

   1     3398       5.9             0.36            0.04          -18.1         0.046            187                  87           0.9934   3.22     0.51        5.7          0            6         2   

   2     3404       6.4            -0.425           0.12           1.1          0.035            269                 491           0.9609    4.1     0.09       13.6          0            7         4   

   2     3406       4.1             0.29            0.41          10.8          0.048            22                  348           0.9844    1.9     0.71       13.17         1            7         3   

   0     3407        6              -0.36           0.15          2.993         0.551           -143                 403           0.9957   3.05     1.67        9.1          1            6         1   

   1     3414       8.8             -0.29          -0.79          10.8          0.285            415                  56            1.037   2.56     -0.65       5.2          1           10         3   

   1     3419       6.7             0.15            0.79           7.9          0.059            284                  81           0.9951   4.05     -0.17       5.1         -1            7         2   

   0     3423       6.8             0.27           -1.21          58.2          -0.11           41.92               162.8           1.048   3.15     1.91        7.8         -1            7         1   

   0     3427       8.1             0.245           0.33           1.1          0.049           -346                 318            1.017   3.13     0.42       13.2          0            6         1   

   1     3432       11.8            0.33           -0.55           3.4          0.093            54                  325           0.9751   2.96     0.76       10.7          0           13         2   

   0     3434       6.4             0.18            0.32          31.5          -0.33            24                   30           0.9963   3.35     2.85        9.4          0            7         1   

   0     3438       14.8            0.59           -2.33         -3.232         -0.47             3                   16           0.9962   3.42     0.92       17.2          0            9         1   

   0     3442       9.1             1.465            0            11.3          0.093            269                 -222          0.9853   3.36     0.92        3.6          0           10         1   

   0     3443       6.6             0.62            0.2            -10          0.046            -53                 -84            1.018   3.17     -0.95       9.3          0            7         1   

   0     3448       4.4             0.84            0.54           2.2          0.587            278                 377           0.9984   3.08     -0.74       9.3          0           12         1   

   1     3456       17.4            0.85            0.33           1.9          0.857            37                  190           0.9895   3.26     0.58        9.7         -1            6         2   

   2     3464        7              0.29           -0.54           1.6         -0.882           -182                 -235           1.021   3.26     0.47       13.6          1            8         4   

   0     3470       -1.1            1.08            0.02          -61.2         0.049           -273                 -26            1.061   3.05     0.63       9.95          0            7         1   

   1     3475       7.7             0.28            0.33           2.4          0.053            -25                 175            0.992    3.2     -2.43       7.9          0            8         2   

   2     3477       7.2             -0.13          -1.28          43.9         -0.504            80                 190.3          0.9619   3.13     -0.21      25.2         -1            8         3   

   0     3490       18.6            1.59           -0.76          -57.1        -1.124            34                  299           0.9964   3.36    0.5262       10           0            8         1   

   1     3493       11.2            -1.22          -1.07           2.4          0.042            30                  382            0.994   3.43     0.61       10.5          0            8         2   

   1     3502       6.8             0.22           -1.27          10.6          0.07             161                 188           0.9965   2.87    0.5746        6          -1            7         2   

   2     3508       6.6             0.26            3.21           -54         0.08365           18                   21            1.013   1.84     -0.98       7.5          0            7         3   

   0     3516       28.1            0.18            0.81          -39.4        0.06538           17                  149            1.046     3      -0.14      15.8         -1            7         1   

   2     3517       8.9             0.205           0.13          3.45         0.1162            41                  152            1.037   3.97     0.52       13.8          1           10         3   

   0     3525       -1.3            -2.12          -0.88          -4.1          0.066           80.31                207           0.9837   2.91     0.52        9.8          0            7         1   

   1     3532       28.6            0.655           0.88          92.5          0.511            15                  113           0.9862   3.17     -0.92       9.8          0            9         2   

   1     3535       -0.9            0.56            3.15           3.1          0.428            28                  157            0.994   3.13    0.5055      12.1          0            7         2   

   1     3536       13.5            0.39            0.2            1.2          0.041            35                  532           0.9922   1.99     -1.32       11           1            7         2   

   1     3540       6.8             1.09           -1.06          -12.5         0.404            225                 172           0.9774   3.29     0.55       11.6         -1            7         2   

   0     3547       -5.7            0.21            0.26          -35.4         0.061            -34                 198           0.9992   3.11     1.59       9.286         0            7         1   

   2     3550       7.1             -0.1            0.41           3.1          0.018            15                   37            0.99    3.02     0.86       11.9         -1            8         3   

   0     3557       7.1             -0.99          -0.35          59.6          0.215           -213                 -68            1.028   3.88    0.5575      11.1         -1            8         1   

   0     3562       13.8            -0.16           0.17          31.9          0.065            236                  24            1.007   4.49     0.68       11.05        -1            8         1   

   1     3563       7.7             0.28            0.29           4.3         -0.192            190                 392           0.9939   2.06     1.31       10.2         -1            8         2   

   0     3564       2.2             0.55           -0.04          -8.3          0.323            306                 201           0.9925   2.38     1.93       11.4         -1            8         1   

   0     3570        6              -0.65           0.05          -24.5         0.066            344                  17            1.032   3.52     1.04        4.3          1            7         1   

   0     3573       8.5             1.48            0.74          -22.9        0.1268            603                 -180          0.9928   3.39    0.6407      11.2          1            9         1   

   0     3577       8.7             -0.43           0.42          -14.4         0.053            27                  114           0.9712   4.16     -0.14       10           1            9         1   

   2     3579        7              0.44           -0.08          -25.6        -0.917            -68                 -78            1.026   3.13    0.4343       9.8         -1            8         3   

   0     3581       13.5            0.49           -0.07           2.6          0.068             4                   53           0.9513    3.3     0.47        -3          -1            8         1   

   1     3587       6.9             0.87            0.79          -110          0.402           -338                  78           0.9898   3.12     0.31       12.5          0            8         2   

   2     3602        6              0.58            1.96          -8.9         -0.126            29                  200           0.9912   1.86     0.71       12.3         -1            7         3   

   1     3609       5.6             -0.25           1.66          -23.7         0.022            163                 -134           1.043   3.29     1.06       12.2          0            9         2   

   1     3612       0.5             0.57            1.62            2           0.104            471                 953           0.9963   2.09     1.26       10.1          1           11         2   

   0     3621       7.4             1.34            1.71           3.7          0.399            544                  73           0.9915   3.06     0.45       11.4          1            8         1   

   1     3642        0              1.47           -1.04           3.8         -0.201           57.12               180.8           0.992   3.05     -1.22      11.2          1            6         2   

   0     3647       2.3             0.32            0.14          45.2          0.21             83                  180           0.9961   1.89     0.47        8.8          0            8         1   

   0     3649       6.4             0.24            1.09           5.8          0.621           21.23                120           0.9942   2.82     0.98       10.5          0            7         1   

   0     3654       2.6             0.29           -0.38           2.2          0.05             216                 -344           1.003   3.47    0.6598      10.3          0           10         1   

   1     3660       6.6             0.24            -0.4          15.8          0.035            326                 110            1.038   3.24     -0.47      9.726         1            7         2   

   2     3665       5.9             1.18            0.79           2.4          0.03            -175                 -245           1.032   4.45    0.4432      19.6          0            6         3   

   1     3669       12.7            1.23           -0.15           9.5          -0.56            15                  130            1.094    3.1     0.44        7.6          0            8         2   

   1     3673       8.2             0.37            0.25          -55.5        -0.286            196                  84           0.9909   3.85     0.28       11.7          0            7         2   

   1     3675        16              0.5            1.34           4.1          0.036            193                 131           0.9902    3.7     -0.87       6.3          0            7         2   

   1     3678       -7.9            0.21           -2.25          19.9          0.057            168                 327           0.9774   3.89     0.59       12.3          0            8         2   

   0     3680       6.2             -0.37          -1.39           2.2         -0.673            19                  -96           0.9946   2.91      0.9        9.4          1            7         1   

   2     3686       7.6             0.08           -0.47          -33.1        -0.026             7                   70           0.9966   3.36     0.99        9.4          2            9         3   

   1     3693       5.9             -0.29           0.23          36.1          0.035            20                  -297          0.9768   3.14     1.37        16           1            7         2   

   0     3710       -0.4            0.22           -0.44         -100.4         0.222            29                   93           0.9927   4.07     1.66        8.3          0            8         1   

   2     3713       8.6             0.45            0.5           44.9         -0.381            24                   31           0.9886   2.94     0.38       13.4          0            8         3   

   2     3718       -8.5            0.22            0.33            2          -0.272            -30                 126           0.9546   3.313    0.55       11.4          1            8         3   

   1     3725       9.5             0.32            1.19           2.7          0.018            109                 516           0.9907   3.67      2.5       11.7         -1            6         2   

   0     3726       7.7             0.39            0.34           4.7          0.056            331                 119           0.9787   3.12     1.57       10.2          1            8         1   

   0     3747       13.9            0.23            0.84          24.4          0.037            181                 141            1.047   3.09     0.32       13.7          0           10         1   

   1     3753       0.1             0.31            0.36           4.8         -0.535            245                 142           0.9925   3.01     -0.6        15           0            9         2   

   2     3754       5.8             0.34            0.37           1.8          0.383            70                  170           0.9903   3.38     1.59       11.8          0            6         4   

   2     3760       -8.1            -1.02           0.25          59.8         -1.125            21                  124           0.9936   3.06     0.38        9.9          0            7         4   

   0     3763       6.1             1.32            0.3            1.2         -0.422            36                  -81            0.991   4.24     0.56       16.8         -1            7         1   

   2     3765       7.2             0.58            0.27           5.8          0.032            40                  -88            1.011   3.17     0.53       12.8          0            8         3   

   2     3769        17              0.2            1.27           1.4          0.045            21                  318           0.9836   3.257    0.46        10           0            8         4   

   1     3771       7.1             0.28           -0.56          37.2          0.84             48                  184            1.041    3.9     -0.18       9.4          0            8         2   

   0     3784       3.1             0.42            0.21         -102.8         0.092            33                  -762          0.9982   4.19     2.21        4.9          1            9         1   

   1     3787        0              -0.35           0.73           4.1          0.074            27                   85           0.9971   5.42    0.5865       3.7          1            8         2   

   1     3794       7.2             0.24            1.83          13.9         -0.496            52                  106           0.9927   3.69     0.77       10.8          0            8         2   

   1     3796       14.7            0.26            0.4            1.1          0.042             9                   60           0.9769   2.34     2.25        7.6          0            8         2   

   1     3798       18.5             1.1            0.24          31.6          0.484            56                  171           0.9496   4.21     -0.52       9.8          1            7         2   

   1     3809       1.1             0.665           0.04          56.8          0.031            48                   71            1.008   3.94     0.32       15.9          0            7         2   

   2     3812        7              -0.97           2.37           8.7          0.045           -351                 222            1.029   4.13     0.54       10.7          1            7         3   

   0     3819       6.9              0.3           -0.63          -52.8         0.048            10                  147           0.9906   3.04     0.46       11.6         -2            8         1   

   2     3828       6.8             0.19            -0.3          2.261        0.03074          -221                 -291          0.9933   3.12     0.44       10.7          0            7         3   

   2     3831       6.4             0.32            0.26          131.6        -0.404            53                  -36            1.017   2.49      0.5        16           1            7         3   

   0     3833       7.5             -0.9            0.23          27.2          0.054            28                  278            1.025   3.18     -1.33       6.6          1            8         1   

   2     3837       6.1              0.9           -1.76          60.1          0.046            39                  151           0.9984   2.87     2.04       10.6          1            7         3   

   0     3839       5.2             0.325           0.16            2          -0.961            13                   49           0.9962   3.38     0.57        9.7         -1            9         1   

   1     3843       4.2             0.215           0.23           96          -0.293            83                  112           0.9969   3.46     0.09        5.1          0            5         2   

   1     3846       12.8            0.92            1.39           4.2          0.627           -128                 -141           0.989   2.81    0.5345      13.1          0            7         2   

   2     3854       -0.8            0.43            0.47          -18.3         0.068            171                 -213          0.9665     3      0.45       10.9          1            8         3   

   0     3861       14.2            0.58            0.01          -35.2        -0.003            -87                  18           0.9957   4.29     0.41       10.5          0            8         1   

   1     3864       7.7             0.23            0.08           2.5          0.428            14                   46           0.9681    2.9     0.66       10.6          0            8         2   

   0     3868       21.4            0.26            1.37           2.6          0.384           -375                 129           0.9902    3.2     0.72       11.5          0            6         1   

   2     3869        7              -1.01           0.52          -60.3        -0.003            -7                   60           0.9918   3.07     0.64        6.8          1            8         3   

   0     3870       17.1             0.1            0.23          7.529        -0.448           -229                 271           0.9192   3.92     -0.96      11.8          0            8         1   

   0     3883        16             -0.27           0.05            9          -0.437            136                 113           0.9919   2.61     1.45       16.7         -1            7         1   

   0     3886       7.6             0.18            0.49          11.05         0.334            36                  335           0.9996   3.06     0.33       14.5          0            8         1   

   1     3889       6.3             1.75            0.2           35.2         -0.506            48                 148.4           1.01    3.17     0.51       11.7          0            7         2   

   0     3894       6.3             0.42            0.25           6.5          -0.32           -420                 329           0.9969   2.55     -0.82      10.6         -1           10         1   

   0     3907       -4.1            0.59            1.1            15           0.091             9                   14           0.9949   4.64     1.68        9.9          0            8         1   

   1     3910      -10.3            1.46            0.25            8          -0.296            265                 177           0.9961   3.22     -0.71       15           0            7         2   

   0     3913       6.1              0.6            3.11          59.3          0.071            14                   45           0.9778   3.482    2.98        11           0            7         1   

   0     3914       11.5            0.37            0.19          10.56         0.068            93                  474           0.9934   3.03     -1.29      10.88         0            7         1   

   1     3921       8.3             0.14            0.25           0.7          0.039            216                  89           0.9919   2.51     0.43       10.4          2            5         2   

   1     3923        6              1.68           -1.44           2.6          0.037            134                 389           0.9938   3.44     0.49        3.5          1            9         2   

   1     3929       7.3             -0.85           0.33         -12.65        -0.474          -202.5                195              1     3.06     0.44        9.1         -2            8         2   

   0     3931       -1.5            0.16           -0.78           6.7          0.395            54                  775           0.9559   3.146      2         6.4         -2            6         1   

   2     3932       6.1             0.11            0.16           1.3          0.209           -124                 126           0.9935   2.25     2.03        8.3          1            7         3   

   0     3937       14.1            0.37            0.41           2.3         -0.627           11.46                285            1.012   3.42      0.8       13.7          0           12         1   

   0     3943       10.3            0.28            0.1           22.7          0.042            14                  -373          0.9922   3.34     1.78       16.7          1           10         1   

   1     3956       3.3             0.33            1.52          17.9          0.066            328                 161           0.9959     3      0.51        8.8          1            7         2   

   0     3957       5.9             0.54           -0.88           0.8          0.032            12                  -141           1.079   3.45     0.36        8.8          0            6         1   

   2     3961       6.3             -1.04           0.24          53.1          0.039            25                  107           0.9951   3.38     0.89       10.2          1            7         4   

   0     3971       15.6            0.21           -2.89          13.1          0.198            28                  -118          0.9743   3.39     0.91        3.8          1            7         1   

   1     4004       21.1            -1.21           1.56          18.4         -0.394           -358                 509            1.062   3.86     1.87       -1.3         -1           10         2   

   0     4005       7.1             0.31           -0.29          11.2         -0.298           -183                 -129          0.9966    4.1      0.6       9.889         1            8         1   

   2     4006       6.3             0.32           -0.32          -54.9         0.112            12                  -158          0.9389    3.3     1.81       13.2          0            7         3   

   0     4011       1.5             0.12            0.69           54           0.038            122                 170           0.9916   3.25     2.15       13.7         -1            6         1   

   2     4013       18.1            0.02            1.49          2.74          1.01             12                  -49            1.005   3.08     0.46         8           1            8         3   

   2     4014       -4.7            1.15            0.29          2.25         -0.385             8                  210           0.9937   3.19     0.62       16.2          2            7         3   

   0     4016        10             0.69           -0.61          1.039         0.084            26                   24            0.969   2.88     1.16       15.8         -1           11         1   

   1     4017       -5.5             0.2            0.3            -39          0.046            38                  356           0.9695   3.34      0.5         5           1            6         3   

   0     4020       5.6             0.19            0.87          35.3          0.033             4                  261            0.969   2.97    0.4272      11.2          0            6         1   

   1     4022        6              0.32            0.44           33           0.557            267                 189              1     5.77     -0.43      12.1          0            7         2   

   0     4026       8.7             0.69            0.31          -61.1         0.478            23                  114            1.029   3.71     0.74       13.3          0           10         1   

   0     4032        2              0.47            1.31           8.9          0.18             199                 172            1.016   3.22     1.46       10.56        -1            8         1   

   0     4043       11.8            0.42           -0.69          134.2         0.503            42                  215           0.9971   3.47     2.31        4.7         -1            8         1   

   0     4045       10.5            1.19            0.96           8.2          0.055            162                 -219          0.9954   3.23     0.48        9.5          1            7         1   

   2     4048        6              -1.27           1.64           9.1         -0.223            35                  127           0.9933   2.97      0.3        10           1            7         3   

   2     4051       18.6             0.2            0.44          -50.3        -0.216            -35                 130           0.9469   3.11    0.6794       10           1            8         3   

   1     4052       -9.8            0.15           -1.16          13.65         0.048            257                 204           0.9978     3       0.6        7.1          0            8         2   

   1     4056       27.8            1.04             0            2.126        -0.128            34                  -323          0.9976   3.62     0.68        9.6         -1            8         2   

   0     4059       10.6            1.025           0.43           2.8          0.618            101                 -238          0.9784   3.06     1.46        6.3          0           12         1   

   2     4069       7.7             0.18            0.35           5.8          0.055           25.61                -184          0.9958   3.24     0.54        9.7          1            8         3   

   1     4074       5.9             0.37            1.01          10.9          0.033           -198                 507           0.9811   3.36     0.56        12           0            7         2   

   0     4076       6.1             1.04            0.28           4.5          0.48             46                  150            1.019   3.43     1.06        8.1          0            7         1   

   0     4077       -3.6            0.25            0.23          16.8          0.047            20                   77            1.027   3.32    0.9614       6.3         -1            6         1   

   0     4079       10.6            0.94            1.75           2.3         0.05422            6                   20           0.9968   3.14     0.72       17.8          0           12         1   

   1     4081       17.2            0.21            0.27          18.15        -0.321            91                  158           0.9303   3.29    0.4409       6.8          0            7         2   

   1     4088       6.8             0.24            0.33          9.095         0.049            68                  216           0.9932    3.1     1.91        7.7          0            7         2   

   0     4105       1.9             0.26           -0.25          13.6          0.05            -189                 278           0.9921   2.14    0.4812      15.3          1            8         1   

   1     4125       -3.3            0.72            0.3            4.7          0.041            40                  148           0.9932   3.16      1.6       10.2          0            7         2   

   1     4134       6.5             0.22            0.4           -15.3        -0.371            -19                 -514           1.045   3.72     0.49       10.6         -1            7         2   

   0     4139       8.9             1.63            0.5           39.9          0.067            25                   57           0.9956   3.24     1.36       10.48         0           10         1   

   0     4146       7.2             0.32            0.4           10.8          0.038            45                  -173           1.027    3.2     0.83       10.63        -1            8         1   

   1     4149       6.8             0.48           -0.16           3.4          0.035           53.09                477           0.9706   2.39     0.47         1           0            7         3   

   2     4151       -0.3            2.66            0.5            2.7          0.122             4                  194            1.001   4.03      0.7        19           1           12         3   

   0     4155       6.8             1.05            0.41          19.9        -0.01015           59                  143           0.9969    3.2      0.4       11.8          0            7         1   

   0     4157        9              0.26            0.34           6.7          0.029            311                 -47            0.995   2.71      0.5        10           1           10         1   

   2     4168       6.5             0.37            0.38          71.6          0.027            65                  237           0.9893   3.24    0.6434      10.1          1            7         3   

   0     4170       8.7             1.165           0.49           13          -0.305            44                  214           0.9684   3.71      0.5        9.7         -1            8         1   

   0     4174       5.5             0.66            0.22          67.9          -0.22            10                  -112           1.028   3.46     0.44        5.9         -1            6         1   

   2     4179        6              0.27           -0.92           3.6          0.035            167                 133           0.9921    3.6     1.76       10.8          1            7         3   

   1     4185       16.2            -0.85           0.77          14.2         -0.726           -163                212.5           0.999   3.14     3.73        3.6          0            8         3   

   0     4199       10.3            -2.52           0.47           1.3          0.039            241                 123           0.9959    2.9     0.64        3.1         -1           10         1   

   2     4205       6.4             0.69           -0.53         -58.35         0.055             7                   12           0.9916   3.47     0.53       12.9          0            7         3   

   0     4208       -0.3            -0.37           1.32          20.15         0.06             30                   22           0.9732   1.32    0.2941       10           1            8         1   

   1     4211       6.5             1.43            0.25          -27.1         0.238            15                  110            1.019   3.15     0.42        9.2         -2            7         2   

   0     4212       11.6            0.41            0.54          39.7          0.057            22                   -2           0.9601   3.32     0.76        6.9         -1           13         1   

   0     4215       2.9             0.21           -1.29          7.319         0.047            60                  189            1.003   2.84     0.98       10.1          0            6         1   

   1     4217      -13.9            0.33            0.3           29.7         0.03464           35                  147            1.013   3.24     0.56       13.4         -1            7         2   

   2     4219       6.7             0.17           -0.09          -36.5         0.032            39                  423           0.9934   2.73     0.52       10.5          0            7         3   

   2     4226       8.9             0.66            1.04            5           0.04             18                  -374           1.017   3.06     0.48       10.6          0            8         3   

   1     4227       6.5             0.18            0.41          14.2          0.039           17.71                129           0.8947   3.28    0.4445      10.3         -1            7         2   

   0     4229       7.7             0.91            0.45          -42.7        -0.505            52                  205            1.017   2.62     -2.93      11.3         -1            7         1   

   0     4231       14.3            1.24            0.58          -60.1        -0.075            160                 238           0.9978   4.06     -0.79       11           0           11         1   

   1     4233        6              0.26            2.05           2.2          0.048           -155                 171           0.8898   2.52     0.61        4.2         -1            7         2   

   0     4237       0.2             0.41           -0.54          34.9          0.597            19                  -710           1.012   3.25     0.881      10.4          0            8         1   

   1     4243        13             0.26           -0.61           4.6          0.027            29                   92           0.9909   3.15     -0.19       9.5          1            8         2   

   2     4248       15.7            0.31            0.34          61.8          0.037            45                  463            1.01    3.95     -1.19      13.2          0            7         3   

   2     4255       2.2              0.9           -0.75          52.5         -0.521            33                   67           0.9892   3.21     -0.17      17.9          1            7         3   

   0     4262       4.9             0.25            0.41          46.5          0.043            126                 497           0.9682   3.15     1.46       10.2         -1            7         1   

   0     4266       6.8             0.67           -0.55          -50.5         0.418            302                 193           0.9984   3.08     0.67       10.34        -1            8         1   

   2     4268        7              0.25            1.31          57.2         -0.331            25                   94            1.03    4.57      1.4        9.2          1            7         4   

   0     4270       -2.7            -1.52           0.55           -40          0.402           55.06                 85            0.953   2.93     0.315      15.4         -1            8         1   

   1     4273       -4.3            0.06            0.32          42.6          0.052            284                 118           0.9966   3.18    0.5221       7.9          1            7         2   

   1     4276       16.9            -0.18           0.35           6.7          0.039            202                 -33              1     1.68     0.81       15.1          1            9         2   

   1     4277       18.5            0.75            0.01          58.1          0.657            119                 228           0.9955   3.55     2.12       12.8          0            7         2   

   0     4279       11.7            0.35            0.48          24.3         0.02372          -258                  44           0.9953   4.21      0.2        13          -1            8         1   

   1     4299       5.6              0.3            0.04          64.2          0.551            -36                 -769          0.9906   3.28     -0.99      12.7          0            6         2   

   1     4313       7.8             0.15            1.18          38.4          0.518            204                  93           0.9641   1.94     0.72       11.3          1            8         2   

   2     4322       6.2             0.36            1.24          -32.4        0.00504          56.58                -549          0.9971   3.31     0.56        9.5          0            7         3   

   1     4324        13             0.23            0.25          17.3          0.182            30                  110           0.9983   2.82       1         9.2          0            7         2   

   1     4328       8.2             -0.31           1.07          -21.4         0.04             41                   92            1.042   2.26      0.6        9.7         -1            9         2   

   0     4331       6.6             0.34            0.27          29.2          0.059            23                  136           0.9957   3.59     1.14        5.4          0            7         1   

   0     4335       8.2              1.1            0.09           -7          -0.617             7                   37           0.9969   3.32     0.55       12.2         -1            9         1   

   1     4337       7.4             0.26            0.31          7.35          0.034            37                  485           0.9938   2.27     0.31        15           0            9         2   

   0     4338       6.9             0.58            1.94          43.8          0.493            121                 104           0.9932   2.99     0.39        9.5         -1            8         1   

   0     4343       9.9             0.35           -0.53          -24.4         0.083            11                  188           0.9982   3.21      0.5       10.1         -1           11         1   

   0     4347        11              1.7            0.3            8.4          0.051            40                  250           0.9856   4.26     0.62        9.7         -2            8         1   

   1     4355       -5.4            1.02           -0.48          15.8          0.302           -124                 167           0.9597   3.335    0.51        9.2          0            7         2   

   0     4357       5.3             0.85            0.29          6.992         0.423           -2.07                 55           0.9908   2.91     0.32       14.8          0            9         1   

   2     4359       6.6             0.44           -0.53           7.5         -0.491            13                  152            1.073    3.1     0.63       18.9          1            7         4   

   0     4362       -7.8            0.26            3.06          10.65        0.06427          -166                 405           0.9924   3.31     1.43        9.8         -2            7         1   

   0     4368       7.3             -0.4            0.4           16.9          0.046            45                  518           0.9958   3.23     0.92       13.7         -1            7         1   

   2     4374       2.9             1.46            0.37          32.9         -0.422           42.06               138.8          0.9896   3.307   0.5062      12.4          1            7         3   

   2     4375       2.5             -0.37           0.55          9.933         0.053            303                 335           0.9742   2.93     0.44       10.38         1            8         3   

   1     4378        7              0.61            0.51           1.7          0.051           -370                 473           0.9946   3.24     1.04        4.4          0            8         2   

   1     4381       5.9             0.18            1.91          -51.6        -0.272            119                 -260          0.9916   2.43     0.38       12.66         0            6         2   

   1     4387       14.5            0.31            0.42           6.9          0.671            50                  481           0.9955    3.1     0.46         9           1            8         2   

   0     4400        5              0.22           -1.33          7.09         -0.097            -73                 185           0.9933   3.03     0.41       14.9         -1            9         1   

   1     4423       2.6             0.54            0.28           7.5          0.077            11                  -145          0.9978   2.46     0.61        10           1            9         2   

   0     4424       -0.3            0.31            3.14          44.1         0.1322            15                   87           0.9915   3.11     -1.14       13           0            8         1   

   2     4428       6.9             0.82            0.52            5          -0.199            52                  497           0.9657   3.55     -0.01       9.6          0            8         3   

   2     4433       -4.6            -1.02           0.3           -30.9         0.047            36                  336           0.9801   3.26     -0.61      10.4          2            6         3   

   1     4436       13.6            -0.61           0.29          -46.8         0.262            154                77.85           1.029   4.28     2.17       15.8         -1            6         2   

   0     4437       6.4             0.55            0.32          5.859         0.047           -275                 -202           1.017   4.03      0.6        9.2          0            7         1   

   2     4439       5.5             0.48            0.28          61.4         -0.166            31                  126            1.027   2.46     -1.19      16.2          1            7         4   

   1     4449       7.1             0.44            0.27          28.4          0.007            252                 223           0.9926   3.78     0.36       16.8          0            8         2   

   1     4456       20.7            1.11            0.74          12.5          0.037            37                  -51            1.016   3.04     0.97       14.5          0            8         2   

   2     4463       9.5             0.13           -1.19           5.4         -0.219            15                  118           0.9954   3.27     0.34        9.6          1            9         4   

   0     4467       16.3            0.26            -1.5          -61.1         0.041            258                134.8          0.9898   2.22     2.18       11.59        -1            8         1   

   0     4468       5.1             0.06           -2.41          11.6          0.243            40                   78            1.024   4.04     0.64        2.5          0            6         1   

   0     4469       7.5             0.33            0.36           2.6          0.25             -16                  45            0.991   3.32     0.53       12.7          0            8         1   

   1     4472       6.9             -1.15          -1.05          -46.5         0.042            36                  450           0.9433   2.14     0.69        2.8          0            7         2   

   2     4473       5.7             1.54           -0.97           6.3          0.043            28                  113           0.9936   3.06     2.02        6.3          0            6         3   

   0     4476       6.5             0.47            0.41          72.3         -0.007            200                 -290           1.048     5      0.72        8.3          0            7         1   

   0     4500        6              -2.44          -0.86           3.6          0.083            36                  133           0.9481   3.27     1.19       10.8         -1            7         1   

   1     4509        3              -1.19           0.3           2.872        -0.529            247                 105           0.9896   2.78     0.58       12.75         0            6         2   

   0     4513       7.7             0.27            1.3           9.866        -0.549            341                 179            1.011   3.48    0.5146       8.9         -1            9         1   

   0     4521       0.8             2.035          -0.41          -88.3         0.045            -11                 -36            1.006   4.31     0.54       15.8          0            7         1   

   0     4527       16.7            0.23            0.29           2.6         -0.135           -173                  98            1.023   1.85     3.55       16.8          0            8         1   

   0     4530        8              1.12           -0.65          -54.1         -0.53            257                 -194           0.99    2.35     0.45       12.4         -2            9         1   

   0     4532       0.5             2.02            0.74          38.7         -0.633            61                  182           0.9953   2.97     1.73       10.5          1            8         1   

   1     4533       0.5              0.2            0.34          -62.8         0.049           -118                  -9           0.9922   2.07     1.88        7.2         -1            8         2   

   0     4535       9.8             0.14            0.81          -53.4         -0.21            75                  189           0.9896   2.975    -2.8        4.7         -1            7         1   

   2     4536       11.3            0.36            0.9            2.4          0.123           -272                 -335           1.021   3.104    -2.18       14           1           12         3   

   1     4542       20.8            0.34            0.44          -1.8         -0.664            47                  126           0.9912   2.96     0.37       18.8          0            9         2   

   0     4551       6.2             0.21            0.26          9.25          0.539           -455                 311           0.9945   3.05     0.37       11.4          0            9         1   

   1     4554       8.6             0.22            1.01          12.05         0.058            18                  125            1.011    4.3     -0.35       9.4          0            7         2   

   0     4555       7.1             -0.5            0.67            2           0.598            152                 128           0.9917   3.19     -1.21      15.8         -2            8         1   

   1     4564       1.9             2.765          -1.29           -2           0.502             6                  172           0.9911    3.4     0.59        17           0            8         2   

   0     4572        7              2.09            0.08          -12.8        -0.249            10                 123.7          0.9686   2.52     0.47        10          -1            8         1   

   2     4573       26.3            0.31           -1.33          -62.3         0.545            -60                 182            0.998   2.95     0.39       13.4          2            9         4   

   0     4577       6.9             0.34           -0.92          -54.8         -0.32            19                  149           0.9925   3.54     1.88       10.8         -1            7         1   

   2     4579       15.2            0.64            1.11          -28.3         0.44             57                 163.1          0.9448   3.16     1.76       11.3          1            5         3   

   1     4583       8.1              0.2            0.28          23.5         -0.0072          -180                  31           0.9906   3.25     0.36        5.7          0            9         2   

   2     4584       6.3             0.23            0.87          26.8          0.427           -105                 482            1.037   4.36     1.95       11.4          1            7         4   

   1     4596       -4.5            0.325           0.49          60.9          0.049            53                  217            0.996   3.16      0.4       9.008        -1            7         2   

   1     4599       5.7              0.1            0.34          26.3          0.135            251                 100           0.9969   3.27     0.46        9.5          0            6         2   

   1     4607       6.2             0.35           -1.24          18.1          0.069            33                  158           0.9603   4.34      0.5        8.8          0            7         2   

   0     4609       11.7             1.2            1.74          -21.7         0.09             20                   47           0.9973   3.34     0.64       12.8         -1           12         1   

   1     4610       7.2             0.16            0.74          12.5         -0.268            47                  161           0.9981   3.04     0.44        8.7          0            8         2   

   0     4616       13.3            -1.17          -0.29          18.15         0.785            41                   91           0.8993    3.3     0.76        8.7         -2            7         1   

   0     4617       17.6            0.425           1.49          13.1         -0.459           -163                 241            1.041   3.88     -0.16       2.9          0            7         1   

   2     4633       0.2             1.54            1.25          12.4          0.114            234                 155           0.9032   3.33     0.48       13.7          0            7         3   

   1     4638       7.8             0.25            0.41           3.7          0.042            -89                 371           0.9954   3.36    0.3764        8           0            8         2   

   0     4641       6.9             -0.62           0.89          70.35         0.003            257                 189           0.9978    2.8     0.565      11.7          0            8         1   

   2     4653       7.3              1.1            0.42          54.4         -0.388            288                 325           0.9996   3.29     1.57       10.26         2            8         4   

   2     4655       6.7             1.05            0.39          70.1         -0.023            64                   40           0.9956   3.89     0.38        9.4          0            7         3   

   1     4659       7.9             -0.66          -1.52           2.3          0.474            63                   86           0.9298   3.53     0.57       14.9          1            8         2   

   0     4669       15.5            -0.25           0.56            2           0.056            20                  124           0.9948    3.6     0.49         4          -1            8         1   

   0     4678        7              0.69            0.07           19           0.091            15                  -125          0.9957   3.38     -1.1        4.9          0            8         1   

   1     4685        7               0.6           -1.12          -27.8         0.447            28                  160           0.9954   2.49     0.46        9.8          1            8         2   

   1     4686       8.2             0.23           -2.78           1.3         0.08236           267                 -220          0.9914   2.99     0.36         9           0            9         2   

   0     4691       30.4             0.2            0.37          16.95         0.048           -220                 190           0.9995    3.7     0.42        6.7         -1            8         1   

   1     4695       -1.4             0.4            1.73          13.65        -0.224            47                  140            0.942   4.53     0.51       10.2          1            7         2   

   1     4698       7.3             0.19           -0.38          124.8         0.057            617                  51           0.9981   2.94     -1.63       6.7          0            8         2   

   2     4700       5.7             1.25            0.28           4.7          0.027           -221                 -71           0.9895   3.33     0.45       12.5          0            6         4   

   1     4711       5.5             -0.2            0.09          40.5          0.15             18                  370            1.004    4.2     0.51         5          -1            6         2   

   1     4722       -0.9            0.22            0.44          61.7         0.08778          -105                 422           0.9459   3.45     1.46         6           0            8         3   

   2     4727       6.4             -0.13           1.15          -45.3         -0.59            31                  -113           1.032   3.54     0.51       10.3         -1            7         3   

   2     4756       6.5             0.33           -0.49          -27.9         0.036            110                  88            1.011   3.25     0.69        15           1            7         4   

   1     4762       7.1             -0.16           0.38          -29.3         0.043            34                  337            1.014   3.23     0.38        8.5          0           10         2   

   1     4763       27.1            3.18            0.78           6.4          0.094           38.36                200            0.998   3.19     -0.61      11.2         -1            7         2   

   2     4766       8.2             0.79            0.51          -37.7         0.073            16                   47           0.9959    3.4     1.61       11.3          0            9         4   

   0     4770       0.4             1.93            1.03           1.9         -0.509            86                   38           0.9952   2.91     0.85        9.8          0            9         1   

   2     4784       6.1             -0.89           0.24           1.5          0.511            38                  124            1.005   3.94     0.42       12.4         -1            7         3   

   0     4791       7.7             -1.04           0.3           24.4          0.407            25                  -197          0.9951   2.97     0.47       10.9          1            8         1   

   2     4795       6.5             1.08            0.24          -8.35        -0.112            25                  131           0.9957   1.96     0.51        8.4          1            7         3   

   0     4799       7.2             0.21           -1.24          14.5         -0.275            306                 311           0.9982   3.05     -0.22       8.9         -1            8         1   

   2     4802       -2.6            0.23            0.29           1.6          0.043            24                  415            1.035   3.12      0.9       10.4          0            8         3   

   1     4805       6.8             0.52            0.74           68           0.088            23                  185           0.9928   4.39     -0.39      12.2          0            8         2   

   1     4814       6.2              1.4            0.61            1           0.031            22                  349            1.018   3.24     -0.27      17.3          1            7         2   

   0     4816        8              0.67           -2.17          10.06          0.1              5                  369            1.016   3.37     -0.91      13.8          0            9         1   

   1     4817       6.9             0.07            0.38           8.1         -0.143            44                  295           0.9958   3.26     0.49        9.8          0            7         2   

   0     4822       -0.4            0.235           1.84          11.75         0.03            -198                 118            1.029   3.04      0.9        9.4          0            6         1   

   0     4827       6.8             0.14            0.35           1.5          0.24             233                 -159          0.9911   1.93     -0.06       6.6         -1            7         1   

   2     4833       6.3             0.25            0.3           -22.4        -0.014           -138                 122            0.994   3.263    0.61       -0.2          0            8         4   

   1     4836       10.6            0.705           0.72          35.3          0.417            -10                 -287          0.9964     3      1.59        9.5          1            8         2   

   0     4842       -2.6            0.12            1.21           0.1          0.398            27                 118.7           1.041   3.29     0.41       13.5          0            7         1   

   0     4844        7              0.13           -0.78          1.749         0.056           39.45                319            1.007   4.73     -0.68       4.2          0            7         1   

   0     4845       1.2              0.7            0.29            5           0.028           -145                 461           0.9908   2.39     0.88       15.3         -1            6         1   

   1     4849       7.6             -0.91          -0.76          -48.8         0.04             545                 -322          0.9916   3.16     1.15        4.3          0            8         3   

   0     4850       6.5             0.93            0.33          29.3          0.042            50                  -58            0.997   2.48     -0.75      10.4          0            7         1   

   2     4860       6.5             0.18            -0.7          -3.5         -0.462            43                  -17            1.028   3.32     0.59       17.8          0            7         3   

   0     4863       8.9             0.57            0.26          -55.8        -0.081            -55                  89           0.9959   2.27     -0.37      9.472         0            9         1   

   1     4871       6.2             -0.74           0.29          -17.3         0.047            45                  220           0.9697   3.35     2.22        10           0            7         2   

   1     4878       7.8             0.645           1.41           5.5          0.086             6                   30           0.9808   2.54     0.94         7           0            8         2   

   0     4881       -2.6            0.69            0.98          40.4          0.629            29                  142            1.009   4.19     0.33       -2.1          0            7         1   

   0     4888       14.9            -0.16           1.53          -49.4        -0.514           -261                63.66          0.9944   3.17     0.33       10.2          2            8         1   

   2     4900       8.6             0.23           -0.03          19.7          0.302            17                   48            1.043   4.43     0.53        9.7          2            9         4   

   0     4906       -2.2             0.3           -0.95          -48.5        -1.065            49                  159           0.9712   3.11     0.48        4.2          1            7         1   

   2     4909       13.1             0.2            0.24          66.8          -0.07           49.23                -78            1.009     4      0.33        11           1            7         3   

   1     4916       1.4              0.2            0.32           1.6          0.11             174                 -578           1.014   3.37     -0.58      13.2          1            8         2   

   2     4918       7.9             1.29            1.85         -45.25         0.033           -231                 100           0.9912   0.96     0.52        7.7          1            9         4   

   0     4926       6.9             0.23            1.48          15.5          0.001           58.83                146           0.9944   2.94     -0.66       9.7          0            7         1   

   0     4928       0.8             0.66            1.86          -34.5        0.08657          -443                 -242          0.9946   3.38      1.8        1.3         -1            7         1   

   0     4941       8.7             0.23            3.35          13.4          0.044            35                  -111          0.9998   3.34     0.47        8.8          0            9         1   

   2     4946       10.5            -1.04           0.49          -54.7         0.115            297                 118           0.9835   3.34      1.3       13.1          0            6         3   

   0     4949       6.8             0.26            1.4            18          -0.032            38                   64           0.9939   3.42      1.2        10           0            7         1   

   0     4956       0.7             -0.09          -0.61           1.8          0.055            -87                 110           0.9796   2.12     0.44        6.2          0            8         1   

   2     4966       7.4             0.27            1.08          27.4          0.415            25                  324            1.005   2.97     0.51       11.9          0            8         3   

   1     4969       9.9             -0.47           0.37           7.9          0.025            110                 -207           1.032   2.93     0.37       19.4          0            9         1   

   1     4973       6.3             0.34           -2.77           6.2         -0.208            81                  227           0.9505   3.29     0.44        9.9          0            7         2   

   2     4978       -0.5            0.81            0.36          67.2          0.909            262                 124            0.997   1.58     0.59       13.7          1            8         3   

   1     4982       5.4             0.37            0.76           4.2          -0.1             243                 368              1     2.19     -0.36      11.8          0           13         2   

   1     4985       13.7            0.26           -1.37          18.7          0.034            39                  134           0.9949   3.33     0.03        7.3          1            7         2   

   0     4991       -4.7            0.305           0.9           1.75          0.173            17                  -723           1.006   2.22     1.63       17.23         1            6         1   

   1     4998       4.7             1.34            0.36          14.6          0.048            35                  -419          0.9968   3.14     1.55       17.1          0            8         2   

   0     5000       6.8             0.11           -1.12          57.9          0.315            252                 104           0.9945    3.2     0.37       11.3         -1            7         1   

   1     5004        9              -0.29           1.05           2.1          0.513            19                   76            0.99    2.62    0.5989      12.1          0           10         2   

   0     5005       12.8            0.26            1.53          13.3          0.044            68                  224           0.9718   3.18     3.89        9.5         -1            8         1   

   1     5011       7.3             0.38            0.23          4.934        -0.251            18                  149            0.993    3.1     0.67       11.2          1            8         2   

   0     5016       6.6             -0.74           0.65           2.6          0.087            13                  -252           1.009   4.18     0.65        11           0           13         1   

   1     5018       8.7             1.33            0.34          45.8          0.018            -91                 372           0.9947   3.12     -1.95      -2.1         -1            9         3   

   1     5034       5.7             -0.91          -1.04          94.1          0.106           -194                 155           0.9927     2      -0.18       16           0            7         2   

   2     5038       6.6             0.19            0.39           62          -0.189            177                  63           0.9917   3.16     0.38       10.5          0            8         3   

   2     5042       21.3            1.335           0.06           49           0.403             9                 139.3           1.022   3.03     -1.25      10.2          2            6         3   

   0     5046       11.1            0.18           -1.82           9.8          0.039            29                  113            1.014   3.11     0.45       10.9          0            7         1   

   1     5051       18.7            0.31            0.51           2.2         -0.245            -90                96.56           1.045   2.19     0.93        9.8          0           12         2   

   1     5054        7              0.77            0.32          -116          -0.27            41                  -210           1.007   2.81    0.5761      12.9          0            7         2   

   2     5057        15             0.51            0.2           64.9          0.034            218                 117            1.005   3.62     0.43       10.1          0            7         3   

   1     5062       6.8             -0.92          -1.04           2.8          0.414            40                  122            1.051   3.06     2.91       9.581         0            7         2   

   1     5063       7.3             0.69            1.32          -19.5         0.104            35                  104            1.026     4      0.51        9.2          1            8         2   

   0     5065        6              0.81            1.1            1.6          0.397           26.14               92.88          0.9521   3.62     0.32       10.7          0            6         1   

   1     5066       6.5             0.31           -0.54           3.5          0.046            22                  147           0.9902   3.15     0.31        6.2         -1            7         2   

   0     5076       0.5             -0.12           0.42           2.8         -0.375            84                  137           0.9908   3.27     0.43       11.8         -1            7         1   

   1     5089       -5.1            0.31            0.4            6.2          0.04             -68                 208           0.9953   2.92      0.1        6.6         -1            7         2   

   1     5092       6.9              0.3            1.85          10.5          0.637            24                  189           0.9936   3.29     0.54        9.9         -2            7         2   

   2     5093       6.5             0.29            0.52           -44          0.213            35                  192           0.9955   3.16     0.51       13.5          0            7         3   

   2     5094       18.4            -0.86           1.5          -56.45         0.034           -230                 293           0.9621   3.91     0.31       10.8          0            9         3   

   1     5098       18.5            1.13            0.86           2.6         -0.503            33                   -1            1.036   4.15     -0.56       2.2          0            7         2   

   2     5102       14.5            0.17            0.15           35           0.029            242                 128            1.03    3.37     -0.64      10.7         -2            8         3   

   2     5112       7.8             0.15            0.92           1.4          0.056            21                  -705          0.9692   2.49     0.53       10.4          1            8         3   

   0     5117       9.6             -0.36           0.38          3.99          0.061            212                  33            0.981   3.73     0.58       17.8          0            9         1   

   1     5127       8.1             1.63            1.46          45.3          0.596           20.44                364            0.997   3.85     2.54        9.8          0            9         2   

   0     5130       -4.6            0.24           -0.32          10.2          0.036            286                 351            0.991   2.71     0.44       5.25         -1            7         1   

   0     5131       4.1             0.68            1.51           2.2          0.095            21                  471            1.043   3.25     1.69        9.2         -1            9         1   

   1     5132       2.3             0.23           -2.21          -48.1        -0.351           -210                 186           0.9991   3.22    0.4897       4.2          0            8         2   

   1     5135       -3.7            -0.61           1.42          -8.2          0.038            15                  -165          0.9602   4.11     0.75        6.6          0            7         2   

   0     5136       4.3             -0.71           1.5            0.5          0.036            34                 125.2          0.9952   1.93     0.39        5.7          0            8         1   

   1     5147       5.7             0.77            0.14           6.3         -0.471            35                  182            1.039   3.11     -1.08      9.25          1            6         2   

   1     5157       -7.1            -0.06           0.42          7.005         0.044            -66                 196           0.9956   3.98     0.48        7.1          0            7         2   

   0     5160       6.8             1.15           -0.12         -125.2        -0.201            13                   74           0.9958    4.2       0        9.523        -1            8         1   

   1     5165       6.4             1.57            0.2            6.6          0.054            10                   94            1.002   2.43     0.69       14.8         -1            8         2   

   2     5166       7.3             -0.03           0.31          -57.7         0.04             39                  302            1.033   3.19     0.51       11.4          0            8         3   

   0     5172       6.6             -0.19           2.56          10.6          0.17             151                 201            1.094   2.96     0.38       9.819        -1            7         1   

   0     5173       13.5            0.28            0.35           1.6          0.082            36                  114           0.9668   3.56      0.5        5.5         -1            6         1   

   0     5179       8.1             -0.04           0.02           1.7         0.0716            16                   56           0.9968    3.9     0.03        9.3          0            9         1   

   2     5184       6.8             0.32            0.28          -40.6        -0.544           -203                 100            1.002   3.08     0.47       12.4          1            7         3   

   0     5187       6.9             0.56            0.26          -27.6         0.06            -213                 193           0.9969   1.73    0.4744       3.2         -1            8         1   

   0     5191       16.6            0.19            0.17           5.1          0.034            306                 531           0.9942   2.18     -0.8       16.4          0            7         1   

   0     5193       3.2             0.43            1.82          -28.4        -0.617           -217                 552           0.9906   5.36     0.94       12.1         -1            8         1   

   0     5194       -4.2            1.69           -0.67          25.1          -0.44           -191                 340           0.9941   3.15     0.49       13.7          0            7         1   

   0     5199       1.3             0.25            0.39         -45.65        -1.093           23.4                 155            1.006   3.92    0.0835        9          -1            8         1   

   1     5212       6.9             -0.59           0.24          -23.5         0.992           -115                 499           0.9899   3.26     0.58        10           0            8         2   

   0     5213       6.4             -0.43           0.17         -116.8         0.593            235                 161           0.9955   3.02      2.1       10.2          0            7         1   

   1     5224       7.2             0.23            0.39          14.2          0.36             49                  -113           1.012   2.98     0.48       14.4          0            8         2   

   2     5226       8.8             3.61            0.24           2.4          0.067            10                   25           0.9969   3.19     0.59        9.5          0           10         3   

   2     5239        17             0.21           -0.68            2           0.344            276                 138           0.9918   3.05     0.76       14.9          1            9         3   

   1     5252       6.2             -2.69           0.93          30.3        -0.04704           55                  204           0.9974   3.16     -0.66       9.1          1            7         2   

   0     5264       7.4             0.67            0.1           64.9          -0.97            12                   48           0.9989   3.319    -0.55       9.5          0           10         1   

   0     5266       7.5             -0.35          -1.33          -17.2        0.2234            49                  -552          0.9098   3.21     0.43        8.8         -2            6         1   

   2     5271       2.2             0.47            0.31            9          -0.352            39                  -10            1.019    3.1      0.5        9.2          1            8         3   

   1     5273       -4.7            0.31            1.49           -45          0.031            281                 151           0.9976   3.36     0.82        12           0            7         2   

   1     5276       4.4             0.32            0.39           4.3          0.38            -137                 127           0.9375   3.46     0.36       12.8         -2            5         2   

   2     5278       6.3             -0.29           0.81           4.7          0.04             -1                  -18           0.9514   3.07     0.75       10.7          0            7         3   

   0     5281       8.1             2.55            0.63          12.3          0.049            50                  531           0.9971   2.57     0.57       10.2         -1            9         1   

   2     5283       4.4             0.74            0.09            2           0.067             5                   10            1.072   3.97     0.57       11.8          0            9         3   

   2     5291       4.5            -0.115           1.44          -30.8        -0.072             6                   31           0.9986   3.23     0.56       10.1          2           10         3   

   1     5294       17.4            -1.47           0.33          -34.4         0.046            31                  123           0.9983   3.85      0.4        4.6          2            7         3   

   1     5296       7.1             -0.28          -0.27          52.7         -0.207            46                  289           0.9675   3.92     0.59       12.5          0            8         2   

   2     5297       3.1             0.63            0.07          -7.3          0.09            -104                  37           0.9979   3.28     0.76       13.7          0            8         3   

   1     5313       6.9              1.3           -0.39           7.8          0.423            11                  548            0.996   3.23     0.15        8.1          0            7         2   

   0     5314       6.2              0.5            0.12           1.8          0.539            279                 416           0.9512   3.28     0.87        9.8          0            8         1   

   1     5321       -2.8            1.41            0.3           44.5          0.241            60                 218.4           1.019    3.7     -0.25       9.3         -1            7         2   

   1     5325       7.1             0.23           -1.31           3.5          0.038            344                 112           0.9916   4.18     0.37       18.17        -1            8         2   

   1     5326       4.4             2.81            0.27          60.8          0.169            63                  344           0.9985   3.66     0.43        6.6          0            7         2   

   2     5328       6.3             -1.04           0.37           1.5          0.024            12                   76           0.9888   3.38    0.5932      12.3         -1            7         3   

   0     5334       6.1             0.53            1.19           -61         -0.338            24                  139           0.9953   4.85     0.68       16.5          0            7         1   

   1     5338       5.1               0             0.42          18.05        -0.362           -201                 688            1.039   4.23     1.19       13.8          1            8         2   

   0     5344       4.5             0.62           -0.66          43.5          0.424            11                  -153          0.9964   3.15     0.66        4.5         -2            9         1   

   0     5348       6.8             0.57            2.12           -69          0.072            32                  -210          0.9801   3.43     -0.86      9.651        -1            7         1   

   0     5352       16.8            1.01            0.24            2          -0.205            19                  -203          0.9917   3.72     0.74       18.7          0            6         1   

   1     5353        6              0.18            1.77           24           0.317            40                  -132          0.9695   1.88     0.62       10.8          0            6         2   

   1     5354       9.1             0.28            0.56           1.9          0.694            52                  280            1.033    3.3     -1.55      10.78         1            9         2   

   0     5361       1.7             1.52            0.58           1.9          0.071             5                   18            0.998   3.09     0.779       10          -1           13         1   

   0     5364       15.2            0.39           -0.64          11.1          0.327            -27                 -67           0.9661   3.05     1.14       16.4          1            8         1   

   1     5365       6.2              0.3            1.27           1.1          0.032            53                  -37           0.9158   2.97     0.42       11.3          0            7         2   

   1     5367       5.8             1.57            0.87          -45.3         0.506            195                 381           0.9938   2.67     0.59        11          -2            6         2   

   2     5379       5.2             0.34            0.39           1.4          0.098             3                   7             1.012   3.19     1.53       11.4          1           11         3   

   1     5382       7.1             0.12            0.84          -41.7         0.276           -489                  94            1.011   4.27     0.56        17          -1            7         2   

   1     5386       3.6             0.27            1.46          25.75         0.042            34                 171.6             1     2.96      0.5        4.6          1            8         3   

   1     5395      -16.3            1.34           -0.84          -26.7        -0.556            16                  128           0.9747   3.34     0.58       15.9          0            6         2   

   1     5410       7.7             0.27            0.34           1.8          0.42            31.87                -158          0.9911   2.99     0.48       10.84         1            8         2   

   0     5411       6.9             0.38            0.25           9.8          0.04             28                  191           0.9971   3.28     0.74       12.3          1            8         1   

   2     5416        -3             -0.16           0.28          56.55         1.208           -132                  78            1.037   2.78     2.01       12.4          1            8         3   

   0     5424       12.4            -0.3           -0.25           11           0.052            53                  247           0.9984   4.53     0.26        9.3          2            7         1   

   0     5426       7.5             0.88            1.33           6.5          0.626            53                  501            1.066   3.03     0.38       10.9          0            8         1   

   1     5428        0              0.65            0.12          -38.9         0.303           -119                  10            1.029   4.59     0.14       13.5          0            6         2   

   2     5430       6.4             -0.21           0.32          14.9         0.05569           36                  162           0.9638   3.28      0.5       14.9          0            7         4   

   0     5433       -1.6            0.32           -0.13          8.25         -0.288            14                  441           0.9651   2.76     0.44       11.4          0            8         1   

   1     5437       6.1             0.15           -0.34          40.6          0.035            -80                  83            1.042   2.69     2.06       9.991        -1            7         2   

   0     5440       28.3            1.44            2.24           1.6         0.1385            12                  521           0.9901   3.13     0.52       12.2          1            6         1   

   1     5442       7.2             0.35           -1.18           5.6         -0.389            12                  315            1.032   2.93     2.95        4.4          1            8         3   

   0     5445       7.9             -0.39           0.44          51.3         -0.191            61                  230            0.995   3.54      0.4       11.8          0            7         1   

   1     5449       6.8             -0.36           0.32          -8.8         0.08341           10                  316           0.9884    2.7     0.67        8.5          0            7         2   

   1     5452       11.4            1.18           -1.23          -61.2         0.038            34                  117           0.9573   3.36     0.59       13.9          0            7         2   

   0     5460       6.1             1.06            0.69          -19.8         0.196           -167                  28            1.033   3.98     0.73       16.2         -1            8         1   

   0     5461       7.1             1.93            2.02           7.1          0.284            28                  426            1.026   4.83     -0.95       5.4         -1            8         1   

   0     5465       6.7             -0.52           0.13           1.4         -0.372            -96                 195           0.9937   3.52     0.54        9.4         -1            7         1   

   2     5467       6.8             0.98            0.35           2.3          0.042            16                   85           0.9492   3.19    0.5481       8.6          0            7         3   

   1     5471       7.9             -0.38           1.63          -8.6          -0.7             20                   72           0.9885   3.12     1.24       10.5          1            8         2   

   1     5474       6.8             0.19            2.4            4.9          0.047            199                  60           0.9928    5.7     0.74        11           0            7         2   

   1     5475       14.8            1.51            0.66           8.5          0.036            46                  579            1.021   3.31    0.6953       8.8         -1            7         2   

   1     5480       15.1            -0.18           0.4           11.9          0.196            244                107.4          0.9462   2.67     0.93        22          -1            8         2   

   1     5481       7.4              0.3            0.3            5.2          0.053            45                  163            1.031   2.42     0.45       10.3          0            8         2   

   2     5484       6.5             -0.66           0.36          -38.1        -0.323            -28                 -310          0.9938   3.21     1.27       12.9          0            7         3   

   1     5494       0.6             0.16            0.34          -31.9         0.029            26                   90           0.9649   3.88      0.7       10.1          2            6         2   

   1     5495        11             -0.01           0.5             1           0.127            63                  493           0.9921   2.31     0.45       10.1         -1            7         2   

   1     5497       6.5             -2.68           0.33          8.75          0.035            -28                 181           0.9962   2.93     -0.27      10.7          0            8         2   

   1     5499       7.1             0.26            0.29          12.4          0.044            80                  240           0.9643   3.04     0.42        9.2         -1            8         2   

   1     5507       6.2             -0.51            1             7.1         -0.403           -195                 -201           1.032   3.36     1.62       13.4          0            7         2   

   0     5510       7.6             -0.88           1.31          -20.4        -0.523            68                  143           0.9983   2.87      0.3         6           1            8         1   

   0     5515       6.5             0.14            0.64          36.2         -0.322            12                  291           0.9972   3.05     0.39       11.3          0            8         1   

   0     5516       14.1            -1.87           0.55           8.7          0.038            49                  495            1.015   2.16     0.55       9.915        -2            8         1   

   1     5517       7.5             -0.18           0.59          11.8          0.046            48                   78            1.026    2.7     1.13        5.7         -1            8         2   

   2     5524        8              0.22            0.31          48.7          0.049            24                  398            1.021    3.1     -0.87      10.9          0            9         3   

   2     5530       7.8             0.53           -0.25          -54.8         0.076            17                   31            1.005   3.245    -0.05       10           2            8         3   

   0     5534       5.9             -0.73          -0.95          33.2          0.03             40                  377           0.9201   3.37     0.46       12.1         -1            6         1   

   1     5543       7.4             -0.76           0.33            2           0.486            31                  101           0.9931   2.81     0.74        9.9          0            8         2   

   0     5545       6.6             0.35            1.13          48.9          0.063            18                  393            0.991    3.1     3.78        9.4          0            7         1   

   1     5558       -1.5            -1.52           0.33          11.8          0.057            43                  127           0.9969   3.67     -0.34       10           0            8         2   

   0     5562       8.2             1.395          -0.71          -37.5         0.329            26                  168           0.9921   3.47     0.46       12.67         0            5         1   

   2     5573       -0.5            0.26           -0.12          10.8         -0.443            10                  -88            1.016   3.08     -0.69       7.9          2            7         4   

   2     5581       6.7             0.27           -0.17          51.7          0.176            263                 106           0.9929   4.27     0.43        6.8          0            8         3   

   2     5583       5.9             0.28            0.14          38.5         -0.642           -236                 435            1.006   4.55     0.44       12.8          1            6         3   

   2     5587       10.3            -0.16          -2.98          58.8         -0.494            19                  102           0.9894   3.141    0.41        8.2         -1            7         3   

   0     5589       7.9             1.42           -0.18          39.35        -0.381            13                  106            1.006   3.24     0.07       7.75         -1            9         1   

   2     5591       20.2            0.23            0.2           -43.7         0.898           -247                  50            1.002   3.15     0.06       12.6          1           11         4   

   0     5596       7.3             -0.34           1.29           9.9          0.467            250                 161           0.9937   3.51     0.28       11.2          0            8         1   

   2     5606       13.9            1.14            0.16           4.1          0.035            26                  155            1.023   3.25     -0.84       9.3          0            8         3   

   1     5608       5.1             -1.15           0.25           1.6          0.601            264                 115           0.9921   3.39     -0.05      10.9          1            7         2   

   1     5611       15.3             0.3            1.79          64.4          0.511            44                  163           0.9895   2.75      1.4       15.1         -1            7         2   

   1     5612        7              -0.31           0.3           13.3         -0.028            46                  300           0.9988    3.2     2.13       13.6          1            7         2   

   2     5614       6.5             0.26            0.32          -0.8          0.028            36                  118           0.9908   3.27     1.97       14.9          0            7         3   

   1     5620       11.2            0.345           1.92            1           0.068            43                  143            1.036    3.5      0.4       10.9          0            6         2   

   2     5623       6.2             1.115           1.22           1.9          0.036            -89                 117           0.9862    3.4     0.44       18.3          1            7         3   

   0     5624       12.8            0.61            1.07          -38.5         0.09            -185                  87           0.9952    2.9     0.23        9.7          2           10         1   

   2     5626       17.4            0.27            0.46           9.7          0.048            89                  -133          0.9974    3.8     0.59        9.6          2            9         3   

   0     5633        8              0.22           -1.11          -3.7          0.044            45                  163           0.9748   3.21     -1.05       3.8         -2            9         1   

   1     5635       20.6            0.24            1.48           9.8         -0.026            20                   46           0.9974   4.19     1.39        10          -1            9         2   

   1     5640       6.6             1.54           -0.07           1.3         0.04259           32                  472           0.9916   2.57     0.42       10.7          1            7         2   

   0     5643       7.6             0.36            0.48          50.4         -0.205            112                182.3          0.9866   3.04     -0.51       9.2          0            8         1   

   2     5644       6.8             0.31            0.3             8           0.028            -37                 122           0.9916   3.13     0.52       12.6          1            7         4   

   2     5653       6.2             0.37            0.42          42.5          0.036            15                   70           0.9665   3.25     0.48       12.7          1            7         3   

   2     5663       7.1             0.22           -2.36          4.906         -0.51           -181                199.9          0.9939   2.56     -0.57       8.3          0            8         3   

   2     5664       -0.7            0.13            0.8           -50.9         0.047            -65                 134            1.08    2.22     0.97        9.8          1            8         3   

   0     5667       -3.6            0.16            0.29           1.8          0.122           -201                 -117          0.9807   3.06     1.38       11.4         -1            7         1   

   0     5671       16.7            0.36            0.25           5.7          0.015            296                 -15           0.9405    3.7     0.59       12.1          0            8         1   

   1     5673       6.6             0.38           -0.85           -33          0.061           -255                 214           0.9976   4.08     0.56        7.7          0            7         2   

   1     5676       5.4             0.18           -1.32          -4.9          0.041            19                  187           0.9728   3.42      0.4        9.4         -2            6         2   

   0     5678        0              0.01            0.54           2.7          0.105             5                  133           0.9988   2.23     0.07        8.8          0           11         1   

   0     5698        7              0.18            0.34          39.3          0.125            12                  136           0.9922   3.25      1.5        6.7         -1            8         1   

   2     5700        26             -0.36          -0.43          35.3          0.037            202                 120            1.028   4.33     0.69       10.6          1            7         4   

   1     5705       -2.2            0.32           -1.18          42.4          0.494           -471                 183           0.9723   4.51     0.43       10.9          0            7         2   

   1     5706        7              -1.51           1.91          38.1          0.045           -358                 550           0.9418   2.99    0.4855      10.8          2            8         2   

   2     5711       1.8             0.27           -0.86           4.5        -0.05814           58                  421           0.9896   2.92     0.31       12.6          0            6         3   

   2     5712       6.6             0.13           -0.06           7.1          0.058            47                  -245          0.9946   3.15     1.46        8.7          1            7         3   

   1     5716       15.3            0.37            0.36            1          -0.138            17                   30            1.031   4.22     1.92       10.84        -1            9         2   

   0     5719       7.3             0.19            1.27          -9.7          0.057           -136                 -153          0.9981   2.94     0.41        8.8          1            8         1   

   0     5725        10             -0.02           1.89         -27.25       -0.04294           127                 151           0.9968   3.08    0.5054       3.7         -1            8         1   

   2     5728        -5             0.19            -0.1           1.2          0.122            45                  378           0.9476   2.11     -0.91      14.2          2            8         4   

   0     5734        3              -0.46           -0.6           2.8          0.084           -120                 122           0.9984    4.4     0.56        9.8         -1           10         1   

   1     5735       -0.9             0.2            0.69          -29.1         -0.45            37                 375.5           0.96    3.14     0.46        3.5          0            8         3   

   0     5743       6.6             -1.02           0.36          -52.3        -0.028            57                  330            0.996    3.4     -2.24       9.6         -1            7         1   

   1     5754       -2.2            2.11            0.26          -14.4         0.038            18                   97           0.9948   3.36     0.46       10.78        -1            6         2   

   0     5755       14.1            0.81           -0.67          -31.3        0.08502           16                  -58           0.9936   3.15     0.45       10.4          0            9         1   

   1     5756        8              -0.42          -0.91           2.5         0.03069           40                  210           0.9932   3.67     -0.75       10           1            7         2   

   0     5766       -3.1            -2.12           0.8           4.154        -0.158            131                 167           0.9776   3.87     0.11         5           0            7         1   

   1     5770       2.5             0.675           0.2            1.7          0.033           -161                 -356           0.99    3.34     0.48        9.8          0            6         2   

   0     5774       8.4            -1.685          -0.99           1.9          0.09            -240                 -217          0.9965   3.19      2.2        6.3          0            9         1   

   0     5775       6.9              0.3            0.3           50.15        -0.199           -171                 435              1     3.07     0.32       12.7         -1            8         1   

   1     5776       6.3             0.24            1.75           1.6          0.057            48                  -63           0.9934   3.45      0.7        16           0            7         2   

   2     5778       5.6              1.2           -0.87          29.8          0.037           -167                 -18           0.9927   3.25     0.99       16.4          1            6         4   

   1     5786       8.4             0.18            -0.5          -3.7          0.046            -36                  31           0.9953   3.03     2.16        9.3         -1            8         2   

   1     5787        9              0.51            0.78          33.2          0.099           -152                 795           0.9986   4.32      1.5       10.4          0            8         2   

   1     5791       6.9             0.51            0.23          -22.6         0.072            13                   22            1.016    3.4     -0.07       3.9          1            8         3   

   1     5794       5.8             0.15           -1.04          -59.1         0.037            301                 119           0.9653   3.68    0.4444      10.2         -1            6         2   

   0     5803       8.8             -0.98           0.19          12.5          0.034            38                  115            1.044   2.24     0.43       -1.6          0            6         1   

   0     5804       0.2             0.28            0.27          10.3          0.025            26                  108           0.9555    3.2    0.4529      10.7          1            7         1   

   2     5808       7.9             0.29            0.39          -22.6         0.442             6                  117            1.056   2.87     0.42       10.7          1            9         3   

   1     5810       6.9             0.19            0.49           6.6          0.036            49                  269           0.9932   3.38     1.06       17.4          0            8         2   

   1     5813       3.3             -0.83           0.27          -44.2         0.029            20                  117           0.9905   3.21     1.48       15.9          0            8         2   

   1     5828       -3.1            -0.04           0.89          30.3          0.05             20                   72           0.9715   3.43     -0.24      10.8         -1            6         2   

   2     5839       -1.5            0.16            0.24          70.2          0.009            180                 361            1.026   4.72     2.03       10.3          1            7         4   

   2     5842        3              1.37            1.2            7.8          0.14             14                  130           0.9615   4.02     0.45       10.27         0            8         3   

   1     5843        11             1.66           -1.01            2           0.343           -259                  18           0.9979   3.78     2.35       10.5         -1           12         2   

   1     5844       18.1            2.41           -0.07           4.7         -0.168            34                  -108          0.9927   3.63     0.38       13.6          0            7         2   

   0     5847       9.2             0.23            0.42          74.5          0.042           -201                 -239          0.9692   3.67     1.34        10           0            8         1   

   0     5851       5.7             1.42            0.25          18.4         -0.158           -234                 182           0.9995   3.13     0.62        9.3         -1            7         1   

   1     5854       -6.4            -1.28          -0.56          -47.4       -0.08037          66.76                 93           0.9946    3.4    0.4832       5.6         -1            7         3   

   0     5857       6.5             0.23            1.87          37.1          0.621            -5                  112            1.006   4.31     0.54        3.2          0            7         1   

   1     5866       5.5             -0.21           0.25          24.2          0.265            198                 118           0.9823    4.8     0.67       12.5         -2            6         2   

   0     5874       6.3             0.48            1.72          -22.9         0.06            -212                 156            1.031   3.79    0.5425       9.4          0            7         1   

   1     5886       19.2            0.31            0.3            0.9         0.0185            16                  209           0.9634   2.83    0.7022       5.3          0            9         2   

   0     5895       -2.5            0.33            0.49           2.6          0.13             27                  294           0.9666   2.44     0.75       14.2          0           13         1   

   0     5897       9.9              0.2            0.22           1.3          0.194            25                  503            0.993   4.21     0.43       10.98        -1            6         1   

   0     5898       7.2             0.62            0.06           2.7          0.146            237                  85           0.9727   3.51     0.23        6.3          0            8         1   

   0     5900       5.6             -1.14           0.26           5.7          0.642            12                  -203           1.024   2.48     1.26       11.1          1            6         1   

   0     5902       12.4            -0.32           0.07          6.236          0.1             20                   57            0.996   2.53     -1.43      11.7          1            8         1   

   0     5908       15.6            2.38            0.41           5.9         -0.408           -244                  13            1.043   3.135    1.25       11.6          0           10         1   

   0     5909       16.7            -0.99           0.22          31.1          0.377             1                  505            1.017   1.42     0.32       11.4          0            6         1   

   2     5912       6.9              0.2            0.37          59.7          0.027            24                  495           0.9659   3.38     1.14       17.9          1            7         4   

   1     5913       8.4             -0.06           0.49          6.385         0.036           -107                 -15            1.038    3.2     0.27        5.8          0            8         2   

   2     5917       6.8             0.34            0.36          47.9          0.029            261                 128           0.9932   3.26     0.35       11.95         0            8         4   

   0     5918       6.7             0.49            0.28          10.2         -0.318            161                 115            1.031   2.68     0.86       14.6          0            7         1   

   2     5921       8.6             1.49            0.42          -20.4         0.307            35                   89            1.006   1.02    0.6346      15.1         -1            9         3   

   0     5931       -3.8             0.2            0.34           55          -0.503            -37                 132           0.9899   1.95     0.42       11.7         -2            6         1   

   1     5942       15.1            0.28            0.34           3.6          0.04             50                  572           0.9874    2.4     -2.16      17.6          0            7         2   

   1     5943       6.7             -1.11          -1.22          -36.7         0.038            83                 154.9           1.011   2.08     0.14       9.73         -1            7         2   

   1     5950       5.9             0.12            0.28          3.151        -1.023            24                 109.3          0.9909   3.29     0.55       10.65         0            6         2   

   1     5954       2.1             -0.12          -0.15           2.2          0.088            -54                  39           0.9969    4.5     0.83       9.975         0           10         2   

   1     5983       11.6            1.78            0.3            3.8         -0.223            34                  -337           0.977   3.25    0.8157      10.83        -1            7         2   

   0     5995       5.1             0.52            1.31           2.7         -0.088            30                   79           0.9932   3.32    0.6112       9.3          0            6         1   

   0     6002        9              0.74            0.49           7.2          0.039            146                 927            1.007   2.94      1.9        10           0           10         1   

   1     6005       -0.8             0.2            0.3            4.7          0.041            67                  148           0.9932   3.16     0.35       10.2          0            7         2   

   2     6009       8.3             1.01            0.34          -60.3         0.093            146                  12           0.9941   2.98     1.98       12.4          2            9         4   

   0     6011       -4.7            0.37            2.63          12.4          0.39            -125                 670            1.032   3.35    0.6519      12.7         -1            6         1   

   2     6012       3.8             0.22            0.32          -0.3         -0.137            -20                 -148           1.034   3.08      0.6       11.3          0            8         4   

   0     6019       3.8             -0.22           0.48          39.1         0.1021            66                  655           0.9972   2.33     2.28        9.3         -1            8         1   

   0     6021       -1.4            0.36            0.14          34.3          0.627            35                  401           0.9977   3.13     0.51        7.2          1            8         1   

   1     6029       15.9            0.23            0.29           2.3         -0.377            14                 115.8          0.9634    3.1     0.58         5           1            7         3   

   1     6036       9.9             -0.01           0.38           1.5         0.1212            47                  400            1.036   3.26     0.82       10.6          1           11         2   

   0     6037       6.7             -0.06           -0.3          -44.5         -0.15            240                 486           0.9598   3.22      0.6        9.2          0            8         1   

   0     6038       9.1             0.28            0.48           -16          0.067            36                  -754          0.9967   2.73     1.04       10.6         -1           10         1   

   0     6043       9.1             -0.72          -1.47          15.7         -0.486            15                   33              1     3.77     1.85       10.2          1           13         1   

   2     6045       8.6             1.38            0.36           1.8          0.495           -127                  55           0.9956   3.25     1.49       14.5          0            9         3   

   0     6047       10.7            1.04            0.3           13.1          0.466            35                  -185           0.928   3.04     -0.71      15.3         -1            8         1   

   0     6048       7.4             1.52           -0.23         -1.931        -0.794            162                 100           0.9904   3.22     0.27       11.99         0            7         1   

   1     6061       5.6             -0.65           1.07         -4.468         0.043            470                  28            1.026   3.23     0.53       10.3          0            6         2   

   0     6063       10.1            0.07            0.3           35.3          0.047            17                  236           0.9571   3.22     0.71        1.9          1            9         1   

   2     6064       16.5            1.63            1.78          20.8          0.035            -39                 184            1.049    3.7     1.09       9.005         1            7         3   

   2     6068       -0.5            -0.56           1.53           2.8          0.382            40                  -57           0.9916   2.96     0.63       15.9          0            7         3   

   0     6069       11.1           -0.035          -0.12           2.1          0.649           -251                  25           0.9961    3.5     1.24        9.7          0            8         1   

   1     6070       -2.2             0.3           -0.91          -0.3         -0.508            46                  165            1.007    0.6      0.4        8.7          0            8         2   

   2     6071        -4             -0.55           0.7           3.95          -0.35            56                  142            0.983   2.46     0.65       10.6          1            7         3   

   2     6074       3.3             0.21            1.12         -43.05         0.042            41                   67           0.9997   3.28    0.5593       9.8          0            7         3   

   1     6079       13.9             0.2            0.38          22.5          0.948            416                 -339          0.9781   3.15     0.37        5.1          0            8         2   

   0     6082       6.9             0.86           -0.61         -1.691         0.036            97                  121           0.9926   3.42    0.4749      10.8          0            7         1   

   2     6088       13.2            -0.12           0.08           34           0.266            248                 164           0.9938   3.56     1.42       10.82         0            7         3   

   0     6094       7.7             1.62            0.36          25.4         -0.119            266                  46           0.9971   3.24     2.41        8.1          0            8         1   

   1     6095        4              0.46             0             1.9          0.587            25                  -227           1.007    3.5     1.89       14.7          0            6         2   

   0     6098       7.6             0.21            0.6          -102.8         0.046            151                 165           0.9936   5.36     0.24        4.1          0            8         1   

   1     6102       11.8            0.24            0.33          12.3          0.046            31                  145           0.9983   2.88    0.5769       9.5          0            7         2   

   0     6105       14.1            0.26            0.13           4.5         -0.891           -208                 116            0.918   3.42      0.9       13.7          0            6         1   

   2     6113       3.4             0.22            0.56          -26.4         0.545           -205                97.44          0.9759   3.23     2.08        9.5          1           11         4   

   0     6116       12.1            -0.46           1.07           2.6         -0.043            26                  -174          0.9217   4.07     0.85       15.6          0            8         1   

   0     6120        5              0.47            0.4           31.5         -0.348           -223                 315            1.001   3.32     0.47       11.46         0            6         1   

   0     6121       11.7            0.32            1.91           7.9         -0.424            53                  -114           1.037   3.14      0.5       9.57         -1            7         1   

   1     6126       8.7             0.23            1.89          -56.6         0.054            136                 -103          0.9924    3.6     -0.02      10.8         -2            7         2   

   1     6144       11.5            0.315           1.5           56.6          0.281             5                  -130          0.9987   3.33      0.7        9.2          1           12         2   

   1     6145       7.4             1.52            0.35           6.1         -0.322            10                  -108          0.9924   4.04     0.52       12.5          1            8         2   

   0     6153       3.5             1.89            0.07            2           0.759           -154                  95            1.008   2.85     0.56       18.9         -1            6         1   

   1     6156       14.3            0.29            0.67          69.2         -0.442            248                 525            1.043    2.9    0.5382       6.5          0            8         2   

   2     6159        8              -0.05           0.63          46.4          0.044           -140                 163            1.016   4.14     0.69       15.4          0            9         3   

   2     6162       2.1             0.27            0.19          12.32         0.236           -256                 114            1.031   3.25    0.5332       8.6          1            7         4   

   0     6184       -4.7            -1.31           1.89          27.2          0.039            -99                 110           0.9578   4.36     -0.62      12.3         -1            7         1   

   0     6188       15.6            0.24            0.41          -34.4         0.046            64                  145           0.9998   3.06     0.39       14.3          0            8         1   

   1     6189       0.7             -0.03           -2.6          40.4          0.937            -42                 169            1.047   2.96     -0.26       6.4         -1            7         2   

   0     6191       8.2              0.5            0.35          44.8         0.0516           -168                 127           0.9976   2.23    0.5533      12.1         -1            9         1   

   1     6211       8.2             0.18            0.31          8.876         0.039            96                  249            1.013   3.07     0.52        9.5          1            9         2   

   1     6216       1.3             0.83            0.29           2.4         -0.118            -71                 119            1.003   3.03     0.33       12.9          0            8         2   

   1     6218       7.6             -2.47           0.22          24.5          0.203            57                  286           0.9509   3.71     -0.24       9.3         -1            8         2   

   1     6222        10             0.13           -0.67          -21.4         0.044            50                  152           0.9934   3.45     0.98        6.3          0            9         2   

   1     6235       2.8             0.12           -0.15           5.2         -0.209            38                   57            1.043   2.48     0.67       10.1         -1            7         2   

   1     6245       0.9             -1.08          -0.42          -32.6         0.055            45                  -219           1.004   3.68     0.52        9.2         -1            8         2   

   1     6248       7.8             0.25            0.34          13.7          0.044            11                  184            1.015    3.3     2.16        5.1          0            8         2   

   1     6253       17.8            0.32           -0.63           2.3          0.036            56                  153           0.9978   4.28     0.97         9           0            9         2   

   0     6256       10.4            0.48            0.44          22.2          0.071            21                   68           0.9992    4.2     -0.4         3           1           11         1   

   1     6257        -3             1.14            0.07         -1.141         0.013            37                  212            1.041   3.04     0.35        7.3          1            9         2   

   0     6259       6.7             1.74            1.36           1.4          0.106            22                   36           0.9525   4.26    0.3909       8.7         -2            8         1   

   1     6266       16.4            0.19           -2.81          1.976        -0.187            63                  143           0.9912   2.54     0.62        8.8          1            7         2   

   1     6268       13.8            -1.06           1.19          -36.6         0.046           55.26                -57           0.9946   3.33     1.52        9.4          0            8         2   

   1     6275       15.1             0.3            0.49          40.6          0.445            17                  105           0.9521   3.73     -0.62      12.4         -2            8         2   

   1     6280       5.8             0.45            0.27          20.8          0.081            190                 -230          0.9914   3.07     0.42       24.3          0            6         1   

   0     6283       6.4             -0.2            0.22          26.5          0.347           -119                158.4          0.9944   3.29     0.32       10.1         -1            7         1   

   2     6288        6              0.14            -0.6           -48         0.0564            -87                  89           0.9924   3.16     0.74       11.5          0            7         4   

   0     6289       7.2             0.585          -1.48          -14.9         0.04             143                 -26           0.9968   3.44     -0.93       9.4         -1            8         1   

   1     6301       17.7            0.37            1.32          -86.8         0.11            -123                  14            1.032   3.17     -0.39      13.6          2            8         2   

   1     6308        8              0.27            1.53          -12.9         0.053            18                  134           0.9973   4.44     3.56       -3.2          1            9         2   

   1     6314       6.7             0.44           -0.06          -15.4        -0.058            183                  11           0.9944   3.316    1.61       11.7          0            6         2   

   0     6315       11.5            -0.86           0.51            4           0.104            69                   23           0.9996   1.85     1.78       10.1         -1           12         1   

   1     6316       6.1             1.41            1.41           7.1          0.184           -225                 963            1.003    3.3     1.19       10.4          0            7         2   

   0     6317       6.7             0.27            0.33          -59.3         0.264             9                   45           0.9914   3.247    1.54       17.2          0            7         1   

   2     6318       6.8             0.28            1.99           7.6         -0.281            30                  162           0.9999   3.08     0.59        6.2         -2            8         3   

   2     6323       6.3             0.41            0.79           7.1         -0.072            154                 -59            1.004    3.2     0.42       11.6         -1            7         3   

   2     6329       4.8             -1.08           0.37          37.3          0.037           -262                 272           0.9646   3.219    0.18       12.2         -1            5         3   

   0     6336       6.7             0.56            0.13          14.9          0.206            15                   36           0.9592   3.61     -0.53       4.4         -1            7         1   

   1     6341       -7.1            0.345           0.34          -7.9          0.068            -28                 143           0.9618   3.24      0.4       10.1          1            6         2   

   2     6348       6.3             0.59            0.37           7.9          0.047            58                  -108           1.03    3.19     2.46       10.75        -1            7         3   

   1     6349       13.7            0.24            0.11          17.3         0.06981          -218                 126           0.9989   2.12     0.47        9.2          1            7         2   

   1     6365       -4.6            0.25            0.37          13.5          0.06             52                  192           0.9975   1.78     1.04        6.9          0            8         2   

   1     6372       8.5             1.67            0.34          90.5          0.041            32                  161            1.049   3.58      0.4       22.3          0            9         2   

   0     6376       13.9            -0.14           0.18           7.4         -0.401           28.96                -62            1.036   3.53     0.71         5           0            7         1   

   0     6378       7.8             -0.15           0.26           1.9          0.088            288                  53           0.9517   3.43     -0.95       9.2          0            9         1   

   1     6379       5.9             0.86            0.32          -54.8         0.022            -36                 -42           0.9722   2.43    0.3251      11.5          1            7         2   

   0     6382       15.7            0.29            1.23          11.7          0.073            40                  131           0.9958   3.38     0.34       14.5         -1            9         1   

   1     6383       6.9             0.34            0.74          11.2          0.174            -34                 573           0.9663   3.18     0.81       11.7         -1            8         2   

   2     6389       1.9             0.63            0.27           8.8          -0.4            -111                 -120           1.032   3.08     0.38        9.3          1            8         3   

   0     6390        8              1.13            0.03            5          0.1085            -8                  101            0.992    3.8     0.78       12.3         -2            9         1   

   2     6392       -1.2            0.24            1.07          48.6         -0.306            140                 746            0.992   2.95     0.49        18           0            6         3   

   2     6394       -8.1            -0.96           0.33           1.4         -0.077            256                  55           0.9616   3.21     0.16         7           1            8         3   

   1     6402       7.2             0.62            0.4           -14.5         0.526            17                  -305          0.9616   3.51     0.53        4.9          1            8         2   

   1     6404       8.7             0.17           -0.46          -26.7         0.215            32                  106           0.9959   2.72     -1.26      20.1          2            7         1   

   0     6405       -9.7            -0.23          -0.64         -0.2265        0.04              5                  -309          0.9913   3.99     -0.87      10.7         -1            6         1   

   0     6406       0.8             0.46            0.26          -51.9         0.467            131                  83           0.9911   3.53     2.24        5.7          0            8         1   

   2     6409       9.1             0.27            0.45          17.9         -0.454            28                 68.33          0.9664    3.2     0.46       10.1          0           10         4   

   2     6410       1.3             1.46             0             1.6          0.491            27                  -90            1.044   3.34     -0.99      11.53         1            7         3   

   1     6411       -3.3            0.23           -2.55           7.2          0.041            21                   90           0.9543   3.22      0.7        9.5          0            7         2   

   2     6421       9.9             -0.61          -0.99           2.6         -0.341            21                   77            0.98    3.28     0.51       11.4          1           11         3   

   2     6428       10.6            0.17            0.24          16.8          0.577             9                  162            1.079   3.17     0.38       12.9          2            8         4   

   0     6429       -3.5            0.57           -0.09           2.1          0.199            263                  26            1.029   3.41     1.89       18.2         -1            7         1   

   2     6432       18.5            1.52            -1.2          20.9          0.035            21                  109           0.9697   3.19     0.58       12.2          0            8         3   

   0     6436       15.9            -0.24          -0.97           1.8          0.565          -13.57                -307          0.9973   3.42     -0.32       7.3         -1            8         1   

   1     6437       6.1             0.33           -0.02           7.8          0.052            306                  5            0.9585   2.33     0.65        9.4          0            7         2   

   1     6438       6.4             0.73            0.6            30           0.112            247                 714            1.032    3.2     0.52        9.2          2           10         2   

   0     6445       13.7            1.13            1.57          28.3          0.323            370                 141           0.9934   3.26     0.47        3.5          0            7         1   

   2     6447        17             -1.19           0.41          11.9          0.048            73                  -513          0.9671   3.03    0.7249       9.4          0            8         3   

   1     6450       16.2            0.52            0.37          16.3          0.033            13                  -424          0.9973   4.01     0.79        5.4          1            8         2   

   1     6462       6.8             -0.36           0.54          -8.5         -0.028            19                   27            0.996   2.65     2.18       11.3          1            8         2   

   1     6467       15.2            -0.74           0.28           1.1          0.038           -341                 110           0.9917   1.92     0.42       10.5          0            7         2   

   1     6478       6.9             0.08            1.12          44.1          0.056           -141                 136           0.9975   5.11     1.13       9.552         0            7         2   

   1     6484       -4.1            0.37            0.86          27.6          0.238            45                  152            1.039   5.02     0.46       13.9          1            7         2   

   1     6492       -3.3            0.17            0.32          19.3          0.435            47                  150           0.9948   4.08     1.02        9.6          1            8         2   

   2     6497       7.4             0.27            0.75          11.8         -0.065           39.12                376            0.978   3.11      0.6       21.2          2            8         3   

   1     6504       4.3             0.15            -0.7           1.3          0.258           -197                 -501          0.9911   3.17     1.92       11.2         -1            7         2   

   0     6505       7.4             0.36            1.39           1.9          0.017            31                   69           0.9892   5.38     0.22        16          -1            8         1   

   1     6513       1.7             -1.07           0.38          33.8          0.571            48                  174            1.013   3.92     0.38       10.5         -1            8         2   

   2     6525       -1.2            0.21            0.38           0.8          0.02             22                   98           0.9791   3.24     0.32       11.8          0            7         4   

   1     6526       6.1             0.31            0.81          19.35        0.06128           134                 207            1.001   2.18     0.53       10.6          1            7         2   

   0     6528       5.3             -0.5            1.77           6.6         -0.246            22                  141           0.9917   2.44      0.6       17.1         -1            6         1   

   2     6540       0.7             1.51            0.31           6.8         -0.378           48.05               156.2           0.993   3.15    0.4693       13           1            8         3   

   2     6542       18.8            0.15           -0.73          51.5          0.152           -179                 190           0.9965   3.36    0.7811      14.1          1            9         3   

   2     6544       6.5             -1.26           0.39          17.3         -0.303            22                  -292           1.05    2.95      1.4        7.6          1            7         3   

   1     6548       6.4             0.24            1.16          0.95          0.041            -38                 131           0.9903   2.48     0.35       10.5          0            7         2   

   1     6552       6.5             0.17            0.33           1.4          0.541            14                  358           0.9462   3.18    0.7916      12.6         -1            7         2   

   1     6558       6.8             0.18            0.46           1.4          0.064           -212                 -273           1.043   3.37     0.45       11.1          0            7         2   

   1     6567       18.1            -2.78           1.08           8.5          0.047            52                  242           0.9549   2.15     2.03       -1.7         -2            7         2   

   2     6569       6.5             0.13            0.42           -56          0.035            11                   76           0.9701   2.42     0.76       23.73         0            7         3   

   2     6572       14.2            -0.7            0.39          70.3          0.058            26                  -102           1.034   3.33     2.77         9           1            8         4   

   1     6577       7.5             1.75            0.67          -55.8        -0.352            53                  166            1.022    2.9     0.41        2.7          2            8         3   

   1     6581       14.7            -0.83           0.44          48.9         -0.533            -93                  97           0.9769    3.1     0.85        22          -1            7         2   

   1     6588       7.4             0.16            1.33          13.7         -0.001            -38                 168            1.004   3.91     0.44        8.7         -1            8         2   

   0     6591       15.2            0.39            0.12          121.8         0.065            14                   24           0.9559   2.69     0.53       12.4          1            8         1   

   0     6594       -2.3            0.22           -3.06           1.7          0.381            322                 118           0.9991   3.74     -0.53      10.6         -1            7         1   

   1     6600       27.7            0.19             0            2.604        -0.529            149                 304           0.9838   3.02     1.24       12.3          2            5         2   

   0     6602       5.5             0.31            0.25          55.3        -0.00869           203                 165           0.9972   4.36     0.55       4.25          1            7         1   

   0     6604       10.5            1.68           -1.22          4.75          0.033           -264                 -24            1.012    2.2     0.42       11.8          0            7         1   

   1     6605       7.5             0.17             0            -50.2        -0.255            52                  -279           0.998   3.03     0.46        8.9          0            8         2   

   0     6614       6.3             0.27            0.29          12.2          0.543            59                   6            0.9978   3.58    0.6374       8.8         -1            7         1   

   1     6616       6.2             -0.03           0.76          -6.8         -0.091            14                 88.91          0.9943   3.45     1.02       14.2         -2            7         2   

   0     6621       7.7             -0.94          -0.67         -23.65         0.053            509                 435           0.9713    3.2      0.5        5.8          0            8         1   

   2     6640       8.3             0.35            0.42          23.7         -0.231           -172                 913           0.9499   3.02     2.49       16.8          0            5         3   

   1     6641       7.7             0.86            0.35          -22.4        0.03537           314                 370            1.02    3.36     -0.01       9.6         -1            8         2   

   0     6643       19.7             1.2            0.22          -82.9         0.08             136                  -3           0.9961   3.78     -0.73       9.9          0            9         1   

   0     6644       -0.7            0.24            0.36            2           0.031            27                  139            1.023   4.25    0.2704      16.8         -1            8         1   

   0     6649        5              -0.32           1.23           4.5          0.18             330                 178           0.9896   3.45     -0.57      10.4         -2            6         1   

   1     6650       -1.7             0.2            0.37          -41.8         0.028           48.62                -85              1     3.14    0.7311      11.8          0            8         2   

   2     6655       16.2            0.58            0.32            4          -0.462           -216                  92           0.9894    3.2     -0.4        8.3          1            7         4   

   0     6661       9.1             -0.93           0.24           2.1          0.388           -278                  28            0.999   4.88     0.87       10.2         -1           10         1   

   2     6672       6.7             0.33            0.36           6.6          0.009            170                 116           0.9981   2.35     1.59        13           0            7         4   

   0     6677       -1.1            1.17            0.24           7.8          0.43             53                  589           0.9969   2.87     0.754      13.2         -1            6         1   

   0     6688       9.3             0.48            0.29          53.8         -0.225            166                  16            1.03    3.22     0.72       11.2          0           10         1   

   2     6689       6.1             2.44            0.96           1.3          0.047            148                143.1          0.9925   3.71     0.46        10           1            6         3   

   1     6691       1.2             0.27           -1.08           2.2         0.03525           26                  117           0.9696   1.95      0.3       21.6         -1            7         1   

   1     6692       5.8             0.31           -1.13           4.5          0.024            28                   94           0.9785   3.25     0.61       18.2          1            6         2   

   2     6694       8.1             -0.5            1.66           8.1          0.297            155                 174           0.9923    3.1     -0.93      11.6         -1            9         3   

   0     6702       7.6             0.55            0.32           1.3          0.488            23                  203           0.9903   3.33    0.5339      16.5         -1            8         1   

   1     6714       18.5            1.02            -0.4           4.5          0.068           26.96                110            1.033    3.3     2.03        7.9          0            8         2   

   2     6716       19.6            -0.01           0.39          10.7          0.044            30                  180            1.027   2.49     0.71       10.8          1            8         3   

   1     6724        15             0.16            0.33           4.8          0.043           -233                 -683           0.992   3.01     1.71       10.59         0            7         2   

   0     6725       0.2             -0.09          -0.02          8.764         0.544            45                  147           0.9985   3.09      0.5        10          -1            7         1   

   1     6730       3.8              0.2            0.71           1.6          0.534           -145                 248            1.066   1.91     1.06       11.5          0            8         2   

   0     6735       5.1             1.41            0.54            7           0.046            160                 176            1.006   2.03      0.7        9.8          0            7         1   

   0     6738       6.8             0.48            0.08           7.8         -0.258            277                  38           0.9518   4.91     0.65        9.6          0            7         1   

   0     6739       16.1            -2.66           3.23          -16.5         0.044            -36                 -156          0.9932   2.64     -1.1       13.6          0            7         1   

   1     6743       7.8             0.19            0.29           5.5          0.042            44                  -181           0.993   3.19     0.47       10.3          0            7         2   

   0     6747       7.6             1.27            0.39          -27.3         0.038            21                  115           0.9652    2.1     0.67        10           0            8         1   

   2     6750       -0.7            0.32            0.26           12          -0.531            63                  170           0.9853   4.06     1.49        9.9          2            7         4   

   1     6751       3.9             -1.02           0.3            1.3          0.052            235                  86           0.9795   3.17    0.7687      16.95        -1            6         2   

   2     6753       8.1             -0.06           0.34           -38          0.048            -43                 -318          0.9326   2.99     1.06       11.3          0            7         3   

   0     6754       7.1             0.68            0.72          11.2         -0.456            392                  22           0.9969   3.48     -1.22      12.2          1            8         1   

   0     6755       6.3              0.3            2.1            7.4          0.053            34                  560            0.997   5.04     -0.94       3.6         -2            7         1   

   1     6762       6.9             1.59            1.83          -3.2          0.932            -87                 118           0.9955     3      0.63       17.5          0            7         2   

   1     6764       8.6             -0.7            0.25           3.4          0.024           -148                 -94            1.03     2.7     0.37        13           0            8         2   

   2     6772       -15             0.42            -0.6          35.4          0.048            16                   42            1.022   3.71     0.74        20           1            5         3   

   0     6774       7.2             0.62            0.01           2.3          0.065            22                  335           0.9654   3.32     0.51       11.8         -1            8         1   

   1     6787       7.4             -0.99          -0.47          34.5          0.037            -4                  -66            1.012   3.25     -2.14      12.4         -2            7         2   

   1     6789       9.7             1.845           0.49           6.1          0.122           -116                 577            1.018    2.8     1.14        9.3          0           10         2   

   1     6793       -5.2            0.39            1.54          42.6          0.037            -36                 138            1.023   2.71     0.43        4.5          0            7         3   

   1     6798       -2.2            0.28            1.98          26.7          0.079            400                 225           0.9948   3.05     2.03        7.7          1            8         2   

   1     6799        20             -0.51           2.33           2.2          0.09              5                   28           0.9988   3.14     -1.07       2.3          1           11         3   

   1     6800       -1.5           -2.305           0.76         -37.45         0.035            140                 -68            1.029   4.43     0.34        18           0            6         2   

   1     6802       5.4             0.375           0.4           14.7         0.02506           249                 133            1.045   3.19     0.52       12.9         -1            6         2   

   0     6808        6              0.28            0.25           1.8          0.221             8                  108           0.9929   2.41     3.68        9.3         -1            7         1   

   1     6809       10.1            -0.19           0.28           4.1         -0.342            191                 -89           0.9818   2.65     0.38       13.8          0            6         2   

   1     6812       7.8              0.4            0.22          -30.6         0.657            308                  23           0.9966   5.12    0.3192       16           1            9         2   

   0     6814       6.6             1.37           -0.85           3.1          0.718           -119                135.1          0.9464   2.95     0.45        11           0            7         1   

   0     6816       6.7             -0.85           0.3           -16.8         0.029            96                  127           0.9953   3.31     2.22        12          -1            7         1   

   0     6822       8.5             0.28           -1.44          13.8         -0.107            183                 327           0.9981   3.13      0.4        9.9          0            9         1   

   1     6829       7.2              0.4            0.49          -2.2          0.037            146                86.94           0.93    3.26     -0.05      10.48         0            8         2   

   0     6834       6.7             0.65            0.37          11.3         -0.528            79                  173           0.9963   3.08     -0.25       4.6         -1            7         1   

   2     6836       11.6            -1.9            1.4           -12.4         0.043            52                  -13           0.9515   3.35     0.44       10.7          0            6         3   

   2     6839       14.7            0.13            0.28           0.9          0.407           52.12                431            1.041   3.02    0.6409      11.2         -1            7         3   

   1     6840       5.4             0.205            1            12.55         0.051            90                  -155          0.9956    3.4    0.7242      11.2         -1            6         2   

   2     6843       10.2            -1.12           0.41           70           0.043            280                 151           0.9878   1.96      0.6       10.2          1            7         3   

   0     6846       2.9              2.4            1.58          -35.4        -0.122            293                 -100          0.9991   2.77     0.45        4.3         -1            9         1   

   0     6848       -5.1            0.67           -0.63           13           0.508            510                 567           0.9519   2.93     0.67        13          -1            8         1   

   0     6852       7.4             -0.94           0.49          -71.7         0.037            33                  156            0.992   2.33    0.4775      13.4         -1            8         1   

   2     6856        7              1.44            0.28          -47.9         0.333            258                 204           0.9737   3.79     2.11       10.28         1            8         4   

   1     6860       23.5            0.755          -0.89           7.7          0.049            53                  217           0.9672   2.95     2.15       9.578         1            7         2   

   2     6866      -12.6            -1.08           1.16          -0.4          0.11             55                  204           0.9383   3.16     -0.48       7.6          0            7         3   

   2     6870        7               0.2           -1.02          133.1         0.631            137                  68           0.9594   3.19     1.28       11.5          0            8         3   

   2     6878       14.7            0.48            0.31           1.4          0.046            136                 135           0.9517   3.72    0.5169       9.8          1            8         3   

   2     6880       7.9             0.25            1.1           -43.6         0.491            33                  549           0.9918     3      0.32       11.8          1            8         3   

   1     6885       7.6             0.23            0.29          119.4        0.06457          -126                  91           0.9949   4.39      0.8        9.7          2            8         2   

   1     6897       -2.6            0.08            1.26          12.8          0.062            19                  171           0.9981     3      1.31        4.6          0            7         3   

   2     6902       6.2             -0.62           0.27          3.748         0.041            51                  117           0.9622    2.3     0.33       12.4         -1            7         3   

   2     6904       6.5             0.18            0.48           18           0.404            31                  183              1     4.02     -0.72       8.9          0            7         3   

   1     6907       6.4             -0.05           0.2           26.1          0.059            -18                 -329          0.9931   5.58     1.29        5.9          0            7         3   

   0     6909        8              0.42            0.32          15.2          0.08            -383                 122            0.998   2.86     1.07        9.7          1            9         1   

   0     6914       0.3             -0.71           0.68          10.9          0.045            299                 334           0.9978     3      1.47        8.7         -2            8         1   

   1     6915       7.8             0.82            0.75           4.6          0.024            20                  198              1     3.06     0.66       14.3          2            8         2   

   1     6922        6              2.025          -1.01           7.9          0.229            68                  124           0.9994   2.25     0.53        9.9         -1            7         2   

   0     6924       7.5             0.51            0.26          -7.5         -0.412            24                  -261           1.021    3.3     0.53       10.83        -1            8         1   

   1     6933       -3.1            0.28            0.45          56.3          0.022            14                  -292          0.9934   4.15     0.61       11.1          0           10         2   

   1     6934       -1.6            0.32           -0.78          70.5          0.237            280                 -327          0.9926    1.3     0.43       13.6          1            7         2   

   1     6941       -1.6            0.89            0.85          -22.3        -0.558            -27                 155           0.9945   3.59     0.06       10.5          0            6         2   

   0     6957       8.1               0            -1.23           1.8         0.1293             3                   12           0.9964   1.25     -0.01       8.4          0            9         1   

   0     6960       12.1            0.42           -0.51           2.7          0.065            278                  18            1.033   3.328    0.87       11.8          2           12         1   

   0     6969       1.1             0.39           -1.04           2.7         -0.443           50.17                124            1.004   2.23     -0.08        5           0           12         1   

   0     6975       7.2             0.25            0.32          47.1          0.054            -67                 105            1.077   3.96     0.63       11.1          0            8         1   

   0     6980       6.4             0.25             1             33          -0.268            -94                 234           0.9955   3.51     -0.22      10.07        -1            7         1   

   1     6983       6.9             0.19            0.6           12.8          0.037            240                 534            1.024   2.92     0.59        2.3         -1            8         2   

   1     6987       6.5             0.55            0.22          -1.4          0.043            34                   90           0.9905   2.24     0.47        5.9         -2            7         2   

   0     6994        7              1.71            0.81           1.6          0.628            25                   42            1.091   3.34     0.87       11.1          1            8         1   

   1     6997       -2.8            -1.79           0.47           1.4         -0.406           -121                 187           0.9984   3.59     -0.32       9.5          1            7         2   

   0     7002       10.9            1.57           -0.69          -14.8         0.047            -82                 492           0.9961   3.17     -0.7        3.1          1            7         1   

   0     7010        -1             1.56            0.34          -60.9        -0.559            -82                  8             1.04    3.44     0.05       12.65        -1            7         1   

   0     7015       7.1             0.21           -0.64          109.7         0.616            24                  8.25           1.034   2.48     0.51        12           1            8         1   

   0     7019       6.4             0.28             0            82.2          0.045            46                  609           0.9952   3.157    0.46        9.4          0            7         1   

   1     7022       -2.1            0.31            0.97           -22         0.0302            19                   72           0.9954   3.107    0.72       18.5          1            9         2   

   1     7025        6              0.26           -0.92          10.14         0.046             6                  252            1.035   3.97     0.61       19.9         -1            7         1   

   0     7029       -2.8            -0.11           0.96          54.4          0.048            101                 207            1.027   2.54      0.3        9.1          2            6         1   

   0     7031        -4             0.32            0.07          45.5          0.054            63                  212           0.9953   3.22     -1.88       9.7         -1            7         1   

   0     7037       0.9              0.2            0.26           18           0.04             36                 154.2          0.9924   2.18     -0.17      10.8         -1            8         1   

   1     7038       14.3            -0.86           0.33           7.7          0.003            27                   98           0.9935   2.65     0.41       12.2          0            9         2   

   0     7043       6.4             0.32            0.88          53.8          0.05             214                 180           0.9721   3.33     -1.22       9.6         -2            7         1   

   0     7049       9.1             -0.48           0.42          1.433         0.479            106                 -169          0.9734   2.93     -0.74       9.4          1            7         1   

   0     7052       7.5             0.25           -0.25          -3.2          0.024            503                 -34           0.9956   3.18      1.9       10.8          1            8         1   

   2     7053        6              0.26            0.51          13.94        -0.527            10                   72           0.9539   3.31     0.48       9.65          0            7         3   

   1     7056        -3             1.73            1.6           -54.6         0.454            40                  107            1.004   3.26     -0.9       14.1         -1            6         2   

   2     7057       6.7             -0.21           0.08          3.75          0.067            266                  16           0.9933   4.34     -0.35      10.58         0            7         3   

   0     7080       7.4             0.27            0.61          67.8         0.04975           159                 193           0.9986   2.46     -0.13       9.2          0            8         1   

   1     7086       -6.8            -0.29           0.16          26.8          0.044            343                 -53            1.028   4.27     1.11       11.2         -1            6         2   

   1     7087       7.4             0.35           -1.03          -12.8         0.421            50                  231            1.001   3.64     0.54        9.2          0            9         2   

   1     7105       6.2             1.12            1.49           50           0.046           54.07                136            1.053   3.17     -0.87      11.02         0            7         2   

   1     7108       7.3             0.07            0.49           9.4          0.432            29                  134           0.9939   2.99    0.5217       11          -2            8         2   

   1     7121       7.1             0.36            1.11          42.4          0.634            211                 140            0.989   3.11     0.63       11.7         -2            8         2   

   0     7122       19.8            0.58            0.37            1          -0.027            10                  -118           1.026   3.08     -0.87      11.4         -1            8         1   

   0     7125       6.3             0.21           -0.03          65.5          0.051            46                  465           0.9928   3.23     0.83        13           0            7         1   

   0     7132       15.4            0.28            -1.6          63.1          0.042            -86                 195           0.9912   3.22     -0.14       5.6          1            7         1   

   1     7134       15.2            1.61            -0.8          50.9          0.042            20                  -200          0.9996   3.71     1.98        12           0            8         2   

   0     7151       11.7            0.35            0.74          -56.4         0.044            -99                 -36            1.061   3.13    0.6106      14.4          0            8         1   

   2     7152       21.5            0.18            0.31          50.7          0.058            38                  519           0.9931   3.52     0.53        10          -1            8         3   

   0     7157       5.5             0.375           0.38          -50.7         0.036           -150                  98           0.9914   3.29     0.59       14.1          0            6         1   

   0     7159       14.3            0.55           -1.45           1.8          0.522            161                 309           0.9669   3.49     0.68       10.5          0            8         1   

   0     7166       8.3             0.43           -1.08          64.5          0.557            -72                 -122           1.028   3.11     1.68        6.6          1            8         1   

   1     7167       6.8             0.22            0.49          -40.7         0.052            -75                 128           0.9159   3.93     1.01       16.1          0            8         2   

   0     7177       6.7             -0.63           0.37          -18.8         0.036            45                  245           0.9896   3.19     0.51       10.1          0            7         1   

   0     7179       -4.4            -0.86           0.19          28.9          0.408           -115                 516           0.9924   3.14     0.07       10.4         -1            7         1   

   2     7181       7.1             0.11            0.07           1.6         -0.139           -220                 -19           0.9695   3.43     0.59       10.2          2            8         3   

   1     7183       7.6             1.09            0.9           31.4          0.207            49                  146           0.9911   2.19     1.97       11.6          2            8         2   

   1     7186       14.7            0.34            0.66          -9.4         -0.524            242                 164           0.9833   2.55     -1.2        3.6          0            7         2   

   2     7193       6.6              0.3            1.76            3           0.551           -233                 762           0.9852    3.1     0.63       21.7          1            7         3   

   1     7205       6.1             0.125           0.25           3.3         -0.512            10                  -146           1.036   3.98    0.4846       9.2         -1            6         2   

   0     7207       5.9             0.25            1.73          12.4          0.224           -127                 162           0.9916   3.422    1.56        4.9          0            6         1   

   1     7209       13.5            0.33            2.01          -15.7         0.056             6                  -752           0.994   3.58     0.71         6           0            9         3   

   1     7216       1.5             1.12            0.24           1.5          0.05             56                  189           0.9931   3.24    0.5106        0           1            7         3   

   0     7232       22.4            1.33            0.5           -9.3         0.06708           10                   21              1     3.12     1.18        4.9          0           13         1   

   1     7235       5.3             -0.74           0.12           6.6          0.043            -20                 504           0.9647    2.5    0.6663      10.4         -1            6         2   

   0     7238        17             0.36            0.26          40.9          0.03            43.5                  39           0.9948   3.03     0.49        12           0            9         1   

   0     7240       7.2             0.61            -2.8           7.2          0.06             239                 485           0.9727   4.21     1.62        4.9         -1            8         1   

   0     7243       12.7            2.86            0.14          -36.9         0.88            -189                 128           0.9948   3.98     0.51        9.4         -1            7         1   

   0     7252       4.5             -0.31          -0.17          -27.2         0.108            30                  548           0.9974   2.96     0.57        9.4         -1            8         1   

   0     7269       6.6             0.38            1.54           2.6          0.041            24                   81           0.9915   3.18      0.5       10.9         -1            7         1   

   1     7275       16.6            0.02           -0.67          -104         -0.358            10                  102           0.9467     3      0.662      11.6          0            8         2   

   0     7281       8.3             0.43           -0.05          77.8          0.792           -9.25                -95           0.9979   4.56    0.7955      9.237         0            9         1   

   0     7283       6.2             0.47            1.2            8.3          0.029            288                 142           0.9058   3.22     0.14       -0.6         -2            7         1   

   2     7287       4.7             0.15            0.28          -27.1         0.029            284                 107            1.041   3.24     0.46       10.4          2            7         3   

   2     7289       -3.2            0.19            1.55           1.2          0.068            11                  405           0.9918   2.83     -0.02       11           2            9         3   

   2     7291       3.9             0.54           -0.84          -14.9         0.32             96                  -152           1.003    3.6    0.6916      10.6          0            7         3   

   2     7294       13.8            -0.44          -1.44          11.6          0.044            61                 189.9          0.9966   3.14     1.58       18.6          2            7         3   

   2     7304       5.2             0.21            0.81          92.3         -0.279            225                  95           0.9895   3.93     2.15       12.4          1            6         3   

   1     7308       7.1               2              0             -39          0.361           -147                 -174          0.9962   3.22     0.36        6.5          1            8         2   

   1     7313       3.3             -0.49           0.09          33.8         -0.195           -125                  93           0.9726   3.03     2.81       10.6         -1            8         2   

   1     7319       6.9             1.58           -0.35          -27.9         0.025           -168                 354           0.9957   3.23     1.48       10.8          0            8         2   

   0     7325       7.7             -0.73          -0.05           5.1         0.07719           81                  142            1.049   3.36     0.33       10.1         -1            7         1   

   0     7326       -6.8            0.665           0.58           1.5          0.066            27                   49           0.9966   3.39     2.02       14.1          0            8         1   

   2     7330       -1.9             0.2           -0.45           1.5         -0.094            94                  147            1.035   3.38     0.56        9.9          1            7         3   

   1     7332       7.3             0.22           -0.59         -25.55         0.598           31.5                395.5          0.9974   3.36     1.74        4.2          1            8         2   

   1     7337       5.7              0.2            0.3            6.1          0.037           -370                 120           0.9939   3.24     0.51       10.8         -1            8         2   

   0     7341       7.9             1.16            0.35          51.4          0.157             1                   44           0.9973    3.3      2.4        9.5          0            9         1   

   2     7346       7.2             -1.12          -1.16          60.5          0.055            -89                 205            1.013   3.12      0.5        7.7         -1            8         3   

   1     7353       7.3             0.25            0.36          3.696         0.034            262                 129           0.9435   3.25      0.4        7.4         -2            8         2   

   2     7354       4.1             0.24            0.33           1.2          0.028            302                 433           0.9686   3.03     0.51       12.5          0            9         3   

   2     7361       7.6             -0.96           1.82          27.7          0.04            65.22                -36           0.9907   2.92     0.618      20.6          0            8         3   

   0     7366       4.7             0.47            1.25           4.8          0.275            14                   28           0.9952   2.15     0.73       11.2          1            9         1   

   2     7368       6.4             0.12           -0.75           9.6          0.237            209                 267           0.9965   3.01     1.83       11.7          1            7         3   

   2     7372       9.1              0.5            0.93           -10          0.065            92                  -62           0.9977   3.32     0.78       10.5          0           10         3   

   1     7375       7.2             0.34            0.68          5.574         0.312            245                  68           0.9959   3.37     1.67       10.1         -1            8         2   

   2     7377       7.7              0.2            0.44          13.9          0.218            251                 130           0.9986   3.11     0.48        10           2            8         3   

   2     7380       6.4             0.16            2.77           -57          0.037            148                 -247          0.9959   3.38     -0.26       9.8          1            7         3   

   2     7382       6.4             -0.24           0.4            1.5         0.05794           220                  28           0.9897   2.65     1.01       12.32         0            7         3   

   0     7385       7.5             0.32            0.26           1.8          0.042            265                 -187          0.9938   3.07     0.38       14.9          0            8         1   

   0     7392       8.5             1.52            0.36          66.3          0.041            208                  34           0.9982   3.08     0.31        10           0            9         1   

   1     7395       -1.6             0.3            1.65          1.165         0.65             155                 111           0.9871   3.12     -1.19       4.3          1            8         2   

   2     7397       2.1             1.51            1.95           55           0.039           -221                  26           0.9649   3.18     2.12       12.1         -1            8         3   

   2     7403       14.9             0.9            0.37           8.8          0.037            31                  103           0.9939   3.13     0.49       10.3         -1            8         3   

   2     7406       6.9             -0.8            1.95         -3.776        -0.209            120                74.14          0.9932   2.99     -0.19       9.2         -1            8         3   

   0     7409       11.1            1.26            0.69           -48          -0.36             5                   82           0.9986   3.17     1.28        7.8          0           12         1   

   1     7410       7.4             -0.45          -0.58          19.9          0.03             100                 433           0.9953   3.13     -0.26       12           0            8         2   

   1     7412       1.2             0.72            0.02            2           0.073            226                 -352          0.9968   3.92     0.57        3.2          1            8         2   

   1     7419       6.7             0.26            0.31          -37.6         0.04             39                  173           0.9918   2.13     0.51       23.2         -1            8         2   

   1     7425       3.6             0.61           -0.21           6.9         -0.428            59                  503           0.9959   3.13     0.45        9.3         -1            7         2   

   2     7435       6.2             0.34            -0.8           6.1          0.032            19                   86           0.9893   3.04     0.26       13.4          2            7         4   

   1     7438       -2.3            0.28            0.4           -67.3        -0.363            40                  143            1.005   3.28     0.59        11           0            7         2   

   1     7440       8.1             0.34            0.28           7.5         -0.352            70                  245           0.9754   4.26     0.79        9.8          1            9         2   

   1     7447        -3             -0.58           0.93          -56.7         0.579           60.55                140           0.9899   2.45     0.62       10.6         -1            6         2   

   1     7449        7              0.25            1.73          15.2         -0.055            40                  364           0.9982   4.84    0.5887       6.1         -2            8         2   

   2     7456      -16.2            0.15            1.65          17.9          0.027            17                  123           0.9629   3.36     0.78       15.8         -1            6         3   

   1     7464       9.4             0.16           -0.16            1           0.027             8                  250           0.9399   3.265    0.39       9.939         0            7         2   

   0     7478       6.3             0.37           -0.83          25.3          0.257            313                 346            1.022    3.1    0.4148      13.8         -1            7         1   

   1     7480       6.4             0.83            1.26           7.2          0.047            175                149.5           1.02    3.11      0.6       14.5         -1            7         2   

   2     7481       2.1             -0.82           0.22           10           0.052            36                  414            0.997   3.08     0.46        9.6          1            7         3   

   1     7483       9.6             -0.33           0.52          -1.39        -0.432            -78                  25           0.9782   3.36     0.59       12.4          0           10         2   

   0     7484       6.4             0.27            0.32           4.5          0.24             582                 572           0.9948   1.86     1.82        9.4         -1            7         1   

   2     7491       15.3            1.32            0.24          -29.2         0.521           -137                 221            0.995   3.16     0.38       14.5          0            8         3   

   0     7494       6.7             0.33            0.49          -8.4          0.534            -97                  94            1.041   3.11     0.97       11.4         -1            8         1   

   0     7501       9.3             0.35           -0.72          -32.6        0.07869           46                  444            1.027   3.73     -0.96      12.3         -1            8         1   

   1     7503       6.5             -1.01          -0.67          -58.4         0.046           60.33                201           0.9671   2.63     0.46       18.5          0            7         2   

   0     7509       6.6             1.335           0.6           22.4          -0.02            -75                 -256          0.9973   3.35     0.54        8.9         -1            7         1   

   2     7517       -1.6            0.51            0.94           6.4          0.08            -262                 -334           1.022   3.27     0.19       11.3          1           10         3   

   2     7518       6.8             0.37            1.44           1.9          0.024            294                 106           0.9899   4.59      0.6       16.5          1            7         4   

   0     7519      -13.5             0.7            0.13          3.85          0.497            105                 154           0.9919   4.15     0.59       11.3         -2            7         1   

   2     7521       12.8            0.26            0.05            2          0.1027            149                 516           0.9908   3.33     0.61       18.2          1            7         3   

   0     7522       -2.8            1.62            1.18          -45.8         0.044           42.44                180            0.991   2.98    0.2784      11.9         -1            5         1   

   1     7536        7              -0.61           1.54          14.6          0.381            227                 737           0.9994   3.34     0.67        8.8          0            8         2   

   0     7539       7.1             0.735           0.16           1.9           0.1             15                  189           0.9883   3.27     -0.65       9.3         -1            8         1   

   1     7547        8              0.01            1.5           17.2         -0.522            98                  -11           0.9996   2.96      0.9        5.7          2            8         3   

   0     7549       16.7            0.21            0.28           4.6          0.309            40                  199           0.9964   2.84     -0.09       10           0            6         1   

   0     7552        7              -0.89          -1.06          15.7          0.036           64.7                 109           0.9912   0.76     1.51        7.2          0            8         1   

   1     7554       6.5             0.99            0.27          -84.4        -0.077            44                  443           0.9799   1.66    0.0498       9.4         -1            7         2   

   1     7556       7.7             1.54            1.94          7.93          0.046            60                   -7           0.9594   3.08     1.35       13.4          0            9         2   

   1     7564       7.7             0.39            1.82          10.91         0.056            293                110.8          0.9998   3.27      1.5       15.7          0            8         2   

   0     7566        6              1.38           -1.13          15.5         -0.313            31                   53           0.9667   3.43     0.44        9.4          0            7         1   

   2     7570       10.7             1.2           -0.38          14.9          0.039            47                  730            1.003   3.14     0.35        14           0            7         3   

   0     7571       6.9             0.28            0.4            8.2          0.036            15                   95            1.011   2.37     0.33        8.5          1            8         1   

   1     7572       14.1            1.52             -1            5.4          0.053             5                  104            1.009    3.3     -0.99       4.6          0            7         2   

   0     7575       7.8              1.5            0.22           1.4         -0.104            24                  -157          0.9963   4.41     0.48         6          -1            8         1   

   1     7586       14.6            1.43           -1.06           2.5         -0.272             8                   20           0.9992   2.74     0.82       10.3          1           13         2   

   2     7589       -2.9            0.24            0.19          46.6          0.048            -4                  344           0.9874    3.1     0.71        9.7          1            8         3   

   0     7590       8.8             -0.82          -1.04           8.7          0.514            20                   90           0.9835   2.87     0.14       10.63         0            8         1   

   1     7597       7.2             0.27            0.28           -31          0.188            205                 394           0.9686   3.08     0.39        11           0            8         2   

   1     7602       7.2             0.25            0.78          14.4          0.055            70                  -208          0.9986   3.12     0.38         9           1            8         2   

   2     7604       10.4            0.32            1.41          46.1          0.026            34                   46           0.9643   2.09     0.35       18.6          0            8         3   

   0     7605       6.5             0.29           -1.27            3           0.036            38                   93           0.9906   3.16     2.37       15.6          0            7         1   

   0     7612       12.7            -1.15           0.26            2           0.111            -34                  60            1.027   2.94     2.08        6.7          0           11         1   

   1     7615       12.5            -0.18           0.18          29.4          0.45            -170                 -96            1.053   3.06      0.5         3           0            7         3   

   0     7617       6.8             -1.81           1.39          37.5         -0.757           -12.7                245           0.9494   3.23     0.23        3.5          0            7         1   

   1     7624       7.2             0.27            1.84            8           0.044           -131                  55           0.9964   3.71     -0.64       9.2          0            8         2   

   2     7632       6.6             0.24            0.45          -44.3         0.603            42                  587            1.025   3.56     0.47       10.89         0            7         3   

   1     7639       10.5            1.37           -0.61          49.3         -0.349            101                  52           0.9937   2.99     -0.65      11.7          1           10         2   

   0     7642       -3.5            0.55            0.21          5.85          0.241            40                  -68           0.9588   1.99     0.57       12.8          1            8         1   

   1     7643       0.9             1.55           -1.04          90.5          0.333            18                  458           0.9921   2.93     -0.27       11           0            9         2   

   1     7649       -3.3            0.19           -0.37          -50.2         1.211           -48.5                158           0.9986   3.14     1.46        9.1          0            8         2   

   0     7650       6.3             0.62            -0.7           6.3         -0.272            49                  152            1.024   3.29    0.3011      17.1         -1            7         1   

   1     7653        6              0.26           -3.12            7           0.134            50                  481           0.9959   4.16     1.99       15.2          0            6         2   

   0     7654       -2.3            0.47            0.32          34.5          0.009            187                147.1          0.9958   3.21     0.34       10.48         1            7         1   

   2     7657       5.2             -0.72           0.28          21.8          0.028            22                   98           0.9907   3.94     0.37        8.3          1            7         3   

   0     7662       -1.7            0.26            0.21          16.2          0.528            263                 523            0.998   3.02      0.5        9.8         -1            9         1   

   1     7669       5.5             1.74            0.23           14          -0.162            16                  124           0.9944   3.26     0.38       11.5          0            6         2   

   0     7671        8              -1.01           0.36          7.569         0.46             191                 333            1.017   4.08     0.72       11.6          0            9         1   

   0     7675       2.6             1.19            0.21           5.1         -0.191            -37                 182           0.9742   3.82     1.52        9.6          0            7         1   

   2     7678       10.8            0.28            0.29           1.6          0.052            231                 262           0.9929   4.32      1.7       10.6          0            7         3   

   2     7682       -6.4            -0.3           -0.38          8.761        0.01587           60                  328           0.9932   3.24     0.66       16.4          0            8         3   

   0     7688       24.3            -0.54           0.24          19.95         0.074            32                  174           0.9992   3.18     0.44       15.8         -1            7         1   

   1     7689       7.2             0.47           -0.35          10.1          0.083            298                 182           0.9118     3      -0.66      22.4         -1            8         1   

   1     7690       6.1             0.16            0.78           1.2          0.209             7                  -399          0.9522   4.42     -0.76        5           1            8         3   

   0     7692       7.8             0.26            1.75          56.5          0.045            21                  -188          0.9931   1.93     0.98       10.3          0            9         1   

   2     7699       7.2             -0.14          -1.05         -118.2         0.59             237                  63           0.9895   2.09     0.53       13.3          1            8         3   

   1     7705       12.8            0.16            0.27          47.5          0.109           -166                 168           0.9433   4.29     0.37        5.9         -1            6         2   

   2     7712       6.9              1.5           -0.45          -43.7         0.059            36                  174           0.9917   3.74    0.7517      11.34        -1            8         3   

   1     7726      -12.4            -0.95           0.16          14.9          0.426            59                  240            0.999   2.22     0.45        8.9          1            8         2   

   0     7728       6.2             0.39            0.25          -4.25         0.476           3.855                -570          0.9917   2.69     1.95       -0.4         -2            7         1   

   1     7735       10.3            0.53            2.11          -31.5         0.063             6                   25            1.041   2.45     3.12       10.4          1           11         2   

   0     7737       6.4             0.09            0.32           1.4          0.602            124                  67            0.992   2.74     0.41       11.4         -1            7         1   

   1     7739       17.4            1.56            0.66           2.9          0.679            63                  -270          0.9993   3.85     0.34       12.5          0            7         2   

   2     7743       -1.1            0.61           -0.49          -56.1         0.037           -200                 113           0.9878   3.12     0.23       25.1          1            7         3   

   1     7744       6.2             1.19            0.36          -1.7          0.822            116                 119           0.9682   3.23     0.27        4.9          2            7         2   

   0     7746       1.9             0.08            0.49          44.1          0.05             93                  148           0.9945   3.46     0.44       10.9         -1            8         1   

   0     7749       5.9             0.51           -0.08           1.7         -0.067            13                   31           0.9976   3.36     1.49        4.9         -1            8         1   

   2     7750       10.7            -0.33           0.37          39.4         -0.185            103                 220           0.9637   3.62     0.65       11.5          0           11         3   

   1     7752       6.2            -0.595           0.89          -41.4         0.036             4                  128            0.917    3.4     1.99       12.2          0            7         2   

   2     7755       7.2             0.57            1.1            9.8          0.081            17                  289           0.9734   3.38     -0.3        6.2          1            8         3   

   1     7756       7.2             0.39            2.09           11           0.047           42.77                178           0.9976   4.34    0.6259      12.5          0            8         2   

   2     7762       5.8             -0.7            0.32          -3.9          0.024            28                  455            1.004   3.78     0.485       8.8          0            6         3   

   1     7764       7.2             1.82            0.18          -23.4         0.604            37                   31           0.9976   3.39     0.72        9.6          1            8         2   

   0     7769        0              0.34            0.39           6.1          0.046            29                  -103          0.9776   3.48     -0.05      10.7         -1            7         1   

   0     7770        -1             1.49           -0.51          12.1         -0.425            68                  210            1.02    3.05     0.24       12.3         -1            8         1   

   2     7776       6.5             0.26            0.28          -52.8         0.046            80                   19            1.028   3.18     -0.57       7.8          1            7         3   

   2     7778       10.1            -0.23           0.44           1.5          0.046            187                 182           0.9946   2.74     0.52       12.3          1            7         3   

   0     7784       2.5             0.015           0.04           -54          0.464            48                  111           0.9906   2.14     0.32       14.7         -1            7         1   

   1     7786      -10.3            1.47            0.31          14.5          0.045            -9                 83.45          0.9986   4.15     -0.33       8.8         -1            8         2   

   1     7789       5.7             0.135           1.04          -91.8         0.042            19                  695            1.044   3.79     0.42       10.47        -1            6         2   

   1     7793       6.9             1.285          -2.97          -33.4         0.526           -212                  63           0.9473   4.24     0.78        9.9          1            8         2   

   0     7794       6.1             -0.03          -0.52          30.9         -0.104            -11                  45           0.9226   4.63     -0.83      16.8         -1            7         1   

   1     7804       5.8              -1             0.22          -52.1        0.09873           42                  206            1.04    3.32     0.38       12.3         -1            6         2   

   1     7811       7.5              0.3           -0.08          6.55         0.08171           -36                  78           0.9689   3.265    3.17       11.1          1            8         2   

   0     7813       6.4             0.37            0.12          -26.6         0.056             6                   91            1.008   4.11     0.46        8.4          0            7         1   

   0     7815       6.8             2.01            0.22          -60.4         0.443            180                 -344           1.03     4.4     -0.65      15.7          1            8         1   

   1     7817       19.8            0.43            -0.8          -47.7         0.145            -49                 120           0.9962   3.21     0.49       10.2          0            9         2   

   1     7818       9.7              0.2            1.61           1.2         -0.547           48.08                -89           0.9926   4.49     0.34        9.9          0            8         2   

   2     7821       5.6             0.86            1.37           0.9          0.557             7                  140           0.9408   3.45     -2.82      14.8          1            7         4   

   2     7825       7.4              1.3            0.04          10.2          0.043            324                 175           0.9536   2.98     -0.5       11.9         -1            6         3   

   2     7830       6.7             0.32           -2.12          33.4          0.031            31                  376           0.9895   3.12     0.35        7.8          1            7         3   

   1     7832       6.5             -0.21           0.8           -4.6         0.08191           32                  -144           0.981   2.13      0.5        9.2          0            7         2   

   1     7835       6.8             0.28            0.35          -44.3         0.042            16                 118.8           0.975   3.19     -2.23      12.4          0            7         2   

   2     7839       2.8             1.35            0.19           1.7          0.603            280                 155            1.002   3.32     1.67       12.6          2            6         3   

   2     7842       0.6             0.18            0.35           24           0.603            48                  108            0.941    2.4     -1.39       6.2          1            7         3   

   1     7849       -1.8            0.21           -1.29          51.8         -0.927            131                  99           0.9927   3.26     0.33        3.6          0            8         3   

   0     7856       -8.7            0.22           -0.26          -35.7        -0.757             3                  358            1.01    3.13    0.0196      12.9         -1            7         1   

   0     7857       6.6             -0.86           0.21           2.9          0.026            165                 126           0.9909   3.22     0.38       11.3         -1            7         1   

   1     7863       7.2             -0.15           2.04           1.2          0.037            11                   95           0.9938   2.96     0.36       16.4          1            8         2   

   2     7866       6.6             -0.27           0.28           23          -0.244            55                  392           0.9869     3      0.52       12.5          0            7         3   

   1     7871       5.5             0.16            0.31          7.252         0.026            -22                  68           0.9691   4.49     0.44       11.63        -1            6         2   

   0     7875       7.2             0.16            0.26           7.1          0.054            209                  27           0.9966   3.38    0.6364      10.1         -1            8         1   

   0     7882       -4.3            2.01            0.09          57.2          0.697            190                 -12           0.9676   3.22     0.72       13.9         -1            8         1   

   0     7887       10.3            2.93            2.03           2.2          1.199            79                  -107          0.9673   3.278    1.69        9.7          0           11         1   

   2     7888       6.4             -1.24           0.3           37.6         -0.976            33                  125            1.026   3.03     -0.58      12.2         -1            7         3   

   0     7891       16.1            0.22            0.39          -27.4         0.463            434                 -256          0.9392   2.66     1.49       11.2         -2            8         1   

   1     7895       -2.7            0.38            0.53           2.1         -0.572            -48                110.4           0.995   1.06     1.99       17.6          1           10         2   

   2     7901       18.1             0.4            0.36           1.3          0.034            32                  509           0.9906   3.129    1.75       11.3          0            7         3   

   0     7906       -0.4            0.17            0.72          62.5          0.614            10                  -167           1.014   4.29      0.5        10          -1            6         1   

   1     7908       19.1            -0.4           -1.15          -42.1         0.048            35                  -150           0.995   2.59     2.03       17.2          0            9         2   

   0     7917       7.6             -0.53          -0.64          12.7          0.465           -135                 354            1.028   3.16     -1.82      11.4         -2            8         1   

   0     7924       5.6             -0.72          -1.09           1.3         -0.146            199                 457           0.9937   5.49     3.03        10           0            7         1   

   1     7948       -2.8            -1.04           1.67           4.2          -0.1             69                   39           0.9663   2.75     0.74       12.8          0            6         2   

   2     7950       5.9             0.22           -0.62          32.6          0.362            -18                 261           0.9483   2.78     1.82       10.8          1            6         4   

   0     7955       7.6             1.56            0.46         -100.4         0.409             6                  -199          0.9804   3.64     -0.65       4.1          0            8         1   

   1     7957       3.9              0.3            1.97           35           0.038            105                 200            1.009    2.9     -1.02       9.5          1            7         2   

   0     7959       7.1             -0.88           1.02          55.2         0.03166           198                  0             1.043   3.24     -0.41      12.5         -1            8         1   

   2     7967       -2.8            -0.69           0.84           3.9          0.325            45                  130           0.9632   3.31     0.85       14.65         0            6         4   

   0     7969        9              0.57            0.02          -58.6         0.077            18                  84.1          0.9523   2.75     0.62        7.8          0            8         1   

   1     7971       -2.7            0.21             2            -15.8         0.042            36                  167           0.9456    2.1     -0.66       5.2          1            8         2   

   1     7974       15.3             0.2            0.36           2.8          0.41             292                 -392           0.94    3.168    0.38       12.6         -1            8         2   

   0     7976       -3.1            1.51           -0.35           1.6          0.628            191                 131           0.9445   3.93    0.5208      10.5          0            8         1   

   2     7986       -6.5            0.36            1.42          -16.2        -0.159            58                  135            1.047   3.22     -0.82      11.6          1            8         4   

   0     7987       -3.8            1.96           -0.97           1.8         -0.188            12                  -29           0.9977    3.5      0.7         9          -1            8         1   

   2     7993        9              0.54            0.5            0.1          0.048            26                  -563          0.9918   2.54     0.34       12.4          0           10         3   

   1     7996       -5.2            0.19            0.35           1.5          0.037            -68                 107           0.9901   3.18     0.68        12           0            7         2   

   0     7998       6.6             0.36            0.52          -25.9        -0.506            115                 140           0.9963   3.07     1.04        3.9          1            7         1   

   2     8018       10.9            0.44            0.76          6.55          0.58             136                  76           0.9734   3.73     0.22        12          -1           12         3   

   0     8019       11.6            0.56            0.3           12.8          0.271           72.29                454           0.9549   1.38     0.52       12.1         -1            7         1   

   0     8027       18.5            -0.83           0.34          -42.3         0.035            34                  177           0.9969   4.09    0.4569       2.4         -1            7         1   

   1     8036       11.3            0.22            0.39          3.862         0.038            21                  149            1.018   3.02     0.54       14.4          0            7         2   

   1     8040       6.2             -1.17           0.36           -32          0.045            249                 180            1.006   3.08     -0.4        4.9          1            7         2   

   0     8044       5.6             0.66           -0.32           3.3          0.087             3                   11           0.9617   2.91     1.42       10.48         2            6         1   

   1     8050       -9.7            -0.33           0.34          -27.6         0.039            99                  140           0.9959   3.02     -0.41       7.7         -1            8         2   

   1     8052       9.9             1.56            1.17           2.3          -0.04            16                   23           0.9991   3.98     0.62       14.3          0           11         2   

   2     8054       9.9             0.95           -0.41          -16.2         0.087            220                 220            1.007   2.77     0.44       11.9          1           11         3   

   1     8057       6.2             0.78            0.26          -56.5        -0.192            -71                 158           0.9883   3.52     -0.33      12.2          0            7         2   

   2     8058       3.9              0.7            -0.6          24.1         -0.067            266                 115           0.9733   2.38     -2.82      10.9          0            7         3   

   0     8059       19.5            0.12           -0.68          -52.7         0.184            76                 192.4          0.9952   3.97     0.42       13.4          0            8         1   

   2     8066       1.6             0.18            0.6           19.25        -0.213            38                  167            1.026   2.93     0.52        9.1         -2            7         3   

   2     8070       7.5             0.79            0.38          12.7         -0.297           451.5                592           0.9971   3.11     -0.36      10.4          2            8         3   

   2     8072       6.1             0.22            0.66          47.4          0.43             40                  129           0.9919   5.98      1.8       10.9          2            7         3   

   0     8078       5.7             0.15            0.28          13.18         0.045            240                 151            1.012   3.22     -0.07      11.2         -1            6         1   

   1     8079        6              0.24            0.49           5.8          0.053            204                 216           0.9942   3.01     0.98       13.5         -1            7         2   

   2     8080       7.1             0.12            0.3            11           0.018           -152                  16            1.011   4.06     0.52       11.9          0            8         3   

   2     8081       4.8             0.33            1.13          -12.7         0.044            205                 -173           0.987   2.44     -0.94      13.3          0            8         3   

   1     8088       7.1             0.23            0.24          -1.5          0.039            90                   33           0.9948   3.23     0.28       10.48         0            8         2   

   0     8091       5.2              0.4            -0.4           4.6          0.425             8                  -71           0.9957   2.73     2.86        9.1          0            8         1   

   0     8094       18.4            0.25            0.29           7.5         -0.072           -285                 -223          0.9875   3.08     0.38        7.4          0            8         1   

   0     8095      -13.1            0.27            0.98          -58.5         0.02             11                 66.83          0.9436   3.32     1.34       12.6         -1            6         1   

   2     8099       -0.8             0.2           -1.57          63.8          0.031            127                  77           0.9905   2.01     0.36       10.9          0            6         3   

   2     8101        7              0.15            1.68         -1.353        -0.315            35                  477            1.006   3.22     0.42       14.9          1            8         3   

   2     8102       6.2             -0.85           0.43           2.6          0.036            37                   92           0.9422   3.27     -0.44      11.5          1            7         3   

   2     8116       -0.1            -2.34           0.28           4.9          0.03             29                   98           0.9902   4.22     0.58       12.8          0            7         3   

   2     8125       11.1            0.24           -0.15          -22.6         0.229            298                 401           0.9954   3.23     0.52        9.3          0            7         3   

   2     8134       6.7             0.48            0.32           2.5          0.288            22                  469           0.9889   4.29      1.1        17           2            8         3   

   1     8139       7.7             1.14            0.26          -44.4         0.089            23                  560            1.018   2.07     -1.01       7.7          1            9         2   

   1     8141       6.8             0.28           -0.51           22           0.048            -74                 175            1.025   2.95     0.68        8.7          1            7         2   

   0     8147       -0.3            -1.25          -0.63           5.6          0.042             2                  -43            1.03    3.15     1.78        9.9          0            7         1   

   2     8158       6.5             0.14            0.31          45.3          0.13            -154                100.7           1.024   3.34     0.35       14.4          1            7         4   

   0     8160       6.2             0.24            1.48           4.6         -0.255            37                  135           0.9563    3.2     -0.55      13.1         -1            7         1   

   1     8165       8.2             1.16            0.47          11.2         0.05083           61                  822           0.9959   3.12     0.77        9.5         -1            7         2   

   0     8187       7.5             1.28            0.34           3.5          0.023           -170                 189           0.9949   3.42     0.58       10.1         -1            7         1   

   1     8205       7.6             -0.53           0.26           1.6          0.236           -198                  88           0.9568   3.11    0.5906        8           0            8         2   

   0     8209       6.4             1.31            0.98           1.8          0.505            14                  -302           1.038   2.96     0.66        9.9          1            7         1   

   1     8211       1.4             0.42            0.33           8.1          0.048            45                  -43           0.9502     4     0.5632       9.3          0            7         2   

   1     8232       -0.9            -0.53           1.04          11.8          0.352            28                  -306          0.9961    2.4     0.49        9.7          0            7         2   

   1     8236       7.6             -0.48          -1.74          15.8         -0.636           -132                  89           0.9641   3.42     0.41        9.4          1            8         2   

   2     8237       10.9            0.335          -0.88           1.3         -0.352            293                 168           0.9921   3.429    0.46       10.47         1            5         3   

   2     8238       11.2            -0.83           0.41          1.415         0.038            52                  -37           0.9094   3.95      0.4       17.4          1            5         4   

   2     8245       15.8            -0.25           0.2           -6.2          0.057           -122                  42           0.9949    3.2     -1.21       9.9          0            8         3   

   0     8256       6.7              0.2            0.24          -16.3         0.186            121                 100            1.007   3.12    0.5409      10.4          0            7         1   

   2     8268       8.1             2.44            0.8           53.3         0.1343            -40                 176           0.9954   2.22     0.55       13.4         -1            9         3   

   0     8269       4.4             0.15           -0.28          51.1          0.044           -10.5                493           0.9467   3.24     0.78       10.2         -1            7         1   

   1     8270       6.8             -0.41           0.35           7.8          0.881           22.07                155            0.993     4      0.43        9.5          1            7         2   

   0     8286       6.6             3.01            0.3           -3.8          0.052           -232                 140           0.9722   3.02      0.5        9.2          0            7         1   

   1     8289       -4.3            0.36            -0.6          13.55        0.05638           44                  -64            1.02    2.97     0.66        11           0            7         2   

   2     8301        6              -0.49           0.39          55.5         -0.216            17                  100           0.9957   4.03     1.03        6.9         -1           10         3   

   1     8305       12.1            1.25            0.42          -47.1         0.044            212                 189            1.043   3.22     0.48       11.3         -1            7         2   

   0     8310       6.1             0.34            0.21            5          -0.359            -53                 300           0.9937   2.76     0.53       13.6          0            7         1   

   0     8312       7.2             1.55            0.36          82.2          0.382            68                 162.7          0.9992   4.24     0.76       9.046        -2            8         1   

   2     8318       7.7             -0.43          -0.18          -11.5        -0.107            36                  461           0.9895   3.19     -0.26      11.5          1            8         3   

   2     8321       6.9             -0.32           0.91           2.4          0.546            -45                 157           0.9424   3.49     1.75       12.3          0            8         3   

   0     8328       1.8             0.36            0.86           15           -0.05           61.54                256           0.9744   1.54     0.64        8.6          1            9         1   

   1     8331       12.8            1.43            0.07          5.649        0.1339            17                  565            0.991   2.94     0.34       14.5          1            8         2   

   0     8334       6.3             1.02             0              2           0.083            27                 140.4          0.9944   3.59     -0.87      11.4          0            7         1   

   1     8344       6.6             -0.66           1.64           3.9          0.039            210                 395           0.9915   2.81     1.76       10.9          0            7         2   

   0     8345       8.1             0.34            0.28           9.1          0.04             91                  230            1.004   3.14     0.63       15.1         -1            9         1   

   2     8352       6.4             -1.29          -0.82          60.5          0.041            18                  126            1.034   3.43     0.42       24.1          0            7         3   

   1     8358       0.5             -0.76           0.29           -24          0.046            -49                 107           0.9912   3.15     0.67        6.3          0            8         2   

   0     8359       3.5             0.655           1.68           6.1         0.05898           110                 175            1.001   2.26     0.97        9.3         -1           10         1   

   0     8360        16             -0.4            1.87          65.7          0.036            38                  195           0.9908   3.35     0.57       15.1         -1            7         1   

   1     8365        6              0.34            1.5            5.4          0.06             23                  -220          0.9602   3.25     0.44       10.68        -1            7         2   

   1     8366       5.8             -0.15           0.31           7.5          0.307            -12                 -166          0.9949   3.19      3.3        9.8         -1            6         2   

   2     8369       14.5            0.51            0.58          -42.2         0.049            481                 135           0.9933    2.8     0.51       9.846         1            9         3   

   2     8373       5.9             0.89            0.28           3.2          0.035            150                 117            1.028   3.366    0.42       13.6          1            6         3   

   1     8378       5.6             -0.38           0.26           4.3          0.518            -66                  97            1.035   4.21     0.46        9.2          0            6         2   

   1     8392       7.6             0.74            0.29          19.3          0.169            36                  493            1.03    3.14      0.5         9          -1            7         2   

   1     8397       6.8             0.87            0.71         -103.5        -0.313            187                  44           0.9978   3.27     -0.2        9.5         -1            8         2   

   0     8399       7.9             -0.25           0.42          -32.4         0.086             8                  358           0.9666   3.78     0.36       11.4         -1            9         1   

   0     8400       13.9            0.67            0.31           5.4          0.052            47                  150           0.9953   3.24     1.23        9.8          1            9         1   

   0     8405       6.6              0.5            -0.8           1.8          0.04             -90                 -399          0.9546   3.25     1.66       10.7          0            7         1   

   1     8406       17.6            1.61           -2.89          26.7          0.015            -64                 215           0.9954   3.111    2.86       14.1          1            7         2   

   2     8410       8.5             -0.46           0.56           69           0.377            47                  169              1     3.07     -0.91      13.1          1            9         3   

   2     8413       6.9             0.22           -0.74          -42.8        -0.348           -142                 203           0.9815   3.25     0.77        8.8          0            8         3   

   0     8414        12             1.48            0.44          32.8          0.069            32                   73           0.9528   4.19     0.57        5.9         -1           10         1   

   2     8416       12.1            -0.18           1.36          28.2         -0.431           10.98                0.12           1.034   3.51     0.52        8.4          1           10         4   

   1     8426       7.3             0.24           -1.12           -57          0.287            487                 -323          0.9684   2.24     -0.07      19.3         -1            8         1   

   1     8434       0.4             0.41            1.01           5.4         -0.414            33                  115            0.983   3.12     1.77       12.09         1            7         2   

   0     8439       17.1            1.22            0.3           43.4          0.049            38                 193.7          0.9963   3.19      0.2        2.7          2            8         1   

   1     8440       6.7             0.64            0.23           2.1          0.08             215                 393           0.9954   2.43     0.93        8.1         -2            8         2   

   1     8475       6.1             -0.53           0.34          65.6         -0.594            31                  188           0.9937   3.32     2.23       5.05          0            7         3   

   2     8480       6.1             0.17           -1.28           1.5          0.036            38                  -31              1     3.29     2.59       14.6          1            7         3   

   0     8497       7.8             1.09            0.26           8.9          0.132            42                  -241           0.996   4.01     0.67        6.1         -1            8         1   

   1     8499       30.6             1.6           -0.94           8.1          0.521           -143                 536           0.9775   2.19      0.3       11.35         1            9         2   

   0     8500        16             0.29            0.24          14.3         -0.164           -169                  43           0.9894   1.65     -0.16      10.3          1            7         1   

   1     8501       -2.3            -1.29           0.3           12.8         -0.289          -102.5                137           0.9986   4.09     0.49        9.1         -1            8         2   

   1     8502       31.5            0.74            0.01           1.5          0.481            50                  -243          0.9917   3.13    0.7124       5.1         -1            9         2   

   1     8518       3.6             0.31            1.71           2.1          0.176            35                  534           0.9964   3.87     0.44        9.1          2            7         2   

   1     8520       6.5             -0.76          -0.08          27.9          0.041            264                 -42            1.008   4.19     -3.07      10.5          0            7         2   

   1     8523       6.1             0.73            0.32          86.7          0.034            24                  -188          0.9898   3.36     -1.2       11.8          1            7         2   

   1     8525       6.4             0.72            0.26           3.4          0.639           -363                 146           0.9794   3.18      0.7       22.2         -2            7         2   

   0     8532       -1.2             0.5            0.33          68.3          0.037            32                  -221          0.9951   3.39    0.4224      10.7          0            8         1   

   0     8535       19.2            0.33            0.56           2.8          0.44              6                   17           0.9964   3.35     -0.8       16.9          0           10         1   

   0     8543       4.7              0.7            2.65          -47.9         0.056            56                  502           0.9898   3.17     0.44        8.8          0            7         1   

   2     8554       7.9             0.29           -0.41           6.7          0.036            97                  117           0.9611   3.12     0.42       16.2          1            9         4   

   2     8560        6               0.2            0.26           6.8          0.626           -133                  93           0.9483   2.17     0.42       11.41         0            6         4   

   2     8561       -3.4            0.32            0.35          31.3         -0.551            -78                 421           0.9912   3.36     1.22        6.1         -1            7         4   

   1     8563       5.2             1.51           -0.68           5.8          0.52              9                   74            1.016   3.28     0.53        7.2         -1            7         2   

   1     8566       7.2             0.26           -0.29          1.095         0.404            -15                 114           0.9966   3.23      0.9       10.5          0            8         2   

   1     8570       6.2             -0.41           0.25          44.1          0.301            114                 105           0.9912   2.08     -0.11      11.1          0            7         2   

   2     8572       5.5             0.82            0.32           5.8          0.051            20                  100           0.9959   3.17     0.49       11.2         -1            7         3   

   0     8582       14.7            1.15            0.63           2.3         -0.329            295                 435              1     3.16     2.02        9.5         -1           13         1   

   0     8583       4.4             -0.31           0.21            1          -0.161            67                  313            1.026   3.14     -2.55      11.8         -1            7         1   

   0     8587       5.9             3.15            0.05          -57.1         0.054            36                  414            1.029   3.43     -0.83       9.2          0            6         1   

   0     8592       0.6             1.48            1.69          -2.4         -0.054            90                  -287           1.026    4.2     -1.03      11.9         -1            9         1   

   2     8593       5.9             0.33            0.32           8.1          0.202             9                   34           0.9592   4.27     0.36       16.6          1            7         4   

   0     8607       8.9             0.49            0.02           2.7         -0.389            -70                  34           0.9461   4.34     1.89        9.2         -1            8         1   

   1     8609       -2.3            0.45            0.32          29.7          0.031            28                  185           0.9589   3.31     0.61        9.4          1            7         2   

   1     8610        8              -0.28           1.04           2.3          0.042           42.2                 208            1.028   3.29     1.23        12           0            9         2   

   1     8614       5.6             1.24            0.5           44.7          0.029            25                   93           0.9753   2.57    0.4833      15.6          0            6         2   

   2     8616       7.9             0.16            0.41           66           0.297            119                 140            1.036    4.1     1.64       12.5          0            8         4   

   2     8622       7.1             1.14            -0.5           1.5         -0.323            26                  384            1.022    3.3     -0.85      10.8         -1            8         4   

   1     8623       5.9             0.73             0             7.4          0.077            550                  44           0.9939    3.5     0.53       11.2          0            6         2   

   0     8624       0.4             -0.25           0.28          70.1          0.31             86                  213           0.9962   3.16     2.22        9.9         -1            7         1   

   2     8633       6.9             0.47            0.3            9.6          0.237            50                  185           0.9939   3.39     -0.61       9.6          1            7         4   

   2     8641       -0.6            -2.48           0.33           -68          0.266            -53                  54           0.9906   3.56    0.7298      10.9          2            8         3   

   2     8644        7              0.28           -1.24          -49.5        -0.248            -35                 179           0.9913   3.166    0.52         9           1            8         4   

   1     8649       6.5              0.4            0.37           8.9          0.053            36                  148            1.031   3.17     0.64        9.3          1            8         2   

   0     8653       6.9             0.19            0.39          98.5          0.028            144                  84            0.994   3.11     0.66       10.8          0            7         1   

   2     8657       5.6             0.26            1.35            1           0.032            27                   96           0.9475   3.18     0.44       18.3          2            7         3   

   0     8658       18.3             0.4            0.02           8.9          0.053           -165                 148           0.9572   3.16     -0.14      11.5          0            8         1   

   1     8663       -2.4            1.83            1.93           8.9          0.043            31                  -57           0.9964   3.22     1.66        9.2          0            8         2   

   0     8672       9.7             -0.79           0.17          -24.2         0.049           -206                 -20            1.006   1.84      2.9       13.6         -1           10         1   

   0     8680        10             -0.53           0.42          30.4          0.056           -203                 393           0.9968   3.11     1.21       15.1         -1           11         1   

   0     8684       9.2             0.34           -0.89           25           0.256            147                 168           0.9982   3.39     2.03        8.7          0            8         1   

   0     8687       6.2             0.94            0.95           1.6          -0.02           -136                  92            1.025   2.04      0.5       10.5          0            7         1   

   1     8688       10.7            -2.35           0.66           41           0.046            26                  164           0.9979   4.04     -1.11       8.8          0            7         2   

   1     8690       6.6             0.22            0.58         -105.9         0.133            52                  136           0.9879   3.23      0.3        7.5          0            7         2   

   1     8712       21.5            0.39           -0.78           2.3          0.235             6                  427            1.046   3.16     0.49        9.5          1           13         2   

   0     8717       6.1              0.2            0.34          50.3          0.004           -173                 201            0.995   3.35     1.93       10.1          1            7         1   

   2     8730       7.3             0.205           0.31           1.7         -0.344            34                  110            1.093    2.7     0.69        11           1            8         3   

   1     8739       7.2              0.2            0.22           1.6          0.531           -205                 101            1.041   2.26     -1.18      15.2          0            8         2   

   1     8744       -2.4            0.975           0.33           9.2          0.058           -151                  5            0.9983   2.42     1.77        9.9          1            7         2   

   2     8747       6.4             0.18            0.74          11.9          0.046            283                 168           0.9799   3.08     0.03       14.3          1            7         3   

   2     8748        14             -0.6            0.35          11.6          0.048            44                  -147          0.9944   3.29     1.95       10.5          0            7         3   

   1     8751       7.4             0.19           -0.35          12.8          0.053           522.5                436           0.9861   3.14     1.76        2.5         -1            8         2   

   1     8758       -1.7            1.78            0.49          46.4          0.031           -173                  99            1.038   3.18     -0.64      13.6          0            8         2   

   1     8761        6              -0.8            0.15           0.9          0.033             9                 101.4          0.9696   3.24     2.01       12.1         -1            7         2   

   2     8763       6.5             0.46            0.24          49.6         -0.678            56                  104            1.022   3.08     -0.73      10.47         1            7         3   

   1     8764       7.1             -1.91           0.04          14.4         -0.783            205                 437           0.9986   3.425    2.15       15.2          0            8         2   

   2     8765       -0.2            0.36           -0.97          52.05         0.342            -37                  96           0.9155   4.18     0.62        11           2            7         3   

   2     8773       11.8            1.04            0.36          106.4        0.03502           28                  156            0.991   3.62     -0.62      10.36         0            8         4   

   0     8780       1.9             1.03            0.47           8.4          0.042            167                 156           0.9856   3.15     0.93        16           0            8         1   

   1     8781        1              1.61            0.33          -25.8         -0.29            71                  162           0.9914   3.07     0.19        11          -1            8         2   

   1     8782        6              1.63           -0.08          -43.9         0.063           19.79                134            1.011   2.63     0.57        4.9          0            7         2   

   0     8785       12.4            1.88            0.58           22           0.103            28                   45            1.001    4.1     1.16        6.9          0           13         1   

   0     8786       9.4             1.21            3.16            2           0.23             25                   48           0.9856   3.57    0.4626       9.7          1           10         1   

   0     8797       0.9             1.38            1.37          70.3          -1.01           -194                 133           0.9978   3.17     0.36        8.7         -1            8         1   

   1     8799       -4.6            1.13            0.35          63.1         -0.399            29                  198           0.9984   3.24      0.5        3.8          0            7         3   

   0     8807       6.3             0.775           2.55          -12.8        -0.283           48.76                 86           0.9959   3.23     -0.17       3.6         -1            9         1   

   1     8816        8              1.98           -3.02            4           0.476           78.64                554           0.9905   1.79     1.36        14           0            9         2   

   1     8817       7.1             -0.48           0.31           70           0.053             0                   78           0.9959   3.31     0.59        5.1         -1            8         3   

   2     8826       6.7             0.06           -1.24          -30.1         0.003           -144                 399           0.9616   3.12    0.4669      11.2          1            7         3   

   0     8833       -7.7            -0.9            0.33            1           0.054            158                 164            1.013   3.62     0.51       11.9          0            7         1   

   0     8834        6              0.26            0.54           1.3         0.08128           -55                 154           0.9935   3.88     0.51        4.2          0            6         1   

   0     8835       9.4             -0.56           0.41          99.6          0.045            68                  183           0.9992    4.4    0.4195       9.4         -1            8         1   

   2     8840       6.7             0.75            1.69          14.8          0.186            44                  436           0.9968    3.2     1.44        9.8          1            7         3   

   0     8843       0.5             0.36            0.11          14.3          0.134            55                  349           0.9979   1.53     0.44         9           1            8         1   

   1     8849       -3.6            0.17            0.04          -43.8         0.037           -105                 133           0.9931    2.3     1.73       10.8         -1            7         2   

   0     8855        6              0.28            0.55            5           0.078           -217                 139            1.042    3.1     -0.34       9.5          1            7         1   

   0     8861       6.4             0.31            1.19           6.9          0.335            -84                 187           0.9937   2.99     0.34       12.2          0           10         1   

   2     8862       9.3             0.38           -0.48           3.8          0.132             3                   11           0.9958   0.92     0.57       10.1          0           10         3   

   2     8865       1.6              1.5            0.41          14.2          0.361            197                187.7          0.9968   2.26      0.5       10.3         -2            7         3   

   2     8868       6.5             0.19            0.56           0.8          0.043           -168                 205           0.9936   4.07     0.39       11.2          0            7         4   

   1     8870        14             0.51            1.34           1.2          0.04             -70                 455           0.9676   3.05     0.29       10.8          1            8         2   

   1     8880        -2              0.2            0.25           15          0.1166             5                  259           0.9529   3.12     0.53        2.8          1            7         2   

   0     8885       8.2             0.67             0             1.9          0.08            -185                 443           0.9556    3.4     0.32        4.2          0            7         1   

   2     8894       15.6            -0.57           0.34          -0.2          0.054            466                 606           0.9693   3.42     0.58       10.4          0            7         3   

   2     8895       1.9             -0.68           0.31          61.5          0.038             8                   79           0.9756   4.12     0.39       10.5          0            6         3   

   2     8899       6.8             0.15           -1.09          12.9         -0.378           68.5                 486           0.9701   2.95     -0.35      16.3          0            7         3   

   1     8912       6.4             -0.56           0.44          -12.5         0.482            49                  179           0.9094   3.26     -0.79       9.2          0            7         2   

   0     8922        7              -0.79           1.57          -44.2         0.394            46                   89           0.9839   3.39     -0.2       10.7         -1            7         1   

   1     8924       17.7            -0.31           0.8           -2.6          0.039            13                  134           0.9731   2.02     0.49       10.9         -1            7         2   

   1     8928       5.2             -0.97           1.13          16.2          0.027            158                 117           0.9889   6.04     0.45       13.2          0            6         2   

   2     8932       12.8             0.3            0.49          12.3          0.049            50                  144           0.9971   3.09     0.57       10.2          1            9         3   

   2     8943      -16.7            0.27            0.21          50.9          0.046            20                  155           0.9986   3.04     0.41       14.1          1            6         3   

   2     8945       5.6             -0.31           0.31          -53.8        0.0753           32.38                -216          0.9909   3.41     -0.97      10.5          1            7         4   

   1     8946       5.9             0.56            1.08            2           0.03             38                   98           0.9889   3.46     -0.9       19.3          1            7         2   

   0     8954       11.2            0.32            0.56            2           0.073             3                  -159          0.9953   3.15     0.73        9.5          0           11         1   

   1     8958       3.7             1.46           -0.71          11.4         -0.316            -8                   93           0.9943   3.23    0.5584      10.5          0            6         2   

   0     8960       11.8            0.32            0.21           2.2          1.123           -118                 -475          0.9678   3.17     -1.36       9.4         -1            7         1   

   0     8965       -9.3             0.5            0.81           2.2          0.057             5                  136              1     3.19     0.44        8.3          0           13         1   

   1     8966       2.9             0.26            0.39          -30.8         0.364            64                  200           0.9956   3.19     0.38       12.5          1            7         2   

   0     8967       -0.3            0.43            0.99           4.5         -0.005            -41                 -86            1.043   3.78     -0.99      10.2         -1            8         1   

   1     8969       6.4             0.46            0.79          -19.7         0.047            51                  138           0.9983   3.39     -1.09      10.5         -1            7         2   

   2     8980       -3.4            0.25            1.61          13.1          0.59             312                 200            1.086   3.04    0.4901       8.9          0            8         3   

   2     8984       14.8            0.12           -0.65           7.1          0.001           62.73                124           0.9888   4.08     0.41        7.4          0            9         3   

   0     8985       -2.3            0.31            0.85          13.2          0.072            267                 406           0.9643   2.98     -0.65       6.1          0            8         1   

   0     8988       14.3             0.9            0.37          77.5          0.112           34.12                 89            1.025   4.66    0.7915       5.3          0            7         1   

   1     8989       6.1             0.22            0.28          16.55        -0.153            54                  135            1.002    3.2     0.38       12.9          1            7         2   

   1     8995       6.9             -0.28           0.74            1           0.621            18                  204            0.992   1.94     -0.32      10.2          0            8         2   

   0     9004        20             0.31            1.32          -46.9        -0.359            28                  137           0.9809   2.96     1.26        11           1            9         1   

   0     9010       9.9             0.87            0.24           2.3         -0.481             6                   14           0.9657   3.34    0.4182       14           0           11         1   

   1     9012        -2             1.74           -1.87           1.6          0.409            161                 147           0.9959   2.77     0.14        8.1          0            8         2   

   1     9018       2.8              0.2            0.31          6.85          0.577            160                 -56            1.038   3.233    0.59       10.4          0            8         2   

   0     9036       8.8             0.48            1.92           3.3          0.092            26                  -171          0.9982   3.31     0.14       16.1         -2           10         1   

   0     9037       8.3             0.88            2.93          24.5          0.033            37                   57            0.957   3.16     0.51        11          -1            9         1   

   2     9040       5.8             0.28            0.3           -30.3        -0.286            31                  114           0.9864   4.27    0.3663      12.5          1            6         3   

   1     9041       6.5             -0.93          -1.16           4.1         -0.427            20                  134           0.9572   3.18     -0.86        9           2            7         2   

   2     9044       13.4             0.3            0.33           2.7          0.044            34                  108            1.014   3.86     0.18       16.4          1            8         4   

   0     9045       11.9            -0.46           0.34           1.6         -0.345            -61                 270            0.942   3.34     0.563       8.5          0            7         1   

   0     9047       8.1             1.47            0.79          -21.6        -0.225            114                 205            1.077   3.36     0.88        11           0            9         1   

   0     9049       6.6              0.5            0.04           2.1         0.07874            6                  -560          0.9955   3.39     0.64        9.4          0            7         1   

   1     9061       -2.2            -1.25           1.28          38.4          0.44            -171                 409           0.9917   2.62     -1.14       8.2          0            7         2   

   0     9062       7.3             0.25           -0.38          25.3         -0.394            38                  -212           1.028    3.4     1.57        9.6          0            8         1   

   1     9076       7.4             0.29            0.4           -30.6        -0.327           -201                 352           0.9932   2.57     0.76       12.3          0            8         2   

   0     9079       -2.7             0.9           -0.88          27.1          0.52             -26                  28           0.9865   3.13     -0.92      10.6         -1            6         1   

   1     9081       6.5            -0.705           1.15          -11.1         0.041            88                  126           0.9949   2.97     -0.17      20.3          0            7         2   

   1     9082       11.2            2.48            0.41          28.5          0.47             44                  139           0.9956   3.09     0.37        5.5          1            7         2   

   0     9089        4              0.25            0.7           -31.5        -0.004            165                 -188           1.038   3.13     0.22        4.7         -1           10         1   

   1     9092       7.5             0.19           -1.23           7.1          0.056            50                  110            1.003   3.06     0.71        9.9         -1            8         2   

   1     9094       6.5             0.28            0.26          37.6         -0.254            44                  139            1.018   3.32    0.2405      10.2          1            7         2   

   0     9115       7.1             0.34            1.02           115          0.082            31                   68           0.9969   3.45     3.46        6.8          0            8         1   

   2     9117       8.2             3.32            0.21          57.7          0.593           -100                 131           0.9902   3.26     0.55        13           0            7         3   

   0     9118       6.1             -1.04          -1.33           2.5          0.186            131                218.5          0.9935   3.46     -0.94      13.9          0            7         1   

   1     9120       6.1             -1.17           0.49           7.6          0.511            77                   39           0.9667   4.08     0.47        8.9         -1            7         2   

   0     9124       7.3             1.44            0.43           1.7         0.01297           21                  123           0.9905   3.19     0.42        9.4          0            8         1   

   0     9128       7.7             0.14           -0.74           60          0.09844           -64                 213           0.9714   3.18     2.05        9.2         -2            8         1   

   1     9135       2.3             1.19            0.08          47.2         -0.251            152                  32           0.9678   4.36     1.06       15.8          0            8         2   

   0     9136       23.8            0.35            0.44           6.5          0.056            31                   6             1.01    3.25     1.33       12.9          0            8         1   

   2     9138       5.8             1.59            0.34           9.7          0.035            26                  453           0.9972   3.08     0.49       10.4          0            8         3   

   1     9157       6.7             0.21            0.36         -91.85         0.02             59                  -221           1.029    3.5    0.4695       2.9          0            7         3   

   0     9176        9              0.15            0.3            5.3          0.765            -10                 127           0.9942   2.51     -0.58      16.3          0            7         1   

   0     9183       0.6             0.32           -1.47          17.75         0.06             207                 190            1.032   1.68     1.16        3.5          0            7         1   

   0     9187       9.2             -0.37          -1.15           7.6          0.08             54                  184           0.9957   2.05     -1.33      10.8          0            7         1   

   0     9188       7.5             0.18            0.99          -24.8         0.543            24                  400           0.9737   3.19     0.08        9.5         -1            8         1   

   2     9190       6.5             0.29            0.05            3           0.273            70                   93           0.9906   3.83     3.55       23.7          0            7         3   

   1     9197       15.6             0.3            0.5            1.1          0.036            174                 -153          0.9497   4.33    0.6034      11.3          0            6         2   

   2     9200       7.3             0.19            0.27          13.9          0.057            45                  155           0.9456   2.94     1.67        8.8         -1            8         3   

   0     9201       17.1             0.7            0.34          46.4          0.468            299                 161           0.9004   3.32     0.62        6.9          0            7         1   

   1     9203       0.5             0.23           -0.97           1.3         -0.112            14                  -98           0.9928   4.62     0.37       16.1          0            7         2   

   1     9212       -1.8            0.38            0.29          50.5          0.039            25                  293            0.966   3.25     0.59        9.3          0            8         2   

   1     9213       5.8              0.3            0.42           1.1          0.036           -527                 113           0.9887   3.247    0.46       18.7         -1            7         2   

   2     9214       5.7              0.8            2.09          51.8         -0.432            49                 138.5          0.9394   3.26     0.25       13.1          0            6         3   

   0     9217       4.5             0.46           -0.61          58.2          0.343           -120                  52           0.9987   3.11     1.81         9           1            8         1   

   0     9219       29.2            0.31            0.09          13.6         -0.449            513                 321           0.9946   3.73     -0.18       0.4          1            7         1   

   2     9220       15.1            0.695           0.06          -22.8         0.076            144                  20           0.8955   2.17     0.54        6.6          1            8         3   

   2     9221       -3.9            -0.71           0.28          12.4          0.62            -113                 -182           1.02    3.16     0.51       14.8          1            7         4   

   1     9237       6.5             0.14            0.25          24.7          0.336            15                  262           0.9526   1.96     0.43        4.7          0            5         2   

   1     9240       16.5            0.24            0.34          21.4         -0.316             3                  -312           1.005    2.4     1.72       11.4          1            8         2   

   0     9241       2.9             -0.77           0.33          10.2          0.048            194                 141           0.9529   3.16     -0.72      10.74        -1            9         1   

   1     9248       6.4             -1.13           0.26           8.2          0.795            47                  596           0.9947   3.17      0.5       15.4         -1            7         2   

   2     9253       2.3              0.2           -0.85          58.5         -0.344            32                  -22           0.9779   1.25     0.46       11.5          2            8         4   

   1     9259       7.2             -1.19          -0.94          75.05         0.038            71                  130            1.023   2.97     0.47         9           1            8         2   

   1     9267       17.6            1.995           0.27          65.05        -0.463            92                   70           0.9899   4.08     0.47       12.15         1            6         2   

   0     9271       7.2             0.58            0.5            8.4          0.077           -169                  28           0.9849   4.01     -0.87       9.4          0            8         1   

   1     9273       13.4             2.6           -0.82          -29.8        -0.033            46                   73            1.032   2.34     0.34       11.51        -1            8         2   

   2     9285       6.6             1.52           -0.34           1.8          0.042            26                   38           0.9794   3.19     -1.88      12.74         1            7         4   

   1     9290       5.1             2.04           -0.65          10.2          0.559            18                  281           0.9913   4.13    0.8055       11           0            6         2   

   1     9291       10.3            -0.3            1.8            1.4         -0.305             5                   33           0.9566   3.95     0.39       11.6          0           11         2   

   1     9293       17.4            0.49            0.69          6.65          0.034            244                 158           0.9934   2.77     0.48       11.2          0            9         2   

   1     9294        1              -0.52           0.39          28.2         -0.266            241                 461           0.9976    2.9     0.46        4.8          0            8         2   

   1     9301       10.6            0.17            0.28           1.2          0.046           -135                 574           0.9121   3.33     -0.52      10.1         -1            7         2   

   2     9302       8.6              0.2            0.42          -47.8        -0.073            35                 125.5          0.9925   2.98     0.49       10.65         0            9         3   

   0     9312        8              -0.39           0.43          12.07         0.067           -160                 -225           1.008   3.38     1.56       11.9          0            9         1   

   1     9316        -3             0.92           -0.92          -50.8        -0.023           -185                 -124          0.9936   3.03     -0.53      10.15         0            7         2   

   1     9319       2.4             1.06           -0.93           9.3          0.041            70                  189            1.008   3.57     0.49        8.6          1            8         2   

   2     9328       8.6             0.48            0.5           14.5          0.361            -97                 -170          0.9983   4.22      1.1        9.1          1            8         3   

   1     9331       9.3             0.775           0.43          28.4          0.045            24                   56           0.9984   3.31     2.26        7.8          1           10         2   

   0     9338       21.8            -0.59          -1.05           3.5          0.094             9                  -186           1.023   3.29     0.53       -0.7         -1           11         1   

   0     9350       12.1            1.16            0.25           7.8          0.05             13                   68           0.9483   2.91      0.4       10.69         0            7         1   

   1     9356       16.1            1.26           -0.58          33.8         -0.218            325                 -273          0.9966   3.83     1.92        9.5          0            7         2   

   0     9359      -10.8            0.65            0.1            2.9         -0.378            17                  263            1.088   3.88     0.55        7.9         -1            9         1   

   0     9362       -0.9            0.49            1.2           63.7          0.176            232                 338           0.9532   3.24     0.68         9           1            7         1   

   0     9364       7.2             -0.76          -0.63          67.9          0.043            226                 -35           0.9463   3.09     1.93       11.41         0            8         1   

   0     9370       -0.1            -0.82           0.07         -126.2         0.041            -21                 -234          0.9482   3.14     1.46        3.1          1            7         1   

   1     9380       18.8             1.5           -0.75           4.6          0.45             -89                 -143          0.9856   4.06     1.95       10.6         -1            8         2   

   1     9386       5.9             -1.12           0.6             2           0.407           -197                  92           0.9715   3.39    0.6377       8.3          1            6         2   

   0     9394       -4.1            0.24            0.29            2          -0.181            15                  346            1.04    3.23     2.99        5.9          0            7         1   

   1     9407        -3             0.26            0.28          74.4          0.028            13                  -107          0.9653   3.09     0.34       12.1          0            7         2   

   0     9411       7.2             -2.03           0.63           11          -0.295            529                 -262          0.9974   3.09     -0.76      12.5          0            8         1   

   1     9422       1.2             -0.42           0.21          -35.9        -0.236             8                   62            0.997     3      0.58        2.8          0            8         2   

   0     9423       17.5            1.695          -1.18          -7.4          0.073            569                  60            1.043   4.18     0.98       15.2          0            9         1   

   1     9429       7.4             -0.42          -0.44          -10.6         0.312            151                 415           0.9991   2.92     0.68       14.1          0            8         2   

   0     9433       8.4              0.2             -1           11.49         0.332            -85                  31           0.9942   3.36     0.45       13.7         -1            9         1   

   0     9439       2.4             0.915            0            53.6          0.435            17                  -179           1.041   3.68     0.73       11.4          0            7         1   

   2     9451       7.1             0.16            0.67           15           0.045            49                  155           0.9771   2.78     1.63        8.7          0            8         3   

   0     9452       8.8             1.19            -1.1           1.9          0.069            36                  372           0.9939   3.38     4.18       16.4          1            7         1   

   0     9453       7.8             0.24           -0.29          48.5          0.037            274                 480           0.9932   3.08    0.3779      11.6         -1            7         1   

   2     9460       5.7             1.68            0.62           7.5          0.038           27.69               128.4           0.986   1.02     -1.79      13.4          1            8         3   

   1     9465       -4.3            -0.34           0.38          70.1          0.126            49                  940           0.9919   3.35     0.57       14.8          2            8         2   

   2     9470       6.6             0.16            0.32           1.4           0.2             235                 -159          0.9906   3.107    0.64       12.4          0            7         3   

   1     9476       -5.8            0.32            0.28          -20.5        0.07565           29                  -640          0.9986   2.06     0.36       13.55         0            7         2   

   1     9485       7.4             0.04            0.3           -14.9         0.056            33                  167            1.008   2.14     2.03       11.6          0            8         2   

   1     9486       4.9             1.33           -1.48          -31.9         0.045            12                  144            1.022   4.69     0.82       12.9         -1            7         2   

   0     9488       6.7             1.08            0.28           2.4         -0.299            -56                 513            1.015   3.26     0.39       11.61         0            7         1   

   2     9507       10.9            1.72            0.57          42.9          -0.06            15                  -193          0.9924   2.97     0.72       11.41         1            7         4   

   1     9508       5.9             0.57           -0.48           1.4          0.397            17                   47            1.026   3.35     0.35        9.1         -1            7         2   

   2     9517        6              0.24            0.28         -23.95         0.038            61                  134           0.9761    3.3     -1.2       11.2          2            7         4   

   1     9521       15.6            -2.19          -0.98          48.1         -0.132            51                  101           0.9954   2.76     0.58       10.4          2            7         2   

   1     9528        7               0.1            0.41          3.732        -0.463            17                  -112          0.9899   2.79     0.52       11.4         -1            7         2   

   0     9532       6.4             -0.32           0.51          35.5          0.175            53                 179.7          0.9708   2.66     0.45        9.6          0            7         1   

   1     9536       -0.3            1.43           -0.95          10.4          0.379            47                  194           0.9947   3.26     0.58        9.6         -1            8         2   

   2     9540       5.6             0.68            0.36          44.2          0.048           -266                 538            1.034   2.27     1.69       10.93         1            6         3   

   1     9542       6.4             0.28            0.56          -17.1         0.577            45                  106           0.9935   4.26     0.37        9.2          1            7         2   

   2     9546       15.4            -0.59           0.33          12.3          0.393            31                  -282          0.9673   3.36      0.4        22          -1            7         3   

   2     9548       -2.9            -1.15           0.34           2.7          0.064            -83                 -240          0.9924   3.63     2.08       11.5          0            7         3   

   2     9549        15             1.535           0.38          -55.3        -1.128           17.75                 63           0.9932   3.42     0.36       12.4          1            6         4   

   2     9554       8.7             0.21            0.31          -8.6          0.046            40                   81           0.9913   2.24     0.65       16.4          0            7         4   

   1     9555       7.2             0.23            0.28          18.2          0.055            35                  205           0.9748   3.12     -0.6         9           1            8         2   

   0     9558       2.6             0.715            3            45.5         -0.712            -13                  43            0.964   2.78      0.9       11.8         -1            8         1   

   1     9573        6              1.46             0             1.4          0.057             4                  119           0.9945   3.36     0.45        9.1          0            7         2   

   2     9575       -1.3            0.305           1.83           1.2          0.059             7                   11            1.034   4.99     0.52       16.6          0            8         4   

   1     9584       -3.7            0.47            0.29          14.8          0.024            106                 142            1.02    3.12     0.48        12          -1            8         2   

   1     9586       18.5            -0.38          -1.04          9.25          0.038           -216                 -103          0.8912     3      0.41       10.7          0            7         2   

   2     9588       5.7             -0.09           0.28           2.2          0.019           -448                 168            1.033   2.72     -0.35      15.1          1            6         3   

   1     9591       -1.1            1.64           -0.98          22.95        -0.496           -141                 -123          0.9913   3.15      0.8       12.7          0            7         2   

   2     9592       13.7            -0.93          -0.15           1.7         -0.188            98                  -212           1.043   3.37    0.6164      9.697         0            7         3   

   2     9597       1.1             0.23           -0.09          -6.2          -0.27            31                  161           0.9724   3.19     0.42       12.15         2            6         3   

   2     9600       7.5             0.97            0.3            4.6          1.123            145                  61            1.022   3.15     0.38       14.6          0            8         3   

   1     9603       8.1             -1.12           0.4            6.3          0.047           -191                85.62          0.9957   3.18     0.53        6.6          0            8         2   

   0     9605       -5.3            0.21            0.36          17.3         -0.049            -16                 113           0.9628   3.64      1.4       16.6         -1            7         1   

   0     9614       7.2             1.54           -0.14          -11.2         0.05             60                  -245          0.9945   3.46    0.8353      10.2          0            8         1   

   2     9616        -3             -1.2            0.35          -56.2         0.434           30.68                165           0.9932   3.04     -1.2        8.6          1           10         3   

   1     9622        7              0.28            0.28           1.4         -0.498            145                  83            0.971   2.87     0.58       11.1          0            8         2   

   2     9624       8.5             0.25           -0.54           2.8          0.032            -45                 -171          0.9955   3.06     0.44       12.8          0            9         3   

   1     9629       5.7             2.31           -0.08           1.5          0.172             7                   19            0.994    3.5     0.48        9.8          0            7         2   

   1     9633       6.8             -0.75           0.25          7.95          0.042           56.28                 11            1.007   3.44     0.61       13.4          0            6         2   

   2     9640       5.3             -0.97           0.72          56.7          0.03             35                  115           0.9867   2.93     0.42       11.8          0            9         3   

   0     9644       33.5            -0.61           0.24           2.4          1.165             6                  -359          0.8971   3.09     0.57        9.4         -1           11         1   

   1     9645       6.8             2.95             0             1.8          0.066            -11                 -371          0.9976   3.62     0.68       12.5          0            8         2   

   0     9646       6.9             -1.13          -0.54           53           0.039             8                  143           0.9601   0.86     2.16        9.8          0            8         1   

   0     9648       6.6             0.96            0.46          -9.5          0.056            231                 482           0.9968    3.5      0.6        9.9          0            7         1   

   0     9649       3.5             -0.67           -1.1          -15.8        -0.297            174                 139           0.9979   3.21     1.02        4.3         -1           10         1   

   1     9660       7.5             0.23            0.21           3.8          0.409            21                  -178           1.041   4.26     0.57        11           0            6         2   

   1     9664       15.9            0.87            1.38           2.1          0.534             5                  -341           0.998   2.99    0.6714       7.2          1           13         2   

   0     9675        7              0.45            0.52          19.8         0.05973           12                 96.88          0.9976   3.07    0.4742      13.9          1            8         1   

   0     9679       6.8             -0.41           1.52           2.4          0.046            27                  132            0.991   4.53     0.73       11.3          0            6         1   

   1     9680        6              2.47           -0.44           0.9          0.038           -115                  72           0.9907   3.23     -1.19      24.3         -1            7         2   

   1     9682       7.1             0.62            0.06           -29          0.307           48.1                 -208           1.018   3.32     0.85       16.5          0            8         2   

   0     9697       6.4             -0.11           0.44          -21.7         0.29             52                  -103          0.9556   2.08     0.48        0.7          0            7         1   

   2     9701       9.3             -0.16          -0.25          3.217         0.172            24                  482           0.9932   3.27     0.39       12.2         -1            7         3   

   1     9704       -0.7            0.64             0           -110.4         0.604            18                   23            1.012   3.32      0.6       11.7         -1            8         2   

   2     9705       6.2             -1.67           0.45          10.4         -0.063            22                   27           0.9971   3.14     0.56        9.8          1            7         3   

   2     9707       18.4             0.2            -0.3           1.7          0.192            -29                 167           0.9778   3.05     1.36        8.8          0            9         3   

   2     9714       6.6              0.8            0.03          -91.1         0.079           -104                 -207          0.9963   3.89      0.5       12.2          1            7         4   

   0     9718       8.3             -1.24           1.52          31.7          0.033           -157                  57           0.9911   3.42     0.51       10.73         0            9         1   

   2     9722       6.2             0.36           -1.22           3.2         -0.471            221                 -141          0.9559    1.9     0.36        9.9          1            7         3   

   0     9739       -2.8             1.2            -0.9          46.9         -0.132           -184                 131           0.9936   3.85     0.64       10.83         0            7         1   

   2     9747       4.9             1.62            1.65         -122.7         0.28             -93                 158           0.9894   5.28     -0.38      12.6          1            7         4   

   0     9751       5.9             0.37            0.14          -35.3        -0.339            34                  185           0.9944   3.17     0.63       18.6         -1            6         1   

   0     9757       8.1             0.82            0.27           4.3          0.03             43                  279           0.9921   3.16     0.25       11.2         -1            9         1   

   2     9759       1.7             1.22            0.15           -41          0.266            29                  478           0.9702   3.29     0.77       13.4         -1            6         3   

   2     9760       6.3             1.11            1.3            3.5         0.08989           23                  109            1.041   2.96     0.54        7.4          0            7         3   

   1     9764       7.6             1.64            0.36           4.5          0.563           -504                  50            1.038   3.09     0.47        5.6         -1            8         2   

   0     9776        10             0.22            0.43          61.6         -0.252            -60                 503            0.958   4.33    0.4809      13.7          0            8         1   

   0     9778        -5             0.18            1.14          2.442         0.048           -155                 -339          0.9956   3.77     -1.07       10           0            7         1   

   0     9786       12.8            0.635          -0.03          -45.6        -0.342           -248                 -76            1.04    3.31     0.57        8.1         -1            9         1   

   1     9803       7.5             -1.68           1.67          -52.9         0.077            11                   35            1.004   3.36     1.75        1.3          0            8         2   

   1     9804       9.1             0.14            0.35          -15.9         0.383           16.58                -183           1.025   4.17     0.35       16.4          1            7         2   

   2     9815       -0.4             0.2            0.07           2.5         -0.237            15                   25           0.9957   2.32     1.15       13.5          1            8         3   

   0     9824       11.2            0.01            0.3            1.8          0.624            16                 113.5          0.9286    4.3     0.82       10.1         -2            8         1   

   1     9825       10.4            0.34            0.58          -55.6         0.174             6                   16            0.997   4.46      0.7       14.5          0           11         2   

   0     9826       16.3            0.405           0.15          1.45          0.453           -137                 387           0.9912   3.52     0.42       11.6          0            6         1   

   1     9827        7              0.18            0.26           1.4          0.044            304                  89           0.9728   2.71     0.48       10.7          0            7         2   

   1     9833       6.7             3.26            0.31           9.9          0.04             10                  453           0.9452   2.33     1.46        7.9          0            7         2   

   0     9835       8.2             2.49            0.64          -38.2         0.043            22                   47           0.9987   2.23     1.55        8.8         -1            9         1   

   1     9860       17.3            0.34            0.32           3.8          0.044            278                 116            1.021   3.39     0.44       11.8          0            7         2   

   0     9865       7.2             1.54            1.53           6.7         -0.397            120                 138           0.9939    3.2     1.24       15.4          1            8         1   

   2     9871       6.6             -2.49           1.52          18.15         0.042            437                 -221           1.034   2.62     2.13        8.7         -1            7         3   

   1     9874       9.9             0.88            0.02           1.5           0.8             38                  157            1.019   3.206    1.15       14.2         -1            7         2   

   0     9880       18.6            1.38            1.09          57.2         -0.072            -95                 108           0.9928   3.13     1.15       11.5          1            9         1   

   1     9882       7.5             -1.21           0.24          -8.1          0.053             8                 117.8           1.014   3.14      0.5        7.7         -1            8         2   

   0     9885       5.8             0.28            0.29          -23.6         0.026            31                  114            1.017   2.79      0.6        9.7          0            6         1   

   1     9888       14.1           -0.125           -0.1          20.3          0.04             57                  -172           1.035   3.22     0.54        3.2          1            7         2   

   0     9892       6.3             0.17            0.23          -59.5         0.045            -20                 147           0.9877   3.08     -0.92      -1.1         -2            7         1   

   2     9893       -3.3            0.47           -0.38           6.4          0.581           -118                 -66           0.9857   3.29     0.52        10           1            7         3   

   1     9896       7.1              1.8            0.39          13.7         -0.144           -151                 477           0.9976    2.9     0.46        8.5         -1            8         2   

   0     9902       4.1             1.52            1.29            2           0.05             23                  363            0.992   3.73     0.37       10.4          1            7         1   

   1     9906       6.4             0.53            1.06          -11.3         0.034            460                  90           0.9886    2.9     -1.14      12.6          0            7         2   

   2     9910       7.8             0.23            0.32          10.7         -0.425            26                  183           0.9554   2.93     1.09        9.1          1            9         3   

   2     9914      -18.2           -0.405          -0.92           1.9          0.036           -536                 324           0.9917   2.28     0.91        14           1            5         3   

   2     9918        6              0.36            0.04          32.4          0.624            189                 203            0.988   0.74     0.62        9.8          1            7         3   

   1     9920       6.6             0.78            0.5           34.5          0.645            183                 -70           0.9458   3.25     0.48       18.5         -1            8         2   

   1     9926       4.9             0.23            1.52          -9.5         -0.391             3                   8            0.9981   3.08      0.7       10.7          2           12         2   

   2     9931       9.7              0.1            0.37           57           0.593           -238                 202           0.9909   3.19     1.42       12.4          2            8         3   

   1     9935       -5.2            -0.08           0.01          -59.2         0.441            18                   30           0.9903    3.2     2.29       13.7          0            7         2   

   1     9945       7.9             -0.87          -0.65          145.4         0.072            44                  -200           1.021   3.03     1.85       16.9          1            8         2   

   2     9953       6.3             0.51            0.74           2.3          0.216            29                  225           0.9517   3.17     0.75        11           1            7         3   

   0     9957       -0.7            0.57            0.21           1.5         0.09799           255                 785           0.9842   3.16     0.54        9.8          0            8         1   

   1     9963       17.6            0.35            0.28          -5.2         -0.161            26                 104.9          0.9767   1.99    0.3976       7.5          1            8         2   

   1     9972       7.2             1.03           -1.67           1.8          0.567            218                  70           0.9539   3.42     0.59        15           1            8         2   

   2     9976       12.2            -0.97            0             6.5          0.51            47.7                 315           0.9939   4.43     2.33       11.6          0            5         3   

   0     9979       7.7             0.39           -0.04           3.3          0.037            29                  224            1.007   3.83    0.4244       11           0            8         1   

   0     9980       8.2             1.47            0.43            8           0.026            18                  385           0.9885   3.22     0.79       17.2          0            7         1   

   2     9982        -1             0.17            0.32           1.6         0.00451          17.07                450           0.9948   3.24     0.76       13.8          1            8         3   

   1     9991        -4             -1.26           0.4           -44.7         0.066             9                  108           0.9379   3.296    0.23        9.7          0            8         2   

   1     10000      6.9             0.34            1.51          11.7          0.034            12                  391           0.9924   2.99     1.68        6.6          2            8         2   

   1     10003     -16.2            1.35           -0.37          -13.1        -0.441            21                  264            0.994   3.58     0.58       11.4          0            8         2   

   0     10005       7              0.27            1.92          24.4          0.534            45                  170            1.017     3      0.45       12.6         -1            8         1   

   1     10014       8              0.99            1.51           9.2          0.044            53                  537           0.9799   3.25     -0.56       3.6          0            9         2   

   0     10032      5.8             0.45            1.5           53.5         -0.094           -161                 118           0.9485   2.99     0.29        11           1            7         1   

   0     10034      -2.2            0.35            0.34           4.9         -0.121             9                 110.2          0.9925   3.32     1.99        3.8          0            7         1   

   0     10041     -11.9            0.81            0.58          79.9          0.044           -235                126.6          0.9978   2.99     0.51         9          -1            7         1   

   1     10042       5              0.62            0.81          13.82        -0.146            276                  46           0.9682    4.4     1.35        18           0            6         2   

   2     10044      6.6             0.21           -0.95           1.1          0.135            197                 144           0.9917   3.39     0.39        9.3          1            7         3   

   1     10045      14.7            2.88            0.39           2.3          0.041            31                  -338           1.033   2.48     0.58       15.8         -2            7         2   

   1     10054       6              0.28           -1.11           2.5          0.342            124                 111            0.999    3.1     1.85         7           0            7         2   

   2     10061      0.9             0.48            0.09           1.7          0.078           -111                  1             0.994   3.45    0.4815      16.7          1            7         4   

   2     10062       7              0.54            0.1           -51.9        -0.294            -98                 -166           0.998   3.28     -1.15       9.2          1            8         3   

   0     10073      11.6            0.39            1.94           2.8          0.092            -29                 101              1     2.73    0.4984      14.2          1           13         1   

   2     10081       8              1.24            0.18           3.4          0.458            34                   4            0.9967   3.19     -1.02      12.1          1            9         3   

   2     10084       -4             1.01            0.2            59          -0.253           28.82                440           0.9971   2.39     0.58       19.6          0            8         3   

   0     10086      5.7             1.36            0.49          -32.9         0.683            235                  80              1     2.25     0.76       10.7          1           13         1   

   0     10093      6.9              0.3            0.49          53.2         -1.033            89                  156            1.045   3.43    0.4583      14.9         -1            8         1   

   2     10101      9.2             -0.05           0.33           1.5          0.036           -227                 514            1.023   3.32    0.5892      16.8          1            7         3   

   2     10105      7.3             0.16            1.88           1.5          0.036            29                  108           0.9934   3.27     -0.19       6.2          0            8         3   

   1     10110      7.8             0.53            0.41          68.1          0.428           -331                 99.9          0.9954   2.72     0.45       14.5          0            8         2   

   0     10113      6.8             -0.36           0.71           7.6          0.052            35                  143           0.9721   3.14     0.38       11.6          0            7         1   

   0     10115      15.2            -0.88           0.18           8.2          0.042            167                 180            1.035   3.21     -0.32       9.1          0            8         1   

   1     10119      7.3             0.21            0.29         -128.3         0.034            48                  -135          0.9917   4.52     2.27       9.327         0            8         2   

   2     10121      14.4            0.18            0.34          15.7          0.369            194                 422            0.99     4.5     0.45        6.4         -1            7         3   

   1     10124      8.4             0.65            0.02           2.1          0.078           -547                 -290           0.955   3.35     0.15        4.6          1            7         3   

   2     10126      3.1             0.28           -0.82           7.7          0.349            -32                 116            1.013   2.99     0.38        3.6          1            8         4   

   0     10127      6.4             0.34            0.2           -72.8        -0.459           -115                 449            1.011   3.13     -0.34       -2           1            7         1   

   0     10145      5.6             0.185          -1.12          22.5         -0.268            28                  361            0.975   3.55     -0.38      10.3          0            6         1   

   1     10147      7.9             0.17           -1.07           1.6          0.283           -113                 150            1.023   2.81     0.63       -3.6         -1            8         2   

   0     10148      -4.6           -0.415           1.15          6.15          0.567            23                   87            1.028   2.94     1.45       11.4         -1            7         1   

   0     10162      17.9            0.28            0.48           2.1         -0.433          -14.67                -286           1.021   3.26     0.62        6.7         -1            9         1   

   0     10163      1.8             0.18            0.3           5.731         0.09            -145                 -171          0.9941   3.03     0.38        9.4          0            8         1   

   0     10166      18.3            0.25           -0.03           36           0.183            41                  161           0.9586   3.16      0.5        13          -2            7         1   

   1     10172      7.2             0.46            0.36          -8.3          0.051            26                  -130          0.9914   2.93     1.59        8.1          0            8         2   

   0     10173      6.8             0.54           -0.52            4           0.348           -541                 134           0.9633   4.53     -0.65       9.7          0            9         1   

   0     10175      19.1            -1.04           1.61          72.2         -0.216            64                  179            1.02    4.84     2.67       12.1         -1            9         1   

   1     10180      12.9            -0.15           1.38           -50          1.041           3.295                121           0.9901    0.9    0.1996      20.4         -1            7         2   

   1     10186       7              0.19            0.33           6.3          0.069            42                  -47           0.9918   3.31     0.03        5.5          1            8         3   

   2     10192      18.3             0.1            0.45           13          -0.204            259                 451           0.9974   3.47     0.46       12.8         -1            7         3   

   1     10199      5.7              1.5            0.65           7.1          0.628           -392                 154            1.008    3.3     0.83        5.8         -1            6         2   

   1     10209      10.9            1.75            2.02          32.6          0.071            17                  440           0.9993   3.05     -0.08      12.8          0           12         2   

   2     10210       6              -0.22           0.41          13.2          0.578            37                   54           0.9916   3.39     0.51        18           2            7         4   

   1     10214      0.7             0.37            0.58           55           0.644            105                 466           0.9971   3.22     0.464       8.6          0           12         2   

   2     10215      -2.6            0.715           0.24          65.5          0.07            27.75                 39           0.9966   3.73     -0.15      20.4          1           10         3   

   0     10216      0.7             0.29            1.69          13.6          0.07             74                  261           0.9977   2.79    0.5944       9.6          0            8         1   

   0     10232      9.6             0.56           -0.95          77.3         -0.488            -46                 106            0.994   3.75     -0.1       13.6          1            9         1   

   2     10239      6.9             2.59            0.92          -16.2         0.018            177                  61           0.9929   3.28     1.93       12.7          1            8         3   

   1     10249      25.5            -2.27           0.25           1.4         -0.464            30                  -170          0.9879   4.34     0.54       11.7          1            7         2   

   2     10253       14             0.37            1.44          -2.2          0.035            -78                 116            0.993   2.68      0.1       12.6          1            7         3   

   1     10255      -5.2            -0.39           0.32          13.2         -0.033           -167                 221            1.007   3.27     2.29        9.6          0            8         2   

   1     10262      16.2            0.37           -0.08          2.85          0.004             5                   24           0.9794   3.19    0.7102      11.9         -1            9         2   

   0     10264      8.9             0.62            0.38          102.3         0.348            19                  102            0.977   3.17     0.35       -2.6         -1            7         1   

   2     10266      18.7            0.63            0.39          -8.5          0.054            23                  104           0.9941   3.27     0.45       10.3          1            8         3   

   0     10268      6.1             -0.73           0.48          11.5         -0.115           -108                  94           0.9978   3.12     0.45        0.8          0            7         1   

   1     10271      -0.6            0.24            1.08          -55.2         0.032            42                  104           0.9774   2.31     -1.02       7.5         -1            8         2   

   2     10272      6.1             0.21           -1.24           1.5          0.085            37                  253           0.9897    3.5     0.31       17.8          1            7         3   

   0     10276      -1.1            0.43            3.2            5.5          0.071           -189                  17           0.9513   3.42     0.43       16.3          0            8         1   

   0     10277       33             0.16            1.83            2           0.044            77                  107           0.9951   3.21     0.13       11.6          0           10         1   

   1     10279      15.4            1.01            0.24          67.2          0.079            19                  911           0.9991   3.18     0.56       10.1         -1           11         2   

   0     10281      4.5             1.91            1.56           4.9         -0.392            -23                  18           0.9783   1.78     0.54        10          -1           10         1   

   0     10285      7.2             0.29            1.42           2.5         -1.035            16                  -322           1.002   3.44    0.4556       9.3         -1            8         1   

   0     10294      5.7             1.88           -0.18          10.1          0.024           -255                 481            1.014    3.2      0.4        9.2         -1            8         1   

   1     10300      8.4             -0.6            0.38          51.2          0.463            51                  170              1      2.9     0.82        8.9         -1            9         2   

   0     10304      4.9             0.345           1.93            1           0.088            -16                 445            0.992   4.02     1.06        3.5          0            6         1   

   0     10307      14.8            1.32            0.86          20.6          0.037            399                 -250          0.9424   3.64    0.6098       8.7          1            8         1   

   2     10309       6              0.27            0.15          -44.9         0.233            35                  -538          0.9936   2.15     1.27        8.3          1            6         3   

   1     10310      6.1             0.41            0.14          39.9          0.037            144                 119            1.009   3.38     -0.67       7.5          0            7         2   

   1     10312      20.1            1.55            0.24           2.3         -0.533           36.01                 28           0.9969    2.6     0.53         4           0            9         2   

   1     10321      -0.4            -0.72           1.37          11.7          0.478            43                  133           0.9588   3.02     0.41        8.8         -1            7         2   

   1     10332      -6.3            0.54            1.87           2.5          0.097             7                  -240           1.005   2.83     2.13        9.3          1           10         2   

   1     10336      4.1             0.41             -1           10.1          0.306            28                  232           0.9968    3.2     0.95         7           0            8         2   

   0     10368      1.4             0.57            1.76         0.9225         0.027            35                  138           0.9895   2.88      0.2        0.2          0            7         1   

   1     10369      6.6             -0.83          -1.09          -5.1          0.068           -135                 -233          0.9614   1.81     0.25       17.8          2            7         2   

   0     10375      5.1             -0.78           1.39           7.9          0.049           -235                 -212          0.9963   2.59     0.48       13.2         -2            8         1   

   0     10376      6.6             -0.88          -1.17          -37.4         0.069            19                  -230          0.9773   3.56     0.47        9.8         -1            7         1   

   1     10379       8              -0.19           0.49          -37.2         0.401            39                 172.2          0.9554   3.13     0.38       9.742         0            9         2   

   0     10380      12.6            0.94            1.47          -5.5          0.063            27                  173           0.9987   5.17      0.1       9.118         0            7         1   

   0     10383      2.2             0.55            0.84          11.2         -0.075           -142                  56            1.035   3.21     0.426       13          -1            9         1   

   2     10385      6.8             -0.93           0.41          12.9          0.267           61.5                 -179           1.037   2.52     -0.39      10.2          1            7         3   

   1     10387      6.8              1.1            0.3            4.2         -0.081           61.68                165           0.9945   5.17     1.92        9.1          0            8         2   

   0     10397       7              1.27            -0.2          127.2         0.035           -106                 632           0.9782   3.26       0        12.3          0            8         1   

   0     10412       6              0.615           0.04           0.8          0.032           9.33                 -28           0.9524   3.48     0.37        11           1            7         1   

   2     10413      6.6             0.27            0.72          -27.7         0.052           42.37                188           0.9915   3.68     -0.2        11           1            7         3   

   0     10418      2.3             0.25            0.07          -1.8          0.056            13                  518           0.9935   4.12    0.4361       9.5         -1            7         1   

   1     10420      7.6             -0.69           0.32           3.6         -0.528            22                  508           0.9914   3.08      0.6       12.5         -1            8         2   

   1     10426      6.3             0.26            0.25           5.2         -0.362            11                  430           0.9741    3.5     -1.04        8           0            7         2   

   0     10427      8.3             -0.37           0.43           2.5          0.036            32                  261           0.9944    4.1     0.44       -1.6          0            9         1   

   1     10428      6.2             0.37            0.3           67.1          0.594            79                  200           0.9954   3.29     1.16       13.9         -1            7         2   

   0     10430      15.9            0.28            0.26          6.452         0.042            463                 450           0.9925   3.69      0.5       10.7          0            8         1   

   1     10435      7.6              0.1            1.76           1.3          0.047            21                  100           0.9644   2.77    0.4846       9.5          0            6         2   

   0     10436       16              0.5            0.34          13.7         -0.104            216                 184           0.9998   3.08    0.4737      9.95         -2            8         1   

   2     10446      6.4            -2.285           0.29          -74.9         0.035            44                  -147          0.9426   3.32     0.55       10.7          1            7         4   

   2     10448       18             0.28            1.29          14.8          0.174            -99                 178           0.9758   3.25     -1.3       16.9         -1            8         3   

   1     10449      27.6            0.26           -1.31          -41.5        -0.342            34                  225           0.9969   4.19     0.41        10           1            7         2   

   0     10463      7.6             0.87            1.87           9.4          0.29             314                 124           0.9807   3.07     0.61        9.7         -1            8         1   

   0     10469      3.3             0.31            0.29          10.5          0.448           -182                 145           0.9966   3.04     1.88       10.1         -1            8         1   

   2     10470      5.8             0.62            1.32           6.1          0.019            27                   12           0.9936     3     0.5568      11.38         0            6         3   

   1     10471      9.1             0.905          -0.53          5.102        0.09362           27                  353           0.9943   3.19     0.38        7.6          0            6         2   

   2     10473      7.4             0.19           -0.09          114.9         0.045            39                  -204           1.005   3.191   0.5393      11.88         1            8         3   

   1     10476       7              0.43            0.31          22.63         1.204            104                 262            1.031   3.38     1.12       12.2         -1            8         2   

   0     10482      9.9             -0.85          -1.39          19.7          0.759            49                  288           0.9947   4.32     -0.64      15.3          0            7         1   

   1     10500      6.4             0.28           -0.89           5.4          0.042            67                  181           0.9752   3.31     0.35       10.2         -1            7         2   

   2     10511      12.4            1.96            0.49          45.8          0.052            34                  391           0.9505   2.99     0.61       11.04         1            7         3   

   1     10512      8.1             1.21            -2.8          11.8          0.507            46                  212           0.9284   3.09     0.46        10           1            9         2   

   1     10514      11.5            1.31            0.3           12.8          0.177          -157.5                -29            1.005   3.76     -1.28      12.3          0            8         2   

   2     10515      5.4             0.17            0.57          53.2         -0.019            28                  104           0.9727   3.25     -1.02      10.3          0            6         3   

   1     10526      7.4             1.17            0.27           1.3          0.189            587                 323            0.994   3.46     1.154      11.7          0            8         2   

   0     10546      5.3             0.31            1.73          10.5          0.031           48.58               149.7          0.9932   3.34     0.46       13.3         -1            6         1   

   1     10549      7.7             -0.72          -0.73           1.8          0.616            -85                 -61            1.003   3.255     1.7       16.2          0            8         2   

   1     10553      8.3             -0.14          -0.27          6.163         0.071            230                  28           0.9964   3.28     0.743      16.3         -1            8         2   

   0     10558      1.7             0.66           -0.79            4           0.303            16                   -9            1.01    2.79     -0.56       9.7         -1            8         1   

   0     10575      12.9            1.73            0.3            1.9          0.074           -230                  84           0.9972   3.39      0.4         9           0            9         1   

   0     10581      6.1             0.705          -0.19           1.9          0.074             8                  266           0.9962   3.34     -0.4       16.6          0            9         1   

   0     10583     -11.6            0.35            0.49          128.5        -0.419            187                  69           0.9556   3.53    0.6565      15.3          1           13         1   

   0     10584      -0.3            0.37            0.29          30.6          0.972            286                  56           0.9904   3.85     -0.66       5.7         -1            6         1   

   1     10585      7.1             2.56            0.18          -41.4         0.094            169                 166           0.9947   2.39     2.14       -2.6          1            8         2   

   2     10610      -1.1            0.52            0.25           4.9          0.04             18                   90           0.9901   3.31     0.56       11.3          1            6         3   

   0     10611      3.7             0.16            0.35          37.4          0.055            25                   25           0.9952   3.34     -0.77      11.6         -1           10         1   

   1     10616      7.8             1.57            1.16           7.5          0.53            -342                 -90           0.9821   4.41     1.42        4.5          2            9         2   

   0     10618      -4.2            0.695           0.04          1.728         0.042           -206                 417           0.9943   3.18     -2.54      11.12         0            6         1   

   0     10628      9.9             0.59           -0.73           2.7          0.857            225                  71              1     3.31     -0.61       3.3         -1           11         1   

   0     10632      6.5             0.28            0.03          15.4          0.042           -178                 195           0.9606   2.23     -0.72      10.01        -1            7         1   

   1     10642      7.5             0.31            0.31          76.2          0.05             26                  180           0.9785   4.05     0.53        9.9          0            8         2   

   0     10648      -1.5            -0.53          -1.31           1.3          0.043            21                  -164          0.9927   3.25     0.62       10.4          1            7         1   

   1     10649       6              0.41            1.85           57           0.586            29                  -374          0.9928   3.42     0.52        3.8          0            7         2   

   1     10650      8.2             -0.89           3.13           1.6          0.219           35.7                 -23           0.9916    3.1      0.5       12.3         -1            9         2   

   0     10654      6.8             -0.76           1.19          -51.5         0.02             38                  133           0.9921   3.18     0.44        12          -2            8         1   

   2     10656      4.8             -0.93            1            34.6          0.048            42                  274           0.9974   3.33     0.59       10.1          1            8         3   

   2     10661      -0.9            0.35            0.51           -37          0.047           -227                 135            1.016   3.03     0.53       10.3          1            8         3   

   2     10663      14.1            2.115           0.22           0.7          0.072            49                  748            1.002   2.63     0.55       15.5          2            9         3   

   0     10672      6.7             -0.64          -0.52          54.5          0.348            62                   33           0.9512   3.21     0.59       19.2          0            7         1   

   2     10678      7.8              0.2            0.32          -9.4          0.016            31                  101            1.017   2.99     -0.26      16.1          1            8         3   

   2     10685       17             0.46            0.49          51.75        0.1407             6                  342           0.9911   2.67     -0.04      11.4          0            9         3   

   2     10690      24.7            1.52            0.4             2           0.432            291                  72           0.9681   3.74       2         12           1            8         3   

   1     10702      7.7             0.14           -0.99          -19.6         0.044            172                 116           0.9485   4.47     0.53        6.5          0            7         2   

   0     10706      6.7             0.29           -0.52          -45.7         0.054            304                 181           0.9987   3.56     2.33        9.1          1            7         1   

   0     10708      14.3            0.28            0.3            1.6          0.047            46                  132            1.011   2.64     0.38        4.8         -1            7         1   

   1     10716      -3.2            -1.12          -0.53          11.7         -0.166            44                  150           0.9958   3.31     -0.12      10.4         -1            8         2   

   2     10717      8.2             0.42           -0.07          -37.1        -0.507            228                 261           0.9978   4.49    0.4261      10.54         0            8         4   

   2     10720      6.1             0.41            0.24          44.4          0.429           -230                  68           0.9627   3.32      0.5        13           1            7         3   

   0     10729      7.4              0.5            2.64            2           0.086            21                   73            0.997   3.36     0.57        9.1          0            8         1   

   2     10730      8.8             -0.83           1.29           4.7          0.222            153                  88            1.029   3.37     0.58       14.6          1            7         3   

   1     10745      5.8             0.24            0.44          -44.5         -0.04             5                  -224          0.9796   3.53     -1.65       5.9          1            6         3   

   0     10753      8.8             0.26            0.74          13.3          0.044            68                  414           0.9948   3.18    0.7559       5.1         -1            8         1   

   0     10754      6.6             0.34            0.39           6.9         -0.478           -164                 -587           1.011   2.97     0.53        9.5         -1            8         1   

   0     10762      12.1            0.75             -1            6.3          0.246            19                  246            1.008   3.09     0.53       11.1         -1            8         1   

   0     10766      2.4             -0.75           1.94          -36.4        -0.123            26                 86.34           1.022   3.16     0.44       10.2         -1            8         1   

   0     10776      13.1            0.49           -1.71          34.3          -0.11           -237                  24           0.9944   2.53     0.83       11.3         -2            8         1   

   0     10783      7.9             -0.12          -1.12           1.6          0.106            10                  244           0.9578   4.27     0.39        9.5          0            9         1   

   1     10789      10.8            0.31            0.38          52.8          0.061            49                  -99            1.019    3.4     0.58        11          -1            9         2   

   1     10790      6.1             -1.22           0.31         -29.85         0.478            249                 -72            0.95    2.86     0.61        9.3          2            7         2   

   0     10797      8.8             0.63            1.57          0.291         0.096            22                   80           0.9902   3.44      0.4       10.2          1           10         1   

   0     10807       7              0.24            -0.4           1.7          0.286            48                  308            0.992   3.25     -0.85      11.4          0            7         1   

   1     10810      7.6             -0.12           0.31          -22.9         0.079           -252                 189           0.9972   3.82     0.62       9.942         0            8         2   

   0     10817      16.2            0.38            0.29          12.7          0.05            -202                 376           0.9986   3.25     0.59         4           1            8         1   

   0     10820      0.8              0.3            0.3           -7.2          0.048            40                  -68           0.9765   3.97     -0.58      10.8         -1            6         1   

   1     10822       0              0.28            0.31            2          -0.973            225                 262           0.9958   3.15     0.86       10.1          0           10         2   

   1     10828       7              0.35            0.3           -57.7         0.04             -57                 520           0.9927   3.28     0.49        9.1          1            8         2   

   0     10829      6.5             0.32            0.33            8          0.01745          -133                 666           0.9897   3.28     1.95        8.7         -1            7         1   

   1     10830      -1.2            0.59           -0.03          -32.6         0.044            -49                 403            0.99    3.19     0.37       15.8         -2            6         2   

   2     10831      5.9             1.08            0.28          49.4          0.039            196                 139           0.9611   2.64     -0.96      15.5          1            6         4   

   1     10841      12.1            0.14            0.49           6.7          0.035            508                 120           0.9983   3.26     1.73        6.1          2            9         3   

   1     10847       14             0.18           -0.41          10.2          0.028           -201                 -292          0.9974   3.49    0.8149      16.1         -1            6         2   

   0     10856      10.2            1.66            1.22          57.1          0.618            11                   24           0.9974   3.29     1.26       11.9         -1           11         1   

   0     10860      10.7            0.35            0.53          37.4          0.065           -122                  16            1.013   3.54    0.5166       5.8          0           12         1   

   2     10861     -10.1            -0.64           0.26          55.9          0.042            368                 469           0.9713   3.43    0.3298       8.2          1            7         3   

   0     10863      6.8              0.3            0.72          21.5          0.041            65                  168            1.025    3.1      0.9        9.8          0            7         1   

   0     10875       1              1.35            0.28           2.7          0.034           -530                 -238          0.9621   3.35    0.7086      10.2          0            8         1   

   2     10884      19.1            0.61           -0.02          -33.8         0.364            34                  184            1.001   3.31     2.85       13.6          0            7         3   

   1     10895      -2.7            -0.15           0.32          -57.4         0.027            259                  72            1.037    3.5     0.45       12.5         -1            6         2   

   0     10897       6              1.05            0.32          6.93          0.053            31                 419.5           1.042   3.29     0.72       17.4          0            7         1   

   0     10898      7.4             0.83            0.27          14.1         0.1036           -164                 173           0.9933   1.86     0.52        8.2          0            8         1   

   2     10903      7.8             1.58            0.49           -28           0.1              5                  443            1.001   3.25     0.74       11.9          1           14         3   

   1     10908      7.4             0.16            0.49         -105.7         0.086            18                  150           0.9751   4.05     0.47        8.6          1            8         2   

   0     10924      7.2             2.06            0.54          -13.1         0.114            -59                  9            0.9972   4.32     -0.33       5.9          0            8         1   

   0     10926      1.5             0.18            0.39         -15.32        -0.268            48                  -243          0.9737   3.35     2.42        2.5         -1            8         1   

   0     10927      12.2            0.25           -1.14           8.1          0.045            54                  180           0.9958   3.39     1.62       9.673         0            7         1   

   0     10928       7              0.35           -0.08           0.9          0.049           -223                 119           0.9412   3.13     0.36       12.8          0            8         1   

   0     10933      17.8            0.25           -1.24          40.4          0.042            28                  166            1.037   3.19     0.59        9.7          0           11         1   

   2     10939      1.4             0.23            0.31           2.1          0.046            -20                 258           0.9926   5.05     2.41       10.7          1            7         4   

   1     10942      9.6             0.68            1.59          -41.8         0.087             5                  173           0.9988   2.79     2.02       10.2          1           11         2   

   1     10945      11.1            0.35            0.28           1.1          0.055             9                  435           0.9579    4.1      0.5        9.1         -1            7         2   

   1     10949      -1.3            0.28            0.24          19.95        -0.494            32                  174           0.9863   4.24     0.44        9.9          0            7         2   

   0     10950      6.7             0.31            0.18           7.7          0.043            57                  200           0.9656   3.72     0.44       9.782         0            7         1   

   2     10958      7.3              1.7            0.31          10.2         -0.021            58                  437           0.9977    2.7     0.45        8.6          2            8         3   

   1     10963       6              -1.18           0.33          55.8          0.834            27                  336           0.9592   3.74      1.6        6.5          0            7         2   

   1     10967      14.7            0.31            2.57         -21.65        -1.033            292                 129           0.9898   4.52     -0.88       9.5         -1            6         2   

   0     10971      -3.9            0.44            1.6           -30.8        0.02927          12.42                 24            1.045   3.68     0.24        9.2          0            8         1   

   2     10972      -1.4            0.21           -0.48           5.8         -0.518            29                  473            1.014   3.15      0.4       16.5          0            7         3   

   1     10974      5.9             0.87            0.68          -90.6        -0.425            69                   74            1.033   4.08     -1.13      13.4          0            8         2   

   2     10976      6.5             0.89            1.12          34.5          0.091            47                  129            1.028    4.4     -0.63      10.3          0            7         4   

   0     10980      14.3             1.2            0.26           5.1          0.051            16                  119            0.973   3.15     1.95        13           0            7         1   

   0     10991      7.9             -0.94          -1.02          -12.1         0.15            -9.5                 1004           1.012   0.88     -1.26       9.1          0            8         1   

   1     10995       6              -0.78           0.58            1           0.034            70                 101.5           0.949   3.21     0.42         6           0            7         3   

   2     11014      7.6             1.46            0.32           3.5          0.375            316                 113           0.9912   3.85     0.71       11.3          1            7         3   

   1     11017      5.2             0.92            0.18          3.61          0.036            41                  129            1.022   3.98    0.5111      13.4          1            6         2   

   1     11019      18.5            0.16           -0.25           28           0.044            -84                 149            0.998   3.12     0.46       14.3          1            7         2   

   0     11022      6.6             0.36            0.53          71.6          0.052           11.59                -293           1.005   2.94     0.35        6.3          0            7         1   

   2     11030      5.6             0.35           -0.72           2.5          0.046           -218                 182           0.9615   3.365    -0.4       11.3          0            6         3   

   1     11031      10.5            0.13            1.52           1.1          0.275            63                  203           0.9907   1.48      1.2       11.2         -1            7         2   

   2     11041      1.4             0.26           -0.93          61.7         -0.351            101                  66           0.9909   3.25     0.75        7.4          0            7         3   

   1     11042      5.2             -0.38           0.44           2.6          0.033            218                  37           0.9969   4.17      0.5        11           0            8         2   

   2     11044      7.7              0.4            0.31          -5.1         0.03751           27                  -281          0.9918   3.21     0.59        10           0            8         3   

   1     11047      6.7             0.24            0.41           9.4         -0.545            49                  166            1.022   3.46    0.4231       9.9          1            7         2   

   0     11048      15.3           -0.355          -0.46           4.5         -0.311           16.19                124           0.9994   3.15    0.5727       9.9          0            7         1   

   1     11049      17.6            0.12            0.21           1.3          0.222           -221                  98           0.9765   2.31     -0.55      22.6          0            6         1   

   0     11052      7.2             -0.51           2.9            57          -0.536            22                  -134          0.9236   2.85     -0.2        8.3          0            7         1   

   2     11058      8.5             0.61            0.32           5.9          0.092            136                 -284          0.9934   2.07      0.4       11.7          0            8         3   

   1     11069      6.9             -0.51           0.49          16.1          0.032            35                  148           0.9131   4.37     -0.73      13.9         -1            8         2   

   1     11070      11.1            0.37           -0.59            1           0.034            270                  94           0.9916   3.84    0.5866      11.7         -1            9         2   

   2     11073      9.4             0.18            0.58          20.05         0.313            29                 143.9          0.9584   3.51     1.93       11.4          1            6         3   

   1     11074      7.2             1.39           -1.04           8.7          0.022            145                 162           0.9958   2.37     0.61        21          -1            8         2   

   1     11078      -4.7            -1.21           0.14           1.3          0.456            52                  128           0.9934   3.76      0.6       15.6          0            7         2   

   0     11079      10.2            0.29            0.65           6.6            0              -44                 -381          0.9957   3.22     0.63        8.8          0           11         1   

   0     11085      8.3             0.715           0.15           1.8          1.024            552                 338           0.9968   3.29     -0.44       9.5          0            9         1   

   1     11088      -3.3            -2.57           0.43          44.3          0.072           -390                 275            1.046   3.77      0.7       10.9          0            9         2   

   0     11106      19.7            0.95           -0.53         -1.284         0.573            266                  72            1.04    2.97     -0.75      10.4          0            9         1   

   2     11110       7              1.49            0.4           12.8         0.01418          16.48                126           0.9942   2.08     0.38       12.2          1            8         4   

   2     11114      -12             -0.26           0.39          -8.1          0.039            46                  -208          0.9928   4.42     0.35       21.6         -1            8         3   

   0     11118      6.2             1.52            0.29           1.3         -0.373            26                  411           0.9767   4.42     1.06        9.5         -1            7         1   

   1     11129      16.1            -1.02           0.25          60.9          0.047            18                  448           0.9673   4.15     0.45        10           1            7         2   

   1     11130      2.6             0.32            1.64          1.15          0.033          -200.5               -34.5           1.012   3.23     1.41       10.5          0            7         2   

   1     11131      16.1            0.24            0.49           0.8         -0.435            29                  149           0.9952   4.16      0.9        10           0            9         2   

   0     11133      6.8             -0.52           0.33           34           0.044            45                 200.8           1.011    3.2     0.57        9.5         -1            7         1   

   2     11138      -4.2            -0.42          -0.85           8.3          0.026            284                 400           0.9857   3.97     0.38       12.3         -1            7         3   

   1     11143      7.1             1.27            0.37          43.1         -0.903            414                 114           0.9904   4.18     0.41        21           0            8         2   

   2     11146      -4.5            1.14            0.28          42.7         -0.091            250                 205           0.9731   3.12     0.38        4.7          0            8         4   

   1     11153      10.6            -0.43          -1.29          -83.6         0.066            20                  443           0.9936   4.11     0.42        10           0            7         2   

   0     11162      9.1             0.46            0.43          34.6          0.487            244                 302            1.044   3.21     0.57       12.9          2            8         1   

   2     11170      7.3             0.23           -0.86          14.6          0.254           -184                 223           0.9986   3.16     -0.1        9.9          2            8         4   

   0     11171      6.5             0.71            0.52           1.2         -0.055           -129                 -131          0.9616   3.73     -0.32      11.3          0           10         1   

   1     11201      7.1             -0.76           1.21          90.6          -0.32            64                  162            1.018   3.499    1.53       13.9         -1            8         2   

   2     11216      20.4            0.35           -0.51           1.3          0.255           -205                 105            0.994   3.156    0.66       10.6          1            8         3   

   0     11219      7.1             0.34            1.72            2          -0.428            41                  -54           0.9969   3.406    -0.22       9.4          0            8         1   

   1     11222     -13.9            -2.31           0.36           1.6          0.521            71                  844            0.993   4.45      0.4       13.3          1            8         2   

   1     11234      -4.6            0.12            0.3            3.1          0.018           -206                 499            0.99    3.22     0.52       10.4          0            8         2   

   1     11238      7.2             0.33            0.73          -3.4          0.034             8                  109           0.9925   4.01     0.57       15.1          0            8         2   

   1     11244      -0.7            -0.6           -0.63           8.4         -0.489            52                  519           0.9963   4.24     -0.99      9.982        -1            8         2   

   0     11246      4.6             0.99            0.29          49.2          0.052            51                  449           0.9954   3.02     0.58        4.2         -2            7         1   

   2     11248      3.8             1.56            1.52           1.6          0.048           -531                 366           0.9908   6.21     0.75        14           2            5         3   

   0     11250      7.7             0.64            0.21          -29.6         0.077            32                  489           0.9657   2.36     0.45       13.2          0            9         1   

   1     11256      17.5            0.24            1.13          -32.5        -0.201            52                  177            1.043   3.13     1.33        2.5          1            8         2   

   0     11259      9.8             0.28            0.4            8.9         -0.344            29                  146           0.9926   5.65     -1.17       9.3         -1            9         1   

   0     11263      4.3             -1.07           0.32          65.9          0.355             4                   15           0.9589   1.99     2.14        9.8          0           10         1   

   0     11264      7.1              0.3            1.27           -20          0.055           32.8                 342           0.9972   2.31     0.55         0           0            8         1   

   1     11270      18.4            0.34            0.21          14.28        -0.208            265                 549           0.9204   3.25     0.06        4.1         -1            8         2   

   1     11274      6.7             1.25           -0.16          4.75         -0.134            29                  134           0.9534   2.92     1.53       17.8          0            7         2   

   1     11281       12              0.2           -1.97          -28.1         0.045            27                  153           0.9964    2.4    0.8907        9          -1            8         2   

   1     11285       8              -0.62           2.3            9.6          -0.21            23                  375            1.001   3.32     1.98        7.8          0            9         2   

   0     11300      10.3            -1.02          -0.87          -31.8         0.078           -107                  28            1.024   2.57     0.87        5.8         -1           10         1   

   1     11305      8.7             -0.59          -0.89          32.8          0.398           -528                 532            1.049   3.12     0.47        8.8         -1            9         2   

   2     11317      6.5              0.9            -0.2           2.7          0.198            208                 107           0.9912   3.32     0.41       11.6         -1            7         3   

   0     11319      6.9             1.15            0.22           4.6         -0.207            55                  152           0.9685   4.28     2.14        9.3         -1            7         1   

   2     11330      6.2             0.09            1.19           1.4         0.08194           23                   81            1.018   3.26     0.42       16.1          1            7         3   

   2     11334      14.3            0.12            0.55          24.95         0.062            -63                 -188           1.013   3.27     2.23        9.1          1            8         3   

   2     11335      8.2             0.29           -0.01           42           0.082            288                 207            1.025   3.276   0.5623      10.8          1            9         4   

   0     11336      7.3             0.22           -0.59          32.5         -0.054            110                 463              1     2.79     0.38         9           0            8         1   

   2     11356      6.6             1.53            0.51          -17.9         0.046            20                  482            1.022   4.37     0.48        9.4          0            7         3   

   1     11358      10.3            0.41            0.42          -29.6         0.213             6                  -57           0.9994   3.19     1.95       13.8          0           11         2   

   0     11360      6.7             0.25            0.26         -107.3        -0.157           118.5                -169          0.9949   3.55     0.63        9.4          0            7         1   

   0     11364      9.7             0.32            0.42           8.3          0.075            12                  -27            1.035   3.231    0.71       11.8          0            9         1   

   2     11373      -0.2            0.215           0.29           3.3          0.04             10                   69            1.043   2.74     -0.08       4.5          1            6         4   

   2     11379      5.9             0.56            1.2           12.5          -0.42            36                  152           0.9972   3.28     0.43        10          -1            6         3   

   2     11382      15.7            1.29            0.28          53.5          0.042           -188                116.3          0.9952    2.3     2.09       13.3          0            7         3   

   0     11383       7              0.29            0.84         -0.817         0.194            16                  502           0.9846   2.19     0.42       16.9          0            6         1   

   2     11385      -3.2            0.38            0.49          -42.3         0.036            20                  506            0.99    1.83     -0.19      12.1          0            9         3   

   1     11387      -3.1            1.06            0.27           8.8          0.248            57                 148.7           1.027   3.08     0.38       15.7         -1            8         2   

   0     11391      0.3              0.3            0.2           4.284         0.039            34                  132           0.9916   3.85     0.38       12.6          0            7         1   

   0     11397       -5             1.09           -0.94          -54.7        -0.031           -159                 410            1.001   2.64     1.69        8.4         -1            7         1   

   0     11404      0.3             -0.26           2.11           2.9         -0.057            28                  -300          0.9893   3.13     -0.98      10.37        -2            8         1   

   0     11405      13.4            0.37            0.34          -2.4          0.028             5                   17           0.9771   1.99     0.06        7.9          1           11         1   

   1     11409      8.2             0.15            1.47           2.7          0.052            24                  190           0.9863    3.5     1.82        4.1          1            9         2   

   1     11419      -4.3            0.22            0.4           14.75         0.474           -98.5               123.5           0.977   3.36     -3.05       9.1         -1            8         2   

   2     11430      6.6             0.24            0.1           69.3          0.069           -207                 182           0.9939     4      -0.31      9.75          0            6         3   

   2     11434      14.2            0.92           -0.37           -32          0.616            273                 -80           0.9932   3.41      0.5       10.8          1            7         4   

   0     11436      7.5             0.23            1.75           2.6          0.031            118                  98            1.036   1.77     0.54        9.5         -1            8         1   

   0     11440       7              0.22           -0.06           44           -0.38            31                   71           0.9854    3.6     0.38        7.6          1            7         1   

   0     11443      13.7            -1.23          -0.78          10.06         0.047           32.51               142.6          0.9532   3.13     0.49       14.4         -1            7         1   

   1     11449      6.4             -0.55           2.48          24.6          0.493            257                 240           0.9521   3.11     1.09        8.5         -2            7         2   

   1     11452      9.6              0.7            0.27           2.2          -0.46             5                 80.15           1.043   3.14     -0.1       13.3          1           11         2   

   1     11453      16.2            -0.84          -1.31           2.2          0.088             9                 47.62          0.9972   2.25      2.1        7.3         -1            8         2   

   2     11456      11.7            -0.43          -0.51           4.8          0.083             5                  -196             1     4.05     0.43        9.5          1           13         3   

   1     11457      7.3             1.61            0.16           18           0.557            94                  224           0.9968   3.14     0.56        9.5          0            8         2   

   1     11459      6.9             1.13           -0.79          15.4         -0.153           -137                 201           0.9985   3.26     -0.48       4.9          1            8         2   

   0     11471      9.8             0.39            0.43         -13.05         -0.19            35                   11           0.9948    3.7     0.46       11.4          0           11         1   

   1     11476       6              1.68            0.72           1.3          0.046             6                  137           0.9932   4.48     0.65       14.5         -1            7         2   

   0     11479      10.4            -0.64           1.6           -45.5         0.225            11                  -331          0.9734   1.95     -0.44      15.3         -1            9         1   

   1     11481      18.6            0.36            1.04          -48.4         0.054             9                  165           0.9933   3.06     0.49        8.6          0            8         2   

   0     11485       8              -0.92          -0.05           1.1         -0.542            117                 -201          0.9877   4.97     0.34       11.2          1            9         1   

   0     11486      15.7            -0.06           0.49          56.5          0.763            58                  156            1.044    3.1    0.2491       9.4          0            9         1   

   0     11487      17.3            0.29            0.31          7.35          0.034            37                  513            1.031   4.14     0.31       10.8          0            9         1   

   0     11488      0.5             0.16            2.67           1.6          0.103           -198                 147            1.007   2.96     0.36       11.1         -1            9         1   

   2     11498      5.3            -0.155           0.19           1.5          0.458           11.92                 62           0.9993    2.6     -0.98      11.15         1            6         4   

   0     11506      12.8            -0.53           1.65           2.9          0.035            -84                 827           0.9464   3.04     0.37       12.5         -1            7         1   

   2     11511      7.4             0.22            0.32           1.7         -0.493            23                  -260           1.001   3.243    0.66       11.2          1            8         3   

   1     11515      6.8             -0.05           0.36          -10.6         0.045            245                 -604          0.9008   1.86    0.3895      11.15        -1            7         2   

   0     11518      0.2             -0.59           0.99           2.9          0.084            25                  -501           1.003    2.7     0.711       8.9         -1           10         1   

   0     11521      0.3             0.18            0.9           55.5         -0.438            14                   77           0.9939   4.31    0.3869      11.7         -1            9         1   

   0     11523      14.6            -0.15           0.35          57.5          0.036           -103                  85            0.992   3.93    0.4585      14.4          0            8         1   

   2     11524      7.4             0.49            1.44           2.1         -0.107           37.29               96.72          0.9782   2.74     0.63        12           1            8         3   

   1     11525      6.4             1.75            1.87          120.5         0.496            83                  158           0.9928    4.4     1.37        9.8          0            7         2   

   0     11528      18.2            -1.74           1.37           1.7          0.085            14                  374           0.9959   3.37     0.51       10.4         -1            8         1   

   0     11530      6.6             1.38            0.21          26.3          0.044           -140                 -218           1.042   1.39     1.24         9           0            7         1   

   1     11531      6.6             0.17            0.36          15.6          0.036           -146                 -198          0.9906   3.21     0.54        7.8         -1            7         2   

   0     11533      6.9             0.37            1.14          -53.9         0.057            54                  319           0.9712   3.23     2.12        10           0            8         1   

   1     11535      6.6             0.43           -0.18          11.9         -0.367            54                  -113           1.082   2.55     0.54        9.8          0            7         2   

   1     11537      1.7             0.18            2.02          55.9          0.061            25                  435            0.995   3.22     0.33        10           0            8         2   

   1     11538      6.4             0.38            0.14          -47.6         0.161            78                  406            0.961   3.11      0.6       12.9         -2            7         2   

   0     11541      5.9             0.09            0.2           14.4          0.05             29                 146.7          0.9967   3.24     1.13       10.3         -2            6         1   

   1     11548      8.8             0.23            0.35          45.7          0.546            26                  127            1.043   2.33     -1.04       2.9          0            9         3   

   0     11552      5.8             0.28            1.24           3.9          0.026            36                  105           0.9425   3.26     0.14       12.75        -1            6         1   

   2     11558      -1.4            -1.03           0.17          17.75         0.06             66                  -166          0.9558   3.49     -0.24      12.4          1            7         3   

   0     11560      6.7             0.55            1.56          -7.1          0.054            27                  202           0.9948   3.92     -0.89       8.5          0            7         1   

   1     11566      7.3             0.25           -0.11           8.9         -0.513            370                 182           0.9996   4.23       2         9.1          0            8         2   

   0     11572      8.8             0.35            0.49            1           0.431            301                  56            0.992   2.25     0.33        1.1          0           10         1   

   2     11573       11             0.17           -0.68          32.3          0.029            93                  161            0.99    3.07     0.18        12           0            5         3   

   2     11582      7.7             1.03           -0.16          -12.4         0.037            29                  -178          0.9943   3.38     0.55        11           0            8         3   

   0     11586      1.5             -0.69          -0.21          -19.1        -0.556            43                  132           0.9898   3.21     0.47       13.4         -1            8         1   

   2     11590      8.4             2.77            1.68           -49          0.047            14                   26           0.9753   2.66     0.78        12           0            9         3   

   0     11591      6.9             0.58            0.01          -52.8         0.08             129                 261           0.9968    3.4     0.73        9.7         -1            7         1   

   1     11601      6.6             0.23            0.27           5.6         -0.072            43                  492           0.9776   2.07     -0.64       9.5          0            7         2   

   1     11611       5               0.3            0.38           2.3          0.06             19                 111.9           1.008   2.76     0.72         8           0            9         2   

   0     11617      7.5             0.67            0.3            101          0.03           -22.11                -25           0.9919   3.05     0.68       -1.7         -1            8         1   

   1     11619       9              0.22            0.38            8           0.043            274                 152           0.9874   3.99     1.34       13.8          1            9         2   

   1     11624      -2.1            0.79            0.3            29           0.672            53                  156            1.003   3.19      0.4        9.4          0            7         2   

   2     11626      3.4             0.28            0.28           4.5          0.051            86                  267           0.9922   3.36     1.14       11.9          1            7         4   

   0     11644      9.2             -0.38          -0.84          -55.3         0.081            -78                 -220           0.998   2.94     1.08       9.659         0           10         1   

   0     11652      8.2             0.01            0.79           2.6          0.171            210                 -27           0.9988    4.3     0.75       10.3         -2            9         1   

   0     11656       5              -0.41           0.04          18.6          0.54             38                  -428           1.049   2.67     -0.07      11.9         -1            5         1   

   2     11658       9              0.21            0.58          17.1          0.155            513                 213            1.001   3.01     1.98        8.7         -2            9         3   

   2     11659      6.9             0.22           -1.01          14.04         0.044           -316                 113            1.034   3.22     -1.11       8.9          1            6         3   

   1     11663       5              0.34            0.08          58.5          0.229            40                 203.9          0.9571   3.273   0.7903       6.4         -1            7         2   

   1     11665      26.4            0.33            0.26            5           0.027            74                  143           0.9924   3.262    1.41        15           0            7         2   

   2     11683      6.1             0.41             0             1.6          0.369            36                  464            1.025   3.27     0.31       12.6          0            7         3   

   1     11685      15.1            -0.95           0.31            1           0.031            22                   73           0.9903   2.62     0.52        7.7         -1            7         2   

   0     11691      14.5            1.24            0.6            -12         -0.507            -67                 112            0.993   3.89     -0.82       9.7          0            7         1   

   1     11694      8.6             0.27           -0.44           1.8          0.524            24                  187           0.9956   4.44     0.55        9.5          0            9         2   

   0     11698      13.6            0.545           0.06            4          -0.326            79                  -178          0.9965   3.17     1.84       11.3          0            9         1   

   1     11700      7.2             0.725          -2.63          -0.55         0.086             4                  346           0.9962   3.41     1.51       13.5          0            8         2   

   0     11703       -4             1.45            1.92          -19.4         0.051           -438                 -198          0.9928   3.23      0.5       10.8          0            8         1   

   0     11705      0.4             0.36            1.72          16.3          0.053            26                  173           0.9941   4.87     0.54        4.1         -1            7         1   

   2     11710      4.8             0.16            0.24           1.6          0.524            32                  114            1.013   3.21     3.19        6.4         -1            6         3   

   1     11711      12.6            0.46           -2.81          -40.7         0.366            88                   34           0.9948    2.3     2.33        4.4         -1            7         2   

   1     11714      2.4             0.66            0.31          -10.4         0.274            22                   73            1.025   3.81     -0.49      15.5         -1            7         2   

   1     11731      11.5            0.31            0.29          -17.8        -0.125            218                 503            1.041   3.09    0.5424        9           1            7         2   

   0     11732       11             -1.44           0.68         -49.75         0.104           8.79                  -1            0.997   4.15     -1.85      11.8          0           12         1   

   0     11742      13.6            -1.2           -0.41           2.2          0.048            48                  -291           0.995   3.171    1.01       12.4          0            9         1   

   1     11744      4.8             0.19           -0.56          -23.4        -0.275           -165                 181           0.9935   3.56     0.27        3.5          0            7         2   

   0     11745      17.4            0.16            0.32          -15.1        -0.059            -4                   28            1.02    3.26     -0.61       11           0            6         1   

   2     11749      11.6            -2.59           0.31           17           0.026            31                  116           0.9898   3.33     1.66       11.65         1            6         3   

   0     11756      6.3              0.3            1.56          -45.4         0.541            18                   97           0.9959   3.44     0.33       12.5          1            7         1   

   0     11761      17.6             0.4            0.51           2.6          0.052            -61                 648            0.995    3.6      0.9       13.4         -1           10         1   

   2     11762      17.9            0.16            0.59          23.9          0.185            254                 -265          0.9595   2.88     -0.17       9.3          0            7         3   

   2     11766      14.2            0.13           -1.24          4.524         0.643            23                  502           0.9897   5.65     -1.25      17.4          0            6         3   

   2     11767      4.4             -0.51           1.3           -51.8         0.03            -160                 127            0.989   3.45     0.36       12.8          2            5         4   

   0     11769       5              1.33            0.33          132.3         1.089            31                  145           0.9983   3.36     1.85       13.1          0            7         1   

   1     11770      6.8             0.24            -0.9          18.3          0.046            40                  290           0.9637    3.3     0.17        8.7          0            7         2   

   2     11771      17.4            1.33            1.07          13.7         -0.101            44                  -574          0.9989   1.98     0.64       11.4          0            8         3   

   1     11777      7.5             -0.36          -0.44           1.2          0.032            486                 152           0.9913   2.99     0.52       18.7         -1            8         2   

   2     11778      8.7             0.33            0.33           1.7          0.061            230                  13            0.996   3.23     -0.66      10.95         1            8         3   

   2     11779      7.1             0.85            0.28           -24          0.082            570                 -285          0.9618   3.45     0.48        9.4          0            8         3   

   0     11788      -1.4            -0.62           1.86          49.7          0.182            114                 424           0.9695   4.57     -1.15      16.7          0            7         1   

   1     11790      17.3            -0.34           0.23          -36.4         0.149            35                  240            0.965   4.15     1.66        10           1            8         2   

   1     11794      11.6            0.43            0.24           1.1         -0.016            283                 163           0.9818   3.93     0.07       10.64         0            8         2   

   1     11801      2.6             0.31            0.44          33.6          0.054            243                  4            0.9877   3.04    0.6662       8.9          0            7         2   

   0     11807      7.7             0.66            0.04           1.6         -0.218             4                  -99           0.9962    3.7     0.47        9.1          0            8         1   

   1     11812      8.2             1.23            0.49           3.5          0.057            14                  -469          0.9912   3.47     0.43        5.7          0            9         3   

   2     11817      7.9             -0.57           0.73           2.1          0.651            33                  -150          0.9895   3.25     -1.27       9.9          1            9         3   

   0     11818      7.6             0.23           -0.71         -120.1         0.106            24                   13            1.089   4.18    0.7677      10.4          0            8         1   

   1     11825      7.4             1.53            1.24          11.9         -0.179            13                  -264          0.9976   3.01     2.02       10.8          1            8         2   

   2     11828       2              1.18            0.32          14.65         0.032            -86                 114           0.9916   3.12    0.6348      12.8          0            8         3   

   2     11833      6.7             0.24            1.15          3.85         -0.384            80                  -12            1.023   2.01     0.59       13.2          0            7         3   

   2     11837       7              0.34           -0.76          -5.8          0.041            -83                145.2          0.9938   3.125    0.35       11.6          1            8         3   

   0     11838      11.4            1.19            0.44          55.6          0.632           -269                  22            1.029   2.46     -1.85       9.5          0           10         1   

   1     11842      5.6            -0.085          -1.16           6.8          0.042            -80                  84           0.9896   3.337    0.11        4.4          0            6         2   

   2     11853      4.7             0.28            0.34           1.6          0.028            32                  118           0.9901   2.29     1.66       15.4          0            8         3   

   2     11857      6.8             0.27            0.32           1.5          -0.12           71.5                 142           0.9921   3.14     1.26       12.1          0            7         3   

   0     11858      -0.8            0.55            0.66          50.1          0.699           -244                  37           0.9982   2.09     -0.29       9.6          0           11         1   

   2     11860      6.5             -0.05           0.32          -47.8         0.045            -93                 -199           1.022   4.44     -0.68       6.7          1            7         3   

   1     11867       7              -0.65           1.74         -0.4625        0.355            30                  -152           1.028   3.15    0.6255      12.5          0            8         2   

   2     11868      7.1             -1.91           0.88          22.7          0.03             -31                 126           0.9901   3.22     0.34       12.1          0            8         4   

   2     11871      6.4             0.26           -0.33          29.5          0.213            33                  109            0.992   3.267   0.6513      12.7          0            7         3   

   0     11875      7.5             -0.93           1.46          19.9          0.057            131                148.9           1.016   4.28     1.51       10.5          2            8         1   

   2     11881      7.5             0.33           -1.16         -18.85         0.032            197                 243            0.964   3.55      0.4       14.1          2            8         3   

   2     11890      6.8              0.8            0.35          61.3          0.433           -166                  96           0.9878   3.23     -0.72       8.1          1            7         3   

   2     11892      5.5             0.84            0.13           1.3         0.05843           45                  -12           0.9918   3.26     0.38       10.7          0            6         3   

   1     11894       4              0.64            0.31          44.7          0.083             7                   49            1.031   3.17     1.67        8.3         -1            8         2   

   1     11896      12.6            0.34            1.74           4.7          0.029            34                  148            1.015   4.93    0.5738      14.1          1            8         2   

   1     11903      17.6            0.28            0.42           -30          0.045            41                  169           0.9959   3.17      0.9       10.6          1            9         2   

   2     11905      6.6             0.29           -0.67          -40.4         0.036            38                  318           0.9761   3.17     0.42       13.7         -1            7         3   

   0     11907      7.5             0.63           -0.87           1.2          0.332           -128                 503           0.9502   3.37     1.17       13.6          0            8         1   

   2     11909      7.3             0.14           -0.51          -1.7          0.032            -85                 -490          0.9824   3.32     0.44        12           2            7         4   

   0     11911     -15.4            0.25           -1.23          8.05         -0.297           118.5                216            1.039   3.55     -0.05       2.9          0            7         1   

   0     11915      6.8             0.21            0.66          29.7          0.216            24                  126           0.9923   3.39     1.06       10.9         -1            7         1   

   1     11918      10.4            1.22            0.55           3.2         -0.094            300                  54           0.9996    4.3    0.6196       6.9          0           11         2   

   2     11920      13.1            -0.23           0.39           1.5          0.129            187                  83           0.9908   2.96     1.78       10.7          0            7         4   

   2     11923      6.8             1.57           -0.33           1.8          0.033            297                 -149           1.003   3.64     1.95       15.2          0            7         3   

   0     11924      6.3             0.39            -2.3          0.442         0.048            325                 442            1.031   3.24     0.47       10.4          0            7         1   

   0     11926      7.6              0.4            1.44          46.1          0.096            109                 373           0.9983   3.32     0.45       10.2         -2            8         1   

   1     11931      10.1            1.91            0.69          11.3         0.0379            61                  318            1.025   2.15     1.37         9           0            8         2   

   2     11933      17.4            -0.75           0.39          -53.2         0.247            -98                 451           0.9989   3.98     0.43       14.4          0            8         3   

   1     11940      5.4             0.31            1.74            3           0.053            46                  464           0.9892   3.29     0.76        10           1            6         2   

   0     11951      14.4            1.46           -0.65          11.3         -0.137            277                 304           0.9984   2.22     0.43        9.2          1            8         1   

   0     11953      9.6             0.23            0.25          -4.8          0.093            19                  -17             1.1     3.1     0.67        8.7          0            8         1   

   2     11973      6.9             0.61            0.21          15.7          0.056            280                  63            1.035   2.51    0.5897      13.4          0            7         3   

   1     11984      5.2             0.17            0.27           0.7          0.03             216                 411            1.013    3.3     0.534      15.7         -1            6         2   

   0     11985      1.5             -0.35          -1.09          58.2          0.042            25                  256            0.997   3.35     -0.32      10.4         -1            7         1   

   0     11991      -6.1            0.26           -0.14           8.1         -0.356            366                 197           0.9956   1.98     0.48        9.5         -1            7         1   

   0     12002      -1.5            2.17            0.11         -18.85         0.039            182                 162            1.013   2.74      0.5       11.2          0            6         1   

   1     12006      1.2             0.45            0.27           4.7          0.035            17                  187            1.013   3.12    0.4931      12.5         -1            8         2   

   2     12008      5.4              0.3           -0.23          21.7          0.029            25                   93           0.9629   3.31      0.4       16.3          0            6         3   

   0     12013      -3.2            0.24            0.42          -27.6         0.087            112                 262           0.9979   1.96     0.42        8.9         -1            8         1   

   2     12015      -5.7            -0.41          -1.31          72.4         -0.317            37                  388            1.017   3.06     -0.92      13.5         -1            7         3   

   2     12016      6.3              1.5           -0.02          -97.9        -0.254            54                  518           0.9579   3.16     0.42       14.6          0            7         3   

   0     12023      6.8             -0.72           0.02           1.7         0.06792           18                  -331          0.9859   3.431    0.63        5.8          0            7         1   

   2     12029      6.1             -0.25          -0.78           3.9          0.034            42                  348            1.037   3.24     0.46       10.9          0            7         3   

   1     12036      -0.5            0.81            -0.2          64.9         -0.051           -161                 179           0.9968    4.1     1.75       18.6          0            9         2   

   0     12038      6.5             0.17            0.54           8.5          0.082            64                  397           0.9959   1.99     0.39        8.8          1            7         1   

   2     12041      7.3             -0.11          -1.02          -37.8         0.034            140                 147           0.9909   3.25     1.24       11.9          1            8         3   

   1     12049      7.2             -0.82           0.2            9.9         0.1209            21                  174            1.035   2.51       2          6           1            8         2   

   0     12050      17.3            2.11            0.02           1.3          0.072           -226                91.62          0.9965    3.1     1.08        9.2          1            8         1   

   0     12054      14.1            0.24            0.34           2.7          0.356           282.5               218.5          0.9934    3.3     0.58        9.7          1            7         1   

   1     12060      15.9            -0.63           0.36          7.399        -0.177           -181                 -185          0.9975   4.13     1.78        11          -1            8         2   

   2     12062      16.9             -1             0.35          22.2          0.045            51                  279           0.9933   1.81     0.44       15.2          1            7         3   

   0     12065      6.2               1             1.42            1          -0.386            158                 213           0.9903   3.54     -0.21      11.3         -1            7         1   

   1     12079      17.6            0.38            0.2            5.3          0.703            57                  181           0.9792   3.24     0.96        4.5         -1            7         2   

   2     12083       -2             -0.67           0.28           6.3          0.04             24                  359           0.9903   3.154    0.64       14.6          1            7         4   

   1     12090      -5.7            0.23            0.28          -40.8         0.062            276                 174           0.9494   3.23     0.72       10.6          1            6         2   

   1     12091      7.6             0.21            0.6            2.1         -0.517            47                   45           0.9881   3.05     0.54        6.5          1            8         2   

   2     12094       6              0.34            1.76          25.9          0.046           -201                 409           0.9979   3.14      2.2        8.8          0            7         3   

   1     12099      12.8            -1.95           0.38           1.2         -0.468            -91                 227           0.9924   3.14     -0.49       3.3          0            8         2   

   0     12101      18.5             0.3           -0.32          61.1          0.051            41                  -306          0.9761   4.01      0.2       10.5          1            8         1   

   0     12110      2.6             0.39            0.22           2.8         -0.198            16                  153           0.9615   1.12     0.36        9.8          0            7         1   

   2     12116      -4.2             0.3            1.78           1.6          0.377            27                  -547          0.9944   4.12    0.4189       9.8          2            8         3   

   2     12122       11             0.35            0.29          61.3         -0.522           -174                 151           0.9912   2.45     0.58       11.97        -1            6         3   

   2     12127      8.2             -2.14           0.6           1.85          0.048            184                 491           0.9549   3.79     0.49       5.05          2            9         4   

   1     12133      3.7             0.33            0.64          71.4          0.056           -242                 273           0.9972   3.05     -1.58      12.6          0            8         2   

   2     12142      6.6             0.61             0            36.9          0.577           -220                  8             0.994   3.33     0.37        5.8          1            7         4   

   2     12147      17.9            0.27            0.3           30.8          0.04            -208                84.67          0.9922   3.28     0.53       16.5          0            8         3   

   0     12156      6.6             -0.81           0.25            8           0.036           -117                 124            1.012   3.06     0.05       10.8         -1            7         1   

   2     12157      9.2             1.49            0.33          10.4         -0.361            -30                 194           0.9612   2.33     0.58       11.7          1            8         3   

   2     12158       8              0.36            0.43          -33.4         0.293            29                 71.52          0.9719    3.4     0.46        3.2          1            9         4   

   2     12161      17.5            0.23           -0.15          -40.1         0.031            24                   98            1.038     3      0.54       13.4          0            8         3   

   2     12163       3               0.4           -1.25          57.5          0.585           -166                 178           0.9955   3.04     0.43       10.9          0            8         3   

   0     12166       20             0.38            0.47           1.1          0.037            23                   22            1.008   3.21     -0.19      10.9          0            9         1   

   1     12170      10.5            -0.54           0.47          13.8          -0.46            273                110.8          0.9964   3.23     0.76       16.8          0           11         2   

   2     12174      0.4             -0.58           0.21           2.2         0.07767           -26                 522            1.026   3.32     0.47       12.9          1            7         3   

   1     12183      9.8             0.61             0             2.2          -0.16            48                   59           0.9807   3.61    0.7925      12.9          0            7         2   

   1     12188      0.9             -0.96          -0.59          26.8         -0.561            176                  19           0.9636   3.31    0.5077      12.6          0            8         2   

   2     12189      6.4             -0.13           0.06           1.8         -0.046            43                  477            1.006   3.42     0.69        11           0            7         3   

   1     12192      1.5             0.28            1.08           1.6          0.045            36                  431           0.9953   3.11    0.5356       6.2          0           10         2   

   1     12201      5.9             0.17            0.02          -48.9         0.03             32                  311           0.9891   0.96     -1.19       8.1         -1            6         2   

   0     12204      12.7            0.23            0.6            2.2          0.565             7                   18           0.9379   3.04     0.25       16.3         -1           12         1   

   0     12207      9.3             0.005           1.87          -27.2         0.07             27                   39            1.017   3.12     0.59        9.9         -1           10         1   

   0     12208      8.9             0.48            0.97           3.5         -1.012            10                   40           0.9944    3.1     0.36        9.8         -1           10         1   

   1     12209      7.3             2.695           0.33           1.1          0.044            14                  -325          0.9901    3.1    0.6751      12.4          0            8         2   

   2     12210      7.6             0.42           -0.82           1.9          0.047           -165                 432           0.9937    3.2     0.53       13.9          2            8         4   

   1     12217      7.1             0.05            0.25           1.3         -0.055           -100                 524           0.9936   3.27     0.55         8          -1            8         2   

   1     12227      8.6             0.29            1.96          32.5          0.427            288                 120            1.014   3.06     1.04       12.1          0            7         2   

   2     12231      6.2             0.25            1.01           -30         -0.278            272                71.15           1.053   4.09     0.34       12.8         -1            7         3   

   1     12232      7.6             0.17            1.1            7.1          0.05             227                 228           0.9942   1.88     -1.11       9.5          0            8         2   

   2     12239      3.9             0.275           1.45           5.4          0.118           -119                 245           0.9926   2.96     -0.79      10.8          1            6         3   

   0     12240      7.3             -0.96           1.02           7.4          0.061            -23                 -380          0.9963   3.31     0.05        13          -1            8         1   

   1     12251       14             0.19            0.3           31.9         -0.245            33                  -275           0.989   4.08     1.44       12.8         -1            7         2   

   1     12256      6.3             1.12            0.32           4.2          0.021            179                 117           0.9918   3.93     0.43       12.8          1            7         2   

   1     12261      10.2            0.05            1.84           2.4          0.075            287                80.15          0.9862   2.36     2.19        24           0           11         1   

   1     12263      8.4             0.23            0.32          13.4          0.124            35                  363           0.9881   3.12     0.47        8.8         -2            9         2   

   0     12266      8.6             0.55            0.35          15.55         0.102           35.5                248.5          0.9799   3.91     0.15        11          -1           10         1   

   0     12267      6.7             1.33           -1.12          1.35         -0.532           30.5                 544           0.9939   3.54     0.53        9.5          0            7         1   

   1     12268      4.2             0.34            0.27          -30.8         0.047            21                  144           0.9874   2.34     0.76       14.7          0            8         2   

   2     12279      -4.1            -0.21           0.29          64.7          0.051            25                 86.14           1.087   4.27     1.62        6.3          1            8         3   

   1     12280      10.7             0.6            0.49           34            0.1              5                  -381          0.9695   3.25    0.5025      11.9          1           14         2   

   0     12283       8              -0.83           0.44          -13.9         0.284            -18                 111           0.9916   3.09     0.32       11.2          0            9         1   

   2     12284       13             -0.65           0.57           0.6          0.373             6                   20           0.9965    3.4     0.48       13.3          1           10         3   

   2     12285      7.1             0.15            0.44            6           0.033             8                  135           0.9833   3.19    0.3623      13.9          1            7         4   

   2     12286      6.3             0.79            0.3            2.8          0.239            33                  125            1.031   3.03       0        14.7          1            7         3   

   1     12292      14.3            -1.1            1.04           14           0.032            47                  365            0.98    4.44      0.5       10.53         1            7         2   

   0     12295       16             0.29           -2.88           2.3         -0.129            20                  509            1.034   2.71     0.41       12.7          0            7         1   

   1     12301      11.8            0.52            0.17          -32.8         0.047             5                   26           0.9932   3.26    0.8713      16.5          0            7         2   

   0     12314      1.6             0.19            0.32          18.75         0.356            106                 517              1     2.06     1.69        6.5         -1            8         1   

   0     12315      10.3            -0.81           0.24          17.2          0.072            15                  -176          0.9956   3.22     0.66       12.8          0           11         1   

   1     12318       8              0.32            0.16           -60           0.4              3                 115.5          0.9945   3.22     0.58       11.2          0            9         2   

   2     12332      1.5             -1.1            1.31          -15.6         0.063            125                 164           0.9657   3.17     -0.41      9.927         1            8         3   

   1     12334      6.9             -0.18          -1.15           1.5          0.224            19                  -142          0.9958   3.91     0.78       14.4          0            7         2   

   1     12337      7.4             1.08           -0.08           8.8          0.027            23                  341           0.9931   4.76     1.58       11.4          0            8         2   

   1     12338      7.1             1.15            1.16          30.7          0.109            30                  124           0.9728   3.77     0.43        5.5          1            8         3   

   2     12349      7.5             0.47           -0.55          -55.6         0.048            275                  89           0.9918   3.54     2.29       13.57         0            6         3   

   2     12350      -5.9            -0.29           0.3           12.4         -0.142            -98                 168           0.9973   4.15     0.47        9.5         -1            7         3   

   2     12359       7              1.94           -0.52          -46.2        -0.555            28                  181           0.9983   3.18     -1.03       9.3          1            8         4   

   2     12360      6.8              0.3            0.22          38.9         -0.523            41                  521           0.9615   3.58     1.39        9.2          1            7         3   

   1     12373      -2.3            0.21            0.4            7.3          0.041           20.74               95.19           1.007   2.64     0.43        6.5          1            7         2   

   1     12374      6.7             -1.07           1.41          9.081         0.037            -1                  310            1.02    3.06     1.83        9.1         -1            7         2   

   1     12380      8.1             0.26           -0.94          10.1          0.05            -183                 375           0.9972   3.69     2.06         9           1            9         2   

   1     12382      6.2             0.44           -1.43           7.7          0.096            292                 242            1.019   3.56     0.72       11.1         -1            7         2   

   1     12383      17.9             0.4            0.21          45.5         -0.372            44                  182            1.048   3.35     0.54        3.6         -1            7         2   

   1     12390      7.4             0.44            0.17           -1           0.045            44                  157            0.998   3.82     0.44       9.63          1            8         2   

   1     12398      6.5             0.27            1.12          -49.2         0.142           -104                 175           0.9936   3.61     1.58       10.1          1            7         2   

   1     12405      6.4             0.18            0.77          -18.1        -0.059            24                   90           0.9963   3.35     -2.82       9.4          0            7         2   

   0     12407      -0.4            1.41            1.64          -2.6         -0.266            -75                 -31           0.9984   3.51     -0.15      15.8          0            7         1   

   2     12410      9.2             0.095           0.19           1.6          0.039            526                 -170           1.065   4.17     0.41         6           1            6         4   

   2     12418      16.4             0.3            0.29           6.2          0.172           -200                  95           0.9907   3.03     1.86       12.9          2            7         3   

   2     12421      7.4             0.42            0.47          14.15         0.667             6                  185            1.015    2.8    0.4237       9.3          1            9         3   

   0     12422      11.9            0.39            0.41          -11.7         0.062            19                  503           0.9963   3.04     0.95        9.4          1            8         1   

   0     12439      -4.2            0.695          -0.64           6.8         0.05969          -172                 -59           0.9943   3.44     -1.89       3.6          0            6         1   

   1     12444      6.1              -1             0.38          -21.1         0.111           -118                 106           0.9432   3.03     0.41       12.1          0            7         2   

   2     12463      5.8             0.32            0.28           4.3          0.032            286                 115           0.9895   3.16     1.35       15.3          0            6         4   

   0     12465      11.9            -0.95           0.01           4.9          0.119            31                  153           0.9966   3.27     0.51        3.4         -1            9         1   

   2     12470      14.9            0.15            0.34          61.5          0.035            31                  -15            0.991   3.14    0.5398       9.7          0            8         3   

   1     12471      -5.1            0.21           -0.82           7.3          0.081            34                  126           0.9962   2.86     0.46         3           0            7         2   

   2     12480      8.5             -1.16           0.48           10           0.58             146                 -275           1.036   3.25     0.37       11.9          0            9         3   

   2     12482      2.4             -0.22           0.4          -35.45         0.041            35                  -346          0.9892   3.11     1.93        6.7          0            7         3   

   1     12484      8.6             0.32            0.29           9.4          0.038           -175                 282            1.006   3.35     0.55       10.8         -1            8         2   

   2     12487      -2.4            0.52            0.11           2.9          0.605            13                   38           0.9573   3.34     2.47        9.3          0            7         3   

   1     12491      7.4             0.64            0.76          31.15        0.1157            42                  163           0.9984    2.9     0.49       -3.1          0            9         2   

   2     12503      8.8             1.32            0.44          33.4          0.042            138                 -235           1.001   3.02    0.6751      13.2          0           10         4   

   0     12507      6.8             0.36           -2.81           5.1          0.227            67                  122           0.9761   3.13     2.36       12.6          0            7         1   

   0     12526      12.5            0.39           -0.44           3.3          0.046            109                  81            1.036   3.27     0.56       12.2         -1            7         1   

   0     12533      3.9             -1.04           0.46          42.5          0.477            44                  177           0.9969   3.36     0.24        9.4          0            7         1   

   1     12540       -1             0.785          -0.15           2.1          0.459             6                  168           0.9966   3.59     0.62        7.7          0            7         2   

   0     12543      2.6             1.27            -0.8          12.5          0.602            38                   3            0.9527   3.33     1.45        4.9         -1            6         1   

   2     12552      13.4            0.695          -0.05          19.4          0.118            12                 127.6          0.9898   2.23     0.67        8.8          0            7         3   

   2     12555      6.4             0.29            0.18           15           0.588           -191                 321           0.9472    0.9      0.5        9.2          2            7         3   

   2     12556       8              1.64            0.13          17.2          0.036            49                  -238          0.9996   1.78     -0.43       9.7          0            8         3   

   1     12570       -6             1.26           -0.93          30.6          -0.34            218                  61           0.9914   4.47     2.23        5.3          0            7         3   

   1     12579      11.7             1.5            0.38          77.4          0.054            32                  445              1     3.22     1.56        9.7          0            9         2   

   0     12588       6              0.89            1.46           9.4          0.042            87                  -253          0.9895   1.65     0.41       18.4         -1            7         1   

   1     12600      -0.1             0.3           -0.99          35.7          0.04             24                   29           0.9939   3.324   0.5926       5.5          1            7         3   

   2     12615      5.6             0.34            0.02           6.9          0.038            192                  89           0.9927   4.85     -1.14       16           1            6         3   

   1     12624      6.3             -0.58           0.24           7.2          0.082            77                   47           0.9958   4.66     0.64       10.67         0            7         2   

   1     12629      -5.5            -0.85          -0.86           1.6          0.054            353                 -173          0.9973   4.51    0.6061      15.7         -1            6         2   

   1     12634       10             0.23            1.47          20.1          0.615            -28                 142            1.001   1.48     0.43        9.7         -1           11         2   

   1     12638      7.1             -0.21           0.45          -34.9        -0.072            53                   17           0.9629   3.271    2.22        3.7          0            8         3   

   0     12646      -1.9            0.51            0.24          -62.3         0.079            16                   86           0.9976   3.34     2.16        9.5          1            9         1   

   0     12650      4.6             1.03            0.65          11.2          0.075             6                   17            1.033   3.22    0.6256      11.8          0           11         1   

   0     12665      -0.4            2.38            0.29          16.85         0.605          -13.94                135            0.95    3.283    -0.64       6.7          0            8         1   

   1     12674      -4.1            0.22            1.7           -6.14         0.214           19.91                -100          0.9717    3.6     0.23         9          -1            7         2   

   0     12676      19.4             0.6             0            -11.3         0.058           11.35                 10           0.9977   3.18     2.04        3.8          0           10         1   

   0     12678      16.2            0.24            0.47          10.5          0.057           39.23                234           0.9959   3.28     0.66        8.8          0            9         1   

   0     12685      7.3             -1.01          -1.89          -43.6         0.894           -484                 368           0.9961   5.38     0.47        2.1          1            8         1   

   0     12690      6.5             -2.06           0.39           1.9         -0.502            -81                 504           0.9957   4.29     0.43       15.8          0            7         1   

   1     12698      3.4             -1.54           0.2            2.2         -0.462            551                  48            1.011   2.99     0.03       16.3          0            6         2   

   1     12702      4.2             1.74            0.31           0.9          0.144            23                  -115           0.993   4.37     0.77       11.4          1            7         2   

   0     12704      6.4             0.16            0.44           35           0.051            39                  122           0.9689   3.11     0.75       11.3          0            7         1   

   0     12705       7              1.38           -0.06          58.8          0.556           -150                 126           0.9906   3.31     0.47       16.4          0            8         1   

   2     12710      3.4             0.45            1.83          -26.9        -0.186            24                   84           0.9909   3.89     0.36       18.3         -1            7         3   

   2     12715      6.5             0.29            0.31           1.7          1.091            240                  79            1.008   3.27     -0.57      11.4          1            7         3   

   1     12720      8.2             0.26           -0.59          38.1         -0.261             7                   86           0.9944   4.34     0.62       10.2          0            9         2   

   0     12734      15.7            1.56            0.03           8.8          0.638            27                  -313          0.9959   3.64     1.91        3.5          0            8         1   

   1     12744      6.7             -0.53           1.38          -2.4          0.213            29                   81           0.9915   2.57     0.39        6.3          0            7         2   

   0     12747      2.3             -0.17           0.58            2           0.076            15                  -468          0.9973   3.35     -0.45       4.1          0            7         1   

   2     12757      16.2            0.53           -0.67           71           0.054            25                  139           0.9984   3.53     1.38       21.2          1            8         3   

   0     12758      18.6            -0.14           0.74          24.2         -0.644           -255                 252           0.9998     3      0.434       9.2         -2            8         1   

   0     12766      2.6             -0.42           3.38          61.1          0.061             9                  166           0.9942   3.28     0.49        10          -1            8         1   

   1     12782      7.6             -0.16           1.56          104.9         0.506            52                  151           0.9056   3.18     -0.4        7.3         -1            8         2   

   2     12787      13.2            0.35           -0.84          -28.2         0.368           62.41                 87            1.023   2.92    0.6868      12.2          0            9         3   

   0     12799      8.8             0.24            0.39           1.2         -0.433            32                   85            1.006   3.16      0.5       10.5         -1            8         1   

   1     12804      12.8            0.18            0.26          -33.6         0.023            10                  276           0.9893   3.07     0.54       12.3          1            6         2   

   1     12809      7.2             2.52            0.27           2.4         -0.535           -504                 149            0.964    3.1     0.51        9.2         -1            8         2   

   1     12813      7.8             0.25            -0.5          -38.2         0.04             46                  133            1.041   3.14      0.6       15.7         -1            8         2   

   1     12816      9.8             1.78            0.49          15.4          0.046            103                 101              1     2.41     0.75        2.8         -1           11         3   

   1     12821       6              0.17            0.22          46.8          0.039           -177                 104           0.9836   2.91     0.617      17.2          0            6         2   

   1     12826      6.4             -0.07           0.49           7.5          0.073            -66                 151            1.025   2.18     1.73        8.3         -2            7         2   

   1     12831      -1.4            0.13            0.61          -52.6         0.054            124                 104           0.9806   3.24     2.66       16.2          0            8         2   

   1     12832      5.8             0.39           -0.01          -29.8         0.042            36                  138           0.9938   3.95     -1.22       23           1            6         1   

   1     12833      6.7             0.28           -0.45          -23.8        -0.451           -130                 111           0.9946   3.25     -1.19       4.7         -1            7         2   

   1     12835      6.5             0.27            0.31          33.8          0.036           -188                 179           0.9979   3.39      1.9       13.2          0            7         2   

   0     12842      4.9             0.425           2.53           37          -0.492            318                 396            1.016   2.73     0.57         9          -1            7         1   

   1     12844      6.8             0.18            0.28          5.04          0.047            52                  521            1.096   3.22     0.53        4.3          0            7         2   

   1     12847      8.6             0.34            1.49          -0.1          0.471            11                  119           0.9541   3.17     0.47        9.4         -1            9         2   

   0     12852      10.4            0.21            0.7           64.2          0.596            261                 142            1.025   3.37     -0.87      10.1          0            7         1   

   1     12856      7.4             0.08            0.58          48.9          0.022            295                 -191          0.9928   3.13     0.01       11.5          0            8         2   

   1     12857      0.4              0.2            0.31          6.85          0.053           -198                 211           0.9959   3.31     0.59       10.4         -1            8         2   

   2     12858      5.1             0.25            1.71           7.7         0.01198           46                 182.6          0.9698   3.35     0.43       10.3          1            6         4   

   0     12861      7.4             0.16            1.49          52.9          0.056           -185                 168           0.9982    2.9     -1.33       8.7          0            8         1   

   1     12869      18.2            -1.27           0.59          22.6          0.147            38                  132           0.9933   3.37     -0.27       9.1          0            8         2   

   0     12876      4.7             1.09           -0.66          20.4         -0.541            17                  -11           0.9462   4.58      0.6       11.8          2            5         1   

   1     12877      5.7             -0.15           0.15          11.82         0.05             20                  360           0.9618   3.31    0.6709       2.4          0            6         2   

   0     12879      1.1             0.34            0.6            1.4          0.032            228                 392           0.9921   3.07     0.52        9.8          1            8         1   

   1     12882      12.5            -0.52           0.34           1.3          0.469            -61                 108            0.991   3.36     0.45        1.4          1            8         2   

   2     12883      -1.1            0.32            0.41           0.9         0.04448           213                 159           0.9752   3.09     1.54       16.37        -1            7         4   

   0     12887      9.5             0.49            0.36            2          -0.537           146.5               314.5          0.9924   3.24     -0.9        11          -1            8         1   

   1     12889     -10.9            0.22            0.34           -54         0.06435           -73                 -127          0.9799   2.96    0.5183       4.8          0            8         2   

   2     12891      6.8             0.17            1.31          2.078         0.039             3                  530           0.9924   3.28     1.44        10           1            6         3   

   2     12894      6.5             0.18           -1.02           1.7         -0.213            30                  -182           1.02    3.49      0.3       10.2         -1            7         3   

   0     12895      16.6            0.68            0.37           1.6          0.049           7.25                 193            1.026   3.16     0.48       13.8          0            8         1   

   2     12899     -14.1            0.24            0.89         -106.9         -0.12            218                 467           0.9537   3.24     -2.46        9           1            7         3   

   2     12905      6.5             0.94            0.06          17.1          0.128            29                   44           0.9949   3.31     1.46        14           2            7         4   

   0     12913      4.4             0.84            0.18           5.8         0.1001            32                  443            1.043   3.52     0.66       12.3          0            7         1   

   1     12916       6              1.01            1.92          50.6          0.408            171                 149           0.9937   3.652    0.82        11           0            7         2   

   0     12917      6.6             0.76           -0.04           1.4          0.656            34                  421           0.9572   3.17     0.38        10           0            7         1   

   2     12925      6.2             1.49           -0.22          -31.5         0.036            37                  -147          0.9894   3.71     3.43       12.8         -1            7         3   

   2     12934       6              -0.77           2.89           6.3         -0.545            143                 174           0.9713   3.69     1.21        9.8          1            7         3   

   2     12939       8              0.44            1.1           12.4          0.308           -142                 -35           0.9991   3.61     0.64        9.2          1            9         3   

   1     12943      1.7              0.3            0.2            1.1          0.077            48                  166           0.9944   4.31     0.54        8.7          1            6         2   

   2     12950      7.7             0.57            0.03          16.8          0.474            -11                 211           0.9755   2.954    0.58       14.5          1            8         3   

   0     12961     -11.4            1.29            1.97          24.9          0.066            10                  126              1     3.12     1.18       14.5         -1           13         1   

   0     12963      4.4             1.555           0.78          -38.9         0.075            226                 415            1.041   3.49     1.09        9.3          0            8         1   

   2     12973      5.2             -0.99            0             1.8          0.05            -228                  51           0.9728   3.68     0.79       18.1          1            6         4   

   1     12979      5.8             1.28            0.27           1.6          0.062           -185                 -150          0.9918   2.28     0.81        6.7          0            6         2   

   1     12980      8.3             0.95            0.96           2.6          0.675            235                 192           0.9627    3.4     0.53       13.8         -1            9         2   

   1     12981      7.4              1.7            0.36          53.6          0.821           -113                178.9          0.9968   1.71     -0.13       9.1         -1            8         2   

   0     12982      9.2             1.14            0.39           0.9         -0.226            15                  -390           1.029   2.96     0.28       10.4          1           10         1   

   0     12992      9.3             0.49            0.36           1.7         -0.125             3                  305           0.9191   2.21     1.12        4.4          1           10         1   

   0     12994      -5.2           -0.435           0.18           2.1         -0.174             5                   30           0.9967    3.4     0.37        9.8          0            9         1   

   1     12999      7.8              0.6            -0.6          -39.4         0.069            32                   73           0.9737   2.49     0.57        10          -1           10         2   

   1     13002      5.7             0.24            0.24           40           0.498            190                 121           0.9579   3.13     0.36        10           0            7         2   

   1     13004      3.7            -0.485           1.5            -51          0.044           -233                 -76           0.9971   4.44     -1.13        9           0            8         2   

   0     13010      6.4             -0.66           0.07          -6.7          0.254            10                  -121           1.029   2.97    0.3507      10.56         1            7         1   

   1     13013       8              1.25           -0.75           9.7          0.357            15                  323           0.9941   2.08     0.36        10           0            9         2   

   1     13015      6.6             0.27            0.29          23.6         -0.344            73                  -226           0.968   3.89     1.92        9.8          1            7         2   

   1     13019      6.3             0.34            1.33          14.7         -0.414            49                  -156           1.004   3.23     0.46       9.992         2            7         2   

   0     13030      20.6            1.29            0.03          28.5          0.076            21                 143.7           1.028   3.215    0.68       11.04        -2            8         1   

   2     13031      6.7             0.11            0.34          39.2         -0.134            41                  -80           0.9962   3.42    0.5997      10.8          1            7         3   

   0     13036       7                0             0.8           36.3          0.036            44                  132            1.042   3.34     0.11        9.4          1            7         1   

   1     13037      11.4            0.26            0.38           1.5          0.061           -190                 120           0.9919   2.44     2.12        4.1          1            8         3   

   2     13042      7.8             0.68            1.91           1.7          -0.19            104                 283            1.033   2.54     0.64        8.5          2            8         3   

   0     13054      -1.5            1.16           -0.83           -36         -0.544            115                 110           0.9525   2.26     -0.63      13.33        -1            7         1   

   2     13060      5.3             0.32           -1.47           3.7          0.043            22                  -60           0.9937   2.15     1.99       10.4          1            6         3   

   1     13072      10.3            1.54            3.37           4.5          0.113            22                  -132           0.998   3.28    0.9148      11.5          0           11         2   

   0     13073      14.8            0.59            1.11          32.5         -0.174           4.475                334            1.04    5.11    0.4786      16.2          0            7         1   

   2     13079      4.9             0.15            1.94          -41.8        -0.383           -109                 253            1.008   2.98     0.39       17.7          1            7         3   

   1     13081      8.4             -0.25           1.26           1.2         -0.342            -92                 467           0.9455   2.07     -1.41       9.5         -1            8         2   

   0     13086      6.8             0.51           -0.07          54.7          0.074             9                  -16            1.031   3.68    0.5722       9.5          0            7         1   

   1     13087      -0.6            -1.02           0.27           2.4         -0.397            199                 -249           1.045   2.65     -0.18       9.2          0            8         2   

   1     13090      6.6             1.36           -0.67          -60.8         0.07             287                 467            0.99    1.86     0.82        8.1          0            7         2   

   0     13098      4.8             0.27            0.25          59.4          0.053            54                  202            1.008   3.22     0.56        9.3          0            7         1   

   0     13100      7.3             -1.06           0.27          -47.6         0.047            16                   79           0.9917   3.07     0.46        5.2          0            8         1   

   0     13105      8.3             0.42            0.62          19.25         0.04             41                  -146           1.012   2.98     0.67        9.7          0            9         1   

   0     13106      6.4             0.25            0.3            5.5          0.208            15                  388           0.9966   3.14     -2.4         5           0            7         1   

   1     13107      6.2             0.06            0.25          -33.3         0.24             35                  -313           1.032   2.35     0.44       11.8          0            7         2   

   2     13113      12.8            1.46           -0.28          27.2          0.038            85                  153           0.9909   3.33     -0.21       12           2            7         4   

   2     13115      5.9             0.12            0.27          -24.5        -0.469            40                  507           0.9923   3.15     0.68       12.1          0            6         3   

   0     13117      -5.5            0.58            1.67         -55.85         0.058             8                   22            1.036   5.37     0.49        15          -1            8         1   

   1     13118      19.4            0.22            0.27          87.6          0.057            45                  586            0.993   3.305    0.44        9.9         -1            8         2   

   1     13121      10.5            -2.42           0.49          63.9        -0.02624          -228                 407            1.049    3.1     -0.4       10.3         -1            9         2   

   0     13137      7.2             0.18           -0.37          61.8          0.409            238                  73           0.9925   2.66      0.4       10.8         -2            8         1   

   0     13146      7.2             -0.54           0.32          32.6          0.047            152                 132            1.006   3.26    0.4579      12.2          0            8         1   

   2     13150      2.1             1.65            0.29          -40.9         0.029           6.32                 134           0.9894   3.03     2.17       12.9          1            8         3   

   1     13151      8.3             0.315           0.26           2.1          0.084            11                   50           0.9976    3.9     0.53       9.582         1            9         2   

   0     13152      -3.4            0.59            0.43          4.213         0.078            18                   30            1.012   4.58    0.6273       4.8          1            8         1   

   2     13156      7.6             0.17            0.37           1.5         0.00726           26                   75            1.035    3.3     0.46       10.8         -1            8         3   

   2     13165      15.4            1.68            0.42           7.4          0.534            56                  122           0.9958   3.22     0.48        7.1          1            7         4   

   1     13169      9.3             0.08            0.07            2           0.593            14                  141           0.9908   2.95     0.77       12.2          1            9         2   

   1     13178      6.5             -0.44           0.19          -26.7         0.064           -119                 112            0.896   3.05     1.16        4.6          0            7         2   

   0     13180      9.4             -0.85            0             1.4          0.326            11                   18           0.9758   3.254    -0.05      14.1          1            6         1   

   2     13183      14.2            0.21            0.28           8.7          0.045           -168                 -196          0.9954   3.25     0.54       10.4          0            7         3   

   2     13184      10.5            -1.21           0.64           2.4          0.453             6                   15           0.9973   3.09     0.66       11.4          1           12         3   

   1     13188      -1.6            -1.43           0.09          7.691         0.224            290                 231           0.9477   2.49     3.14       17.7         -1            7         2   

   1     13191      -5.2            0.12             0             37           0.602            32                   88           0.9897    3.2     -0.18       11           0            7         2   

   1     13196       7              1.95            0.37          29.4         -0.041            223                 104            0.955    1.9     1.98       17.7         -1            8         2   

   1     13203      18.3            0.27           -0.66          18.8          0.024            29                  128           0.9898   3.01     0.535      12.4          0            9         2   

   0     13206       -3             -0.41          -0.91           0.7          0.764            11                   66            1.034   3.97     0.16        9.8         -1            6         1   

   1     13211      6.7             0.46           -1.08           1.7           0.1             218                110.3          0.9948   3.52      0.6        15           1            7         2   

   2     13219      7.5            -0.395          -0.01          -0.6          0.413             4                   18            1.046   2.17     -0.53      14.7          1            8         3   

   2     13223      8.7              0.9            0.37           -53          0.06            -232                 371           0.9876   3.54     0.88       11.5          2            8         3   

   1     13226      6.8             0.18            0.28          12.6          0.223           -294                 113           0.9443   3.11     0.45       10.9          0            7         2   

   0     13228      17.2            -1.08           0.26           7.2         -0.469            104                 207            1.019   3.12     0.37       15.5         -1            8         1   

   1     13230       -4             0.58           -0.65          -55.3         0.345            33                   81           0.9892   3.85     -0.38      11.5          1            6         2   

   1     13240      6.6             0.72            0.89           0.8          0.462            -55                 -306          0.9776   2.65     0.37        7.8          1            7         2   

   2     13249      5.9              0.5            0.49         -1.871         0.054            187                 -39           0.9948   3.43      0.5        9.2          1            6         3   

   1     13250      10.7            0.59           -0.76           2.3          0.082           -111                 712           0.9974   4.29     1.09       10.2         -1            8         2   

   1     13256      -1.8           -1.125           0.34          50.5          0.157           97.5                  -5           0.9934   3.18     1.49       10.9          0            8         2   

   0     13261      27.4            0.185           0.14          -6.2          0.544            47                  421            0.984   3.55     0.44       14.25         0            6         1   

   0     13263      9.6             -0.78           0.61            1           0.028            190                  24           0.9926   2.91     0.04       15.8          0           10         1   

   1     13268      2.4             0.05            0.19           4.9          0.055            267                 127            1.017   4.26     0.41        6.3          1            7         2   

   1     13275      3.3             -0.23          -0.55          -23.5         0.077            221                 -445           1.038   3.36     1.06        9.1          1            8         2   

   2     13277      -2.2            0.53            0.33          13.7          0.395          -10.21                -93           0.9902   2.56     -1.16      12.8          1            8         3   

   1     13283      6.8             0.63            1.27           1.9          0.215            87                  108           0.9438   4.06     0.45       14.6          0            7         2   

   0     13284      7.1             1.13           -0.05            2           0.047           400.5               307.5           1.032   3.24     0.08       10.7          0            8         1   

   0     13285      15.2            1.06            0.3           -0.3          0.037            29                  159            1.039   5.21     0.42       11.74         0            8         1   

   2     13286       12             0.36            1.98          -11.8         1.161            -3                 63.54           1.02     3.4     0.43        11           0            8         3   

   0     13287      6.6             -0.07          -0.02           66          -0.333           -109                 -94           0.9693   2.54     0.55        2.7         -1            7         1   

   0     13290       -1             0.35            0.35            6          -0.088            31                  344            1.039    3.1     0.47        9.4          0            7         1   

   0     13291      7.5             -0.68          -1.37          -24.1         0.117           -235                 255           0.9963   3.38    0.4538       9.2          1            8         1   

   2     13294      -2.2            -0.39           1.11          -1.1         -0.043            175                 -274           1.003   2.09     1.46       18.4          1            8         3   

   1     13295      7.7              0.3            0.34          42.2         -0.332           -232                 -182           1.024   3.18     0.34        6.7         -1            8         2   

   1     13303      12.4            -0.34           0.17          17.75         0.335           -122                 553           0.9992   3.87     1.55        8.8         -1            7         2   

   0     13306      7.8             1.34            1.85           3.2          0.027            28                  786           0.9475   2.96     -0.01      11.3         -2            9         1   

   1     13311      5.8             0.29            0.05           0.8          0.272            11                  363           0.9924   3.36     0.35       14.8          1            6         2   

   0     13322      13.1            0.71           -1.55          -46.6         0.094            178                 -299           1.031   3.47     2.27        9.4          0            8         1   

   0     13331       19               1              0             2.6          1.106            25                   55           0.9968   4.93     0.68       9.82          0            9         1   

   1     13337      13.4            -1.82           1.79          -26.6         0.385            40                  199            1.007    3.2     0.26       20.9          1            6         2   

   0     13344      7.3             -0.13           0.43          95.7          0.048            52                  409           0.9698    4.5     -1.33      9.606         0            8         1   

   1     13362      5.6             -0.73          -0.83          20.3          0.027            37                  150            0.991    3.3     -1.15      13.9          1            6         2   

   0     13364      6.8             0.28            0.43           7.6         -0.653           -257                 129            1.053   3.08     1.37       12.5         -1            8         1   

   1     13366      6.8             0.33            0.31          64.6          0.045           25.73                -279             1     3.06     0.55       15.1          0            7         2   

   1     13368      18.3            0.41           -0.92           4.7          0.023            82                  110            1.007   2.21     -1.14      12.5         -1            7         2   

   0     13370      8.5             0.44            0.5           52.2          0.369            -63                 311           0.9963   1.05      1.1       13.5         -1            9         1   

   2     13377      -6.4            0.34            0.28          -11.7         0.166            -26                 457           0.9968   2.89     0.49       11.7          1            8         3   

   0     13378      8.9             0.29            0.34           -14          0.037            10                  557           0.9962   1.93     -0.23      14.2         -1            9         1   

   0     13388      11.1            0.32           -0.54           2.2          0.415            159                 -347           1.003   2.89     1.44       11.1          0           11         1   

   1     13392      6.3             1.28            0.3           5.741         0.463            23                  120            1.016   3.24     0.47       14.5          1            7         2   

   1     13398      6.4             1.07            0.32           1.9          0.04             234                 -215          0.9703   3.68     -0.52      11.8          1            7         2   

   1     13403      -2.7            0.21            -1.2          -44.1         0.033           55.42                684            0.954   2.63     0.35       10.5          1            8         2   

   1     13404      15.3            1.04            0.38          16.05         0.058            16                   19           0.9648   3.38     2.01        9.2          1            7         2   

   1     13409      7.4             -0.38          -2.95          -37.4         0.561            264                 458           0.9991   3.06     0.57        9.9          0            8         2   

   2     13416       12              0.4            1.94           1.3         -0.388            162                 149            1.052   4.18     0.96        8.7          2            8         3   

   0     13422      22.1            0.17            1.22           58          -0.133            11                  -453           1.023   3.32     -0.78      15.7          0           11         1   

   1     13427      -2.1            0.93            0.25          -32.9         0.048            152                 -23           0.9966   1.48       0         9.5          0            8         2   

   2     13433      2.4              -1             0.28           2.5         -0.554           -239                 109           0.9921   4.04     -1.29      11.6          1            7         3   

   1     13438      8.8             1.28            0.33          30.3          0.456            16                  -292           1.001   3.14     1.36       14.7         -1            9         2   

   2     13441       7              0.28           -0.56          -51.5        0.05708           32                  141            1.082   3.38     0.53        0.3          1            8         4   

   2     13449      12.4            0.89            0.28          73.95         0.041            29                  199           0.9942   2.06     -1.31      14.4          1            7         3   

   0     13450      6.7             -0.1             0            5.788         0.471            148                  75           0.9955   3.15     1.83       9.739         1            7         1   

   0     13453      13.3            0.21            0.24            6           0.042           -117                 123            0.993   3.14     -1.29      12.3         -1            8         1   

   0     13460      -2.9            0.41            0.63          26.7          0.039            185                 179           0.9979   3.08     0.44       9.845         1            9         1   

   1     13461      6.4             -0.44           0.45           3.5         -0.041            118                 180           0.9942   1.88     -0.68       7.8          1            7         2   

   1     13465       20             0.83            0.42          -30.2        -0.097            10                  -188          0.9679   3.32     0.46        9.5          0            8         2   

   1     13468      13.8            0.75           -0.96           6.8         -0.435           44.5                 234           0.9972   5.44     -2.33      10.2          1            8         2   

   1     13481       7              0.36            0.21          64.7          0.378            20                  371           0.9708   4.39     1.49        5.2          0            8         2   

   0     13485       7              0.29            3.76           3.8         -0.094            37                  -109           1.015   3.47     1.65        9.4         -1            8         1   

   2     13487      5.9             -0.1            0.56          -38.3        0.06674           258                 102           0.9923   3.24     -1.94      10.5          1            8         3   

   1     13490      10.1            -0.46           0.92           1.2          0.06             19                  464            0.99    3.25    0.4462       7.9          0            7         2   

   0     13493      15.5            -0.14           0.44          -20.8         0.034            113                 -10           0.9502   2.22     2.03       10.54         0            7         1   

   0     13497     -14.6             0.7           -0.64          -29.5         0.081            38                  430           0.9882   3.08     1.89       10.3         -1            7         1   

   1     13508      6.5             0.22            0.19           7.6         -0.422            16                  115           0.9937   4.04     0.44       10.3          1            7         2   

   0     13516      18.5            0.91            0.11           81           0.172            12                   31           0.9979    3.4    0.7613       9.9          0           10         1   

   1     13525      17.9            -1.31           0.01           2.3         -0.438            197                  19            0.996   4.17     0.87        9.1          0           11         2   

   2     13533      7.3             1.08            1.39          23.1         0.03804          -185                 424           0.9938   4.05     0.58        4.5          0            8         4   

   1     13535      15.7            -0.5            0.53           4.9         -0.475           -130                 101           0.9768   3.19     0.503      10.2          0            7         2   

   1     13538       14              0.2            0.3            15           0.546            23                  166           0.9948   3.62     2.18       13.6          0            8         2   

   0     13545      -0.3            0.27            0.19          14.2          0.085            21                  561           0.9447   2.24    0.7296       9.5          1            7         1   

   2     13566      7.7             0.25            0.43          57.3          0.231            306                 115            1.043   4.14     -0.91       8.6         -1            8         3   

   0     13581       13             0.24            0.36           5.2          0.524            49                  -253          0.9942   2.89     0.37       10.8          0            8         1   

   0     13584      -4.7            0.72            1.7            0.8          0.029            26                   77            1.025   5.66     0.51       14.2         -1            6         1   

   0     13588      5.6             0.27           -0.18           0.9          0.025           -215                  49           0.9512   3.402    0.95       13.1         -1            6         1   

   0     13596       16             1.66            -0.6           6.2          0.059            -70                 136            1.036    3.3     0.49        12           0            7         1   

   2     13600      6.3            -0.635           2.53          -3.7          0.04             37                  288            1.007    3.8     -0.1        6.3          2            7         3   

   1     13604      6.4             1.53           -1.36          27.3          0.463            17                  -137          0.9987   3.23     0.44       12.2          0            7         2   

   0     13608      6.6             0.46            0.23          -50.4         0.222            19                  184            1.021   3.11     0.38         9           1            8         1   

   0     13611     -11.5             0.4            1.23          12.9          0.033            -64                 186            1.02    3.08     0.49       -3.6          0            7         1   

   0     13612      6.4             0.85            0.98            2          -0.358            21                  191           0.9923   4.03     1.63        9.6          0            7         1   

   1     13615      6.1            -0.285          -0.16          60.5          0.056            77                  172           0.9954   3.64     0.73        5.4          0            8         2   

   1     13616      14.5            1.63            1.19           6.7          0.037            15                   60            1.044   3.95     -0.17       2.2          0            8         3   

   1     13618      -0.8            1.77            1.69          -27.9        -0.621            177                  65            0.976   5.27     -0.51      12.7          0            8         2   

   1     13625      21.1            -0.65           3.59          64.6          0.05             26                 203.9          0.9478   3.33     0.53        9.1         -1            8         2   

   2     13628      7.1             0.44            0.62          11.8          0.493            52                  276            1.049   3.62     0.46        8.7         -1            8         3   

   0     13629      8.9              1.1            1.22           1.9          0.494           -212                  16           0.9948   3.35      0.7         9           0           10         1   

   2     13630       -2              0.2            0.38          -47.2         0.034            105                 104           0.9887   2.07     0.52       15.9          1            7         3   

   1     13633      7.4             0.43           -0.34           13           0.467            37                  158           0.9226   1.95     -0.8       11.6          0            9         2   

   1     13637      5.8             0.42            0.29          7.104         0.042            -87                 101           0.9744   3.36     1.22       11.4          0            6         2   

   0     13640      6.5             0.25           -0.29          -33.7         0.36             169                 -239          0.9503    2.1     0.54        9.7         -1            7         1   

   0     13641      18.2            0.67            0.01          -33.1         0.077           -399                 -244           0.995   3.16     1.36        15           0            8         1   

   1     13651     -16.4            1.74            0.66           9.1          0.584           48.52                159           0.9454   3.66     3.09       10.8          1            7         2   

   1     13674      6.4             0.16            0.37           1.5          0.459            27                   -1              1     3.38     2.13        6.3          0            7         2   

   1     13684       6              0.82            0.96           7.7          0.046           -180                 432           0.9642   3.04     0.38        11           0            7         2   

   0     13690      6.3             0.19           -1.31          50.6         -0.274            33                 130.9          0.9833   3.71     0.54       12.8         -2            7         1   

   1     13707      7.1             -0.15          -0.65          -58.4         0.371            115                 164            1.034   3.17     0.93        10           0            8         2   

   2     13709      12.3            0.51            0.24           2.1          0.043            125                 484           0.9486   3.22     3.82       10.92         1            7         3   

   2     13710      -4.6             0.9            1.55          21.2          0.17            41.95                126           0.9848   2.95    0.6263      17.4         -1            8         3   

   1     13713      10.3            -0.78          -0.59          -51.1         0.046            113                 134            1.052   4.13     0.45       14.8          2            8         2   

   2     13724      7.6             0.29            0.42           1.3          0.035            18                  354            1.04    2.99    0.5843      11.3          2            8         3   

   2     13725      7.5             0.41           -0.41          -11.9         0.104           -143                  94           0.9481   3.092    1.91        6.5          2            8         3   

   0     13731       -1             0.29            1.9            9.1          0.05             29                  124           0.9968   3.06      1.2       -2.2         -1            8         1   

   0     13736      -1.8            0.12            0.49           5.2          0.236            33                  -257          0.9952   3.18     0.49       10.6         -1            9         1   

   2     13740      6.3            -0.565          -0.48          37.3          0.076             8                   15           0.9844   2.04     0.53       14.8          1            8         3   

   2     13745      7.3             0.34           -0.06         0.6015         0.05            19.13                136           0.9936   3.25     -0.16      10.2          2            8         3   

   1     13748      12.9            0.18           -0.59          53.3          0.055            243                 314           0.9583    3.6     0.93       15.4         -1            8         2   

   2     13751       8              0.705          -0.62           1.9          0.074             8                  131           0.9962   3.34     -0.66      10.5          1            9         3   

   0     13758      17.4            0.28            0.18          43.8          0.058             7                  108           0.9929   3.23     -0.83      9.55         -1            6         1   

   0     13762      15.2            1.23            0.57          16.4          0.042            34                  153            1.008   3.11     -0.82       9.8          0           10         1   

   2     13764      3.1             -0.56           -0.4           -57         -0.854            57                  135           0.9902   2.19     0.34       15.6          0            7         3   

   2     13765      6.4             0.24            0.29           5.5          0.038            50                  257           0.9906    3.3     0.42       11.8          0            7         3   

   0     13769      13.6            0.52            0.99           8.5         0.00022          -227                 -130          0.9963    3.2     0.33       11.3         -1            8         1   

   0     13770      11.4            0.35            0.36           1.6          0.038            163                 -288           1.018   3.25     2.24        5.3          0            9         1   

   1     13774      8.8             0.56            0.28           7.7          0.053            37                  551           0.9949   3.06      0.5         2           1            7         3   

   0     13787      29.3            0.04            0.26          21.35        -0.019            52                  495           0.9904   2.33     1.77       11.5          0            9         1   

   0     13791      7.5             0.36            0.59           2.2          0.152           -563                  18           0.9601   3.04     1.05         0           1           12         1   

   0     13802      1.1             1.51            0.57           2.3          0.201           -250                 -176           1.063   3.36     0.55        11          -1            8         1   

   0     13807      7.3             0.365           0.49          65.8          0.163            -18                  42            1.033    2.5     0.78        11           0            8         1   

   0     13808       7              0.24            2.06           6.6          0.029            17                  227           0.9965   3.03     0.61        9.5         -2            8         1   

   2     13809      8.5             0.23           -0.31          -34.7         0.035            321                 110            1.007   3.07     -0.69       6.4          1            9         3   

   1     13810      3.4             0.38            1.84          59.3         -0.048             5                   12            1.033   3.36    0.7267      12.4          0            8         2   

   1     13822      16.7            0.615           1.35           5.8          0.315             7                 28.62          0.9646   3.74     -0.09       3.2          1           14         3   

   1     13823      -2.9            0.28           -0.35          16.9          0.044            231                 -227           1.004   3.35     2.15       10.7         -1            6         2   

   1     13825      7.7             -0.06          -0.63          -43.6        -0.209            29                  131            1.038   3.68     0.44        11           0            8         2   

   2     13826      3.2             0.16            0.35          -7.3          0.635           -109                 147           0.9935   2.96     0.36        10           1            9         3   

   1     13833      17.1            1.45           -0.93           1.1          0.034            36                   84           0.9914   3.05     0.55       11.6          0           10         2   

   1     13837      8.2              0.3            1.78          12.4          0.043            52                  154           0.9945   3.04     2.11        12          -1            9         2   

   1     13842       17             0.66           -0.49          -5.1          0.031            -47                 122           0.9932   3.03     0.52       10.3          0            9         2   

   1     13846       13             0.47            0.49           4.3          0.085             6                   -7           0.9828   2.61     -0.76       15           0           14         2   

   2     13852      1.4             0.78            0.45          -24.8         0.16             370                 124           0.9953   2.93     -0.09      10.8          1           11         3   

   0     13853      11.8            -1.09           1.29           2.1          0.102            304                 -42            0.99    2.61     0.57       12.9         -2           10         1   

   1     13858      9.7             0.36            0.26          56.7          0.081            236                  79           0.9706   2.84     0.78       11.4         -1            9         2   

   1     13860      1.5             0.21            0.83           1.8          0.254           -101                 222            1.04    3.46     0.44       11.2          0            7         2   

   0     13866      5.7             0.22            1.52           3.5          0.04             27                  211            0.961    3.9     0.36       13.3          0            6         1   

   0     13886      7.6             1.73            0.29           2.1          0.075            272                 -124          0.9576   3.46    0.6263       4.8          0            8         1   

   2     13887      4.8             0.61            0.4             4           0.073            235                  69           0.9979   3.22     -0.4        9.5          1           10         3   

   0     13890      -1.1            1.76            0.34          -63.5        -0.198            30                  133           0.9954   2.78     0.44        9.8          2            7         1   

   1     13891      -9.1            -1.9            0.32         -1.867         0.549            257                 117            1.027    2.3     0.54       15.7         -1            7         2   

   0     13893      7.6             1.71            0.34          21.3         -0.131            18                  427           0.9908   3.06     1.53       12.4         -1            8         1   

   2     13902      9.2             -0.59          -1.25          37.7          0.053            -10                 175            1.008    3.2     1.05        11           2            8         3   

   1     13903       12             0.15            0.44          12.6          0.499            65                  875           0.9969   3.26    0.6377       3.8          0            7         2   

   1     13908       -2             0.54            1.95           2.4          0.581            265                 301            1.001     4      0.71        8.9          1           11         2   

   0     13912      18.7            0.27            1.04           3.6          0.036            44                  340            1.019   2.15     -0.11       9.6         -2            7         1   

   2     13924      5.9              1.2            0.1           21.4          -0.42            -98                 -61           0.9745   2.84     0.92        6.5          1            7         3   

   0     13928      7.8             0.34            0.12          -51.7         0.024           -238                 231           0.9908   3.11     0.41       12.1          0            8         1   

   0     13929      9.8             -0.4            0.3           -6.2          0.054            108                 152            1.024    3.1     -1.97       9.5          1            7         1   

   1     13938       1              1.32           -0.49           -7          -0.459            200                 189           0.9986   2.94     0.99        9.4          1            7         2   

   0     13939      7.7             -0.2            0.34           6.5          0.23            -265                 192           0.9908   2.75    0.7089       7.7         -1            8         1   

   2     13941      8.5             -0.53           1.27           9.2          0.032           -193                  61            1.004   3.06     -0.46      11.5          1            9         3   

   0     13951      10.2            0.44            0.88           6.2         -0.166           -210                 505           0.9677   3.03     0.51         9           1           12         1   

   1     13962      -4.8            0.17           -0.35          -104          0.578            109                 -253          0.9485    3.4      0.1        11          -2            8         2   

   0     13964      6.2              1.6           -0.23           1.2          0.539            147                  95           0.9869   3.24     0.89       11.8         -1            7         1   

   1     13967       3              0.31            0.27          11.1         -0.018            23                  -304           0.994   3.41     0.54       11.7         -1            8         2   

   2     13971      4.3             1.37            0.4            1.5          0.037            143                 107           0.9804   3.46     1.12       18.2         -1            7         3   

   1     13972      -0.2             0.3           -1.12          27.6          0.025            37                  107           0.9916   3.31     1.23        5.7          0            7         3   

   2     13975       12             -0.11           0.76          -40.2        -0.141           -249                  -2           0.9526   1.93     -0.34       13           2           13         3   

   0     13977      -4.6            0.24           -0.81          56.8          0.034            95                  -140          0.9977    3.2     1.07         9           0            8         1   

   2     13979      5.1             0.26            0.05           1.1          0.915            46                  -209          0.9552   3.35     0.43       11.2          0            6         3   

   0     13983      6.6             0.37            1.72          -28.4         0.613            -4                  210            1.023   3.15     0.01       11.13        -1            7         1   

   1     13984      7.6              0.4            0.09          -38.7        -1.011             6                   19           0.9788   3.99     0.82       11.7          0           11         2   

   0     13987      8.1             0.02           -0.84           7.9          0.034            17                  -241           1.014   4.08     0.31        7.3          0            7         1   

   2     13994      6.1             -0.48           1.04           9.8          0.644            33                  152           0.9809   3.31    0.3922      18.8          0            7         3   

   0     13999       10             0.22            1.28          17.6          0.054            178                 -200          0.9948   3.83     -1.14      10.1          0            7         1   

   1     14003      6.8             -1.7            0.22           6.2         -1.089            41                  190            1.016   3.18     0.51        9.2          2            7         2   

   1     14008       9              -0.26           0.03          65.2         -0.482           -234                 157            0.995   4.46     1.78       10.1          1            6         2   

   1     14011      17.7            0.19            0.59          13.6          0.18             60                  -57           0.9989   3.17    0.4851       8.7          2            9         2   

   0     14012      9.3             -0.92           0.35           1.7          0.05             257                 178            1.001   3.16     -1.05      10.2          0           10         1   

   1     14016      -4.2            0.35            1.58          13.8          0.048           -183                 103           0.9679   3.28     -0.36       5.7         -1            7         2   

   0     14017       7              -0.38           1.87          21.9          0.066           24.98                 10            1.023   3.33     0.77        11           0            8         1   

   1     14020       16             0.41           -0.02          -96.7        -0.369           -169                118.2          0.9618   3.244    0.64       10.1          0            8         2   

   2     14027      12.4            -1.04           0.49          -13.8         0.046            87                  -38            1.038   3.244    -0.12      13.9          1            8         3   

   1     14038      6.4             1.49            0.49           7.5          0.054           -238                 -139           1.046   4.07     3.38       15.4          0            7         2   

   2     14040     -17.2             0.3            1.94          -35.2        -0.078            114                 531           0.9945   3.21     -1.24       9.9          1            8         3   

   0     14042      -0.6            0.59            0.24           7.4          0.044            142                 308            1.03    3.97     2.08        4.8         -1            6         1   

   1     14055      18.4            -0.58           0.33          -42.6         0.059           -207                84.52          0.9869   2.69     2.22       10.1          1            7         2   

   1     14057      6.6             0.26           -0.69          126.5         0.239            56                  -28           0.9906   4.51      0.3       18.2          1            7         2   

   2     14060      7.3             0.18            1.38          -22.3         0.046            28                  -262           1.042   3.59     -0.06       9.4          1            8         3   

   1     14081      7.2             0.23            0.25          18.8          0.177            219                161.3           1.056   3.11     -0.17      11.6         -1            8         2   

   1     14091      5.3             0.34           -0.43           27           0.041            43                  542           0.9928   3.91     0.68        6.8          0            7         2   

   1     14111      6.6             0.56           -0.37          -1.8         -0.071            183                 107           0.9457   2.51     0.51       11.3         -1            7         2   

   2     14117      -2.3            0.16           -0.08          -14.1         0.037            18                  102           0.9923   3.62     -0.24      11.27         1            7         3   

   1     14121      11.2             0.2            0.39          16.5          0.304           -225                149.2           1.036   4.19     0.44       10.25         0            8         2   

   2     14122      8.3              0.4            1.29          16.3         0.1137           28.5                 190           0.9964   1.92     1.86       12.3          1            7         3   

   1     14125      18.6            0.01            1.69          30.6          0.07             25                  402           0.9745   3.05     -0.25       9.2          0            7         2   

   0     14129      7.8             0.43            0.32          29.7          0.08             29                  161           0.9974   2.02     0.64       14.5          0            9         1   

   0     14135      8.8             0.61            0.3            2.8            0              78                  -321          0.9976   3.26     0.51        9.3         -1           10         1   

   2     14148      8.3             -0.14            1             13           0.045            11                 160.3          0.9286    4.2     0.55       10.9          2            9         3   

   1     14157      6.9             0.13            0.86          6.596         0.035            157                 138            1.044   2.88     0.76       10.33         0            7         2   

   0     14161      7.3             1.71            0.09         -0.5555        0.39             10                  505           0.9565    3.3     0.67       16.4          0            8         1   

   0     14163      7.1             0.685           0.35          119.3        -0.364             9                  638           0.9963   2.39    0.2624       3.1          0            8         1   

   2     14172       6              -1.4             -1           12.2         -0.242            25                   97            1.003   1.93    0.6049      11.3         -1            7         3   

   2     14180      6.1             0.51            0.16          -32.7         0.069            313                 -158          0.9902   2.83     0.74       16.7          1            7         3   

   1     14182      -1.6            1.03            0.3           -19.5         0.025           47.7                128.3           0.991   3.11     1.25        11           1            7         2   

   1     14188      6.7             -0.75           0.36          -15.5         0.152            37                  509           0.9995   3.23     0.43        8.8          1            7         2   

   0     14191      6.2             0.35            -1.2           7.3          0.044            296                 282           0.9956   3.36     0.55        5.7          0            7         1   

   2     14201      7.4             0.42            0.74          60.2          0.423            42                   18           0.9978   3.12     -0.48        9           2            8         4   

   1     14202      3.3             -0.83           0.36         -0.712        -0.078           44.5                 118           0.9766   3.49     2.21       10.2          0            8         2   

   1     14213      6.2             0.21            0.34          29.5          0.351           -239                 -165          0.9472   3.022    0.45       12.5          0            7         2   

   0     14220      8.5              0.2            0.4           -26.7         0.468            50                  364           0.9919   3.78     0.35       10.5          0            9         1   

   0     14224      -3.2            0.29            1.8           -24.4        -0.476           -378                 -259          0.9939   3.16     0.39       13.2         -1            8         1   

   0     14231      5.3             0.32           -1.36          64.3          0.05             225                190.1          0.9929   2.49    0.6179       8.7         -1            8         1   

   2     14241      29.9            0.27            0.37           8.2          0.055           -104                 -236          0.9959    3.5     0.52        9.5          1            7         3   

   2     14243      8.2             0.28            1.3           61.2         -0.523           36.06                -149          0.9936   3.13     0.41        8.9          0            9         3   

   0     14245      12.7            -0.04           0.3            -35         -0.017            535                 -49           0.9331   3.32     1.86       13.8         -1            7         1   

   0     14247      6.9             -0.35           0.3           -41.5         0.346            39                  190           0.9914   1.41     0.475      12.2         -2            7         1   

   0     14248      6.4             1.19            0.46          37.9         -0.125            81                   74           0.9884   4.26     0.06       13.6          0            7         1   

   0     14252      16.1            -0.47           0.23           8.8          0.054            313                 358            1.027   3.16     0.58       12.2          0            8         1   

   2     14254      14.1            0.28            0.34           3.6          0.359            29                  121           0.9911   4.11     -0.01      12.1          0            7         3   

   2     14260      7.4             1.05            0.42           1.1         -0.044            269                 171           0.9638   3.12     0.35        6.7         -1            8         3   

   1     14269      -1.6            0.23            2.12          12.9          0.431            216                  9             1.027    3.7     1.24        9.1          1            8         2   

   2     14272      -3.3            0.61            0.42           1.2          0.033            220                  52            1.062   3.81     0.43       10.48         1            8         3   

   1     14274      -4.8            3.54            0.65          43.2         -0.257            -74                 -246          0.9592   3.75     0.34       17.7          0            7         2   

   0     14279      16.1            0.18            0.2           19.5          0.098            309                  59           0.9989   3.81     0.58       15.1          1            8         1   

   2     14280      5.8             0.17            1.26          43.4          0.036            11                   70           0.9778   3.43     1.23       10.4          1            6         3   

   1     14290       6              -1.26           3.14           1.6         -0.437            13                   61           0.9914   2.02     0.65       13.6         -1            7         2   

   2     14298      6.9             0.26            0.29          18.2          0.043            33                  114           0.9705   3.16    0.5651      12.5          2            7         4   

   2     14308      7.6             -1.23           1.37          48.8         -0.221            269                 -87           0.9914   3.04     1.54       12.8          0            8         3   

   1     14313      -8.5            0.22           -1.24          34.7         -0.538            36                  342           0.9901   3.27     0.16       20.2          0            7         2   

   1     14316      17.6            -0.47          -0.27          32.1          0.03             32                  150           0.9936   2.51     0.31        12           0            7         2   

   2     14319      0.9             0.08            0.44          14.1          0.053           -500                185.4           1.001   2.75     -0.07       9.1          1            9         4   

   0     14322      7.8             0.46            0.26           -43         0.1036           -231                  53           0.9981   3.43     1.42        9.2          1            9         1   

   1     14323      7.9             -2.36          -0.26         -114.3         0.027            316                  92            1.025   5.26    0.4046      15.8         -1            9         2   

   2     14325      -10              0.3            1.24          60.1          0.237            52                  -44            1.024    3.3     0.33       14.4          2            9         3   

   1     14337      -3.6            0.78           -1.12          41.9          0.036            28                  -77            1.039   3.24     0.77        6.1          0            8         3   

   2     14339      6.9             1.34            -0.7          -19.3         0.23             40                  461            1.065   2.98     0.47       11.8          0            8         3   

   0     14341      0.1             -0.98           1.12          -50.6         0.046            193                 208           0.9749   3.23     -0.28       9.8          0            8         1   

   2     14342      19.6            0.22            0.28           14           0.583            83                  197           0.9981   3.14     0.98       16.3          1            9         3   

   2     14346      6.2             1.78            0.24           6.1          0.032            260                  86           0.9545    1.9     1.87       12.7          1            7         4   

   1     14351      7.6              0.1           -1.13           1.2          0.481            33                  -258          0.9909   3.06     0.68        16           0            8         2   

   0     14354      7.3             0.27            0.32         -119.6         0.859            23                   72           0.9964   2.14     -0.72      10.5          0            8         1   

   1     14355      7.4             0.59           -0.89           4.4         -0.127             6                  -121          0.9974   3.38      0.5        6.8          0            8         2   

   2     14358      7.1             0.28            1.94           8.5          0.03             359                 223            1.042   4.48     0.46       10.01         2            8         3   

   0     14359      8.7             0.45            0.4           55.6          0.067            -75                 100           0.9499   3.05    0.6099      14.5         -1           10         1   

   1     14364      7.5             0.32           -0.46         -112.1        -0.502            111                 -165          0.9861   3.15     -0.23      12.8          0            8         2   

   0     14374      6.6            -0.715           0.24          -16.4         0.412           -222                 140            1.019   3.36     1.07       10.46        -2            7         1   

   0     14376      8.5             0.585           0.18           2.1          -0.42           -0.37                 30           0.9967    3.2     1.45       12.9         -1            9         1   

   0     14382      -3.4            0.39            1.53          26.7          0.02             38                  312            1.02    3.18      2.1        12           0            8         1   

   0     14384      -1.6            -0.58           0.3           -33.1         0.051            366                 552           0.9976    4.2     0.62       9.621         0            8         1   

   1     14393     -17.5            0.24           -0.57           7.3          0.19           -61.13                 -1              1     3.12      0.5        5.8          0            7         2   

   0     14398      10.9            0.27           -0.98           6.7         -0.317            61                  230           0.9661   2.82      0.4        9.4          0            7         1   

   2     14403      2.6             1.43            0.75          -34.6         0.042            183                  61           0.9914   3.22     0.54       10.8          0            7         3   

   0     14406       10             -0.33           0.14          4.402         0.071           83.62                373            1.032   3.16     -0.61       7.9          0           11         1   

   1     14408      6.3             0.31            0.3           35.9         0.03822           345                 212           0.9962   4.16     0.55        16           0            7         2   

   2     14411      -3.2            -0.68           1.76          -41.1         0.025            43                  117           0.9928   3.46     1.23        9.7          1            7         3   

   1     14414      5.8             0.23            0.2             2           -1.15            39                  426           0.9923   2.22     -0.13      16.2          0            6         2   

   0     14418      6.8             -0.64           0.36           1.4         0.08236          -122                 105           0.9912   3.23      0.6        8.9         -1            7         1   

   1     14423     -10.2            -0.5            1.79          -41.4         0.098            13                 110.3          0.9966   3.03     0.22        15           0            8         2   

   2     14442       7              0.36           -0.16          104.5        -0.006            67                  -101          0.9915   2.84     0.55        6.3          0            8         3   

   1     14443      -0.9            0.25            3.45          69.45         0.492            52                  161           0.9986   3.88     0.44       14.7          0            7         2   

   1     14444      16.1            1.65            0.22           6.2          0.025            36                   30            1.027   2.29      0.6       13.8         -1            7         2   

   2     14446      13.3            -1.06           0.29          -44.6         0.132            39                  118            1.066   3.05    0.7594       9.1         -1            7         3   

   0     14455      5.8             1.56            0.68           7.3         -0.118            -62                 145           0.9944   3.15     -0.61       10           0            6         1   

   2     14456      -4.2            0.225           0.46          -52.4        -0.423            188                 118            0.989   3.57      0.4       12.8          0            5         3   

   1     14458      7.7             0.11            0.81          14.05         0.369            325                 -208          0.9963   3.67     0.59        11           0            8         2   

   1     14464      7.1             0.68            1.33          5.904         0.324           -211                104.8           1.034   2.43     0.38        0.2          1            8         2   

   2     14466       8              0.71            0.36          -9.5          0.608            50                  151           0.9632   2.97     0.63       10.3          1            9         3   

   0     14467      7.9             0.24            1.49         -100.6         0.046           -186                 -54           0.9908   2.65     1.08       11.4          0            7         1   

   2     14469      25.9            -0.15          -0.91          21.1          -0.07            31                  257           0.9585   4.39     1.14        6.7         -1            9         3   

   2     14483      9.7             0.815           0.15           2.6         -0.356            80                  210            1.036   4.46     0.62       17.3          1            9         3   

   0     14484      0.5             0.475           1.35          14.4          0.055            146                 131           0.9932   2.97     0.29         5           0            7         1   

   0     14490       7              1.53            0.32          53.8          -0.21            -7                  -98           0.9958   3.21     0.34        10           0            7         1   

   1     14491      6.8             1.51            2.79           1.8          0.118            13                   20           0.9761   3.42     -0.29      11.3         -2            8         2   

   0     14494      6.8             0.22            0.31          29.5         -0.215            33                  330           0.8927   3.47     0.39       13.8          0            7         1   

   1     14496      -4.3            0.26            0.18          64.5          0.031            40                  114              1     5.55      0.4       11.4          0            6         2   

   0     14503      15.3            1.13            0.09           117          0.123            14                   31           0.9968   2.24     0.67       10.24        -1            7         1   

   0     14504       0              0.28            0.37           4.3          0.039            26                   99            0.992   3.83     -0.09       5.8          0            8         1   

   1     14505       7              0.16            0.94          58.3          0.045            -97                 -25           0.9958     2      2.47        8.4         -1            7         2   

   1     14506      8.2             -0.97            -1            9.6          0.507            53                  154            1.043   3.24     1.58        5.5          0            9         2   

   0     14507       7              1.01           -0.14            1           0.486             8                  119           0.9923     3      -0.34      10.78         0            8         1   

   0     14512      10.6            -0.41           0.3            4.2          0.066            38                 151.6           1.027   5.66     -0.14       9.1         -1            8         1   

   1     14520      0.5             -1.27           0.26           1.4          0.48             40                  196           0.9941   2.82     2.15       10.8          1            7         2   

   0     14527      19.2            3.11           -1.18         -107.6         0.354            193                 128            1.011   2.19     1.61        8.6         -1            8         1   

   2     14531      -4.2            0.03           -0.23           -21          0.036            49                  -637          0.9503   4.43     0.27       14.9          1            8         3   

   0     14532      7.5              1.7            1.14          14.8          0.039            62                  -178          0.9982   3.64    0.8436      10.2          0            8         1   

   0     14535      5.4             0.77            2.46          53.1          0.043            -44                 -566          0.9588   3.17     0.39         4          -1            7         1   

   0     14543      9.6             1.22            0.26           1.8          0.515            -68                 133           0.9883   4.36     0.38        5.5          0            8         1   

   1     14554      5.6             0.13            0.27           4.8          0.028            267                 114           0.9948   3.424    -0.57       9.2          0            6         2   

   2     14556      6.4             0.68            0.26          -56.6         0.069            301                 293           0.9933   3.18      0.4        9.3          2            7         3   

   1     14557      6.4             -0.83           -0.9           -7           0.252            21                   49           0.9974   4.37     -0.25       9.8          0            7         2   

   0     14561      -8.8            0.29            0.88          -8.6          0.214            58                   3            0.9995    3.3     1.61       11.1         -1            8         1   

   2     14562      5.6             0.16            0.46          36.3         0.03812           142                 115           0.9909   3.36      0.5       10.4         -1            6         3   

   0     14567      14.5            0.615          -0.79           1.4          0.068            -73                 154           0.9846    3.2     0.48        7.8         -2            8         1   

   0     14568      12.3            0.07           -0.13           1.3         -0.227            -48                 109           0.9894   4.05     -0.9       10.77        -2            7         1   

   2     14574      17.8            0.92            2.1            1.3          0.029           -258                 722           0.9903   1.89     0.42       11.9         -1            7         3   

   0     14575      6.1             0.16            0.37           1.1          0.031           -148                 106           0.9922   4.69     0.72        8.1          0            7         1   

   2     14579      8.1             0.545           0.18           1.9          -0.5             -73                  35           0.9972   4.12     -1.05        9          -1            9         3   

   1     14581      6.9             0.28            0.41          -52.9         0.05             10                  136            0.993     3      1.54        7.8          0            8         2   

   0     14582      6.5             0.28            0.34          67.5         -0.342            30                  133           0.9954   3.11     0.353       9.8         -2            7         1   

   0     14586      6.6             0.34            0.4           65.9         -0.109            68                  -66           0.9949   3.15     -0.16      6.55          0            7         1   

   1     14591       7              0.55            1.52           5.6          0.06            -527                 121           0.9674   3.34     -0.96      19.6          0            8         1   

   0     14598      9.7              0.3            -0.6          66.75         0.057            65                  239           0.9803   2.47     0.53        9.1          0            7         1   

   0     14599      3.5             0.19            0.14           1.3         0.1359           -245                 -595           1.011   2.58     3.87       12.1          0            6         1   

   0     14600      17.2            0.21            1.69           1.2          0.378            -27                 458            1.018    3.2     0.37       15.8         -1            9         1   

   2     14612      9.8             0.41            0.22           7.3          0.466           -422                 526           0.9986    3.2     -0.1       11.24         0            7         4   

   0     14613      6.7             -2.35           0.22           8.8         -0.483           -185                 103            1.039   3.22     1.34        9.4         -1            7         1   

   2     14624      14.9            0.22            0.24           2.1          0.078             1                  406           0.9653   3.41     0.87       15.5          1           10         3   

   0     14626       -4             0.23            0.88          43.4          0.205            47                  375            1.033   2.94     0.53       14.5          0            8         1   

   2     14630      6.7             0.18            1.75          10.2         -0.334            29                  155           0.9567   2.87     0.45       11.39         0            7         3   

   0     14633      8.9             0.34           -0.44          115.5         0.235            13                  176            1.04    3.14     0.81        9.7          1           10         1   

   0     14639      6.7             1.66            0.46          91.4         -0.218          -8.005                234           0.9985   3.03     0.34       14.1          0            8         1   

   1     14642       9              -0.17           0.49          36.8          0.078            26                 67.02          0.9978   3.08    0.6497       9.2          0           10         2   

   2     14643      14.1            1.69            0.27          -35.4         0.179           -215                 325           0.9571   3.45     1.05        9.4          0            8         4   

   0     14649      9.3             -0.07           0.49           2.5          0.085            38                  142           0.9978   3.17     2.21        9.4          1           10         1   

   0     14650      13.6             0.6           -0.91           4.6          0.143            -44                 416           0.9939    3.5     -0.74       14           0            6         1   

   0     14653      14.7            0.68            0.3            2.1         -0.391            17                  -53            0.995   3.22     0.71       16.4          0            9         1   

   0     14655      4.4             -0.66           0.27           4.6          0.568           -220                  98           0.9942   3.58     0.47        9.5         -1            8         1   

   0     14656       6              1.49            0.37           1.2          0.032            63                  148            0.983   3.33     0.95       12.43        -1            7         1   

   1     14662      7.7             0.44           -0.77          11.2          0.031            41                   43            1.01    3.234    0.43       12.4          0            8         2   

   2     14663      9.4             1.26             0           -40.25         0.055             7                  310           0.9832   2.54     0.53        11           1            7         3   

   0     14673      -6.3            1.72            0.66          80.4          0.105            11                  -182           0.959   3.66     -0.72       0.8          0            7         1   

   0     14674      6.5             -0.5           -0.65           79           0.289           -207                 133           0.9992   3.26     0.41        8.8         -1            7         1   

   1     14676      2.8             0.26            0.42           7.1          0.115            -36                 119            1.04     3.2     0.53        9.5          0            7         2   

   1     14682      5.9             0.19            0.21           1.7          0.419            57                  135           0.9934   4.06     0.44        9.5          0            6         2   

   2     14685      7.4             -0.72           0.28           2.4          0.234           -197                 100           0.9756   3.26     0.14       11.7          0            7         4   

   0     14689      6.9             0.21            0.81          -11.6         0.137            52                   43           0.9932   4.21     0.39       10.1          0            8         1   

   0     14693      16.4            0.21           -0.02           4.4         -0.359            37                  -224           0.991   3.282    0.91       11.5          0            6         1   

   0     14697      0.8             -0.78           1.12          11.02         0.703            12                   86           0.9936   3.15     -0.69       9.4          0            8         1   

   0     14700      -3.6            -0.47           0.25           2.9          0.047            434                 122           0.9537   3.44     0.64       10.8          0            7         1   

   0     14704      -0.9             0.4           -1.19          11.58         0.852           -174                 -142           1.025   3.15    0.4586        9           1            7         1   

   1     14710      -1.2            0.24            3.35           57           0.033            268                 266           0.9906   5.76     0.38       15.7         -1            6         2   

   1     14719      21.2            1.47           -0.71           3.2          0.058           -147                 133            0.996   2.82     1.96        9.5          0           10         2   

   1     14724      6.6             -0.42           0.8           14.05         0.042            306                 589           0.9997    3.8     1.03        2.2          1            7         2   

   2     14728      4.3             1.33            0.26          19.6          0.401            17                  -134           1.036   3.36     0.78       13.9          0            6         3   

   1     14735       20             1.04            0.18          -47.3         0.029            205                 -644           1.009   2.993    0.42       10.6          0           10         2   

   0     14736      7.2             0.33           -2.06           1.4          0.068           61.43                522           0.9925   3.28     1.95       10.6         -1            8         1   

   0     14741      -3.9            0.51            0.26           3.3         -0.192           -218                 135           0.9944   2.61    0.1625      14.2          0            8         1   

   0     14744      12.7            0.73           -0.18          -49.8        -0.281             5                   19           0.9994   2.69     0.06       10.13         1           14         1   

   0     14753      17.6            0.26            1.44           1.7          0.059           -189                  38           0.9935   3.29     0.33       10.8          0            8         1   

   2     14756      16.9            0.26            0.32          51.7          0.031            64                  -275          0.9983   2.35     0.84        9.4          0            7         3   

   2     14762      6.1             2.77           -0.28          -76.9         0.031            207                 134           0.9923   3.25     0.26         7           1            7         3   

   2     14765      7.7             0.79            0.32          118.5         0.037            23                  -155           1.001   2.41     -1.02      12.6          0            8         4   

   2     14783      6.5             0.27            0.28           3.7          0.059            136                 484           0.9704   3.23     0.41       16.9          0            7         4   

   0     14784      7.3             0.54           -1.51           8.2          -0.42            44                  142           0.9927   3.66     -1.27      12.4         -1            8         1   

   0     14786      -1.8              2             0.59          -2.5          0.046           -175                 191           0.9937   2.12     0.33       10.8          0           10         1   

   0     14790      11.6            0.23            0.57           32           0.365            -26                  8             1.036   3.14     -0.69       9.9         -1           12         1   

   1     14793      7.4             0.16            0.27         -110.8         0.05             25                  151           0.9984    2.9     -1.06       8.7         -1            8         2   

   2     14796      -2.9            -0.79          -0.68           4.8         -0.253            60                  166           0.9547   2.66       2          5           1            7         4   

   2     14801      7.2             -0.84           0.37           2.5          0.063            11                   41           0.9984   3.52     0.85        14           1            8         3   

   1     14807       7              0.62            0.48          -17.2         0.529             5                   12           0.9446   4.16     0.86        22          -1            8         1   

   1     14812      5.8             0.24            0.2           -55.4         0.064            42                  266           0.9944   2.04     -1.15      15.6          0            6         2   

   2     14815      6.8             -1.02           0.52          -38.1         0.167            28                  134            1.054   3.85     0.49        9.9          1            7         3   

   2     14831      6.1             0.29            0.17          11.8          0.242            13                   76           0.9893   3.21     0.42       12.6          0            7         3   

   2     14833      7.7             -1.15           0.94          56.4          0.523           -262                 101            1.04    3.43     1.03        9.9          1            7         4   

   2     14836      5.4             1.28            2.31            5          -0.527            -16                 106           0.9946   3.13     1.75         9           1            6         4   

   1     14856      -6.2            -0.01           -0.8           13           0.047            69                  160            0.997   3.16      0.5        4.4          0            7         3   

   0     14859      6.7             0.21            1.32          22.1          0.05             -76                90.32           1.023   3.61     1.47       10.4          0            7         1   

   0     14861      2.9             0.28            1.56          20.4          0.041           -174                 262            1.037    2.4     0.45        4.3          1            7         1   

   0     14863      11.5            1.54            0.45           40           0.704            31                  376            1.024   3.01     0.83       11.8         -1           13         1   

   2     14865      6.5             0.08           -0.67           1.9          0.281            190                  93            0.991   3.04      0.7       12.6          0            7         3   

   1     14880      8.3              0.3           -1.28          -10.8        -0.526            488                 577            1.061   3.23     1.24       8.941         0            9         2   

   1     14881      -1.8            0.14            0.27          -9.9          0.029            22                  104            1.007   3.47     0.44        10           0            6         2   

   1     14883      7.8             -0.52           0.34           -24          -0.05           -214                  41            1.006   3.79      0.4        8.6         -1            8         2   

   1     14884      7.8             1.195           3.38          24.8          0.111            -24                 223            0.99    2.71    0.6756       4.7          1            9         3   

   1     14894      14.6            0.07            1.17          -21.5        -0.467           -131                 524            1.031    3.2     2.17       10.1          0            7         2   

   2     14896       7              0.26           -0.36          -2.6         -0.017            37                  184            1.044   2.22     1.71       10.3          0            8         3   

   1     14899      19.2            -2.59          -0.12           15           0.335            140                 187           0.9491   2.93     0.57        9.4         -1            8         2   

   1     14900      4.5             -1.43           0.39          48.2          -0.26            236                  84            0.994   3.11     0.67        6.8         -1            7         2   

   1     14901      -8.2            0.14            0.38          -43.3        0.08167           31                  103           0.9835   3.01     0.36       12.03         0            6         2   

   1     14906      7.1             0.31            0.19          62.5         -0.525            205                 890            1.046   3.16     2.03        4.9          0            8         2   

   0     14907       17             -0.38           0.53           2.5         -0.168            18                   80           0.9976   2.12     -0.79       4.1          0            9         1   

   2     14915      6.1             1.62            0.29            6           0.03             29                  343            1.082   4.79     0.46        6.8          1            7         3   

   0     14919      12.2            0.19           -0.27           5.7        0.007035           27                  -286           1.014   3.04     0.54        9.4         -1            7         1   

   2     14926      7.1             0.25            0.25           1.6          0.046            50                  -224          0.9759   3.31      0.4       10.63         1            8         4   

   0     14927      13.3            0.38            0.23          10.8          0.03            -106                  96           0.8998   2.93     0.41       13.6         -1            8         1   

   1     14933      7.3             0.42            0.53          -83.9         0.047           199.5               475.5          0.9984   2.77     -0.04       8.1         -1            8         2   

   1     14937      6.7             1.75           -0.83           5.3          0.036           -134                 165              1     2.41     0.79       12.2         -1            7         2   

   1     14939      6.4             0.29            0.06            1           0.218            211                101.5           1.023   2.57     1.36        9.5         -1            7         2   

   0     14940      11.9             0.4            0.84           8.9          0.033            -97                 334            1.048   3.08     0.49       9.321         0            7         1   

   1     14943      -4.2            1.07            0.63          -99.4         0.403            34                  -74           0.9969   2.19     0.43        9.1         -1            7         2   

   1     14953      7.6             1.52            1.21           2.5         -1.034           -210                 -138           1.003   4.36     -0.43       9.2          0            8         2   

   0     14954      6.8             -0.73           0.24           6.6         -0.286            -72                 -175          0.9953   3.07     0.48        9.4         -1            7         1   

   1     14969      2.2             0.54            1.54         -26.45         0.257            -91                  8             0.997    3.4     1.24        9.4          0            8         2   

   2     14999      3.7             0.18            0.28           1.3          0.399             9                 66.04          0.9909     3      0.53       11.2          2            6         4   

   1     15008      6.7             0.79           -1.08          24.7         -0.064            223                  96           0.9913   4.37     2.21       12.4          0            7         2   

   1     15009      6.7             -1.06           0.34           -56          0.443           14.59               92.54          0.9912   3.44     0.59        6.9          0            7         2   

   1     15018      3.9              0.1            0.35           1.6          0.047            43                  154           0.9934   3.36     -0.85      11.8          1            8         2   

   1     15023      6.4             0.28            0.28            3           0.04             290                 -214          0.9922   3.25     1.94       11.27         0            7         2   

   0     15025      2.7             0.26            1.58           1.2          0.04             17                  195           0.9566   3.21     -1.75      10.8          0            8         1   

   1     15034      5.7             0.45            0.26          41.9          0.023           74.28                 95           0.9893    1.9     2.26       12.3          0            6         2   

   2     15036      4.2             0.43            1.02           8.8          0.169            18                  -214          0.9917   3.28     -0.35      12.9          0            7         3   

   2     15051      -2.5            0.21            0.28          -16.6         0.028             3                  836           0.9917   5.49     0.15       12.15         1            7         3   

   1     15052      13.1            0.19            0.35          13.5          0.105            49                  118           0.9955   2.64     -0.26      9.445        -1            7         2   

   1     15064       13             0.23            0.54          -28.9         0.044            45                  169           0.9998    3.5     0.47        8.8          0            9         2   

   1     15070      7.6             0.32            1.93          18.35         0.054            44                  -658           1.002   3.22     1.98         9           0            8         2   

   1     15074      19.6            0.27             2             2.6          0.493            29                  103            1.041   1.17     0.34        6.3          1            8         2   

   1     15077      6.2              0.2            1.02          -16.2         0.047            42                  498           0.9986   3.48     0.59        7.6          1            7         2   

   1     15081     -14.1            0.82            0.31           5.9          0.64            -250                 -54            1.001    3.2     0.43       11.7          0            6         2   

   2     15086      -0.9            0.24            0.25          -4.5          0.042           -238                 189            0.992   3.25     0.42         7           1            7         4   

   1     15093      -2.7             2.9           -2.82          34.6          0.028            -81                  66            0.998   4.21     -0.01       15          -1            9         2   

   0     15094      17.2            1.62            2.09           2.1         -0.131            20                  -327          0.9782   2.85     0.46        9.5          2            9         1   

   0     15103      7.2            -0.325          -1.25          -22.7         0.081            13                  153            1.032   4.55     -0.56       9.2         -1            8         1   

   1     15104      -0.1            2.37            0.32          52.3         0.06629           39                  166           0.9839   4.04     1.36       14.9         -2            7         2   

   0     15110      6.5             -0.92          -0.93          -14.6         0.044            25                  150           0.9705   4.18     0.44       10.2          0            7         1   

   0     15112      7.2             0.16           -0.53            1          -0.419            40                  509           0.9896   3.12      0.4       18.5         -2            8         1   

   1     15115      6.9             1.09           -0.42           1.6         0.07959           34                  -217           1.042   3.16     -1.05      11.4          2            7         2   

   0     15131      6.7             0.96            1.46           1.2         -0.434            36                   86           0.9448   3.37     1.02        9.7          0            7         1   

   2     15139      7.4             0.75            -0.3           63           0.053           19.5                 229           0.9912   2.68     -0.06       9.1         -2            8         3   

   1     15141      12.5             1.8            1.96          24.6          0.078            15                  -159           1.003   3.88     0.86       14.6          0            9         2   

   0     15148      0.2             0.32            -1.1           1.2          0.05            221.5                 88           0.9884   3.24     0.37       17.3         -1            9         1   

   2     15154      11.2            1.26            -0.1          -49.5        0.00252           46                  189           0.9587   3.12     0.37        9.1          1            7         4   

   1     15156      2.5             0.16            0.44           1.2          0.051            39                  -117          0.9906   1.97     -0.11       14          -1            7         2   

   0     15161      2.6             1.24           -1.49            2           0.079            32                  151            0.998   3.85     0.01        9.5          0           11         1   

   1     15167      18.2            1.67           -0.47          16.9          0.056            49                  282            1.032   3.37     3.82        9.6         -1            8         2   

   2     15178      13.9            0.18            0.36          16.9          0.056           8.015                -145             1     2.97     1.78       10.53         0            8         3   

   2     15205      5.7             0.28            0.24          17.5          0.044            281                 -248          0.9664   3.31     0.44       11.84         0            6         3   

   1     15207      -0.5            0.22            0.39           1.2          1.176           38.67                152            1.094   4.17     0.47        4.7          1            7         2   

   1     15222      7.1             2.84           -0.31           1.2         -0.443           -108                 124           0.9689   2.38     0.44       10.6          0            8         2   

   2     15223      3.5             0.365          -1.28           6.8         -0.364           -184                  84           0.9943   4.09     0.41       12.4          0            6         3   

   2     15225      29.8            0.29            0.67          28.5          0.41            -134                  82           0.9966    2.9     0.41        8.9          0            8         3   

   1     15228      7.1             0.26            0.46           8.2          0.051           4.55                 128            1.006   3.16    0.4783       5.9          1            8         2   

   0     15239      -0.4            0.795           0.22           2.7          0.575            46                 127.1           1.035   3.75     0.76        5.2         -1            5         1   

   0     15241      22.5            1.54            0.27         -15.85         0.551            207                 146            1.015   3.49     -2.4       10.5          0            7         1   

   1     15246       6              1.26            -0.6          32.7         -0.302            26                  173           0.9812   4.01     0.54       11.5          0            7         2   

   0     15247      5.6             0.855           0.29          -0.8          -0.39            20                  -19            1.039   3.28     -0.07       8.6         -1            6         1   

   0     15249      6.3             -1.12           -1.5          -48.8         0.043            45                  155           0.9924   1.97     0.48       10.6          0            7         1   

   2     15255      18.2            -0.88          -0.22           4.7          0.457            296                 -144           1.044   3.41    0.6406      10.8         -1            7         3   

   0     15257      -6.6            0.22           -0.38           9.4         -0.559            205                 308            1.082   3.348    -1.09        7           0            8         1   

   0     15267      7.3             -0.49           0.36          -12.7        -0.053            -13                 235           0.9772    2.7     0.23       10.5          0            8         1   

   1     15277      -4.6            0.155           2.13           1.3          0.039            -25                 136           0.9926   2.81     0.77        6.8         -1            8         2   

   2     15280       8              -0.41           0.57          50.6          0.243            18                  231           0.9529   0.98     -0.63        9           1            9         3   

   1     15289      8.1             -1.28           0.3           -21.2         0.036           23.39                 49            1.036   2.14     0.73       10.13         1            9         2   

   2     15297       6              3.03            1.83           3.8         -0.001            65                  180           0.9901   3.15     -1.05      14.6          0            7         3   

   0     15302      7.3             0.38           -1.49            2           0.366            -58                  35           0.9656   3.205    0.47         6           0            8         1   

   1     15304      8.1              0.2            2.01          -16.6         0.038            -17                 167           0.9734   3.05     0.37        7.3         -1            9         2   

   0     15312       7              0.65             3             2.1          0.01              8                   25           0.9972   2.57     0.67        3.3         -1            8         1   

   1     15321      11.9            1.63            0.58          34.2         -1.121            65                 133.3          0.9714   3.09     0.63        6.3         -1           13         2   

   0     15325       8              0.25            0.35           1.1          -0.04            13                  -284          0.9844   3.08     -1.2        8.1          0            9         1   

   1     15326      6.7             0.28            0.14         -120.8         0.043            -64                 159            0.992   1.99     0.39        7.2          1            7         2   

   1     15333      8.8              0.4           -1.19          -1.9         0.1365            19                   52            0.998   3.44     2.16        2.4          1           10         3   

   1     15337      5.6             0.02            0.6            2.1          0.074            17                   25           0.9981   3.83     1.73       10.6          0            8         2   

   0     15338      6.7             -0.29           1.62           -55          0.236            170                 277           0.9954   2.74      0.7        7.1          2            8         1   

   1     15340      15.5            0.26            0.58           7.9          0.369            -51                 180            1.025   3.31     0.26         9           2            8         2   

   0     15342      8.3             0.31            1.91           2.4         -0.117            17                   43           0.9991   4.24    0.5916       9.7         -1            9         1   

   1     15344      -2.7            0.21            0.6           -1.8         -0.377           -221                 603           0.9962   2.21     -0.9         7          -1            7         2   

   1     15347      9.9              0.5           -0.91          34.8          0.07             -48                 -13           0.9963   3.206    0.63        6.3          0            8         2   

   2     15349      6.3             0.29            0.56          20.7         -0.341           -234                175.1          0.9936   2.64     0.77       12.3          1            8         3   

   0     15355      7.5             0.91            0.02          -13.2         0.077            11                   35           0.9956   3.36     -1.13      10.8          1            8         1   

   1     15359      7.3             1.15            0.68          26.7          0.043            90                  542           0.9711   3.34      1.4       11.5          0            8         2   

   0     15366      2.3             2.36            1.28           2.2         -0.461            318                  89            1.008   3.26     1.25        9.6         -1            9         1   

   0     15367      11.1            0.42            0.42          58.8          0.064           -9.97                 19           0.9976   3.25     0.57       10.4         -1           12         1   

   0     15368      9.5             0.67            2.17          -25.5         -0.35            107                 -298          0.9968   3.305    -0.03      10.5         -1            7         1   

   1     15369      6.4             0.89            0.94          51.9          0.04            -129                 528           0.9948   3.96    0.7227       10           1            7         2   

   1     15380      -1.3             0.2            1.24          -14.3         0.05            -177                 290           0.9936   3.18     0.55        3.6          0            7         2   

   1     15381      17.4            0.18            0.49          -11.1         0.047            23                   90           0.9919   2.35     1.41       11.6         -1            7         2   

   2     15387      11.9            0.38            0.49           2.7          0.027            -23                  42              1     1.36     1.37       10.3          1           13         3   

   0     15388      15.1             0.5            1.75           1.3          0.04             87                  168            0.992   3.18     0.69       11.16         0            7         1   

   2     15389      17.8            0.45            0.07           1.9          0.632            10                   18           0.9309   3.22     1.36        13           2           11         3   

   2     15392      6.2             -1.54           0.49          10.6         -0.507           -135                 115           0.9527   3.27     0.57        8.3          0            7         3   

   1     15400      7.9             0.25            0.34          11.4          0.04             -2                  219            1.079   3.11     0.57        4.6         -1            8         2   

   0     15405      6.2             0.32            0.45          12.23         0.259           -285                  94            1.035   3.25      0.6        9.7          1            7         1   

   1     15407     -15.8            1.35            1.04          -53.2         0.043            28                   37           0.9968    3.2     0.59        9.4          0            8         2   

   2     15408      6.5             0.35           -1.09          15.87         0.567           -164                 -151          0.9962   2.93     0.51        5.3          2            7         4   

   0     15411     -15.4            -0.35           2.01          -46.1         0.003            83                  432            0.991   3.03     0.41       16.6          0            8         1   

   2     15413      5.8             0.32           -1.24          1.536         0.504            -76                  65            1.05    2.23     0.42       11.8          0            7         3   

   2     15418      6.5             0.34            0.28          -20.7         0.138            43                  188           0.9928   3.13     1.97       11.1          0            7         4   

   2     15419      7.7             0.56            0.08           0.2          0.631            257                 284            1.016   3.24     0.66       14.3          1            8         3   

   0     15421      6.6             0.28            1.76          12.8          0.044            16                  -380          0.9977    2.6     0.47        9.8          0            7         1   

   0     15425      6.7             0.63            1.34          -4.4          0.033           -145                 349            1.012   4.26     0.77       11.7          0            7         1   

   1     15436       15             0.34            2.11          14.9          0.06             26                  146           0.9983   3.13     0.45         9           0            7         2   

   2     15438      12.5            0.24            -1.6           1.7          -0.39           -144                 136           0.9932   4.16     0.51       10.4          0            9         3   

   2     15440      -1.7            0.66           -0.58           1.4          0.318            245                  13            0.994   1.73     0.58        7.8          0            9         3   

   1     15443      -5.8            1.25            0.01           79           0.037            25                  102           0.9894   4.27     -0.21        8           0            6         2   

   0     15460      11.8            0.39            0.3            2.1          0.102           -238                  7            0.9946   4.14     0.58       10.16         0            8         1   

   0     15464      7.3             -0.94           1.19           1.5          0.553            29                  108           0.9934   2.27      1.8        11          -1            8         1   

   1     15465      7.1             0.53            0.07           7.5          0.071            15                   24           0.9951   4.51     0.66       10.8         -1            8         2   

   2     15473      7.4             0.22           -0.41           8.8          0.027            283                  74           0.9685   2.98     1.01       12.4          0            8         3   

   1     15475      13.9            0.19            0.27         -4.268         0.057            196                 155            1.033   2.94     -0.63       8.8         -2            8         2   

   1     15483      6.9             -0.38           0.54           7.9          0.036           -251                 169           0.9927   2.38     0.47       12.2          0            8         2   

   2     15494      0.7             0.31           -0.93            8           0.174            33                  122            1.036   3.13     0.63       10.4          0            7         4   

   2     15495      7.8             0.91            0.74          40.1          0.808            33                  156            0.991   3.077    0.52       12.8          2            9         4   

   1     15498      -4.7            0.26           -0.41          14.4          0.067            589                 370           0.9646   3.07     3.66        4.2         -1            8         3   

   0     15499      -1.7            0.35            0.31           1.8          0.069            15                  351           0.9944   3.18     -0.59      11.9          0            8         1   

   1     15500      18.5            1.43           -0.19           1.8         -0.501             8                   24           0.9978   4.06     0.53        4.7          1            8         2   

   0     15501      8.1             0.24            0.33          1.486         0.048           -300                 -184          0.9972   3.16     -0.18      10.3         -1            9         1   

   0     15510      8.2             1.72            0.29          -14.8          0.6            -104                 742           0.9911   2.14     0.32       14.7         -1            9         1   

   0     15512      7.6             -1.07           0.37          26.5          0.04             18                   56            1.044   2.21     0.48       12.4         -1            8         1   

   0     15516      18.5            0.23            0.28          42.3          0.039            179                 403           0.9865   1.77     1.58        7.5         -1            7         1   

   2     15518       7              -1.39          -0.73          52.6          0.445            132                102.7           1.028   4.37     -0.75      12.8          1            8         3   

   1     15519      -1.5            0.43           -1.35          19.3           0.1             20                  301            0.996   3.94     -0.8       11.7          0            8         2   

   1     15524      14.9            1.54            0.49           1.6          0.167            229                  94           0.9534   3.11     1.98       11.4         -1            8         2   

   1     15527      -2.2            0.24            0.57          -4.6          0.044            80                  288           0.9974   3.96     -0.28      19.5          0            9         1   

   2     15529      7.1             -0.45           0.35          16.5          0.506             7                  789           0.9511   3.16     0.59       21.7          0            8         3   

   1     15530      5.5             0.49            0.89          28.3          0.044            28                  -257           1.033   4.61     0.82        14           0            6         2   

   0     15538      19.7             0.4            1.62            2           0.422            91                   63            1.03    2.02     1.17         9           0           10         1   

   0     15539       6              1.78            0.45          76.85         0.048            42                  419            0.969   3.76     0.98       10.1          0            7         1   

   1     15541      19.8            1.36            0.48          -54.1         0.026            23                  -491          0.9918   3.15      0.5         7           0            9         2   

   0     15546      13.6            0.25            0.24          46.1         -0.354            39                  582            0.994   3.53     0.06       10.8         -1            7         1   

   0     15547      -4.2            0.23            0.32           -22          0.024            26                 140.5          0.9908   3.29     1.59       11.8          0            7         1   

   1     15548      6.6             0.19           -1.04          15.4          -0.08            62                  153           0.9984   1.97    0.3967       9.3          1            7         2   

   0     15552      8.8             0.59            0.18          -40.7          0.3             188                  74           0.9974   2.35     1.62        8.3         -1           10         1   

   2     15556      7.3             0.51            0.26          30.6          0.307           -204                 135           0.9944   1.31     -0.35      10.1          1            8         3   

   1     15567      8.1             0.49            0.49          11.8          0.048            46                 127.9           1.015   2.62     0.46       9.11         -1            9         2   

   0     15572      7.4             -1.29           1.81          12.8          0.629           48.5                  62           0.9819   4.25     -0.86      14.5         -1            8         1   

   2     15573      20.9            0.32            0.52           1.8          0.911           -174                 -288          0.9846   3.28     -1.1       11.5          1           12         3   

   1     15574       7              1.19            0.52           1.7         -0.443           -109                 -314           1.038   2.19     0.52        9.1          0            8         2   

   0     15577      0.6             1.67           -0.33          -86.2         0.08             14                  138           0.9972   4.29      1.2        6.5         -1            8         1   

   1     15579      7.4             -0.02           0.37         -3.122        -0.039           -127                 113           0.9934   3.94     0.29        6.9          0            8         2   

   0     15581      11.5            0.21            0.38           -15         -0.327            -2                   57           0.9951   3.06     0.36        9.5         -1            7         1   

   0     15589      -4.6            -1.03           1.48          -58.2         0.123            260                 250            1.026   3.07     0.48       10.82        -1            7         1   

   0     15596      -3.2            -0.39           0.24           2.5          0.226            -96                  15           0.9991   3.32     0.35       10.5          0           10         1   

   2     15598      6.4             0.59            0.85         -39.45         0.314            61                  228              1     2.95     0.75       10.6          1            9         3   

   2     15599      7.1             0.22            0.32          16.9          0.056            -16                 158           0.9703   3.37     0.38        9.6          0            8         3   

   2     15605      10.7            0.35            0.84          64.5          0.034            -93                 134           0.9897   3.26     0.38       13.1          2            8         3   

   2     15606      6.4             -1.44           0.36          -32.9        -0.334            43                  342           0.9922   3.42     1.46        11           0            7         3   

   1     15608      6.3             0.01           -1.68          -63.3        -0.821            223                 100            0.991   3.42     0.57       11.4          0            7         2   

   1     15616      7.9             2.46            0.05           0.8          0.038            11                   30           0.9924   2.37     0.35        5.5          1            6         2   

   0     15618      7.2             0.66            1.33           2.5          0.586            124                 -269          0.9941   2.35     -0.53      12.8          0            8         1   

   0     15621      9.3             -0.06           0.42            2           0.08             11                   27           0.9974   2.01     1.04        9.4          0            9         1   

   0     15626      7.7             0.69            0.49           0.5          0.115           -255                 450           0.9851   3.54     1.56       15.9          0            9         1   

   0     15638      7.2             -0.98          -1.82            7          -0.188            19                  -233          0.9608   4.38     0.49       12.8          0            8         1   

   0     15639       7              0.69           -1.18          34.7          0.317           49.05                221           0.9954   2.89     0.84        5.7         -2            7         1   

   0     15642      2.1             0.01            0.06          -19.6         0.06             133                 392           0.9962   3.41     0.56        4.5         -2            7         1   

   0     15644      -7.6            0.425           0.48         -11.35         0.511            23                  349           0.9969   2.94    0.3493      14.2          0            7         1   

   2     15646      20.4            0.51            0.64           2.4         0.07904            6                  -85           0.9973   3.09    0.1583      22.8          1           12         4   

   1     15649      8.3             0.16            0.94          -37.3         0.025            38                  107           0.9553   2.24     0.37        6.5          1            9         2   

   1     15656      6.9             0.16           -0.51           1.8         -0.545            36                   95           0.9895   2.93     0.56        12          -1            7         2   

   1     15659      9.3            -0.695           0.24          42.2          0.217             5                 38.22          0.9966   1.89     0.59        9.9          1           10         2   

   0     15680      7.1             0.755          -1.51           1.8          0.194            124                  84           0.9959    2.2      0.5       15.4         -1            8         1   

   2     15686      5.2             2.74            0.23          -17.6         0.047            199                  77            1.025   3.32     1.43       13.8          0            6         3   

   1     15693      13.8            -0.02           0.68          -16.3         0.031            47                  491           0.9969   4.24     0.58        9.6          1            8         2   

   2     15697      23.3            0.63            1.98           6.9          0.348            50                  297           0.9958   4.01     0.46         9           1            8         3   

   2     15699       7              0.27            0.85          27.2          0.032            229                 178           0.9896   3.18     0.44       18.6          0            6         4   

   1     15701      17.4            -0.65           0.29          -39.4         0.025            37                  107           0.9916   2.59     0.63        9.1          1            7         2   

   1     15705      6.4             0.28           -0.83           7.1          0.045            313                 221           0.9952   4.35     1.96       13.3          0            7         2   

   0     15714      7.5             2.42            2.13          -50.3         0.073            22                  197           0.9972   3.32      0.7       11.5          0            8         1   

   2     15722       6              1.28            1.58          60.3         -0.176           -195                 128           0.9967    3.7     1.48       10.6          0            6         3   

   1     15728      2.9             1.69            0.35         -0.662        0.1162            -68                 396           0.9905   3.44     0.67        6.3          0            6         2   

   1     15734      5.8             0.75            2.11           2.6          0.025            133                 -65           0.9894   3.39     1.91        14          -1            6         2   

   0     15752      9.6             -0.57           1.56           0.2          0.625            15                  170           0.9979    4.1     0.92        10          -1           10         1   

   1     15756      13.3            0.66            0.23           7.9          0.476           -186                 390           0.9944   3.14     0.59       10.9          0            6         2   

   1     15760       6                0            -1.18          -23.7         0.03            -131                 105           0.9673   3.31     1.67       11.5          0            6         2   

   2     15762      8.3             0.26           -0.26           -21          0.043            64                  199            1.021   1.88     2.37       14.4          0            8         3   

   2     15767      -2.7            0.98           -0.83           5.3          0.038            85                  255            1.005   2.51     0.65       16.9         -1            6         3   

   0     15768      17.2            0.27           -1.07          113.8         0.249           35.35                 63           0.9944   2.31     1.08       17.7          0            9         1   

   2     15773      16.2            0.24            0.12           2.3         -0.062           41.76                102            1.018   3.27     1.16        11           1            8         3   

   1     15774      4.5              0.7            0.59           1.9          0.076            11                  348           0.9474   3.51    0.7952       9.4          0            8         2   

   0     15781      -2.1            -0.82           0.24          -15.7        -0.331            86                 122.1          0.9435   2.76     0.31       11.02         1            8         1   

   0     15782      7.6             -0.13           1.77           2.2          0.494             7                  330           0.9299   2.55     0.55        9.7          0            8         1   

   2     15784      -4.1            -2.21           1.46          24.3          0.03             258                 158           0.9893   3.19     0.96       16.8          2            7         4   

   0     15791      8.6             2.89            0.49           -22          0.043           43.62                -369          0.9572   2.98     0.59       10.5          1            9         1   

   1     15796      7.2             -0.11          -0.26          16.6          0.421            344                  24            1.041   2.19     1.15        9.3          1            7         2   

   2     15798      -4.2             0.4            0.19          -56.2         0.034           -197                 124           0.9549   3.22     3.35       10.1          1            7         3   

   0     15806      -8.3            1.64            0.25          85.9         -0.115           -170                 -113          0.9442   4.21     1.86        6.4         -1            7         1   

   0     15814      10.9            0.735           0.16          46.1           0.1             15                   45           0.9966   4.41     2.11        9.3          0            8         1   

   0     15819      7.2             0.64            0.09          -33.7         0.108           -247                 151           0.9818   3.07     0.42        9.2          1            8         1   

   1     15825      11.8            -1.26           1.6            6.3          1.205            238                 573            1.001   4.46     -0.18       7.3          0            8         2   

   1     15826      6.8             -0.31           1.55          -6.45         0.092           -147                 -272           0.999   2.98     0.56        5.8          1            7         2   

   2     15831      20.2            0.15            1.39          -20.1        0.1293            17                 70.07           1.01    3.03      0.4       10.3          0            9         3   

   2     15835      1.4             0.98           -0.05          -44.9         0.412            176                 417           0.9949    4.6     0.46       11.7          1            7         4   

   0     15836       6              0.31            0.12           3.6          0.067            -37                 425            1.021   3.39     -0.76       11          -1            7         1   

   2     15839      -0.4            0.19           -0.49          38.7          0.032            14                   75            1.029   2.49     0.38        13           0            7         4   

   0     15845      6.4             -0.95           1.06          -19.7        -0.553           -262                 394           0.9503   3.49     0.63        9.6          0            7         1   

   1     15858      6.5             1.39            1.67          -70.9         0.05             41                  178            1.035   3.37     2.18        9.7          0            8         2   

   1     15859       6              0.14            0.21          0.577         0.045            42                  168            1.029   3.25     0.43        5.9          0            7         2   

   1     15876      12.1            0.75           -2.96           1.1         -0.342           -174                 192           0.9841   3.32      0.5       10.2          1            7         2   

   2     15878      6.6             0.18           -0.97           1.7          0.175           47.43                585           0.9921   2.24    0.6081      10.2          0            7         3   

   2     15880      -2.4            0.18            0.34           2.7         -0.054            15                  188           0.9947   2.41     0.78       11.8          1            8         3   

   2     15886      15.9            -1.54           -0.7           68           0.332            108                 168           0.9928   3.07    0.6489      11.4          0            7         3   

   0     15888      7.2             0.62            1.53          -82.3         0.17            23.43                148           0.9986   3.17     0.93        9.2          1           10         1   

   0     15891      6.2             0.15            0.46           1.6          0.039            190                 -184           0.993   3.38     -0.86       4.7          1            7         1   

   0     15900      13.2            -0.18            1            19.5          0.04             33                  148            1.038   3.12    0.2431      18.3         -2            9         1   

   2     15902      -2.4            0.21            0.28           1.2         -0.007           -250                 234           0.9927   3.19     2.07        9.8          0            8         3   

   0     15904      7.5             0.19            0.62           9.9          -0.11            25                  115            1.04    3.15     0.46       10.9          0            8         1   

   0     15908      7.1             1.35            0.38           1.8          0.598            263                  18           0.9925   3.152    2.32       12.8         -1            8         1   

   0     15910      12.7            0.46            1.67          35.8         -0.253             6                  -723           0.996   3.28     -1.58      10.18        -1            8         1   

   0     15917      4.4             -2.83           0.37          63.5         -0.789            -52                  0            0.9884   3.19     0.51       12.4          1            7         1   

   1     15919      2.7             0.16            3.19          15.5         -0.245           -144                 135           0.9984   2.56     0.43        5.7          1            8         3   

   0     15924      15.4            0.18            0.26          80.5         -0.201            194                 -134          0.9772   4.05     0.43        9.4          0            7         1   

   0     15927      7.4              0.9            -0.1           1.3         -0.374            18                  -150          0.9904   2.32     0.56       8.15          0            7         1   

   0     15937      4.8             0.01            1.83           14           0.169             8                  113            0.978   3.44    0.2886       9.8          0            7         1   

   1     15946      1.3             0.865           0.19           7.1          0.048            193                 110           0.9548   3.03     0.41        9.5         -1            6         2   

   1     15949       7              1.27            3.7            5.9         -0.522            128                 118           0.9648   3.36     0.36        9.4         -1            8         2   

   1     15957      17.1            0.21            0.34          -72.5         0.03            -151                  91           0.9627   3.32     0.45       22.5          1            7         2   

   2     15961      2.2             0.32            0.48          -19.5        -0.064            268                 114           0.9911   3.24     -1.73      18.5          0            9         3   

   0     15964      6.2             -0.55           1.03           11           0.306            533                 -83            0.996   3.216    0.38        4.4         -1            7         1   

   1     15965      -5.9            0.26           -0.33          5.15          0.034            262                 365            1.031   3.82     0.51       20.6         -1            6         2   

   1     15966      18.2            0.46            0.54          -102          0.633            44                   -4           0.9579   1.86     0.84        8.8          1            8         2   

   0     15978      7.6             0.27           -0.23          48.8          0.386            233                 282           0.9942   3.08     1.43        3.5          0            8         1   

   2     15983      6.6             1.32             0             1.8          0.188             5                   16           0.9936   2.57     0.44       13.2          1            8         3   

   2     15987      7.1              0.6           -0.58           1.9         -0.063            62                  -244          0.9989   2.22    0.4314      10.4         -2           10         3   

   0     15988      5.7             0.25           -2.33          12.5          0.489           -83.5                417            1.003   2.56     0.45       14.3         -1            6         1   

   0     15998      -2.1            -1.67           0.3           -16.2         0.52             231                 161           0.9955   2.83     0.59       10.2         -1            7         1   

   0     16004      7.3             0.32            0.25           7.2         -0.303            47                  180           0.9961   4.26     -0.81      12.3          1            8         1   

   1     16008      28.4            0.28            0.34           8.9          0.357            95                  111           0.9727   3.25     0.47        4.7         -1            7         3   

   0     16011      -1.3            0.49            0.38          10.5         -0.225            -22                 139            1.036   3.75    0.5413      10.3          1            8         1   

   0     16023      6.7             0.38            0.19          1.55          0.036            274                  91            1.051   2.98      1.7        7.4          0            7         1   

   0     16024      15.6            0.67            0.07           1.2          0.075           78.86                108           0.9931    3.2     0.35       14.4         -1            7         1   

   0     16025      4.8             0.13            2.15           1.5          0.612            30                  133           0.9909   3.59     0.48       11.7          0            8         1   

   1     16048      13.7            0.24            0.01         -26.55         -0.08           13.07                466           0.9903   3.25    0.4266      10.7          2            7         2   

   1     16050      5.6             1.86            2.54          -24.7         0.041            322                  23           0.9685   3.196    0.99       25.5          1            8         1   

   1     16051      -3.7            0.36            0.62           7.1          0.208            -48                 613           0.9947   3.131    -1.58       9.1          0            8         2   

   1     16057      6.8             1.68            0.18          -45.3         0.044            56                   81           0.9958   3.55     0.48        9.3          1            7         2   

   2     16059      16.3            1.62            0.48           0.6          0.623            281                 506           0.9515   3.04     0.47       19.1          1            8         3   

   1     16060      -3.8             0.2            0.35           -47          0.779           -196                 -235          0.9924   2.79     -0.42       4.5          0            8         2   

   2     16075      6.4             -0.05           0.21           53           0.041            101                 146            1.06    2.42     0.87        9.8          0            6         3   

   2     16094      6.9             -0.99          -1.24          -25.6         0.11            -178                 -546           0.991   3.21     0.36       11.5          2            8         3   

   2     16096      2.8              0.3           -0.74          15.15         0.631            243                 135           0.9841   3.16      3.8         9           1            8         3   

   0     16116      -3.9            0.79            1.23          -24.1         0.061            11                 86.26          0.9959   3.53     0.93       10.4         -1            7         1   

   0     16118       31             -1.76           0.24          14.2          0.053            198                 135           0.9982    3.8     0.42        9.6          0            7         1   

   1     16121       9              0.725           0.44          47.4         -0.334           -213                 526           0.9939   3.24     -1.18      10.6         -2            7         2   

   1     16122      7.8             1.18            0.24          4.957         0.034            29                  -120          0.9903    3.1      0.4        6.1          0            7         2   

   2     16124      -0.4            -0.98           0.34           1.3          0.226            136                  0            0.9918   3.07     -1.22      14.7          1            9         4   

   1     16125      6.6             0.41            0.22          1.919         0.035            23                  117            1.01    2.84     0.39       8.44          0            7         2   

   0     16126      6.1             -0.22           1.15           1.1          0.041            32                   92            1.015   3.26    0.4298      17.2          0            7         1   

   2     16130      7.1             0.21            0.31          14.6          0.021            281                 142           0.9921   3.17     -0.37       9.7          0            8         3   
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

\normalsize

\newpage

# Appendix A

## Session Info

\begin{itemize}\raggedright
  \item R version 3.3.2 (2016-10-31), \verb|x86_64-w64-mingw32|
  \item Locale: \verb|LC_COLLATE=English_United States.1252|, \verb|LC_CTYPE=English_United States.1252|, \verb|LC_MONETARY=English_United States.1252|, \verb|LC_NUMERIC=C|, \verb|LC_TIME=English_United States.1252|
  \item Base packages: base, datasets, graphics, grDevices,
    methods, parallel, stats, utils
  \item Other packages: abc~2.1, abc.data~1.0, AER~1.2-4,
    bibtex~0.4.0, boot~1.3-18, car~2.1-4, corrplot~0.77,
    DAAG~1.22, data.table~1.10.0, doParallel~1.0.10, dplyr~0.5.0,
    e1071~1.6-7, foreach~1.4.3, forecast~7.3, Formula~1.2-1,
    ggplot2~2.2.0, glmulti~1.0.7, highlight~0.4.7, Hmisc~4.0-0,
    iterators~1.0.8, itertools~0.1-3, knitcitations~1.0.7,
    knitr~1.15.1, lars~1.2, lattice~0.20-34, leaps~2.9,
    lmtest~0.9-34, locfit~1.5-9.1, magrittr~1.5, MASS~7.3-45,
    matrixStats~0.51.0, missForest~1.4, nnet~7.3-12, pacman~0.4.1,
    pander~0.6.0, pracma~1.9.5, purrr~0.2.2, quantreg~5.29,
    randomForest~4.6-12, readr~1.0.0, rJava~0.9-8, sandwich~2.3-4,
    scales~0.4.1, SparseM~1.74, stargazer~5.2, stringr~1.1.0,
    survival~2.40-1, tibble~1.2, tidyr~0.6.0, tidyverse~1.0.0,
    timeDate~3012.100, xlsx~0.5.7, xlsxjars~0.6.1, xtable~1.8-2,
    zoo~1.7-13
  \item Loaded via a namespace (and not attached): acepack~1.4.1,
    assertthat~0.1, backports~1.0.4, bitops~1.0-6, class~7.3-14,
    cluster~2.0.5, codetools~0.2-15, colorspace~1.3-1, DBI~0.5-1,
    digest~0.6.10, evaluate~0.10, foreign~0.8-67, fracdiff~1.4-2,
    grid~3.3.2, gridExtra~2.2.1, gtable~0.2.0, htmlTable~1.7,
    htmltools~0.3.5, httr~1.2.1, latticeExtra~0.6-28,
    lazyeval~0.2.0, lme4~1.1-12, lubridate~1.6.0, Matrix~1.2-7.1,
    MatrixModels~0.4-1, mgcv~1.8-16, minqa~1.2.4, munsell~0.4.3,
    nlme~3.1-128, nloptr~1.0.4, pbkrtest~0.4-6, plyr~1.8.4,
    quadprog~1.5-5, R6~2.2.0, RColorBrewer~1.1-2, Rcpp~0.12.8,
    RCurl~1.95-4.8, RefManageR~0.13.1, RJSONIO~1.3-0,
    rmarkdown~1.2, rpart~4.1-10, rprojroot~1.1, splines~3.3.2,
    stringi~1.1.2, tools~3.3.2, tseries~0.10-35, XML~3.98-1.5,
    yaml~2.1.14
\end{itemize}

## Data Dictionary

\footnotesize

----------------------------------------------------
    Variable Code     Definition                    
--------------------- ------------------------------
      **INDEX**       **Identification Variable (do 
                      not use)**                    

       TARGET         Number of Cases Purchased     

    **AcidIndex**     **Proprietary method of       
                      testing total acidity of wine 
                      by using a weighted averag**  

       Alcohol        Alcohol Content               

    **Chlorides**     **Chloride content of wine**  

     CitricAcid       Citric Acid Content           

     **Density**      **Density of Wine**           

    FixedAcidity      Fixed Acidity of Wine         

**FreeSulfurDioxide** **Sulfur Dioxide content of   
                      wine**                        

     LabelAppeal      Marketing Score indicating the
                      appeal of label design for    
                      consumers. High numbers       
                      suggest customers like the    
                      label design. Negative numbers
                      suggest customes don't like   
                      the design.                   

  **ResidualSugar**   **Residual Sugar of wine**    

        STARS         Wine rating by a team of      
                      experts. 4 Stars = Excellent, 
                      1 Star = Poor                 

    **Sulphates**     **Sulfate content of wine**   

 TotalSulfurDioxide   Total Sulfur Dioxide of Wine  

 **VolatileAcidity**  **Volatile Acid content of    
                      wine**                        

         pH           pH of wine                    
----------------------------------------------------

## R source code

Please see [Homework 5.rmd](https://github.com/ChristopheHunt/DATA-621-Group-1/blob/master/Homework%205/Homework%205.Rmd) on GitHub for source code.   

https://github.com/ChristopheHunt/DATA-621-Group-1/blob/master/Homework%205/Homework%205.Rmd

