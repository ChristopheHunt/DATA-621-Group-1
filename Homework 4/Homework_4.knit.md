---
title: "Homework 4"
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

Consumers who own a car are often required to purchase car insurance to protect themselves from serious financial repercussions of being involved in a car accident. Insurance Providers must determine the risk of offering insurance coverage to a new customer through accurate statistical models that evaluate the consumers propensity for accidents. Since Insurance Providers are motivated by collecting the maximum amount of revenue from consumers while returning the lowest amount in accident claims, statistical modeling provides Insurance Providers with insight into the consumers behavior and the most appropriate pricing schemes[^1]. 

[^1]: ["Insider Information: How Insurance Companies Measure Risk - Insurance Companies.com."](http://www.insurancecompanies.com/insider-information-how-insurance-companies-measure-risk/) Insurance Companiescom. N.p., n.d. Web. 06 Nov. 2016.

# Statement of the Problem

The purpose of this report is to develop statistical models to make inference into the likelihood of a customer being involved in a car accident and the cost associated of a customer being involved in a car accident. 

# Data Exploration  

## Variables Explained

The variables provided in the `Insurance Training Data Set` are explained below:


\footnotesize

 Variable Code   Definition                               
---------------  -----------------------------------------
     INDEX       Identification Variable (do not use)     
  TARGET_FLAG    Was Car in a crash? 1=YES 0=NO           
  TARGET_AMT     If car was in a crash, what was the cost 
      AGE        Age of Driver                            
   BLUEBOOK      Value of Vehicle                         
    CAR_AGE      Vehicle Age                              
   CAR_TYPE      Type of Car                              
    CAR_USE      Vehicle Use                              
   CLM_FREQ      # Claims (Past 5 Years)                  
   EDUCATION     Max Education Level                      
   HOMEKIDS      # Children at Home                       
   HOME_VAL      Home Value                               
    INCOME       Income                                   
   KIDSDRIV      # Driving Children                       
    MSTATUS      Marital Status                           
    MVR_PTS      Motor Vehicle Record Points              
   OLDCLAIM      Total Claims (Past 5 Years)              
    PARENT1      Single Parent                            
    RED_CAR      A Red Car                                
    REVOKED      License Revoked (Past 7 Years)           
      SEX        Gender                                   
      TIF        Time in Force                            
   TRAVTIME      Distance to Work                         
  URBANICITY     Home/Work Area                           
      YOJ        Years on Job                             



\normalsize

\newpage

### Nominal Variables

We first look at our nominal variables and their applicable proportions. Interestingly, we see that in this data set only a quarter of the customer records indicate an accident occurred. Also, the majority of consumers in this data set have no kids at home, are married, more than a high school education but less than a PhD, use their car for private purposes, typically own a SUV or minivan, and also live in an urban environment. This provides an interesting insight to the type of customer this data set represents and should be considered when further interpreting our statistical model. Additionally, we should be mindful of any selection biases in this data set as consumers with extremely risky histories are likely to have not been extended insurance coverage. 

\begingroup\footnotesize
\begin{longtable}{ll|rrr}
\caption{Table of nominal variables} \\ 
 \textbf{Variable} & \textbf{Levels} & $\mathbf{n}$ & $\mathbf{\%}$ & $\mathbf{\sum \%}$ \\ 
  \hline \endhead  \hline
TARGET\_FLAG & 0 & 6008 & 73.6 & 73.6 \\ 
   & 1 & 2153 & 26.4 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
KIDSDRIV & 0 & 7180 & 88.0 & 88.0 \\ 
   & 1 & 636 & 7.8 & 95.8 \\ 
   & 2 & 279 & 3.4 & 99.2 \\ 
   & 3 & 62 & 0.8 & 100.0 \\ 
   & 4 & 4 & 0.0 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
HOMEKIDS & 0 & 5289 & 64.8 & 64.8 \\ 
   & 1 & 902 & 11.1 & 75.9 \\ 
   & 2 & 1118 & 13.7 & 89.6 \\ 
   & 3 & 674 & 8.3 & 97.8 \\ 
   & 4 & 164 & 2.0 & 99.8 \\ 
   & 5 & 14 & 0.2 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
PARENT1 & No & 7084 & 86.8 & 86.8 \\ 
   & Yes & 1077 & 13.2 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
MSTATUS & No & 3267 & 40.0 & 40.0 \\ 
   & Yes & 4894 & 60.0 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
SEX & F & 4375 & 53.6 & 53.6 \\ 
   & M & 3786 & 46.4 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
EDUCATION & Less Than High School & 1203 & 14.7 & 14.7 \\ 
   & High School & 2330 & 28.6 & 43.3 \\ 
   & Bachelors & 2242 & 27.5 & 70.8 \\ 
   & Masters & 1658 & 20.3 & 91.1 \\ 
   & PhD & 728 & 8.9 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
JOB & Blue Collar & 1825 & 23.9 & 23.9 \\ 
   & Clerical & 1271 & 16.6 & 40.5 \\ 
   & Doctor & 246 & 3.2 & 43.8 \\ 
   & Home Maker & 641 & 8.4 & 52.2 \\ 
   & Lawyer & 835 & 10.9 & 63.1 \\ 
   & Manager & 988 & 12.9 & 76.0 \\ 
   & Professional & 1117 & 14.6 & 90.7 \\ 
   & Student & 712 & 9.3 & 100.0 \\ 
   \hline
 & all & 7635 & 100.0 &  \\ 
   \hline
\hline
CAR\_USE & Commercial & 3029 & 37.1 & 37.1 \\ 
   & Private & 5132 & 62.9 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
CAR\_TYPE & Minivan & 2145 & 26.3 & 26.3 \\ 
   & Panel Truck & 676 & 8.3 & 34.6 \\ 
   & Pickup & 1389 & 17.0 & 51.6 \\ 
   & Sports Car & 907 & 11.1 & 62.7 \\ 
   & SUV & 2294 & 28.1 & 90.8 \\ 
   & Van & 750 & 9.2 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
RED\_CAR & no & 5783 & 70.9 & 70.9 \\ 
   & yes & 2378 & 29.1 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
CLM\_FREQ & 0 & 5009 & 61.4 & 61.4 \\ 
   & 1 & 997 & 12.2 & 73.6 \\ 
   & 2 & 1171 & 14.3 & 88.0 \\ 
   & 3 & 776 & 9.5 & 97.5 \\ 
   & 4 & 190 & 2.3 & 99.8 \\ 
   & 5 & 18 & 0.2 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
REVOKED & No & 7161 & 87.8 & 87.8 \\ 
   & Yes & 1000 & 12.2 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
URBANICITY & Highly Rural/ Rural & 1669 & 20.4 & 20.4 \\ 
   & Highly Urban/ Urban & 6492 & 79.5 & 100.0 \\ 
   \hline
 & all & 8161 & 100.0 &  \\ 
   \hline
\hline
\hline
\label{tab: nominal}
\end{longtable}
\endgroup

### Continuous and Discrete Variables

We can see that in our continuous and discrete variables there is some additional variability. The median claim amount (`TARGET_AMT`) is 0 which would coincide with only a quarter for records indicating an accident. However, the spread is large since the average payout is only \$1,504.30 but the maximum payout was \$107,586.10. Surprisingly, the median `AGE` is 45 and the average `AGE` is 44.8 years, while we expected a lower average it could be due to simple selection bias in the data set source or the aging US population bringing this average higher [^2]. We also noticed that an `INCOME` of \$0.00 seems unwise because it is unclear how the individual would be able to cover their premium costs without parental support. Finally, we should note that the data set has as `CAR_AGE` of -3, which is impossible and will need to be removed.

There are many missing values for this portion of our data set, we have over 400 values missing for years on the job, income, home value, and car age. Due to these missing values we will need to impute to complete our statistical model. 

[^2]: Ortman, Jennifer M., Victoria A. Velkoff, and Howard Hogan. "An aging nation: the older population in the United States." Washington, DC: US Census Bureau (2014): 25-1140.

\begingroup\footnotesize
\begin{longtable}{lrrrrrrrrrr}
 \textbf{Variable} & $\mathbf{n}$ & \textbf{Min} & $\mathbf{q_1}$ & $\mathbf{\widetilde{x}}$ & $\mathbf{\bar{x}}$ & $\mathbf{q_3}$ & \textbf{Max} & $\mathbf{s}$ & \textbf{IQR} & \textbf{\#NA} \\ 
  \hline
TARGET\_AMT & 8161 &    0 &     0 &      0 &   1504.3 &   1036 & 107586.1 &   4704.0 &   1036 &   0 \\ 
  TIF & 8161 &    1 &     1 &      4 &      5.4 &      7 &     25.0 &      4.1 &      6 &   0 \\ 
  AGE & 8155 &   16 &    39 &     45 &     44.8 &     51 &     81.0 &      8.6 &     12 &   6 \\ 
  YOJ & 7707 &    0 &     9 &     11 &     10.5 &     13 &     23.0 &      4.1 &      4 & 454 \\ 
  INCOME & 7716 &    0 & 28097 &  54028 &  61898.1 &  85986 & 367030.0 &  47572.7 &  57889 & 445 \\ 
  HOME\_VAL & 7697 &    0 &     0 & 161160 & 154867.3 & 238724 & 885282.0 & 129123.8 & 238724 & 464 \\ 
  TRAVTIME & 8161 &    5 &    22 &     33 &     33.5 &     44 &    142.0 &     15.9 &     22 &   0 \\ 
  BLUEBOOK & 8161 & 1500 &  9280 &  14440 &  15709.9 &  20850 &  69740.0 &   8419.7 &  11570 &   0 \\ 
  OLDCLAIM & 8161 &    0 &     0 &      0 &   4037.1 &   4636 &  57037.0 &   8777.1 &   4636 &   0 \\ 
  MVR\_PTS & 8161 &    0 &     0 &      1 &      1.7 &      3 &     13.0 &      2.1 &      3 &   0 \\ 
  CAR\_AGE & 7651 &   -3 &     1 &      8 &      8.3 &     12 &     28.0 &      5.7 &     11 & 510 \\ 
  \hline
\caption{} 
\label{}
\end{longtable}
\endgroup

\newpage

## Imputting Missing Values

In order to address the missing values in our variables we used a non-parametric imputation method (Random Forest) using the `missForest` package. The function is particularly useful in that it can handle any type of input data and it will make as few assumptions about the structure of the data as possible.[^3]

[^3]: Stekhoven, Daniel J., and Peter B?hlmann. ["MissForest-non-parametric missing value imputation for mixed-type data." Bioinformatics 28.1 (2012): 112-118](http://bioinformatics.oxfordjournals.org/content/28/1/112.short).



\begin{spacing}{0.7}
\begin{center}\textbf{ Table 2 : Imputed Descriptive Statistics \\ 25 Variables~~~~~ 8161 ~Observations}\end{center}
\smallskip\hrule\smallskip{\small
\vbox{\noindent\textbf{TARGET\_FLAG}

{\smaller
\begin{tabular}{ rrrrrrr }
n&missing&distinct&Info&Sum&Mean&Gmd \\
8161&0&2&0.583&2153&0.3&0.4 \end{tabular}
}
\smallskip\hrule\smallskip
}
\noindent\textbf{TARGET\_AMT}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&1949&0.601&1504&2574&   0&   0&   0&   0&1036&4904&6452 \end{tabular}
\begin{verbatim}
lowest :      0.00000     30.27728     58.53106     95.56732    108.74150
highest:  73783.46592  77907.43028  78874.19056  85523.65335 107586.13616 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{KIDSDRIV}

{\smaller
\begin{tabular}{ rrrrrr }
n&missing&distinct&Info&Mean&Gmd \\
8161&0&5&0.318&0.2&0.3 \end{tabular}
\begin{verbatim}
lowest : 0 1 2 3 4, highest: 0 1 2 3 4 

0 (7180, 0.880), 1 (636, 0.078), 2 (279, 0.034), 3 (62, 0.008), 4 (4, 0.000)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{AGE}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&66&0.999&45&10&30&33&39&45&51&56&59 \end{tabular}
\begin{verbatim}
lowest : 16 17 18 19 20, highest: 72 73 76 80 81 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{HOMEKIDS}

{\smaller
\begin{tabular}{ rrrrrr }
n&missing&distinct&Info&Mean&Gmd \\
8161&0&6&0.723&0.7&1 \end{tabular}
\begin{verbatim}
lowest : 0 1 2 3 4, highest: 1 2 3 4 5 

0 (5289, 0.648), 1 (902, 0.111), 2 (1118, 0.137), 3 (674, 0.083), 4 (164, 0.020), 5 (14,
0.002)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{YOJ}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&446&0.991&10&4& 0& 5& 9&11&13&14&15 \end{tabular}
\begin{verbatim}
lowest :  0.00  0.15  0.20  0.26  0.27, highest: 16.00 17.00 18.00 19.00 23.00 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{INCOME}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&7057&1&61569&50845&0e+00&5e+03&3e+04&5e+04&9e+04&1e+05&2e+05 \end{tabular}
\begin{verbatim}
lowest :      0.00      5.00      7.00     18.00     26.33
highest: 306277.00 309628.00 320127.00 332339.00 367030.00 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{PARENT1}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&2 \end{tabular}
\begin{verbatim}

No (7084, 0.868), Yes (1077, 0.132)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{HOME\_VAL}

{\smaller[2]
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&5570&0.978&2e+05&1e+05&0e+00&0e+00&0e+00&2e+05&2e+05&3e+05&4e+05 \end{tabular}
\begin{verbatim}
lowest :      0.000   4176.960   8196.080   8263.335   9438.009
highest: 657804.000 682634.000 738153.000 750455.000 885282.000 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{MSTATUS}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&2 \end{tabular}
\begin{verbatim}

No (3267, 0.4), Yes (4894, 0.6)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{SEX}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&2 \end{tabular}
\begin{verbatim}

F (4375, 0.536), M (3786, 0.464)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{EDUCATION}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&5 \end{tabular}
\begin{verbatim}
lowest : Bachelors             High School           Less Than High School Masters               PhD                  
highest: Bachelors             High School           Less Than High School Masters               PhD                   

Bachelors (2242, 0.275), High School (2330, 0.286), Less Than High School (1203, 0.147),
Masters (1658, 0.203), PhD (728, 0.089)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{JOB}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&8 \end{tabular}
\begin{verbatim}
lowest : Blue Collar  Clerical     Doctor       Home Maker   Lawyer      
highest: Home Maker   Lawyer       Manager      Professional Student      
                                                                                        
Value       Blue Collar     Clerical       Doctor   Home Maker       Lawyer      Manager
Frequency          1830         1273          254          643          865         1412
Proportion        0.224        0.156        0.031        0.079        0.106        0.173
                                    
Value      Professional      Student
Frequency          1172          712
Proportion        0.144        0.087
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{TRAVTIME}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&97&1&33&18& 7&13&22&33&44&54&60 \end{tabular}
\begin{verbatim}
lowest :   5   6   7   8   9, highest: 103 113 124 134 142 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{CAR\_USE}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&2 \end{tabular}
\begin{verbatim}

Commercial (3029, 0.371), Private (5132, 0.629)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{BLUEBOOK}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&2789&1&15710&9354& 4900& 6000& 9280&14440&20850&27460&31110 \end{tabular}
\begin{verbatim}
lowest :  1500  1520  1530  1540  1590, highest: 57970 61050 62240 65970 69740 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{TIF}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&23&0.961&5&5& 1& 1& 1& 4& 7&11&13 \end{tabular}
\begin{verbatim}
lowest :  1  2  3  4  5, highest: 19 20 21 22 25 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{CAR\_TYPE}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&6 \end{tabular}
\begin{verbatim}
lowest : Minivan     Panel Truck Pickup      Sports Car  SUV        
highest: Panel Truck Pickup      Sports Car  SUV         Van         

Minivan (2145, 0.263), Panel Truck (676, 0.083), Pickup (1389, 0.170), Sports Car (907,
0.111), SUV (2294, 0.281), Van (750, 0.092)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{RED\_CAR}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&2 \end{tabular}
\begin{verbatim}

no (5783, 0.709), yes (2378, 0.291)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{OLDCLAIM}

{\smaller[2]
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&2857&0.769&4037&6563&    0&    0&    0&    0& 4636& 9583&27090 \end{tabular}
\begin{verbatim}
lowest :     0   502   506   518   519, highest: 52507 53477 53568 53986 57037 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{CLM\_FREQ}

{\smaller
\begin{tabular}{ rrrrrr }
n&missing&distinct&Info&Mean&Gmd \\
8161&0&6&0.763&0.8&1 \end{tabular}
\begin{verbatim}
lowest : 0 1 2 3 4, highest: 1 2 3 4 5 

0 (5009, 0.614), 1 (997, 0.122), 2 (1171, 0.143), 3 (776, 0.095), 4 (190, 0.023), 5 (18,
0.002)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{REVOKED}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&2 \end{tabular}
\begin{verbatim}

No (7161, 0.877), Yes (1000, 0.123)
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{MVR\_PTS}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&13&0.9&2&2&0&0&0&1&3&5&6 \end{tabular}
\begin{verbatim}
lowest :  0  1  2  3  4, highest:  8  9 10 11 13 
                                                                                        
Value          0     1     2     3     4     5     6     7     8     9    10    11    13
Frequency   3712  1157   948   758   599   399   266   167    84    45    13    11     2
Proportion 0.455 0.142 0.116 0.093 0.073 0.049 0.033 0.020 0.010 0.006 0.002 0.001 0.000
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{CAR\_AGE}

{\smaller
\begin{tabular}{ rrrrrrrrrrrrr }
n&missing&distinct&Info&Mean&Gmd&.05&.10&.25&.50&.75&.90&.95 \\
8161&0&507&0.985&8&6& 1& 1& 4& 8&12&16&18 \end{tabular}
\begin{verbatim}
lowest :  0.000  1.000  2.000  2.035  2.890, highest: 24.000 25.000 26.000 27.000 28.000 
\end{verbatim}
}
\smallskip\hrule\smallskip
\noindent\textbf{URBANICITY}

{\smaller
\begin{tabular}{ rrr }
n&missing&distinct \\
8161&0&2 \end{tabular}
\begin{verbatim}

Highly Rural/ Rural (1669, 0.205), Highly Urban/ Urban (6492, 0.795)
\end{verbatim}
}
\smallskip\hrule\smallskip
}\end{spacing}
\newpage


## Exploration of Variables

### Correlation Matrix

If we widen our data set to a matrix to account for the many factors in our evaluation data set we can plot a correlation matrix. We can see some interesting patterns in the data. 

* It is intuitive how both target variables have no correlation with an education level that is less than high school. If the person who wants to buy the vehicle does not have a sufficient level of education, obviously he or she would not have a high-paying job and therefore would not be able to buy the vehicle. 

* Not surprisingly, the `TARGET_FLG` variable has negative correlation with marital status. If a married couple owns the vehicle and both the husband and wife share the vehicle, each of them would have to be careful while driving it so as to not get into any accident. 

* We see that the `TARGET_FLG` variable is negatively correlated with bluebook value. If the bluebook value is high then that means that the car would be very expensive and the owner would likely not want to get the new car into an accident. Otherwise the owner may see their premiums increase sharply after the accident.  


![Correlation Plot of Training Data Set](Homework_4_files/figure-latex/correlation matrix-1.pdf) 

\newpage

# Data Transformation

## Outliers Treatment

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
INCOME & 8,161 & 61,225.430 & 45,828.110 & 0.000 & 210,660.000 \\ 
HOME\_VAL & 8,161 & 154,982.200 & 127,401.100 & 0.000 & 750,455.000 \\ 
OLDCLAIM & 8,161 & 2,757.246 & 4,469.462 & 0 & 14,738 \\ 
BLUEBOOK & 8,161 & 15,696.740 & 8,359.971 & 1,500 & 46,250 \\ 
TARGET\_FLAG & 8,161 & 0.264 & 0.441 & 0 & 1 \\ 
TARGET\_AMT & 8,161 & 1,504.325 & 4,704.027 & 0.000 & 107,586.100 \\ 
KIDSDRIV & 8,161 & 0.171 & 0.512 & 0 & 4 \\ 
AGE & 8,161 & 44.782 & 8.630 & 16.000 & 81.000 \\ 
HOMEKIDS & 8,161 & 0.721 & 1.116 & 0 & 5 \\ 
YOJ & 8,161 & 10.498 & 4.037 & 0.000 & 23.000 \\ 
TRAVTIME & 8,161 & 33.486 & 15.908 & 5 & 142 \\ 
TIF & 8,161 & 5.351 & 4.147 & 1 & 25 \\ 
CLM\_FREQ & 8,161 & 0.799 & 1.158 & 0 & 5 \\ 
MVR\_PTS & 8,161 & 1.696 & 2.147 & 0 & 13 \\ 
CAR\_AGE & 8,161 & 8.350 & 5.602 & 0.000 & 28.000 \\ 
\hline \\[-1.8ex] 
\end{tabular} 
\end{table} 

\newpage

## BoxCox Transformations 

The Box-Cox transformations were done only on three of the input variables - income, house value, and the total number of claims during the past 5 years. These transformations were done based on the residual plots. In the residual plots, these three variables showed a great deal of non-constant variance because the plots were funnel-shaped. 

Non-constant Variance Score Test 
Variance formula: ~ KIDSDRIV + AGE + HOMEKIDS + YOJ + INCOME + PARENT1 + HOME_VAL + MSTATUS + SEX + EDUCATION + JOB + TRAVTIME + CAR_USE + BLUEBOOK + TIF + CAR_TYPE + RED_CAR + OLDCLAIM + CLM_FREQ + REVOKED + MVR_PTS + CAR_AGE + URBANICITY 
Chisquare = 5720.739    Df = 36     p = 0 

![](Homework_4_files/figure-latex/unnamed-chunk-4-1.pdf)<!-- --> ![](Homework_4_files/figure-latex/unnamed-chunk-4-2.pdf)<!-- --> ![](Homework_4_files/figure-latex/unnamed-chunk-4-3.pdf)<!-- --> 

```
##            Test stat Pr(>|t|)
## KIDSDRIV      -2.068    0.039
## AGE            4.741    0.000
## HOMEKIDS      -1.519    0.129
## YOJ            0.031    0.976
## INCOME        -0.069    0.945
## PARENT1           NA       NA
## HOME_VAL       0.528    0.597
## MSTATUS           NA       NA
## SEX               NA       NA
## EDUCATION         NA       NA
## JOB               NA       NA
## TRAVTIME      -1.328    0.184
## CAR_USE           NA       NA
## BLUEBOOK       0.130    0.896
## TIF            1.081    0.280
## CAR_TYPE          NA       NA
## RED_CAR           NA       NA
## OLDCLAIM      -1.799    0.072
## CLM_FREQ      -1.499    0.134
## REVOKED           NA       NA
## MVR_PTS        2.257    0.024
## CAR_AGE       -0.464    0.642
## URBANICITY        NA       NA
## Tukey test     8.684    0.000
```

\newpage

Using the `BoxCox.lambda` function from the `forecast` package we are able to determine our necessary transformations to our independent variables. 


     $\lambda$        Variables 
-------------------  -----------
 0.268842617694589     INCOME   
 0.505233636014921    HOME_VAL  
 0.456635555660553    TRAVTIME  

Utilizing the below table of common transformations based on the lambda value of the BoxCox we further transform our independent variables.

\centering

Common Box-Cox Transformations[^6] [^5]

\setlength{\tabcolsep}{12pt}

\begin{tabular}{ c c }
\hline
$\lambda$ & Y' \\ \hline
-2 &	$Y^{-2}~=~\frac{1}{Y^{2}}$ \\
-1 &	$Y^{-1}~=~\frac{1}{Y^{1}}$ \\
-0.5 &	$Y^{-0.5}~=~\frac{1}{\sqrt{(Y)}}$ \\
0	& $\log(Y)$ \\
.25  & $\sqrt[4]{Y}$\\  
0.5	& $Y^{0.5}~=~\sqrt{(Y)}$ \\
1	& $Y^{1}~=~Y$ \\
2	& $Y^{2}$ \\

\end{tabular}

\justifying

Lambda values were truncated to the nearest tenth that match a common transformation as per the below table.

\centering

\begin{tabular}{ c c }
\hline
variable & variable transformation \\ \hline
INCOME & $\sqrt[4]{INCOME}$ \\
HOME VAL & $\sqrt(HOME~VAL)$ \\
TRAVTIME & $\sqrt{TRAVTIME}$ 
\end{tabular}

\justifying

\setlength{\tabcolsep}{6pt}

[^5]: Osborne, Jason W. "Improving your data transformations: Applying the Box-Cox transformation." Practical Assessment, Research & Evaluation 15.12 (2010): 1-9.

[^6]: [By Understanding Both the Concept of Transformation and the Box-Cox Method, Practitioners Will Be Better Prepared to Work with Non-normal Data.](https://www.isixsigma.com/tools-templates/normality/making-data-normal-using-box-cox-power-transformation/) . "Making Data Normal Using Box-Cox Power Transformation." ISixSigma. N.p., n.d. Web. 29 Oct. 2016.

\newpage

# Models Built



## Logistic Regressions 1 - Backwards Selection Method

In the backwards selection model, the resulting AIC was 7,703.13. All of the variables remain except the age of the driver, sex, whether the car was red or not, number of kids at home, and car age. Zero correlation for bluebook value is a result of our transformations. As the bluebook value increases, the log likelihood that the vehicle gets into a crash decreases.


\begin{table}[!htbp] \centering 
  \caption{} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
\\[-1.8ex] & fullModel \\ 
\hline \\[-1.8ex] 
 Constant & 0.113$^{***}$ (0.037) \\ 
  KIDSDRIV & 0.065$^{***}$ (0.009) \\ 
  I(INCOME$\hat{\mkern6mu}$(1/4)) & $-$0.008$^{***}$ (0.002) \\ 
  PARENT1Yes & 0.085$^{***}$ (0.015) \\ 
  I(sqrt(HOME\_VAL)) & $-$0.0001$^{***}$ (0.00003) \\ 
  MSTATUSYes & $-$0.059$^{***}$ (0.012) \\ 
  EDUCATIONHigh School & 0.062$^{***}$ (0.013) \\ 
  EDUCATIONLess Than High School & 0.054$^{***}$ (0.016) \\ 
  EDUCATIONMasters & 0.024 (0.017) \\ 
  EDUCATIONPhD & 0.041$^{*}$ (0.022) \\ 
  JOBClerical & 0.012 (0.016) \\ 
  JOBDoctor & $-$0.134$^{***}$ (0.036) \\ 
  JOBHome Maker & $-$0.053$^{**}$ (0.025) \\ 
  JOBLawyer & $-$0.051$^{*}$ (0.026) \\ 
  JOBManager & $-$0.136$^{***}$ (0.019) \\ 
  JOBProfessional & $-$0.028 (0.018) \\ 
  JOBStudent & $-$0.069$^{***}$ (0.023) \\ 
  I(sqrt(TRAVTIME)) & 0.023$^{***}$ (0.003) \\ 
  CAR\_USEPrivate & $-$0.126$^{***}$ (0.014) \\ 
  BLUEBOOK & $-$0.00000$^{***}$ (0.00000) \\ 
  TIF & $-$0.008$^{***}$ (0.001) \\ 
  CAR\_TYPEPanel Truck & 0.069$^{***}$ (0.022) \\ 
  CAR\_TYPEPickup & 0.073$^{***}$ (0.015) \\ 
  CAR\_TYPESports Car & 0.133$^{***}$ (0.016) \\ 
  CAR\_TYPESUV & 0.096$^{***}$ (0.012) \\ 
  CAR\_TYPEVan & 0.081$^{***}$ (0.018) \\ 
  OLDCLAIM & $-$0.00000$^{**}$ (0.00000) \\ 
  CLM\_FREQ & 0.031$^{***}$ (0.005) \\ 
  REVOKEDYes & 0.139$^{***}$ (0.014) \\ 
  MVR\_PTS & 0.021$^{***}$ (0.002) \\ 
  URBANICITYHighly Urban/ Urban & 0.299$^{***}$ (0.012) \\ 
 \textit{N} & 8,161 \\ 
Log Likelihood & $-$3,820.565 \\ 
Akaike Inf. Crit. & 7,703.130 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Notes:} & \multicolumn{1}{r}{$^{***}$Significant at the 1 percent level.} \\ 
 & \multicolumn{1}{r}{$^{**}$Significant at the 5 percent level.} \\ 
 & \multicolumn{1}{r}{$^{*}$Significant at the 10 percent level.} \\ 
\end{tabular} 
\end{table} 

\newpage

### Model Metrics for Backwards Selection

We first use an established threshold of .50 to determine our best possible threshold. 

![](Homework_4_files/figure-latex/backwards model metrics-1.pdf)<!-- --> 

            Act-Pos   Act-Neg
---------  --------  --------
Pred-Pos        792      1361
Pred-Neg        342      5666

                 Model Metrics for Backwards Selection 
---------------  --------------------------------------
accuracy         0.791                                 
classif.error    0.209                                 
precision        0.698                                 
sensitivity      0.368                                 
specificity      0.943                                 
f1score          0.482                                 
auc              0.672                                 
best.threshold   0.320                                 
aic              7703.130                              
CVError          0.151                                 


Our previous results indicate that .320 would be the best threshold for this model so we re-run our metrics using this threshold.

\newpage

#### Model Metrics for Backwards Selection with best threshold

Model Metrics using best threshold of .320. 

![](Homework_4_files/figure-latex/backwards model metrics best threshold-1.pdf)<!-- --> 

            Act-Pos   Act-Neg
---------  --------  --------
Pred-Pos       1609       544
Pred-Neg       1634      4374

                 Model Metrics for Backwards Selection with best threshold 
---------------  ----------------------------------------------------------
accuracy         0.733                                                     
classif.error    0.267                                                     
precision        0.496                                                     
sensitivity      0.747                                                     
specificity      0.728                                                     
f1score          0.596                                                     
auc              0.672                                                     
best.threshold   0.320                                                     
aic              7703.130                                                  
CVError          0.151                                                     

\newpage

### Multicollinearity for Backwards Selection

We square `GVIF^(1/(2*Df))` [^7] in order to use the VIF threshold of 5 for multicollinearity. Here in our subset selection model we find that no variable exceeds our pre-established threshold of 5 for multicollinearity.


rn                     GVIF       Df    GVIF^(1/(2*Df))    Adjusted_GVIF 
------------------  -----------  ----  -----------------  ---------------
KIDSDRIV             1.077479     1        1.038017          1.077479    
I(INCOME^(1/4))      3.304651     1        1.817870          3.304651    
PARENT1              1.411265     1        1.187967          1.411265    
I(sqrt(HOME_VAL))    2.092827     1        1.446661          2.092827    
MSTATUS              2.011783     1        1.418373          2.011783    
EDUCATION            6.358805     4        1.260149          1.587976    
JOB                  25.249598    7        1.259392          1.586069    
I(sqrt(TRAVTIME))    1.033131     1        1.016431          1.033131    
CAR_USE              2.409493     1        1.552254          2.409493    
BLUEBOOK             1.671435     1        1.292840          1.671435    
TIF                  1.007070     1        1.003529          1.007070    
CAR_TYPE             2.488834     5        1.095468          1.200050    
OLDCLAIM             2.191933     1        1.480518          2.191933    
CLM_FREQ             2.074773     1        1.440407          2.074773    
REVOKED              1.199983     1        1.095437          1.199983    
MVR_PTS              1.237482     1        1.112422          1.237482    
URBANICITY           1.247372     1        1.116858          1.247372    

[^7]: ["Which Variance Inflation Factor Should I Be Using: $text{GVIF}$ or $text{GVIF}^{1/(2cdottext{df})}$?"](http://stats.stackexchange.com/a/96584) R. N.p., n.d. Web. 13 Nov. 2016.

\newpage

## Logistic Regression 2 - Forwards Selection Method

In the forwards selection model, the resulting AIC was 7,712.07. All of the variables remain in the model. The coefficients are relatively similar to the previous model, while `BLUEBOOK` and `OLDCLAIM` are significant they have very low coefficients and therefore don't explain a great deal of the log odds. 


\begin{table}[!htbp] \centering 
  \caption{} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
\\[-1.8ex] & fullModel \\ 
\hline \\[-1.8ex] 
 Constant & 0.123$^{**}$ (0.048) \\ 
  KIDSDRIV & 0.062$^{***}$ (0.010) \\ 
  AGE & $-$0.0004 (0.001) \\ 
  HOMEKIDS & 0.004 (0.006) \\ 
  YOJ & 0.001 (0.002) \\ 
  I(INCOME$\hat{\mkern6mu}$(1/4)) & $-$0.009$^{***}$ (0.002) \\ 
  PARENT1Yes & 0.075$^{***}$ (0.017) \\ 
  I(sqrt(HOME\_VAL)) & $-$0.0001$^{***}$ (0.00003) \\ 
  MSTATUSYes & $-$0.063$^{***}$ (0.013) \\ 
  SEXM & 0.014 (0.016) \\ 
  EDUCATIONHigh School & 0.059$^{***}$ (0.014) \\ 
  EDUCATIONLess Than High School & 0.049$^{***}$ (0.018) \\ 
  EDUCATIONMasters & 0.028 (0.018) \\ 
  EDUCATIONPhD & 0.046$^{**}$ (0.023) \\ 
  JOBClerical & 0.010 (0.016) \\ 
  JOBDoctor & $-$0.132$^{***}$ (0.037) \\ 
  JOBHome Maker & $-$0.051$^{**}$ (0.025) \\ 
  JOBLawyer & $-$0.049$^{*}$ (0.026) \\ 
  JOBManager & $-$0.134$^{***}$ (0.019) \\ 
  JOBProfessional & $-$0.027 (0.018) \\ 
  JOBStudent & $-$0.070$^{***}$ (0.023) \\ 
  I(sqrt(TRAVTIME)) & 0.023$^{***}$ (0.003) \\ 
  CAR\_USEPrivate & $-$0.126$^{***}$ (0.014) \\ 
  BLUEBOOK & $-$0.00000$^{***}$ (0.00000) \\ 
  TIF & $-$0.008$^{***}$ (0.001) \\ 
  CAR\_TYPEPanel Truck & 0.063$^{***}$ (0.024) \\ 
  CAR\_TYPEPickup & 0.074$^{***}$ (0.015) \\ 
  CAR\_TYPESports Car & 0.141$^{***}$ (0.019) \\ 
  CAR\_TYPESUV & 0.104$^{***}$ (0.015) \\ 
  CAR\_TYPEVan & 0.077$^{***}$ (0.018) \\ 
  RED\_CARyes & $-$0.005 (0.013) \\ 
  OLDCLAIM & $-$0.00000$^{**}$ (0.00000) \\ 
  CLM\_FREQ & 0.031$^{***}$ (0.005) \\ 
  REVOKEDYes & 0.138$^{***}$ (0.014) \\ 
  MVR\_PTS & 0.021$^{***}$ (0.002) \\ 
  CAR\_AGE & $-$0.001 (0.001) \\ 
  URBANICITYHighly Urban/ Urban & 0.299$^{***}$ (0.012) \\ 
 \textit{N} & 8,161 \\ 
Log Likelihood & $-$3,819.035 \\ 
Akaike Inf. Crit. & 7,712.070 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Notes:} & \multicolumn{1}{r}{$^{***}$Significant at the 1 percent level.} \\ 
 & \multicolumn{1}{r}{$^{**}$Significant at the 5 percent level.} \\ 
 & \multicolumn{1}{r}{$^{*}$Significant at the 10 percent level.} \\ 
\end{tabular} 
\end{table} 

\newpage

### Model Metrics for Forwards Selection

We first use an established threshold of .50 to determine our best possible threshold. 

![](Homework_4_files/figure-latex/forwards model metrics-1.pdf)<!-- --> 

            Act-Pos   Act-Neg
---------  --------  --------
Pred-Pos        797      1356
Pred-Neg        348      5660

                 Model Metrics for Forwards Selection 
---------------  -------------------------------------
accuracy         0.791                                
classif.error    0.209                                
precision        0.696                                
sensitivity      0.370                                
specificity      0.942                                
f1score          0.483                                
auc              0.670                                
best.threshold   0.310                                
aic              7712.070                             
CVError          0.151                                

Our previous results indicate that .310 would be the best threshold for this model so we re-run our metrics using this threshold.

\newpage

#### Model Metrics for Forwards Selection with best threshold

Model Metrics using best threshold of .310. 

![](Homework_4_files/figure-latex/forwards model metrics with best threshold-1.pdf)<!-- --> 

            Act-Pos   Act-Neg
---------  --------  --------
Pred-Pos       1641       512
Pred-Neg       1734      4274

                 Model Metrics for Forwards Selection with Best Threshold 
---------------  ---------------------------------------------------------
accuracy         0.725                                                    
classif.error    0.275                                                    
precision        0.486                                                    
sensitivity      0.762                                                    
specificity      0.711                                                    
f1score          0.594                                                    
auc              0.670                                                    
best.threshold   0.310                                                    
aic              7712.070                                                 
CVError          0.151                                                    
\newpage

### Multicollinearity for Forwards Selection

We square `GVIF^(1/(2*Df))` in order to use the VIF threshold of 5 for multicollinearity. Here in our subset selection model we find that no variable exceeds our pre-established threshold of 5 for multicollinearity.


rn                     GVIF       Df    GVIF^(1/(2*Df))    Adjusted_GVIF 
------------------  -----------  ----  -----------------  ---------------
KIDSDRIV             1.325344     1        1.151236          1.325344    
AGE                  1.487782     1        1.219747          1.487782    
HOMEKIDS             2.136050     1        1.461523          2.136050    
YOJ                  2.043591     1        1.429542          2.043591    
I(INCOME^(1/4))      4.626874     1        2.151017          4.626874    
PARENT1              1.844294     1        1.358048          1.844294    
I(sqrt(HOME_VAL))    2.115696     1        1.454543          2.115696    
MSTATUS              2.204211     1        1.484659          2.204211    
SEX                  3.324170     1        1.823231          3.324170    
EDUCATION            8.969420     4        1.315514          1.730578    
JOB                  26.685061    7        1.264376          1.598647    
I(sqrt(TRAVTIME))    1.033912     1        1.016814          1.033912    
CAR_USE              2.409933     1        1.552396          2.409933    
BLUEBOOK             2.065326     1        1.437124          2.065326    
TIF                  1.007641     1        1.003813          1.007641    
CAR_TYPE             5.489500     5        1.185641          1.405745    
RED_CAR              1.814257     1        1.346944          1.814257    
OLDCLAIM             2.193395     1        1.481011          2.193395    
CLM_FREQ             2.076612     1        1.441045          2.076612    
REVOKED              1.200779     1        1.095800          1.200779    
MVR_PTS              1.239981     1        1.113544          1.239981    
CAR_AGE              2.166209     1        1.471805          2.166209    
URBANICITY           1.248323     1        1.117284          1.248323    

\newpage

## Logistic Regression 3 - Subset Selection Method

### Subset Variable Selection

Using the `leaps` package and the `regsubsets` function we are able to subset our independent variables by looking at the best model for each predictor. 


                                 1  ( 1 )   2  ( 1 )   3  ( 1 )   4  ( 1 )   5  ( 1 )   6  ( 1 )   7  ( 1 )   8  ( 1 ) 
-------------------------------  ---------  ---------  ---------  ---------  ---------  ---------  ---------  ---------
KIDSDRIV                                                                                                      *        
AGE                                                                                                                    
HOMEKIDS                                                                                                               
YOJ                                                                                                                    
I(INCOME^(1/4))                                                              *          *          *          *        
PARENT1Yes                                                                   *          *          *                   
I(sqrt(HOME_VAL))                           *          *          *                                                    
MSTATUSYes                                                                                                    *        
SEXM                                                                                                                   
EDUCATIONHigh School                                                                                                   
EDUCATIONLess Than High School                                                                                         
EDUCATIONMasters                                                                                                       
EDUCATIONPhD                                                                                                           
JOBClerical                                                                                                            
JOBDoctor                                                                                                              
JOBHome Maker                                                                                                          
JOBLawyer                                                                                                              
JOBManager                                                                                         *          *        
JOBProfessional                                                                                                        
JOBStudent                                                                                                             
I(sqrt(TRAVTIME))                                                                                                      
CAR_USEPrivate                                                    *          *          *          *          *        
BLUEBOOK                                                                                                               
TIF                                                                                                                    
CAR_TYPEPanel Truck                                                                                                    
CAR_TYPEPickup                                                                                                         
CAR_TYPESports Car                                                                                                     
CAR_TYPESUV                                                                                                            
CAR_TYPEVan                                                                                                            
RED_CARyes                                                                                                             
OLDCLAIM                                                                                                               
CLM_FREQ                                                                                                               
REVOKEDYes                                                                              *          *          *        
MVR_PTS                                                *          *          *          *          *          *        
CAR_AGE                                                                                                                
URBANICITYHighly Urban/ Urban    *          *          *          *          *          *          *          *        

\newpage

### Subset Model

The variables as indicated in column `8` of the previous table will be further implement into our subset selection model in the following table. In the subset selection model, the resulting AIC was 7,708.37. Very few of the variables remained. These variables were number of kids driving, income, marital status, job category, car use, whether the license was revoked or not, urbanicity, and motor vehicle record points. In this model, the target variable has a stronger correlation with urbanicity than it does in the other logistic models. 


\begin{table}[!htbp] \centering 
  \caption{} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
\\[-1.8ex] & TARGET\_FLAG \\ 
\hline \\[-1.8ex] 
 Constant & $-$1.135$^{***}$ (0.185) \\ 
  KIDSDRIV & 0.469$^{***}$ (0.052) \\ 
  I(INCOME$\hat{\mkern6mu}$(1/4)) & $-$0.085$^{***}$ (0.010) \\ 
  MSTATUSYes & $-$0.748$^{***}$ (0.057) \\ 
  JOBClerical & 0.148 (0.099) \\ 
  JOBDoctor & $-$0.972$^{***}$ (0.218) \\ 
  JOBHome Maker & $-$0.422$^{***}$ (0.156) \\ 
  JOBLawyer & $-$0.467$^{***}$ (0.121) \\ 
  JOBManager & $-$0.955$^{***}$ (0.096) \\ 
  JOBProfessional & $-$0.398$^{***}$ (0.099) \\ 
  JOBStudent & $-$0.343$^{**}$ (0.144) \\ 
  CAR\_USEPrivate & $-$0.725$^{***}$ (0.070) \\ 
  REVOKEDYes & 0.753$^{***}$ (0.078) \\ 
  MVR\_PTS & 0.151$^{***}$ (0.012) \\ 
  URBANICITYHighly Urban/ Urban & 2.283$^{***}$ (0.109) \\ 
 \textit{N} & 8,161 \\ 
Log Likelihood & $-$3,839.185 \\ 
Akaike Inf. Crit. & 7,708.369 \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Notes:} & \multicolumn{1}{r}{$^{***}$Significant at the 1 percent level.} \\ 
 & \multicolumn{1}{r}{$^{**}$Significant at the 5 percent level.} \\ 
 & \multicolumn{1}{r}{$^{*}$Significant at the 10 percent level.} \\ 
\end{tabular} 
\end{table} 

\newpage

### Model Metrics for Subset Selection

We first use an established threshold of .50 to determine our best possible threshold. 

![](Homework_4_files/figure-latex/subset model metrics-1.pdf)<!-- --> 

            Act-Pos   Act-Neg
---------  --------  --------
Pred-Pos        783      1370
Pred-Neg        441      5567

                 Model Metrics for Subset Selection 
---------------  -----------------------------------
accuracy         0.778                              
classif.error    0.222                              
precision        0.640                              
sensitivity      0.364                              
specificity      0.927                              
f1score          0.464                              
auc              0.786                              
best.threshold   0.280                              
aic              7708.369                           
CVError          0.154                              

#### Model Metrics for Subset Selection with best threshold

Model Metrics using best threshold of .280.

![](Homework_4_files/figure-latex/subset model metrics with best threshold-1.pdf)<!-- --> 

            Act-Pos   Act-Neg
---------  --------  --------
Pred-Pos       1543       610
Pred-Neg       1686      4322

                 Model Metrics for Subset Selection with Best Threshold 
---------------  -------------------------------------------------------
accuracy         0.719                                                  
classif.error    0.281                                                  
precision        0.478                                                  
sensitivity      0.717                                                  
specificity      0.719                                                  
f1score          0.573                                                  
auc              0.786                                                  
best.threshold   0.280                                                  
aic              7708.369                                               
CVError          0.154                                                  

\newpage

### Multicollinearity for Subset Selection

We square `GVIF^(1/(2*Df))` in order to use the VIF threshold of 5 for multicollinearity. Here in our subset selection model we find that no variable exceeds our pre-established threshold of 5 for multicollinearity. 


rn                   GVIF      Df    GVIF^(1/(2*Df))    Adjusted_GVIF 
----------------  ----------  ----  -----------------  ---------------
KIDSDRIV           1.022204    1        1.011041          1.022204    
I(INCOME^(1/4))    3.012788    1        1.735739          3.012788    
MSTATUS            1.026972    1        1.013396          1.026972    
JOB                4.435051    7        1.112262          1.237126    
CAR_USE            1.491887    1        1.221428          1.491887    
REVOKED            1.004182    1        1.002089          1.004182    
MVR_PTS            1.011248    1        1.005608          1.011248    
URBANICITY         1.084428    1        1.041359          1.084428    

\newpage

## Linear Regression 1 - Backwards Selection

In the backwards linear regression model, the variables eliminated were the number of years on the job, whether the car is red or not, number of kids at home, total claims within the past 5 years, and age of the driver. The target variable has the strongest correlation with the urbanicity. Due to our transformation of the income variable, income does have some correlation now with the target amount. Before our tranformation there was no correlation at all between these two variables. 


\begin{table}[!htbp] \centering 
  \caption{} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
\\[-1.8ex] & bkFitStep \\ 
\hline \\[-1.8ex] 
 Constant & 155.127 (483.701) \\ 
  KIDSDRIV & 373.748$^{***}$ (102.021) \\ 
  I(INCOME$\hat{\mkern6mu}$(1/4)) & $-$42.613$^{**}$ (18.400) \\ 
  PARENT1Yes & 651.686$^{***}$ (176.724) \\ 
  I(sqrt(HOME\_VAL)) & $-$0.513 (0.328) \\ 
  MSTATUSYes & $-$472.060$^{***}$ (145.552) \\ 
  SEXM & 354.488$^{**}$ (160.980) \\ 
  EDUCATIONHigh School & 179.812 (158.771) \\ 
  EDUCATIONLess Than High School & 275.395 (206.053) \\ 
  EDUCATIONMasters & 359.220$^{*}$ (208.987) \\ 
  EDUCATIONPhD & 652.657$^{**}$ (268.258) \\ 
  JOBClerical & 54.342 (191.096) \\ 
  JOBDoctor & $-$1,228.175$^{***}$ (428.452) \\ 
  JOBHome Maker & $-$316.777 (298.794) \\ 
  JOBLawyer & $-$346.133 (304.717) \\ 
  JOBManager & $-$1,036.446$^{***}$ (224.812) \\ 
  JOBProfessional & 11.033 (210.674) \\ 
  JOBStudent & $-$465.695$^{*}$ (273.834) \\ 
  I(sqrt(TRAVTIME)) & 131.435$^{***}$ (34.969) \\ 
  CAR\_USEPrivate & $-$824.416$^{***}$ (161.514) \\ 
  BLUEBOOK & 0.014 (0.009) \\ 
  TIF & $-$47.715$^{***}$ (12.166) \\ 
  CAR\_TYPEPanel Truck & 283.655 (275.805) \\ 
  CAR\_TYPEPickup & 397.622$^{**}$ (170.505) \\ 
  CAR\_TYPESports Car & 1,035.523$^{***}$ (216.328) \\ 
  CAR\_TYPESUV & 775.037$^{***}$ (178.442) \\ 
  CAR\_TYPEVan & 519.314$^{**}$ (212.581) \\ 
  CLM\_FREQ & 106.214$^{**}$ (48.786) \\ 
  REVOKEDYes & 430.516$^{***}$ (154.861) \\ 
  MVR\_PTS & 170.200$^{***}$ (25.800) \\ 
  CAR\_AGE & $-$27.881$^{**}$ (13.204) \\ 
  URBANICITYHighly Urban/ Urban & 1,676.140$^{***}$ (139.142) \\ 
 \textit{N} & 8,161 \\ 
R$^{2}$ & 0.072 \\ 
Adjusted R$^{2}$ & 0.068 \\ 
Residual Std. Error & 4,541.097 (df = 8129) \\ 
F Statistic & 20.227$^{***}$ (df = 31; 8129) \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Notes:} & \multicolumn{1}{r}{$^{***}$Significant at the 1 percent level.} \\ 
 & \multicolumn{1}{r}{$^{**}$Significant at the 5 percent level.} \\ 
 & \multicolumn{1}{r}{$^{*}$Significant at the 10 percent level.} \\ 
\end{tabular} 
\end{table} 
\newpage

### Linear Regression 1 - Backwards Selection Model Metrics

![](Homework_4_files/figure-latex/unnamed-chunk-10-1.pdf)<!-- --> 

\newpage

## Linear Regression 2 - Forwards Selection 

In the forwards linear regression model, the variables eliminated were the same as the variables eliminated in the backwards linear regression. Additionally, we removed `HOME_VAL` and `BLUEBOOK` because they did not appear to be significant in the previous model. Just like the previous model, the target variable has the strongest correlation with urbanicity.


\begin{table}[!htbp] \centering 
  \caption{} 
  \label{} 
\normalsize 
\begin{tabular}{@{\extracolsep{5pt}}lc} 
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
\\[-1.8ex] & fwdFitstep \\ 
\hline \\[-1.8ex] 
 Constant & 357.964 (460.236) \\ 
  MVR\_PTS & 170.557$^{***}$ (25.795) \\ 
  URBANICITYHighly Urban/ Urban & 1,674.581$^{***}$ (139.164) \\ 
  JOBClerical & 61.164 (190.906) \\ 
  JOBDoctor & $-$1,209.748$^{***}$ (428.237) \\ 
  JOBHome Maker & $-$318.806 (298.826) \\ 
  JOBLawyer & $-$338.710 (304.616) \\ 
  JOBManager & $-$1,029.965$^{***}$ (224.758) \\ 
  JOBProfessional & 11.612 (210.556) \\ 
  JOBStudent & $-$377.477 (267.863) \\ 
  MSTATUSYes & $-$601.849$^{***}$ (119.319) \\ 
  CAR\_USEPrivate & $-$829.337$^{***}$ (161.487) \\ 
  KIDSDRIV & 376.869$^{***}$ (102.025) \\ 
  CAR\_TYPEPanel Truck & 463.358$^{*}$ (248.511) \\ 
  CAR\_TYPEPickup & 362.629$^{**}$ (169.180) \\ 
  CAR\_TYPESports Car & 923.236$^{***}$ (204.203) \\ 
  CAR\_TYPESUV & 668.781$^{***}$ (164.957) \\ 
  CAR\_TYPEVan & 591.351$^{***}$ (207.143) \\ 
  TIF & $-$47.827$^{***}$ (12.168) \\ 
  I(sqrt(TRAVTIME)) & 132.590$^{***}$ (34.970) \\ 
  PARENT1Yes & 642.156$^{***}$ (176.701) \\ 
  I(INCOME$\hat{\mkern6mu}$(1/4)) & $-$44.237$^{**}$ (17.867) \\ 
  REVOKEDYes & 434.916$^{***}$ (154.857) \\ 
  CAR\_AGE & $-$27.498$^{**}$ (13.203) \\ 
  CLM\_FREQ & 107.285$^{**}$ (48.754) \\ 
  SEXM & 247.621$^{*}$ (146.601) \\ 
  EDUCATIONHigh School & 185.762 (158.504) \\ 
  EDUCATIONLess Than High School & 284.796 (205.740) \\ 
  EDUCATIONMasters & 356.364$^{*}$ (209.019) \\ 
  EDUCATIONPhD & 651.012$^{**}$ (268.056) \\ 
 \textit{N} & 8,161 \\ 
R$^{2}$ & 0.071 \\ 
Adjusted R$^{2}$ & 0.068 \\ 
Residual Std. Error & 4,541.888 (df = 8131) \\ 
F Statistic & 21.448$^{***}$ (df = 29; 8131) \\ 
\hline 
\hline \\[-1.8ex] 
\textit{Notes:} & \multicolumn{1}{r}{$^{***}$Significant at the 1 percent level.} \\ 
 & \multicolumn{1}{r}{$^{**}$Significant at the 5 percent level.} \\ 
 & \multicolumn{1}{r}{$^{*}$Significant at the 10 percent level.} \\ 
\end{tabular} 
\end{table} 

### Linear Regression 2 - Forwards Selection Model Metrics

![](Homework_4_files/figure-latex/unnamed-chunk-12-1.pdf)<!-- --> 

\newpage

#Selected Models 

Of note, the urban and rural flag had the most influence on both Target variables. This is not surprising as someone living in an urban environment is driving their car among many other cars and it is intiuitive that accidents would be more likely in this environment. 

## Logistic Regression Selected

Logistic Regression Model Metrics 


Out of all the logistic models, the Subset Selection Model rated the best due to the highest accuracy. The AIC for this model was not the lowest. However, the difference between this AIC (7708.37) and the lowest AIC (7703.13) is not too much. Additionally, it is a simpler model with a better precision. This is why we chose this model over the other two. 


------------------------------------------------------------------------------------------------------------------------------------------------------------
       &nbsp;         Model Metrics for Forwards Selection   Model Metrics for Subset Selection   Model Metrics for Backwards Selection with best threshold 
-------------------- -------------------------------------- ------------------------------------ -----------------------------------------------------------
    **accuracy**                     0.725                                 0.778                                            0.733                           

 **classif.error**                   0.275                                 0.222                                            0.267                           

   **precision**                     0.486                                 0.640                                            0.496                           

  **sensitivity**                    0.762                                 0.364                                            0.747                           

  **specificity**                    0.711                                 0.927                                            0.728                           

    **f1score**                      0.594                                 0.464                                            0.596                           

      **auc**                        0.670                                 0.786                                            0.672                           

 **best.threshold**                  0.310                                 0.280                                            0.320                           

      **aic**                       7712.070                              7708.369                                        7703.130                          

    **CVError**                      0.151                                 0.154                                            0.151                           
------------------------------------------------------------------------------------------------------------------------------------------------------------

Our Final Logistic Model (Subset Selection Method): 

$$
\begin{aligned}
\log(TARGET FLAG)~=~&-469*KIDSDRIV~+~-0.085*\sqrt[4]{INCOME}~+~-0.748*MSTATUSYes\\
&~+~0.148*JOBClerical~+~-0.972*JOBDoctor~+~-0.421*JOBHome Maker\\
&~+~-0.466*JOBLawyer~+~-0.954*JOBManager~+~-0.398*JOBProfessional\\
&~+~-0.343*JOBStudent~+~-0.725*CAR_USEPrivate~+~0.752*REVOKEDYes\\
&~+~0.151*MVR_PTS~+~2.282672*URBANICITYHighly Urban/ Urban~+~-1.135467\\
\end{aligned}
$$
\newpage

## Linear Regression Selected

In the linear models rendered, some of the correlation coefficients do make sense. For example, in both models, it would make sense for a student to have to pay less in a car crash due to the fact that the student would spend more time studying and less time on the road. It would also make sense for urbanicity to affect the cost during a car crash because in urban areas, there are more people and pedestrians and the probability of people getting killed in a car crash would be very high as opposed to rural areas where there would be less pedestrians. However, while both models have the same adjusted R^2, the Forward Selection Model has fewer variables which makes it easier to understand and is therefore the selected Linear Regresion.

Our Final Linear Model (Forward Selection Method):

$$
\begin{aligned}
TARGET AMT~=~&170.55*MVR_PTS~+~1,674.58*URBANICITYHighly Urban/ Urban\\
&+~61.16*JOBClerical~+~-1,209.74*JOBDoctor~+~-318.80*JOBHome Maker\\
&+~-338.710*JOBLawyer~+~-1,029.96*JOBManager~+~11.61*JOBProfessional\\
&~+~-377.47*JOBStudent~+~-601.84*MSTATUSYes~+~-829.33*CAR USEPrivate\\
&~+~376.86*KIDSDRIV~+~463.35*CAR TYPEPanel Truck~+~362.62*CAR_TYPEPickup\\
&~+~923.23*CAR TYPESports Car~+~668.78*CAR TYPESUV~+~591.35*CAR_TYPEVan\\
&~+~-47.8*TIF~+~132.59*\sqrt{TRAVTIME}\\
&~+~642.15*PARENT1Yes~+~-44.23*\sqrt[4]{INCOME}\\
&~+~434.91*REVOKEDYes~+~-27.49*CAR AGE~+~107.28*CLM FREQ~+~247.62*SEXM\\
&~+~185.76*EDUCATIONHigh School~+~284.79*EDUCATIONLess Than High School\\
&~+~356.36*EDUCATIONMasters~+~651.01*EDUCATIONPhD
\end{aligned}
$$

\blandscape
\pagebreak[4]
  \global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 90} <!-- provided by http://tex.stackexchange.com/questions/40683/rotate-single-pdf-page-when-viewing --> 


## Predictions using Final Model on Evaluation Data Set 

The Evaluation Data Set needed to be data cleansed much like our Training Data Set. We modified the Evaluation Data Set variables to conform to the Training Data Set and we also imputed the missing values in the Evaluation Data Set in order to be able to make predictions. 





The below table represents our predictions as indicated in column `TARGET_FLAG` and `TARGET_AMT` using our final models and using the provided evaluation data set after transformation.

\tiny


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 INDEX   KIDSDRIV   AGE   HOMEKIDS   YOJ   INCOME   PARENT1   HOME_VAL   MSTATUS   SEX        EDUCATION           JOB       TRAVTIME   CAR_USE    BLUEBOOK   TIF   CAR_TYPE    RED_CAR   OLDCLAIM   CLM_FREQ   REVOKED   MVR_PTS   CAR_AGE      URBANICITY       eval.PredProb   TARGET_FLAG   TARGET_AMT 
------- ---------- ----- ---------- ----- -------- --------- ---------- --------- ----- --------------------- ------------ ---------- ---------- ---------- ----- ----------- --------- ---------- ---------- --------- --------- --------- ------------------- --------------- ------------- ------------
   3        0       48       0       11    52881      No         0         No       M         Bachelors         Manager        26      Private     21970      1       Van        yes        0          0         No         2        10     Highly Urban/ Urban      0.18             0        $1,035.77  

   9        1       40       1       11    50815      Yes        0         No       M        High School        Manager        21      Private     18930      6     Minivan      no        3295        1         No         2         1     Highly Urban/ Urban      0.26             0        $1,703.01  

  10        0       44       2       12    43486      Yes        0         No       F        High School      Blue Collar      30     Commercial    5900     10       SUV        no         0          0         No         0        10     Highly Rural/ Rural      0.09             0        $1,188.82  

  18        0       35       2      10.34  21204      Yes        0         No       M        High School        Clerical       74      Private      9230      6     Pickup       no         0          0         Yes        0         4     Highly Rural/ Rural      0.12             0        $1,672.68  

  21        0       59       0       12    87460      No         0         No       M        High School        Manager        45      Private     15420      1     Minivan      yes      44857        2         No         4         1     Highly Urban/ Urban       0.2             0        $1,556.79  

  30        0       46       0       14    72851      No       207519      Yes      M         Bachelors       Professional     7      Commercial   25660      1   Panel Truck    no        2119        1         No         2        12     Highly Urban/ Urban      0.25             0        $1,847.91  

  31        0       60       0       12    37940      No       182739      Yes      F        High School      Blue Collar      16     Commercial   11290      1   Sports Car     no         0          0         No         0         1     Highly Urban/ Urban      0.31             1        $2,377.34  

  37        0       54       0       12    33212      No       158432      Yes      M   Less Than High School Blue Collar      27     Commercial   24000      4   Panel Truck    no         0          0         No         5       4.43    Highly Urban/ Urban       0.5             1        $3,058.02  

  39        2       36       2       12    130540     Yes      344195      No       F         Bachelors       Blue Collar      5      Commercial   27200      4     Minivan      no         0          0         No         0         9     Highly Rural/ Rural      0.14             0         $770.69   

  47        0       50       0        8    167469     No         0         No       F            PhD             Doctor        22      Private     34150      4   Sports Car     no         0          0         No         3         1     Highly Urban/ Urban      0.14             0        $1,587.58  

  60        0       42       0      10.67  52988      No       176275      Yes      M        High School      Blue Collar      24     Commercial   23450      1     Minivan      no         0          0         No         2        11     Highly Rural/ Rural      0.05             0         $158.69   

  62        0       41       2        7    17755      Yes      148815      No       F   Less Than High School   Clerical       29      Private     14480      1     Minivan      yes        0          0         Yes        2         1     Highly Urban/ Urban      0.66             1        $3,095.40  

  63        1       37       2       13    46944      Yes        0         No       F        High School      Blue Collar      62     Commercial    9360      4   Sports Car     no         0          0         No         0       4.96    Highly Urban/ Urban      0.59             1        $4,225.59  

  64        0       36       3       12    56048      No       137836      Yes      M          Masters           Lawyer        15      Private     10700      6     Minivan      no        2045        2         No         2        16     Highly Urban/ Urban      0.14             0         $528.25   

  68        0       34       3       12    22510      No       123888      Yes      M        High School        Clerical       26      Private     14690      4     Minivan      yes        0          0         Yes        0         1     Highly Rural/ Rural      0.06             0         $-228.34  

  75        0       35       2       12    36559      Yes        0         No       F   Less Than High School Blue Collar      43      Private      9730      5       SUV        no         0          0         No         4         4     Highly Urban/ Urban      0.46             1        $3,389.79  

  76        2       44       2       14    45576      No       156623      Yes      F   Less Than High School Blue Collar      27      Private      1500      4   Sports Car     no       25276        1         No         8       4.46    Highly Urban/ Urban      0.64             1        $3,763.52  

  83        0       48       0        9    61509      No       195438      Yes      M          Masters        Professional     40     Commercial   23230      6   Panel Truck    yes        0          0         No         1        17     Highly Urban/ Urban      0.23             0        $2,067.69  

  87        0       62       0       15    40656      No       208242      Yes      F        High School        Clerical       57      Private      9170      4   Sports Car     no       42342        2         Yes        2         7     Highly Urban/ Urban      0.42             1        $2,751.20  

  92        0       39       0       11    33727      No         0         No       F         Bachelors         Clerical       27      Private     10850      1       SUV        no        8350        1         No         2        12     Highly Urban/ Urban      0.43             1        $2,093.22  

  98        0       38       0        0      0        No         0         Yes      M        High School        Student        41     Commercial   17470     10       Van        no        3157        2         No         5         6     Highly Rural/ Rural      0.19             0        $1,676.45  

  106       0       39       2        0      0        No       69369       Yes      F        High School       Home Maker      36      Private      8750      4   Sports Car     no         0          0         No         0         8     Highly Urban/ Urban      0.32             1        $1,775.79  

  107       2       44       2       13    142588     No       365256      Yes      M          Masters          Manager        28      Private     21790      6     Minivan      yes        0          0         No         2         9     Highly Urban/ Urban      0.16             0         $577.76   

  113       0       45       0       12    32394      No         0         No       F        High School        Clerical       33      Private     13770      4       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.36             1        $2,068.30  

  120       0       43       1        0      0        No       70170       Yes      F         Bachelors        Home Maker      26      Private      8350      1       SUV        no         0          0         No         3         7     Highly Urban/ Urban      0.43             1        $1,898.77  

  123       0       64       0       15    31738      No       197010      Yes      M   Less Than High School Blue Collar      23     Commercial   14620      6       SUV        no        3994        2         No         0         1     Highly Urban/ Urban      0.32             1        $2,577.43  

  125       0       60       0        9    125893     No         0         No       M            PhD            Manager        21     Commercial    7500      9     Pickup       yes       7278        2         No         4        15     Highly Urban/ Urban      0.31             1        $2,092.05  

  126       2       35       4        6    154577     Yes      397868      No       F         Bachelors       Blue Collar      27      Private     20450      6       SUV        no        4645        1         No         3         1     Highly Urban/ Urban      0.53             1        $3,384.19  

  128       0       52       0       11    79348      No       270032      Yes      F        High School        Manager        23      Private     13150     11       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.08             0         $106.87   

  129       0       56       2       14    192089     No       471701      Yes      M            PhD            Manager        31     Commercial   21100      1       Van        yes        0          0         No         0       13.24   Highly Urban/ Urban      0.09             0        $1,290.84  

  131       0       55       0       15    108152     No       329756      Yes      F          Masters          Manager        18      Private     12320      1       SUV        no         0          0         Yes        0        15     Highly Urban/ Urban      0.11             0         $331.46   

  135       0       26       0        8    53244      No         0         No       M         Bachelors       Professional     28     Commercial   20920      3       Van        yes       6224        1         No         1         8     Highly Urban/ Urban       0.4             1        $2,827.13  

  141       0       52       0        8    88560      No       244028      Yes      M          Masters           Lawyer        14      Private     13630      1     Minivan      no         0          0         No         4        17     Highly Urban/ Urban      0.16             0         $766.55   

  147       0       41       0       12    110386     No       335488      Yes      M          Masters          Manager        21     Commercial   16640      1       Van        yes        0          0         No         2        14     Highly Urban/ Urban      0.14             0        $1,305.65  

  148       0       49       0       12    53765      No         0         No       F         Bachelors       Professional     5       Private     12360      4       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.22             0        $1,287.66  

  151       0       30       2      11.39  26226      No       165178      Yes      F        High School        Clerical       68      Private     23610      4       SUV        no         0          0         No         1         1     Highly Rural/ Rural      0.03             0         $324.65   

  156       1       34       3       12    29431      No       143149      Yes      F   Less Than High School   Clerical       12      Private     22560      1     Minivan      no         0          0         No         1       4.79    Highly Urban/ Urban      0.34             1        $1,195.00  

  157       0       44       0       14    44790      No       205463      Yes      F          Masters          Manager        5      Commercial   19800      4     Pickup       no       37163        1         No         4         9     Highly Urban/ Urban      0.23             0        $1,123.38  

  174       0       49       0      11.44  38326      No       133010      Yes      M          Masters           Lawyer        5       Private     10230      4     Pickup       yes        0          0         No         0        17     Highly Urban/ Urban      0.12             0         $248.01   

  186       1       40       2       12    35260      No       141167      Yes      F   Less Than High School Blue Collar      30      Private      9740      7       SUV        no        2235        1         No         8         1     Highly Urban/ Urban      0.55             1        $3,161.29  

  193       0       26       3        9    33283      No       104323      Yes      M         Bachelors       Blue Collar      37     Commercial    7690     10     Pickup       no         0          0         No         2        16     Highly Urban/ Urban      0.39             1        $1,672.82  

  195       0       46       0        7    26697      No       134863      Yes      F   Less Than High School   Clerical       43      Private     15080      6       SUV        no         0          0         Yes        4         1     Highly Urban/ Urban      0.52             1        $2,722.77  

  212       0       50       0        7    73308      No       240645      No       M          Masters           Lawyer        38      Private     18720      7       Van        no         0          0         No         2        19     Highly Rural/ Rural      0.03             0         $-41.46   

  213       0       62       0       12    22181      No       185459      No       F        High School        Clerical       24      Private     17880      7   Sports Car     no        9873        3         No         5         1     Highly Urban/ Urban      0.57             1        $3,295.41  

  217       0       53       1       13    52759      No       164906      Yes      F         Bachelors       Professional     41      Private     24160      9     Minivan      no         0          0         No         0        13     Highly Rural/ Rural      0.01             0        $-1,670.99 

  223       0       44       0        4    146267     No       357184      Yes      M          Masters          Manager        51     Commercial    6720      4     Pickup       no         0          0         No         0        10     Highly Urban/ Urban       0.1             0         $982.82   

  226       0       48       1       10    84629      No       308848      Yes      F         Bachelors         Manager        35      Private     15060      7       SUV        no        9592        1         No         0        10     Highly Urban/ Urban      0.06             0         $-232.41  

  228       1       45       2       17    111268     No       288071      Yes      F          Masters           Lawyer        46      Private     24600      1       Van        no       28026        2         Yes        2        10     Highly Urban/ Urban      0.31             1        $2,346.35  

  230       0       41       0       10    97700      No         0         No       F         Bachelors        Home Maker      43      Private     26250      8     Pickup       no         0          0         No         0         6     Highly Rural/ Rural      0.02             0         $-887.81  

  241       0       32       3       13    30955      Yes      111256      No       F        High School        Clerical       9       Private      7800      4       SUV        no         0          0         Yes        0         8     Highly Urban/ Urban      0.55             1        $2,595.69  

  243       0       49       1       15    89612      No       261946      Yes      M          Masters        Professional     23     Commercial    6400     10     Pickup       yes        0          0         No         0        23     Highly Urban/ Urban      0.19             0        $1,168.69  

  249       0       41       0       12    80718      No         0         No       F         Bachelors       Professional     29      Private     26480     11   Sports Car     no        8623        3         No         5         8     Highly Urban/ Urban      0.34             1        $2,534.99  

  281       1       44       2       15    46140      No       169084      Yes      M        High School      Blue Collar      29     Commercial   10510      1     Pickup       no        4276        3         No         7         1     Highly Urban/ Urban      0.66             1        $4,109.68  

  288       0       47       0       12    80105      No         0         No       M          Masters          Manager        29      Private     14210      6     Minivan      yes        0          0         No         1        12     Highly Urban/ Urban      0.14             0         $300.64   

  294       2       41       2        8    17814      No         0         Yes      M   Less Than High School   Student        43     Commercial    5850      1     Pickup       yes       9419        1         No         5         6     Highly Rural/ Rural      0.18             0        $2,133.06  

  295       0       41       2       10    78675      Yes      265450      No       M         Bachelors       Blue Collar      33     Commercial   13470     11     Minivan      yes        0          0         No         0         3     Highly Urban/ Urban      0.43             1        $2,334.52  

  300       0       50       0       10    219024     No         0         No       M            PhD            Manager        27     Commercial   23370      4   Panel Truck    yes       4117        2         No         4        20     Highly Urban/ Urban      0.26             0        $2,252.06  

  302       0       51       0       10    55573      No         0         No       F          Masters           Lawyer        18      Private     12160      1       SUV        no        9768        1         No         6        14     Highly Urban/ Urban      0.39             1        $2,470.79  

  303       0       53       0        8    61862      No       245885      Yes      M            PhD             Doctor        33      Private     11270      1     Pickup       yes        0          0         No         0        14     Highly Urban/ Urban      0.07             0         $284.08   

  308       0       32       3       14    21944      No       128776      Yes      F   Less Than High School Blue Collar      34      Private      7270      1       SUV        no         0          0         Yes        1         1     Highly Urban/ Urban      0.39             1        $2,319.80  

  319       0       48       0       14    42008      No       176219      Yes      F          Masters           Lawyer        23      Private     10000      4       SUV        no         0          0         No         0        14     Highly Rural/ Rural      0.01             0         $-960.51  

  320       0       54       0        8    90149      No       261569      Yes      F          Masters          Manager        17      Private     15910      4       SUV        no         0          0         No         1        10     Highly Urban/ Urban      0.07             0          $80.96   

  324       0       55       0       15    75249      No         0         No       M          Masters        Professional     5      Commercial   17020      1       Van        yes       1316        2         No         1        21     Highly Urban/ Urban      0.38             1        $2,563.14  

  331       0       51       0       11    117016     No         0         No       F          Masters          Manager        23      Private     20320      4     Minivan      no        1197        2         No         6         8     Highly Urban/ Urban      0.23             0        $1,173.92  

  343       0       47       0        7    76462      No       229334      Yes      M         Bachelors       Professional     29      Private     13850      6     Minivan      yes        0          0         No         0         7     Highly Urban/ Urban      0.11             0         $359.55   

  347       0       44       1      1.52     0        No       70461       Yes      F          Masters         Home Maker      19      Private      2640      4   Sports Car     no        2219        2         No         1        13     Highly Urban/ Urban      0.36             1        $1,976.44  

  348       0       36       0       13    20891      No       134406      Yes      F        High School      Blue Collar      39     Commercial    5100      1       SUV        no        2949        2         No         9         7     Highly Urban/ Urban      0.68             1        $4,090.70  

  350       0       35       2       10    17493      Yes      102902      No       F   Less Than High School   Clerical       52      Private     19340      9     Minivan      no        5658        3         No         7         1     Highly Urban/ Urban      0.66             1        $3,696.50  

  357       0       43       0       11    39848      No       136304      No       F          Masters           Lawyer        45      Private     18060      8       SUV        no         0          0         No         0        15     Highly Urban/ Urban      0.22             0        $1,358.98  

  358       0       42       1       12    117978     Yes        0         No       F         Bachelors       Blue Collar      17     Commercial   28700      1       SUV        no         0          0         No         0         7     Highly Rural/ Rural      0.06             0        $1,155.41  

  360       0       56       0       12    62483      No       208267      Yes      F         Bachelors         Manager        18      Private     20940      6     Minivan      no         0          0         No         0         8     Highly Urban/ Urban      0.07             0        $-1,072.43 

  366       0       39       0       14    73367      No         0         No       M         Bachelors       Professional     36      Private     12740      6     Minivan      yes       3320        1         No         4         7     Highly Urban/ Urban      0.32             1        $1,839.99  

  367       0       32       4       15     4478      Yes        0         No       F   Less Than High School   Student        7       Private      6780      4       SUV        no        7181        3         No         5         8     Highly Urban/ Urban      0.53             1        $3,173.74  

  368       0       44       1        9     5952      No         0         Yes      M         Bachelors         Student        22     Commercial    6500      4     Pickup       yes        0          0         No         0        10     Highly Urban/ Urban      0.33             1        $1,430.52  

  376       0       44       1       11    75046      No       244819      Yes      M        High School      Blue Collar      56     Commercial    9000      4     Pickup       yes       3288        3         No         6        10     Highly Urban/ Urban      0.47             1        $3,365.64  

  380       0       38       0       10    75432      No         0         No       F         Bachelors         Manager        51      Private     16260      1       SUV        no        8035        3         No         0        13     Highly Urban/ Urban      0.13             0         $972.33   

  388       0       35       3       13    64872      No       187354      Yes      F   Less Than High School   Clerical       44      Private     11490      1       SUV        no         0          0         No         3         8     Highly Urban/ Urban      0.25             0        $2,033.47  

  396       0       55       0       14    66964      No         0         No       M          Masters           Lawyer        47      Private     13700      6     Minivan      yes       6183        3         No         3        18     Highly Urban/ Urban      0.28             0        $1,717.45  

  398       0       42       2       11    34210      No       186734      Yes      M        High School        Clerical       34      Private     12880      6     Minivan      yes       1830        1         No         0         1     Highly Urban/ Urban      0.21             0        $1,060.23  

  403       1       43       2       11    24124      No       157794      Yes      F   Less Than High School Blue Collar      40      Private      8140      7       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.04             0         $182.19   

  410       0       44       0       12    39852      No       125283      Yes      F        High School      Blue Collar      37     Commercial    7410      1       SUV        no        3704        2         No         0         6     Highly Urban/ Urban      0.31             1        $2,468.48  

  412       0       51       0       13    65702      No         0         No       F          Masters           Lawyer        27      Private     15820      1       SUV        no        7181        2         No         3         1     Highly Urban/ Urban      0.28             0        $2,521.27  

  420       0       34       1       12    68833      No       183087      Yes      F         Bachelors         Clerical       35     Commercial   21940      4     Pickup       no        1494        2         No         3         9     Highly Urban/ Urban      0.41             1        $2,209.82  

  434       1       40       2        6    54159      No       180764      Yes      M   Less Than High School Blue Collar      65      Private     16920     10       Van        yes        0          0         No         1         1     Highly Rural/ Rural      0.04             0         $486.33   

  440       0       37       3       17     6217      No         0         Yes      F        High School        Student        27     Commercial   22260     10     Pickup       no         0          0         Yes        0         4     Highly Urban/ Urban      0.51             1        $1,744.41  

  450       0       58       0       14    39707      No       192089      Yes      M   Less Than High School Blue Collar      29     Commercial   16870      1       Van        yes       3546        1         No         6         6     Highly Urban/ Urban      0.53             1        $3,561.84  

  453       0       50       0       10    24358      No       128210      Yes      M   Less Than High School Blue Collar      11      Private     17790      3       Van        no         0          0         Yes        0         7     Highly Urban/ Urban      0.35             1        $1,711.18  

  464       0       46       0        7    106409     No         0         No       F          Masters          Manager        42     Commercial   24410      6     Pickup       no        6948        1         No         0        18     Highly Urban/ Urban      0.21             0        $1,107.23  

  465       0       53       0       14    59797      No       178230      Yes      F            PhD             Doctor        35      Private     18070      4     Minivan      no         0          0         No         0        16     Highly Urban/ Urban      0.07             0         $-496.01  

  466       0       63       2       10    52064      No       182295      Yes      F        High School      Blue Collar      16     Commercial   11770      1   Sports Car     no        834         2         No         8         1     Highly Urban/ Urban      0.58             1        $3,905.53  

  473       0       53       0        7    77012      No       316239      Yes      M            PhD             Doctor        22      Private     21440      1       Van        no        8744        2         No         0        13     Highly Urban/ Urban      0.06             0         $575.83   

  476       0       36       0       11    17085      No         0         Yes      F        High School        Student        58      Private     15840      7   Sports Car     no        4070        2         No         2         1     Highly Rural/ Rural      0.03             0         $355.71   

  478       0       43       0       13    238856     No       389826      Yes      M          Masters          Manager        19     Commercial   29690     11   Panel Truck    yes        0          0         No         0        22     Highly Urban/ Urban      0.08             0         $-63.00   

  479       0       54       0       12    69625      No       271183      Yes      F         Bachelors         Manager        51      Private     22340      1       SUV        no        3155        1         No         2        12     Highly Urban/ Urban      0.09             0         $539.06   

  493       0       39       3       16    42535      No       189139      Yes      M        High School        Clerical       22     Commercial   19330      4       Van        yes        0          0         No         1         8     Highly Rural/ Rural      0.06             0         $587.89   

  497       1       43       2       14    81674      No       233744      Yes      M         Bachelors         Manager        39     Commercial   34680      1   Panel Truck    no         0          0         No         1        10     Highly Urban/ Urban       0.2             0        $1,416.51  

  503       0       51       0       13    34658      No       159187      Yes      M         Bachelors       Professional     31      Private     15660      1     Minivan      no         0          0         No         0        11     Highly Rural/ Rural      0.02             0        $-1,029.65 

  504       0       42       0        0      0        No         0         No       F        High School       Home Maker      5       Private     25540      1   Sports Car     no         0          0         No         0         1     Highly Urban/ Urban       0.5             1        $2,214.55  

  505       0       41       0        6    86227      No       237057      No       M          Masters          Manager        28     Commercial   19530      9       Van        no        2948        3         No         2        17     Highly Urban/ Urban      0.28             0        $1,906.52  

  507       0       35       1       12    77126      No       242001      Yes      M        High School        Manager        5      Commercial   11510     10     Pickup       yes       3079        3         No         0         1     Highly Urban/ Urban      0.12             0         $572.10   

  513       0       35       2        0      0        No         0         Yes      F   Less Than High School   Student        32      Private      4810      1       SUV        no         0          0         No         0         6     Highly Urban/ Urban      0.34             1        $1,714.68  

  519       1       41       3        5    30043      Yes      84761       No       M        High School        Clerical       22      Private     16860      4       Van        yes        0          0         No         0         1     Highly Urban/ Urban      0.48             1        $3,128.82  

  521       0       43       0       14    54932      No       225678      Yes      M        High School        Clerical       37     Commercial   11290      4     Pickup       yes       5076        3         No         5         1     Highly Urban/ Urban       0.5             1        $3,372.98  

  522       0       42       0        8    94591      No       309644      No       M   Less Than High School Blue Collar      21     Commercial   17470      6       Van        yes      16121        3         Yes        3         8     Highly Urban/ Urban       0.7             1        $3,749.61  

  545       1       56       2       17    100575     No       315504      Yes      F         Bachelors       Professional     32      Private     28740      1     Minivan      no         0          0         No         1         6     Highly Urban/ Urban      0.17             0         $909.83   

  549       0       40       1       13    79715      Yes        0         No       F         Bachelors         Clerical       6       Private     23140     10     Minivan      no         0          0         No         0         7     Highly Urban/ Urban       0.3             1         $817.23   

  551       0       51       0       12    40760      No       186223      No       M         Bachelors       Professional     24      Private     11880      1     Pickup       no         0          0         No         0         8     Highly Urban/ Urban      0.23             0        $1,578.25  

  556       0       38       0       10    28409      No         0         No       M        High School        Clerical       27     Commercial    8140     10     Pickup       yes        0          0         No         1         7     Highly Rural/ Rural      0.13             0         $829.58   

  557       0       27       3        9    69794      Yes        0         No       F         Bachelors       Professional     24      Private     14660      4       SUV        no        2848        1         No         3         6     Highly Urban/ Urban      0.29             1        $2,718.95  

  559       1       42       2       15    85408      No       274402      Yes      F        High School      Blue Collar      32     Commercial   20170     10     Minivan      no        697         2         No         0         8     Highly Urban/ Urban      0.36             1        $1,503.44  

  560       0       55       0       11     3865      No         0         No       F   Less Than High School  Home Maker      27      Private     16600      1       SUV        no        6089        2         Yes        0         1     Highly Urban/ Urban      0.52             1        $2,752.30  

  566       0       43       0        7    58112      No         0         No       M         Bachelors         Clerical       34      Private      1500      4     Minivan      yes        0          0         No         2        11     Highly Rural/ Rural      0.06             0         $-228.97  

  569       0       54       0       12    65298      No       213225      Yes      F        High School        Clerical       5       Private      8030     17       SUV        no        4528        3         No         5         1     Highly Urban/ Urban      0.31             1        $1,440.47  

  573       1       37       2        9    54349      No       212419      Yes      F        High School        Manager        28      Private     10630     13       SUV        no        1381        1         No         4        11     Highly Urban/ Urban      0.18             0         $694.25   

  578       0       44       0       12    51842      No         0         No       F        High School      Blue Collar      32     Commercial   10770      1       SUV        no         0          0         No         2         8     Highly Urban/ Urban      0.54             1        $3,042.92  

  579       0       44       2        7    20324      No       147038      Yes      F        High School        Clerical       20      Private     10280      1   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.03             0          $86.39   

  582       2       37       3       11    159092     No       382687      Yes      M         Bachelors       Blue Collar      29      Private     15050      6     Minivan      yes       1927        3         No         0         8     Highly Rural/ Rural      0.03             0         $-426.42  

  596       0       31       2        0      0        No         0         Yes      F   Less Than High School   Student        48      Private      7740      4   Sports Car     no        7323        1         No         7         1     Highly Urban/ Urban       0.6             1        $3,432.90  

  598       2       36       2        0      0        No       110346      Yes      F        High School       Home Maker      28      Private      5100      4     Minivan      no       39425        3         Yes        1         9     Highly Urban/ Urban      0.75             1        $2,412.19  

  599       0       54       0       12    77267      No         0         No       F         Bachelors         Manager        14      Private     14630      1       SUV        no        8395        2         No         0         9     Highly Urban/ Urban      0.12             0         $519.85   

  602       0       39       0        0      0        No         0         No       F        High School        Student        53     Commercial    5500      1   Sports Car     no         0          0         No         0         8     Highly Rural/ Rural      0.19             0        $1,786.94  

  605       1       57       2        0      0        No         0         Yes      M        High School        Student        29      Private      9240      1     Pickup       yes       8336        2         Yes        5         1     Highly Urban/ Urban      0.79             1        $3,537.73  

  617       0       34       2        0      0        Yes        0         No       F        High School        Student        22      Private     11520      9       SUV        no         0          0         Yes        0         9     Highly Urban/ Urban       0.7             1        $2,701.32  

  619       0       48       0       10     7302      No       11971       No       F   Less Than High School   Student        27      Private      7030     10       SUV        no        3564        1         No         3         1     Highly Urban/ Urban      0.44             1        $2,172.52  

  630       0       52       0       15    88691      No       279497      Yes      M         Bachelors       Blue Collar      40      Private     18200      4       Van        yes       1261        4         No         2        10     Highly Urban/ Urban      0.18             0        $1,819.46  

  634       1       58       2       17     3272      No         0         Yes      M   Less Than High School   Student        42      Private      7200      1     Minivan      yes       5086        2         No         2         5     Highly Urban/ Urban      0.37             1        $2,028.24  

  643       0       45       0       14    65466      No       212677      Yes      M        High School      Blue Collar      24     Commercial    7080      3     Pickup       no         0          0         No         2         1     Highly Urban/ Urban      0.34             1        $2,338.79  

  645       0       72       0       16    63890      No       256797      Yes      F          Masters           Lawyer        41      Private      9100      7   Sports Car     no        4448        3         No         0         6     Highly Urban/ Urban       0.1             0        $1,510.00  

  647       0       48       0        8    43075      No       175858      Yes      F        High School        Manager        52      Private     13970      4       SUV        no        5878        2         No         3        11     Highly Urban/ Urban      0.11             0         $977.21   

  649       0       49       0        9    90658      No       276028      No       F         Bachelors       Blue Collar      7      Commercial   12350     13     Minivan      no         0          0         No         0         7     Highly Urban/ Urban      0.42             1         $801.50   

  656       0       57       0       14    200772     No       465304      No       F            PhD             Doctor        27      Private      9270      1       SUV        no         0          0         No         0       12.9    Highly Urban/ Urban      0.09             0         $663.34   

  657       0       22       0      10.17  36821      No       193948      No       F          Masters           Lawyer        23      Private     29390      6     Pickup       no        8502        2         No         0        20     Highly Urban/ Urban      0.23             0         $984.22   

  658       0       53       0       13    108744     No       333039      Yes      M          Masters          Manager        5      Commercial    5430      1     Pickup       yes       3267        1         No         0       14.15   Highly Urban/ Urban      0.11             0         $530.87   

  667       0       50       0       14    30795      No       174778      Yes      M        High School        Clerical       53     Commercial    8920      6     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural      0.05             0         $678.08   

  692       0       59       0       12    155410     No       422815      Yes      M         Bachelors         Manager        40     Commercial   33330      7   Panel Truck    yes       4765        3         No         4        10     Highly Urban/ Urban      0.16             0        $1,466.26  

  693       0       33       3        7    37106      No       147326      Yes      F   Less Than High School Blue Collar      38      Private     22520      5     Minivan      no        3075        1         No         6         1     Highly Urban/ Urban      0.35             1        $1,953.52  

  698       0       48       0       11    26875      No         0         No       M        High School        Clerical       18     Commercial   10450      1     Pickup       no        3830        1         No         8         6     Highly Urban/ Urban       0.8             1        $4,144.78  

  699       1       42       3       11    99269      Yes      306012      No       M         Bachelors       Professional     34     Commercial   25910      7   Panel Truck    yes      45894        2         Yes        1        10     Highly Urban/ Urban      0.65             1        $3,972.34  

  700       0       50       0       11    102262     No         0         No       M        High School      Blue Collar      39     Commercial   16730     14       Van        yes        0          0         No         0         8     Highly Rural/ Rural      0.07             0         $530.08   

  704       0       53       0        2    13753      No         0         No       F   Less Than High School  Home Maker      49      Private      2880      4   Sports Car     no         0          0         No         1       4.43    Highly Rural/ Rural      0.05             0         $724.34   

  707       0       49       0        9    60368      No       170643      Yes      M         Bachelors         Manager        16      Private      6400      4     Pickup       no         0          0         No         0         4     Highly Urban/ Urban      0.07             0         $-282.71  

  708       0       21       1        8    18483      Yes        0         No       F        High School        Clerical       20      Private      8150      1   Sports Car     no        7781        2         No         3         1     Highly Urban/ Urban      0.51             1        $3,743.60  

  709       0       50       0        9    58628      No         0         No       M          Masters           Lawyer        14      Private     12360      1     Minivan      yes        0          0         No         0        15     Highly Urban/ Urban       0.2             0         $815.93   

  713       0       53       0        0      0        No       105085      Yes      M          Masters         Home Maker      31      Private      6800     11     Pickup       yes        0          0         No         0        14     Highly Urban/ Urban      0.32             1        $1,076.32  

  714       0       49       0        2    81280      No       241420      Yes      M         Bachelors       Professional     24      Private     14530      1     Minivan      no         0          0         No         0         6     Highly Urban/ Urban       0.1             0         $550.40   

  716       1       38       2       13    38317      No       125157      Yes      F            PhD             Doctor        44      Private      1500      1   Sports Car     no        2896        1         No         8         8     Highly Urban/ Urban      0.31             1        $2,807.24  

  718       0       53       0       11    70026      No         0         No       F          Masters           Lawyer        39      Private     18780     10     Pickup       no         0          0         No         0        11     Highly Urban/ Urban      0.19             0         $911.14   

  722       0       49       0        8    78384      No         0         No       M          Masters           Lawyer        26      Private     12910      4     Minivan      no         0          0         No         0        17     Highly Urban/ Urban      0.19             0         $745.59   

  729       0       48       0        8    134140     No         0         No       M            PhD            Manager        34     Commercial   30240      1   Panel Truck    no        7478        2         No         6        13     Highly Urban/ Urban      0.37             1        $3,123.71  

  731       0       53       0       13    158919     No       499433      Yes      M            PhD             Doctor        26      Private     14610      6     Minivan      no         0          0         No         0         5     Highly Urban/ Urban      0.05             0         $-341.38  

  733       0       51       0        4    72453      No         0         No       F            PhD             Doctor        52      Private     13850      1       SUV        no        2847        4         No         7        15     Highly Urban/ Urban      0.29             1        $2,706.34  

  746       2       37       2        5    58079      No       235987      Yes      M         Bachelors         Clerical       50      Private     11270      1     Minivan      yes        0          0         No         3         1     Highly Urban/ Urban      0.47             1        $2,351.04  

  747       0       26       3       13    14822      Yes      41680       No       F   Less Than High School   Clerical       5       Private      8830     10   Sports Car     no        7486        3         No         9         1     Highly Urban/ Urban      0.73             1        $4,274.03  

  748       0       47       0        0      0        No       56266       Yes      F         Bachelors        Home Maker      32      Private      6200      1       SUV        no         0          0         Yes        0         1     Highly Urban/ Urban       0.5             1        $2,060.96  

  753       0       48       0       13    78966      No         0         No       F         Bachelors       Professional     39      Private     21420      6   Sports Car     no         0          0         No         3         8     Highly Urban/ Urban      0.28             0        $2,229.24  

  757       0       51       0       13    51513      No         0         No       M          Masters           Lawyer        42      Private      6650      4     Minivan      no       33388        2         Yes        4        17     Highly Urban/ Urban      0.51             1        $2,334.25  

  763       0       33       0       11    25655      No       122916      No       F        High School       Home Maker      47      Private     12400     20     Minivan      no        5531        2         No         6         1     Highly Rural/ Rural      0.08             0          $-1.42   

  767       0       58       0       12    69282      No       295989      Yes      M         Bachelors       Professional     47      Private     10520      6     Pickup       no        1142        1         No         0        13     Highly Urban/ Urban      0.11             0         $877.36   

  774       0       30       0       10    27803      No         0         No       F        High School        Clerical       41      Private      7280      4     Minivan      no        6322        2         No         5         8     Highly Urban/ Urban      0.56             1        $2,383.96  

  776       0       50       0        8    34611      No         0         No       F        High School        Clerical       47      Private     12760      1     Minivan      no        3908        2         No         4         8     Highly Urban/ Urban       0.5             1        $2,384.73  

  788       0       47       0       12    55019      No       206801      Yes      F         Bachelors       Professional     51      Private     18110      4       SUV        no        9085        2         No         1         9     Highly Urban/ Urban      0.13             0        $1,497.46  

  794       0       42       1       11    200928     No       513817      Yes      M            PhD            Manager        25     Commercial    5600      1     Pickup       no        4020        1         No         2        14     Highly Urban/ Urban      0.11             0        $1,403.96  

  799       0       33       1       12    92060      Yes        0         No       F         Bachelors       Professional     24      Private     14010      5       SUV        no         0          0         No         0        10     Highly Urban/ Urban      0.19             0        $1,890.64  

  803       0       36       0       11    48901      No       210300      Yes      M        High School        Manager        5       Private      5100      1     Pickup       no        3805        3         No         0         9     Highly Urban/ Urban      0.07             0          $32.60   

  806       3       38       3        9    38212      Yes      160245      No       M         Bachelors         Clerical       61     Commercial   22320      1       Van        yes       4326        4         No         6        13     Highly Rural/ Rural      0.53             1        $4,495.11  

  807       0       36       1       10    100095     Yes        0         No       F          Masters           Lawyer        15      Private     17520      1       SUV        no         0          0         No         0        19     Highly Urban/ Urban      0.17             0        $1,688.18  

  811       0       56       0        8    42834      No       146455      Yes      M         Bachelors       Blue Collar      29     Commercial   22760      4   Panel Truck    yes        0          0         No         5         8     Highly Rural/ Rural      0.09             0         $986.20   

  816       0       37       3       15    130123     No       313024      Yes      F         Bachelors       Blue Collar      59     Commercial   32260      4     Minivan      no         0          0         No         0         7     Highly Urban/ Urban      0.23             0        $1,225.15  

  818       0       57       0       13    27281      No       198619      Yes      F        High School       Home Maker      24      Private     22470      4       SUV        no         0          0         Yes        1         1     Highly Urban/ Urban      0.28             1        $1,604.79  

  819       0       37       4       11    34622      No       188514      Yes      M          Masters        Professional     30      Private     20170      6       Van        no        7875        1         No         0       11.74   Highly Urban/ Urban      0.13             0        $1,428.60  

  831       1       38       3       15    57925      No       144063      Yes      M   Less Than High School Blue Collar      16      Private     30770      6     Minivan      yes        0          0         No         0         6     Highly Urban/ Urban      0.24             0         $902.77   

  835       1       39       3       17    25846      No       107211      Yes      M        High School        Clerical       68     Commercial   26850     10   Panel Truck    yes        0          0         No         3         7     Highly Urban/ Urban       0.6             1        $3,138.84  

  837       0       43       2       13    126496     No       302855      Yes      M          Masters          Manager        22     Commercial   26980      7   Panel Truck    yes        0          0         No         5        16     Highly Urban/ Urban       0.2             0        $1,333.73  

  841       1       41       1       11    182782     Yes        0         No       M            PhD            Manager        36     Commercial   23880      3   Panel Truck    no        5639        2         Yes        5        14     Highly Urban/ Urban       0.6             1        $4,238.27  

  846       0       28       4       12    94675      Yes      291876      No       M          Masters           Lawyer        47      Private     10320      6     Pickup       no         0          0         No         3        17     Highly Urban/ Urban      0.25             0        $2,363.53  

  856       0       47       0        0      0        No       67647       Yes      F         Bachelors        Home Maker      19      Private      6200      9       SUV        no       23972        2         Yes        1         9     Highly Urban/ Urban      0.54             1        $1,671.39  

  861       0       38       0       12    34537      No       122423      Yes      M   Less Than High School   Clerical       35     Commercial   32460      1   Panel Truck    yes       1414        2         No         4         1     Highly Urban/ Urban       0.5             1        $3,490.46  

  862       0       53       0       11    27045      No       161922      Yes      M         Bachelors         Clerical       54     Commercial    6800      6     Pickup       no        6523        3         No         4         7     Highly Urban/ Urban      0.52             1        $3,033.78  

  863       0       48       0       11    75984      No         0         No       F        High School      Blue Collar      42     Commercial   37310      1   Sports Car     no       40386        3         Yes        1         2     Highly Urban/ Urban      0.65             1        $4,090.87  

  865       0       48       0       12    88745      No       241555      Yes      F        High School      Blue Collar      55     Commercial    7050      1       SUV        no        1031        2         No         5        12     Highly Urban/ Urban      0.42             1        $3,194.58  

  871       0       44       2       14    26377      Yes      169045      No       M        High School        Clerical       30      Private      8540      1     Minivan      yes       4236        3         No         3         1     Highly Urban/ Urban      0.49             1        $3,260.58  

  879       0       54       0        6    73663      No       268990      Yes      M         Bachelors       Professional     14     Commercial   41310      7   Panel Truck    no       36700        1         Yes        3         5     Highly Urban/ Urban      0.45             1        $2,502.20  

  880       0       55       0       15    87426      No       286182      Yes      M         Bachelors       Blue Collar      41      Private      8410      4     Pickup       no         0          0         No         0         9     Highly Urban/ Urban      0.14             0         $861.13   

  881       0       41       2       12    10758      No       92197       Yes      F          Masters         Home Maker      41     Commercial   22210      7     Pickup       no         0          0         No         2        12     Highly Urban/ Urban      0.36             1        $1,905.69  

  885       0       57       0       12    210811     No         0         No       M          Masters          Manager        7      Commercial   28280      1   Panel Truck    yes       3542        1         No         4        17     Highly Urban/ Urban      0.26             0        $1,747.05  

  887       0       48       0        8    75914      No         0         No       F         Bachelors       Professional     51      Private     13240      1       SUV        no         0          0         No         0         1     Highly Urban/ Urban       0.2             0        $2,020.87  

  892       0       43       0       11    90213      No       293850      Yes      M            PhD             Doctor        21      Private     16210      4       Van        yes        0          0         No         0       13.77   Highly Urban/ Urban      0.06             0         $152.58   

  898       0       47       0       11    93658      No       303850      Yes      M          Masters           Lawyer        37      Private      6200      5     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.09             0         $247.66   

  900       0       55       0      11.27  34466      No       152288      No       F        High School        Clerical       32      Private     17080      7     Minivan      no         0          0         No         1         1     Highly Urban/ Urban      0.39             1        $1,405.70  

  904       0       48       0       10    173279     No         0         No       F            PhD             Doctor        27      Private     22390      4       Van        no        7357        2         No         8         1     Highly Urban/ Urban      0.25             0        $2,382.45  

  906       0       41       1        0      0        No       65804       Yes      F   Less Than High School  Home Maker      31      Private      5600      1       SUV        no        7792        3         No         2         1     Highly Urban/ Urban      0.39             1        $2,562.00  

  910       2       42       3       17    28916      No       115937      Yes      F   Less Than High School   Clerical       43      Private      8300      4   Sports Car     no        958         1         No         4         7     Highly Urban/ Urban      0.56             1        $3,322.60  

  912       0       32       2        7    152883     Yes      466804      No       M            PhD            Manager        43     Commercial   30470     10   Panel Truck    yes       6042        3         No         0        14     Highly Urban/ Urban      0.18             0        $2,460.05  

  913       0       34       3        9    23439      No       113409      Yes      F        High School        Clerical       38      Private      7240      4     Minivan      no         0          0         Yes        1         6     Highly Urban/ Urban      0.42             1        $1,367.44  

  919       0       46       0       11    68126      No       214584      Yes      F         Bachelors       Professional     52      Private     21160      1     Minivan      no         0          0         No         0         6     Highly Urban/ Urban      0.11             0         $641.59   

  924       0       50       0        0      0        No         0         No       F        High School       Home Maker      37      Private      6500      3   Sports Car     no         0          0         No         0         1     Highly Urban/ Urban       0.5             1        $2,628.93  

  925       0       43       1        8    23921      Yes        0         No       F        High School        Clerical       25      Private     14070     21   Sports Car     no        3805        1         No         2         1     Highly Urban/ Urban      0.45             1        $2,544.85  

  930       0       47       0       11    78953      No       233925      Yes      M         Bachelors       Blue Collar      23     Commercial   17410      4       Van        yes        0          0         No         1         8     Highly Urban/ Urban      0.29             1        $1,923.28  

  940       0       46       0       10    107872     No       324375      Yes      F          Masters           Lawyer        35      Private     12290      4   Sports Car     no        4784        3         No         3        11     Highly Urban/ Urban      0.13             0        $1,864.69  

  941       0       56       0       14    13692      No       134847      Yes      F        High School       Home Maker      28      Private     35620      1       SUV        no         0          0         No         0         9     Highly Urban/ Urban      0.16             0        $1,064.86  

  946       0       40       0       12    74117      No       252030      Yes      F          Masters          Manager        24     Commercial   28620      1       Van        no        5784        1         No         0       11.96   Highly Urban/ Urban      0.12             0         $998.81   

  949       0       38       0       11    71263      No       193720      Yes      F         Bachelors       Blue Collar      34     Commercial   14980      9       SUV        no       29447        1         Yes        0         9     Highly Urban/ Urban      0.44             1        $2,014.10  

  951       1       36       1       11    109631     No       277683      Yes      F         Bachelors       Blue Collar      15     Commercial   29960     10     Minivan      no         0          0         No         0        12     Highly Urban/ Urban      0.34             1         $707.88   

  962       0       30       0       10    37614      No       165402      Yes      M        High School      Blue Collar      75     Commercial   16170      6     Minivan      yes        0          0         No         1         1     Highly Rural/ Rural      0.05             0         $577.79   

  966       0       42       0        7     2763      No         0         Yes      M        High School        Student        44     Commercial    7230      4     Pickup       no         0          0         No         0         9     Highly Rural/ Rural      0.06             0         $294.63   

  967       0       54       0        7    91916      No       266099      Yes      F         Bachelors       Professional     42      Private     16090      1       SUV        no         0          0         No         0         9     Highly Rural/ Rural      0.01             0         $-599.11  

  971       1       39       1       12    29114      Yes        0         No       M   Less Than High School   Clerical       40     Commercial    5400      6     Pickup       yes        0          0         No         4         1     Highly Urban/ Urban      0.78             1        $4,636.27  

  981       0       54       0        9    94995      No       301004      Yes      F            PhD            Clerical       42     Commercial   33700      7     Minivan      yes       5172        1         No         6        10     Highly Rural/ Rural      0.09             0        $1,071.80  

  982       1       36       2        9    21873      Yes      118100      No       M   Less Than High School   Clerical       27      Private      7290      6     Minivan      no         0          0         No         0         1     Highly Rural/ Rural      0.09             0         $977.75   

  983       0       48       0        5    92868      No       256927      Yes      F          Masters          Manager        39      Private     15590      7       SUV        no         0          0         No         2         9     Highly Urban/ Urban      0.08             0         $411.16   

  984       0       53       0       10    185291     No       475137      Yes      F            PhD            Manager        49      Private     22070     17     Pickup       no         0          0         No         3        12     Highly Urban/ Urban      0.07             0         $-36.01   

  989       0       48       0       12    59334      No       208034      No       M         Bachelors       Blue Collar      50      Private     12230      3     Minivan      yes        0          0         No         3        11     Highly Urban/ Urban      0.39             1        $1,763.67  

  990       0       38       0       11    48207      No       179539      No       F        High School        Clerical       38      Private     10120      3       SUV        no        1842        3         No         4         8     Highly Urban/ Urban      0.48             1        $2,921.38  

  992       0       45       0       10    96708      No       272829      Yes      F         Bachelors       Blue Collar      29     Commercial    7880      4       SUV        no        4148        2         No         7         9     Highly Urban/ Urban      0.49             1        $3,003.07  

  995       0       30       0        0      0        No         0         No       F        High School       Home Maker      18      Private      1500     10   Sports Car     no         0          0         No         0         7     Highly Rural/ Rural      0.09             0         $210.59   

  996       0       46       0       10    134752     No         0         No       M          Masters          Manager        30     Commercial   29930      4   Panel Truck    no        3722        2         No         1        13     Highly Urban/ Urban      0.22             0        $1,784.93  

  998       1       45       1       10    39032      Yes      209556      No       F         Bachelors         Manager        43      Private     10520      1   Sports Car     no         0          0         No         1        11     Highly Urban/ Urban      0.25             0        $2,183.42  

 1001       0       28       2       12    56943      Yes        0         No       M        High School        Clerical       60      Private      5810      6     Minivan      no         0          0         No         0        10     Highly Rural/ Rural      0.05             0         $447.06   

 1007       0       44       0       12    87190      No       260524      Yes      M          Masters        Professional     36     Commercial   24900      3   Panel Truck    yes        0          0         No         0        12     Highly Urban/ Urban      0.19             0        $2,071.57  

 1008       0       52       0       14    284898     No       645241      Yes      M            PhD            Manager        33     Commercial   35190      3   Panel Truck    yes        0          0         No         0        19     Highly Urban/ Urban      0.07             0         $836.43   

 1016       0       47       0        7    28654      No       144131      No       M        High School      Professional     22      Private     10990      1     Pickup       yes        0          0         No         2         8     Highly Rural/ Rural      0.04             0         $455.90   

 1022       0       45       1       15    91898      No       318207      Yes      M          Masters           Lawyer        47      Private     16190     14     Minivan      yes        0          0         No         2        11     Highly Urban/ Urban      0.12             0         $374.46   

 1027       2       36       3        6    26011      No       133863      Yes      M   Less Than High School Blue Collar      41      Private     18290      6     Minivan      no         0          0         Yes        0         1     Highly Urban/ Urban      0.57             1        $2,295.16  

 1032       0       39       0       11    107949     No       273486      No       F         Bachelors       Professional     49      Private      7330     10       SUV        no        8043        2         No         6        11     Highly Urban/ Urban      0.35             1        $2,467.04  

 1033       1       52       1       12    50726      Yes      220288      No       M         Bachelors         Manager        12      Private      1500      7     Minivan      no         0          0         No         0        10     Highly Urban/ Urban      0.21             0         $625.53   

 1041       0       40       0       11     4404      No         0         No       F          Masters         Home Maker      54      Private     10400      4     Minivan      no       21205        2         No         1        17     Highly Urban/ Urban      0.37             1        $1,581.08  

 1065       0       31       2        7    35053      Yes      125625      No       M        High School      Blue Collar      28     Commercial   12860     10     Minivan      yes        0          0         Yes        1         1     Highly Urban/ Urban      0.71             1        $3,304.09  

 1074       0       38       0        8    44575      No       164145      Yes      F         Bachelors       Professional     31      Private      9760     11       SUV        no        3787        4         Yes        4         6     Highly Urban/ Urban      0.35             1        $2,232.40  

 1075       0       47       0       11    30452      No       150468      Yes      M   Less Than High School Blue Collar      34     Commercial   21210      1       Van        yes        0          0         No         0         8     Highly Urban/ Urban      0.33             1        $2,475.40  

 1081       0       39       2       14    28846      No       151789      Yes      F         Bachelors       Blue Collar      16      Private     26370      1       SUV        no         0          0         No         2         8     Highly Urban/ Urban      0.24             0        $1,297.29  

 1094       0       48       0       13    144515     No       378420      Yes      M          Masters           Lawyer        48      Private     20750     10     Minivan      no        3751        1         No         0        21     Highly Urban/ Urban      0.08             0         $-25.72   

 1099       0       45       0      0.81     0        No         0         No       M         Bachelors         Student        22     Commercial   14510      1     Minivan      no         0          0         No         3         8     Highly Rural/ Rural      0.26             0        $1,093.87  

 1105       0       41       2       15    97679      Yes      273142      No       M         Bachelors       Blue Collar      22     Commercial   12850      1     Minivan      yes      38815        3         No         6         1     Highly Urban/ Urban      0.63             1        $4,032.04  

 1123       0       55       0       12    133966     No       342198      Yes      F            PhD             Lawyer        8       Private     29170      6       SUV        no       34507        2         Yes        0        13     Highly Urban/ Urban      0.16             0        $1,116.19  

 1135       0       63       0       17    86078      No       319488      Yes      F         Bachelors       Professional     13      Private     20960      4   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.01             0         $-636.84  

 1142       0       49       0       12    24513      No       148422      Yes      M   Less Than High School Blue Collar      27      Private      8850      1     Minivan      yes       1263        1         No         1         1     Highly Urban/ Urban      0.22             0        $1,471.73  

 1155       0       46       0       12    103455     No       286457      No       M          Masters           Lawyer        21      Private     13050      1     Minivan      yes        0          0         No         0         7     Highly Urban/ Urban      0.17             0        $1,042.40  

 1169       0       45       0      9.97   19599      No       134906      No       F         Bachelors        Home Maker      43      Private     10740      6     Minivan      no         0          0         No         2         1     Highly Rural/ Rural      0.05             0         $-417.49  

 1176       0       46       0        9    107006     No       342272      Yes      M          Masters          Manager        7       Private     16800     16       Van        yes        0          0         No         4        15     Highly Urban/ Urban       0.1             0         $-178.04  

 1178       0       53       0       13    80023      No       246532      Yes      F         Bachelors       Blue Collar      58     Commercial   20990      4   Sports Car     no       29379        2         Yes        5         9     Highly Urban/ Urban      0.62             1        $3,683.15  

 1180       0       35       0       10    57241      No         0         No       M   Less Than High School   Clerical       36      Private     11050      4     Minivan      yes        0          0         No         0         1     Highly Rural/ Rural      0.05             0          $14.69   

 1184       0       35       0       11    122150     No       289760      Yes      F          Masters           Lawyer        41      Private     26820      4       SUV        no         0          0         No         2        12     Highly Urban/ Urban      0.11             0        $1,129.60  

 1185       2       56       2       17    28088      Yes      154530      No       M         Bachelors         Clerical       46      Private      9910      1     Minivan      yes       1157        1         No         3         1     Highly Urban/ Urban       0.7             1        $3,778.10  

 1193       0       40       0       11    49978      No       240143      Yes      M          Masters        Professional     40     Commercial   21160      3       Van        yes        0          0         No         2        15     Highly Urban/ Urban      0.28             0        $2,599.95  

 1196       0       51       0        5    94454      No         0         No       M         Bachelors       Professional     30      Private     14370      3     Minivan      no        5399        1         No         0         9     Highly Urban/ Urban      0.19             0        $1,129.47  

 1199       0       48       0        0      0        No         0         No       F   Less Than High School   Student        5       Private      9060      1       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.59             1        $2,341.58  

 1203       0       37       2       13    31725      No       148396      Yes      F          Masters           Lawyer        32      Private     10860      4       SUV        no        3810        3         No         3        22     Highly Urban/ Urban      0.19             0        $1,484.70  

 1205       1       37       2       10    30843      No       132741      Yes      F        High School        Clerical       33      Private      8280      6   Sports Car     no         0          0         No         1         8     Highly Urban/ Urban      0.34             1        $1,987.43  

 1207       0       39       0       13    18274      No         0         No       F        High School        Clerical       11      Private      7230      6       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.06             0          $55.29   

 1208       0       39       0       10    31131      No         0         No       M        High School        Clerical       30      Private      8510      6     Minivan      yes      37066        2         Yes        5        13     Highly Urban/ Urban      0.72             1        $2,694.21  

 1212       0       37       4        0     1164      No       55527       Yes      F        High School       Home Maker      5       Private      5700      1   Sports Car     no        4865        1         No         6         7     Highly Urban/ Urban      0.42             1        $2,319.93  

 1213       0       50       0       12    26748      No       75571       No       M   Less Than High School Blue Collar      25      Private      9170      1     Pickup       no       25089        2         Yes        1         6     Highly Urban/ Urban      0.56             1        $2,802.70  

 1222       1       57       1       13    53227      No       204309      Yes      F         Bachelors       Professional     41      Private     34950      6     Minivan      no         0          0         No         0        11     Highly Urban/ Urban      0.18             0         $577.46   

 1223       0       45       0      11.56  55848      No       216312      Yes      M         Bachelors         Clerical       51     Commercial   11580      6     Pickup       yes        0          0         No         1         7     Highly Urban/ Urban      0.35             1        $2,060.05  

 1226       0       55       0        0      0        No         0         No       F            PhD           Home Maker      36      Private      2950      4       SUV        no         0          0         No         0        12     Highly Urban/ Urban       0.5             1        $2,478.44  

 1227       0       63       0       14    51046      No       192050      Yes      F            PhD             Doctor        18      Private      7800      1   Sports Car     no       14357        3         No         5         1     Highly Urban/ Urban      0.14             0        $1,962.77  

 1229       0       47       0       10    37958      No       177502      Yes      M        High School        Clerical       8       Private      9640     10     Pickup       no         0          0         No         1         8     Highly Urban/ Urban      0.23             0         $688.39   

 1230       0       44       0       12    46781      No         0         No       F         Bachelors       Professional     29      Private     17960     11       SUV        no        6545        1         No         5        15     Highly Urban/ Urban      0.38             1        $1,968.53  

 1231       1       54       1        0      0        No         0         Yes      F         Bachelors         Student        37      Private     10600      1   Sports Car     no        5493        3         No         1         8     Highly Urban/ Urban      0.49             1        $2,555.10  

 1241       1       43       3       11    28021      Yes        0         No       M        High School        Clerical       31      Private     16010      4     Minivan      no         0          0         No         1         9     Highly Rural/ Rural       0.1             0         $939.85   

 1243       0       49       0       11    23711      No         0         No       F        High School        Clerical       25      Private      8770      7   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.06             0         $450.51   

 1244       0       39       0       13    49194      No       126703      Yes      M        High School        Manager        34     Commercial   24060     10   Panel Truck    yes        0          0         No         0         7     Highly Urban/ Urban      0.14             0         $741.02   

 1246       0       58       0       12    61265      No       208445      Yes      F          Masters           Lawyer        49      Private      3230     10       SUV        no         0          0         No         2         9     Highly Urban/ Urban      0.14             0        $1,135.31  

 1248       0       41       3       15    52274      No       177209      Yes      F        High School      Professional     38      Private     19580      3     Minivan      no         0          0         No         3         6     Highly Urban/ Urban      0.17             0        $1,150.38  

 1249       0       40       0       13    84506      No       251400      Yes      F          Masters           Lawyer        32      Private     19100      6     Minivan      no         0          0         Yes        5        15     Highly Urban/ Urban      0.32             1        $1,203.08  

 1252       0       39       0       13    51091      No       185506      Yes      M          Masters           Lawyer        37      Private     15450      1     Minivan      no         0          0         No         0        17     Highly Urban/ Urban      0.11             0         $492.77   

 1261       0       43       0       12    94641      No       299424      Yes      F          Masters           Lawyer        52      Private     21400      6       SUV        no       11095        1         No         0        19     Highly Urban/ Urban      0.09             0         $765.87   

 1275       0       51       0       17    48263      No       2e+05       Yes      F        High School      Professional     39      Private     24450      1     Minivan      no         0          0         No         0        10     Highly Urban/ Urban      0.12             0         $648.27   

 1281       0       39       0       14    28830      No         0         No       M   Less Than High School   Clerical       50     Commercial   18930      1       Van        yes        0          0         Yes        5         1     Highly Urban/ Urban      0.85             1        $4,790.97  

 1285       0       23       5       14    11666      No       109363      Yes      F   Less Than High School   Clerical       26      Private      5080      6   Sports Car     no         0          0         No         4         1     Highly Urban/ Urban      0.39             1        $2,454.65  

 1288       0       50       0       13    62626      No         0         No       F        High School      Blue Collar      36     Commercial   13790      6       SUV        no         0          0         No         1        10     Highly Urban/ Urban      0.49             1        $2,591.44  

 1290       0       40       0       14    93249      No       293000      No       F          Masters           Lawyer        35      Private     27270      7     Minivan      no         0          0         No         0        14     Highly Urban/ Urban      0.18             0         $512.47   

 1291       0       45       0       14    49116      No       213351      No       F        High School        Clerical       41      Private     18510      6       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.33             1        $1,994.89  

 1304       0       30       2       14    100801     Yes        0         No       M          Masters        Professional     52     Commercial   19340      6       Van        yes      32990        2         Yes        0        17     Highly Urban/ Urban       0.5             1        $3,944.59  

 1305       0       54       0       10    46624      No       212273      No       M          Masters           Lawyer        40      Private     18990     13       Van        no         0          0         No         0        13     Highly Urban/ Urban      0.22             0        $1,269.13  

 1323       0       53       0       12    116419     No       356989      No       M            PhD            Manager        5      Commercial   27300      4   Panel Truck    no        1404        2         No         4        12     Highly Urban/ Urban      0.32             1        $2,219.43  

 1342       2       45       3       17    86880      Yes        0         No       F          Masters           Lawyer        64      Private     19550     10       SUV        no         0          0         No         5        14     Highly Urban/ Urban      0.55             1        $3,576.31  

 1348       0       29       1       14    15936      No       55455       Yes      F   Less Than High School   Student        28      Private     29510      4     Pickup       no        6111        2         No         0         1     Highly Urban/ Urban      0.16             0        $1,071.64  

 1353       0       29       2       14    45299      No       148600      Yes      F        High School      Blue Collar      11     Commercial   21330      4       SUV        no         0          0         No         0         1     Highly Urban/ Urban       0.3             1        $1,860.81  

 1363       0       48       0       12    49711      No         0         No       F        High School      Professional     5       Private     11270      7       SUV        no         0          0         No         0         7     Highly Urban/ Urban      0.22             0        $1,178.02  

 1371       0       45       1       12    212914     Yes      553525      No       M            PhD             Doctor        24      Private     14830      1     Minivan      yes      25614        2         Yes        4        20     Highly Urban/ Urban      0.27             0        $1,967.48  

 1372       0       57       0       11    114830     No         0         No       M            PhD            Manager        26     Commercial   26900      4   Panel Truck    no       28321        2         No         0        13     Highly Urban/ Urban       0.2             0        $1,892.10  

 1378       0       35       1       12    15234      No       115903      Yes      F   Less Than High School   Clerical       6       Private      6520     20   Sports Car     no        7535        2         No         5         4     Highly Urban/ Urban      0.41             1        $1,704.68  

 1381       0       34       0        9    31052      No       116137      Yes      F        High School        Clerical       63      Private     13700      5       SUV        no         0          0         No         2         7     Highly Urban/ Urban      0.27             0        $1,891.72  

 1382       0       50       0      1.76     0        No       90196       Yes      F         Bachelors         Student        31     Commercial    6500     13       SUV        no        9098        1         No         2         7     Highly Urban/ Urban      0.59             1        $2,094.38  

 1393       1       57       1       14    41645      No       160772      Yes      M        High School      Professional     23     Commercial    7200      4     Pickup       yes       5040        2         No         0         5     Highly Urban/ Urban      0.32             1        $2,504.89  

 1394       0       54       0       13    77864      No       299542      Yes      M         Bachelors       Blue Collar      72     Commercial   26930      1     Minivan      yes        0          0         No         0        13     Highly Rural/ Rural      0.04             0         $-15.47   

 1398       0       65       0       15    22481      No       127617      Yes      F        High School        Clerical       14      Private     11340      9   Sports Car     no       33075        1         Yes        0         1     Highly Urban/ Urban      0.39             1        $1,810.21  

 1404       0       44       0       11    62346      No         0         No       M          Masters        Professional     42      Private      5900      1     Pickup       yes        0          0         Yes        0        18     Highly Urban/ Urban      0.36             1        $2,233.82  

 1405       0       52       0       11    81849      No       273961      Yes      F        High School      Blue Collar      56     Commercial    6700      1       SUV        no        4235        3         No         6         1     Highly Urban/ Urban      0.47             1        $3,799.08  

 1419       1       62       1        2    54776      No       237217      Yes      F          Masters           Lawyer        16      Private     15770      4   Sports Car     no       11035        1         No         6        14     Highly Urban/ Urban      0.33             1        $2,327.06  

 1421       0       46       0        9    19814      No         0         Yes      M        High School        Student        14      Private      7310      7     Pickup       yes        0          0         No         0         1     Highly Urban/ Urban      0.16             0         $628.87   

 1426       0       38       1        0      0        No         0         Yes      F   Less Than High School   Student        17      Private      5850      6       SUV        no        5090        1         No         6         8     Highly Rural/ Rural      0.11             0         $673.24   

 1431       0       38       0        4    22036      No       158037      Yes      M        High School        Clerical       32     Commercial    7500      6     Pickup       yes       9416        1         No         2       4.82    Highly Urban/ Urban      0.45             1        $2,527.90  

 1435       2       44       2       13    155897     Yes      398191      No       F          Masters           Lawyer        84      Private     33800      4     Minivan      no         0          0         No         1        12     Highly Rural/ Rural      0.05             0         $927.63   

 1437       1       37       1        7    17589      No       132645      Yes      F   Less Than High School   Clerical       51      Private      9370      6       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.33             1        $2,115.94  

 1438       0       57       0       12    68350      No       222894      Yes      M         Bachelors       Blue Collar      15     Commercial   18700      8       Van        no        2757        1         No         1        11     Highly Urban/ Urban       0.3             1        $1,660.66  

 1442       0       45       2       15    39196      Yes        0         No       F        High School      Professional     25      Private     17300     14   Sports Car     no        7410        3         No         3         1     Highly Urban/ Urban      0.33             1        $3,142.93  

 1464       0       53       0        6    59144      No       205862      Yes      M            PhD            Manager        24      Private     14870      3     Minivan      no         0          0         Yes        0        13     Highly Urban/ Urban      0.14             0         $363.67   

 1471       0       42       1        7    139335     Yes        0         No       F            PhD            Manager        29      Private      3470     10       SUV        no        9828        1         No         5        14     Highly Urban/ Urban      0.19             0        $2,091.36  

 1473       0       46       0       11    45372      No       236719      Yes      M        High School      Blue Collar      24     Commercial   22790      4   Panel Truck    no         0          0         No         0         1     Highly Urban/ Urban       0.3             1        $2,112.55  

 1476       0       49       0        0      0        No         0         No       F         Bachelors        Home Maker      23      Private      6400      6   Sports Car     no         0          0         No         1         8     Highly Rural/ Rural      0.11             0         $432.54   

 1478       0       50       0       14    40447      No       192990      Yes      M        High School      Blue Collar      19     Commercial    5540      7     Pickup       no         0          0         No         0         1     Highly Urban/ Urban      0.31             1        $1,815.02  

 1479       1       44       2        2    68081      Yes      221459      No       F          Masters          Manager        32      Private     25040      6   Sports Car     no       47837        1         Yes        6        18     Highly Urban/ Urban      0.56             1        $3,290.95  

 1487       0       41       1       14     2346      Yes        0         No       F   Less Than High School   Student        13      Private      5830     11   Sports Car     no        8521        2         No         0         6     Highly Urban/ Urban      0.37             1        $2,369.59  

 1492       0       42       0        0      0        No         0         Yes      M         Bachelors         Student        13     Commercial    5700     10     Pickup       no         0          0         No         5         1     Highly Urban/ Urban      0.69             1        $2,488.54  

 1496       0       50       0       12    126172     No         0         No       M          Masters           Lawyer        43      Private     14120      6     Minivan      yes        0          0         No         0         1     Highly Urban/ Urban      0.16             0        $1,189.74  

 1497       0       43       2        0      0        No       117111      Yes      F   Less Than High School  Home Maker      44      Private      5800      6   Sports Car     no        4959        1         No         3         6     Highly Urban/ Urban      0.43             1        $2,537.09  

 1515       0       48       0       10    80756      No       276395      Yes      F        High School      Blue Collar      47     Commercial   17640     18     Pickup       no         0          0         No         0         1     Highly Rural/ Rural      0.03             0         $-420.62  

 1519       0       44       0       11    18612      No         0         No       M            PhD             Lawyer        24      Private     21160      3       Van        no         0          0         No         1        12     Highly Urban/ Urban      0.29             1        $2,184.44  

 1522       0       36       2       13    19934      Yes      36183       No       M        High School        Clerical       17      Private     10790      6     Pickup       yes       7797        2         No         9         1     Highly Urban/ Urban      0.72             1        $4,158.71  

 1526       0       37       3        0      0        No       73311       Yes      F        High School       Home Maker      17      Private      7510      5       SUV        no        7421        2         No         0         7     Highly Urban/ Urban      0.32             1        $1,466.72  

 1537       0       58       0       14    56383      No       248930      Yes      F         Bachelors       Professional     31      Private     16140      9     Minivan      no         0          0         No         0       10.43   Highly Urban/ Urban      0.12             0         $-47.60   

 1538       2       38       2       11    30886      Yes        0         No       M        High School        Clerical       27     Commercial    8390      1     Pickup       no        9267        3         No         2         6     Highly Urban/ Urban       0.8             1        $4,838.28  

 1540       0       53       0       14    107394     No       318906      Yes      F        High School      Blue Collar      20     Commercial   26400      6       SUV        no         0          0         No         2         1     Highly Urban/ Urban       0.3             1        $2,104.04  

 1543       2       39       2        7    59402      No       186000      Yes      F          Masters           Lawyer        32      Private     18960     13     Minivan      no        3182        1         No         2        15     Highly Urban/ Urban      0.29             1         $846.35   

 1548       0       67       0       13    45368      No       190399      Yes      M         Bachelors       Professional     33      Private     17760      4       SUV        yes        0          0         Yes        0        13     Highly Urban/ Urban      0.23             0        $1,531.56  

 1549       0       36       0        9    15493      No       103733      Yes      M   Less Than High School   Clerical       11      Private     17960     12     Minivan      yes       1038        2         No         1         6     Highly Urban/ Urban      0.27             0         $787.36   

 1556       0       35       0       10    51996      No         0         No       M        High School      Professional     35      Private     10200      6     Pickup       yes      41621        2         Yes        5         8     Highly Urban/ Urban      0.56             1        $3,122.56  

 1564       0       41       0       10    89968      No       258626      Yes      M         Bachelors       Blue Collar      39     Commercial   14600      1     Minivan      no         0          0         No         0        11     Highly Rural/ Rural      0.03             0         $-284.69  

 1570       0       25       1       11    64122      No       196842      Yes      M            PhD             Doctor        42      Private     15740      1     Minivan      yes      28366        2         Yes        0        20     Highly Urban/ Urban      0.13             0         $497.27   

 1577       1       36       2       14    20926      No       122046      Yes      M        High School        Clerical       23     Commercial    8390      6     Pickup       no        1429        3         No         0         1     Highly Urban/ Urban       0.5             1        $2,775.95  

 1585       0       51       0       13    54197      No       222759      Yes      M         Bachelors         Manager        26      Private     11720      4     Pickup       yes        0          0         Yes        3        13     Highly Urban/ Urban       0.2             0         $580.56   

 1590       0       48       0       10    58039      No       273348      Yes      M          Masters          Manager        19     Commercial    6640      4     Pickup       yes        0          0         No         2        15     Highly Urban/ Urban      0.17             0         $996.00   

 1592       0       48       0       11    53878      No       220705      Yes      F        High School        Clerical       29      Private     11690      1   Sports Car     no       26114        3         Yes        7         1     Highly Urban/ Urban      0.58             1        $3,686.92  

 1594       0       38       0       12    62756      No       175085      No       F          Masters           Lawyer        55      Private     13790     10       SUV        no       11836        3         No         5        18     Highly Urban/ Urban      0.35             1        $2,374.19  

 1596       0       49       0        0     3925      No         0         No       F         Bachelors         Student        5      Commercial   10810      4       SUV        no        3461        2         No         5        10     Highly Urban/ Urban      0.71             1        $2,871.24  

 1598       0       44       3       15    56217      No       155178      Yes      F          Masters           Lawyer        47      Private      1500     10   Sports Car     no         0          0         No         0        16     Highly Urban/ Urban      0.11             0         $851.83   

 1603       0       33       1       11    45680      Yes      61260       No       F        High School      Blue Collar      36      Private     19040      4       SUV        no         0          0         No         0         8     Highly Urban/ Urban      0.31             1        $2,437.43  

 1607       0       59       0       11    131919     No       328571      Yes      F         Bachelors       Blue Collar      27     Commercial    1500     13   Sports Car     no        9343        2         No         0         6     Highly Urban/ Urban      0.23             0        $1,627.64  

 1612       0       50       0       12    77367      No       258711      Yes      F         Bachelors       Professional     17      Private     28280      4     Pickup       no         0          0         No         1         7     Highly Urban/ Urban      0.12             0         $571.26   

 1627       0       49       0      12.15  39338      No       168456      Yes      M   Less Than High School Blue Collar      33     Commercial    9340     10     Pickup       no         0          0         No         0         5     Highly Rural/ Rural      0.04             0         $174.06   

 1629       0       47       0        6    25871      No       193683      Yes      F        High School      Blue Collar      38     Commercial   15330      1       SUV        no         0          0         Yes        6         9     Highly Urban/ Urban      0.73             1        $3,704.49  

 1630       0       50       0       14    15989      No       117038      Yes      M   Less Than High School   Clerical       22      Private     11390     11     Pickup       no         0          0         No         0         5     Highly Urban/ Urban      0.24             0        $1,018.44  

 1640       0       48       0        8    105567     No         0         No       M         Bachelors         Manager        84      Private     15660     11     Minivan      no        9837        3         No         9         8     Highly Urban/ Urban      0.33             1        $1,949.46  

 1641       2       39       2       13    92000      No       301965      Yes      M         Bachelors       Professional     50      Private     14600      1     Minivan      yes       6627        3         No         2         1     Highly Urban/ Urban      0.28             0        $2,369.09  

 1646       0       50       0       12    113832     No         0         No       F          Masters           Lawyer        13      Private     32470      1   Sports Car     no         0          0         No         0        16     Highly Urban/ Urban      0.17             0        $1,321.81  

 1662       0       47       0       10    45237      No         0         No       F        High School      Professional     43      Private     15550      3     Pickup       no         0          0         Yes        0         1     Highly Urban/ Urban      0.39             1        $2,251.45  

 1668       0       57       0       14    101399     No       120004      No       M          Masters          Manager        5      Commercial   29080      4   Panel Truck    yes        0          0         No         0        14     Highly Urban/ Urban      0.21             0        $1,000.72  

 1671       0       55       0       14     8684      No       98652       No       F         Bachelors        Home Maker      38      Private      7000      6       SUV        no         0          0         No         3        10     Highly Rural/ Rural      0.07             0         $218.63   

 1672       1       42       3        7    85819      No       262789      Yes      M         Bachelors       Blue Collar      45     Commercial    5700      1     Pickup       yes       5699        3         No         1        14     Highly Urban/ Urban      0.39             1        $2,609.71  

 1673       0       23       4        9     5367      No       75782       Yes      F        High School      Blue Collar      14     Commercial   22550      7     Minivan      yes       6027        3         No        10         1     Highly Urban/ Urban      0.77             1        $3,399.07  

 1686       0       41       0       11     1953      No       137081      Yes      F        High School       Home Maker      40      Private      5600     12       SUV        no       36757        3         No         6         9     Highly Urban/ Urban       0.4             1        $2,205.37  

 1688       0       51       0        0      0        No       129459      Yes      F        High School       Home Maker      39      Private      6600      1   Sports Car     no        4545        1         No         8         6     Highly Urban/ Urban      0.61             1        $3,478.50  

 1696       0       32       1       11    143195     No       346009      Yes      M            PhD            Manager        55     Commercial   23860      1   Panel Truck    yes        0          0         No         0        14     Highly Rural/ Rural      0.01             0         $-221.88  

 1701       0       41       0       12    19114      No       137718      Yes      M        High School        Clerical       11     Commercial    5600      7     Pickup       no         0          0         No         0         1     Highly Rural/ Rural      0.06             0         $170.61   

 1707       0       58       0       11    67608      No       244407      Yes      M         Bachelors       Professional     40      Private     23140      6     Minivan      no         0          0         Yes        0        12     Highly Urban/ Urban      0.21             0         $803.81   

 1708       0       59       0       15    198042     No       474444      Yes      F            PhD             Doctor        36      Private     27960     13   Sports Car     no         0          0         Yes        0        10     Highly Urban/ Urban      0.09             0         $366.37   

 1713       0       38       0      9.73   17028      No         0         No       F        High School        Clerical       26      Private     14160      6       SUV        no        5511        1         No         0         1     Highly Rural/ Rural      0.06             0         $407.90   

 1715       0       66       1       17    88979      No       275391      Yes      F            PhD             Lawyer        42      Private     10400      9   Sports Car     no         0          0         No         4        20     Highly Urban/ Urban      0.16             0        $1,633.97  

 1717       0       29       3      11.01  31850      No       180601      Yes      F   Less Than High School Blue Collar      52      Private      9430      7       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.02             0         $-116.79  

 1721       3       43       3        7    38430      Yes      221139      No       M        High School      Blue Collar      26     Commercial   17350      4       Van        no         0          0         No         1         6     Highly Rural/ Rural      0.32             1        $3,026.42  

 1724       2       36       3        0      0        No       35389       Yes      F   Less Than High School   Student        19     Commercial   23510      6     Pickup       no       32008        3         Yes        6         1     Highly Urban/ Urban      0.93             1        $4,497.98  

 1725       1       39       3       14    71309      Yes      224123      No       F         Bachelors       Professional     87      Private     14580      1       SUV        no        4648        3         No         3         7     Highly Urban/ Urban      0.39             1        $4,009.66  

 1730       1       42       2        0      0        No       97022       Yes      F        High School       Home Maker      39      Private     14840      1       SUV        no        6844        1         No         1         1     Highly Rural/ Rural      0.08             0         $869.92   

 1731       0       56       0       12     278       No       91930       Yes      F        High School        Student        58      Private      1530      6   Sports Car     no        4611        2         No         5         8     Highly Urban/ Urban      0.44             1        $2,722.43  

 1734       0       47       0       12    21063      No       117381      Yes      F         Bachelors         Clerical       42     Commercial   20730      4     Pickup       no        4652        2         No         1         6     Highly Urban/ Urban      0.42             1        $2,209.67  

 1740       0       52       0        9    112481     No         0         No       M            PhD             Lawyer        15      Private     17950      1       Van        yes        0          0         No         0        10     Highly Urban/ Urban      0.17             0        $1,735.06  

 1748       0       58       0       12    119035     No       385521      Yes      F            PhD             Doctor        12      Private     19200      4     Minivan      no         0          0         No         2        14     Highly Urban/ Urban      0.07             0         $-554.93  

 1749       0       49       0       12    75311      No       324126      Yes      F          Masters           Lawyer        46      Private     20960     12       SUV        no         0          0         No         0        14     Highly Urban/ Urban       0.1             0         $495.33   

 1750       0       33       1        8    77719      Yes        0         No       F        High School      Blue Collar      39     Commercial    9250      6       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.43             1        $3,304.19  

 1763       0       42       0        9    50949      No       227129      No       F         Bachelors         Clerical       24      Private     10790      3       SUV        no         0          0         No         0         9     Highly Urban/ Urban      0.33             1        $1,527.13  

 1768       0       57       0       10    130831     No       365792      Yes      F            PhD             Lawyer        24      Private     14580      4       SUV        no         0          0         No         0        12     Highly Urban/ Urban      0.08             0         $869.38   

 1773       2       37       2       11    16238      No       65155       Yes      M   Less Than High School   Clerical       33      Private      6820      6     Pickup       yes       5612        4         No         0         1     Highly Urban/ Urban      0.45             1        $2,688.29  

 1777       0       52       0       11    176305     No       453094      No       M            PhD             Doctor        36      Private     10950      1     Minivan      no         0          0         Yes        0        17     Highly Urban/ Urban      0.18             0         $700.78   

 1778       0       30       0      9.93   47538      No       184423      No       M        High School      Blue Collar      53     Commercial   29840     13     Minivan      no        3421        2         No         4         7     Highly Urban/ Urban      0.62             1        $2,860.55  

 1780       0       30       2       13    19355      No       95595       Yes      F          Masters        Professional     39      Private      6440     15       SUV        no         0          0         No         0         9     Highly Urban/ Urban      0.15             0         $979.47   

 1782       0       55       0        9    69683      No       231225      Yes      F   Less Than High School Blue Collar      50      Private      7000      6   Sports Car     no        1174        1         No         0         6     Highly Urban/ Urban      0.15             0        $1,683.54  

 1784       0       46       0       11    78929      No       222058      Yes      F        High School      Blue Collar      48     Commercial   23710      6   Sports Car     no         0          0         No         0         8     Highly Rural/ Rural      0.04             0         $535.30   

 1786       0       47       0        7    18573      No       106303      Yes      F   Less Than High School   Clerical       36      Private     17440     11       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.24             0        $1,341.61  

 1787       0       59       0       11    131919     No       328571      Yes      F         Bachelors       Blue Collar      27     Commercial   19580      6       SUV        no         0          0         No         0         6     Highly Urban/ Urban      0.23             0        $1,493.41  

 1792       0       44       0       11    89474      No         0         No       M            PhD            Manager        11     Commercial   26450      6   Panel Truck    yes       3845        2         No         0        16     Highly Urban/ Urban      0.22             0        $1,526.87  

 1800       1       40       1       10    131449     Yes        0         No       F          Masters          Manager        18     Commercial   31080     13       Van        no        6895        3         No         4        11     Highly Urban/ Urban      0.41             1        $2,769.38  

 1801       0       45       0       11    36745      No         0         No       M        High School      Blue Collar      45      Private     13940     11     Minivan      no         0          0         No         1       5.27    Highly Urban/ Urban      0.35             1        $1,413.19  

 1803       0       53       0       12    45387      No       162853      Yes      F          Masters           Lawyer        38      Private      6040      7       SUV        no         0          0         No         0        13     Highly Urban/ Urban      0.12             0         $767.18   

 1804       0       35       0       13     7163      No         0         No       M        High School        Student        50     Commercial    6580      6     Pickup       yes        0          0         No         1         9     Highly Urban/ Urban      0.54             1        $2,617.77  

 1807       0       51       0       12    257228     No       588089      Yes      M            PhD             Doctor        40      Private     35650      4     Minivan      yes        0          0         No         0        16     Highly Urban/ Urban      0.04             0         $-498.71  

 1818       0       52       0       11    109807     No         0         No       M            PhD            Manager        35     Commercial   23320      9   Panel Truck    no         0          0         No         3         8     Highly Urban/ Urban      0.29             1        $2,204.95  

 1821       0       51       0        8    74003      No       249395      Yes      M        High School      Blue Collar      29     Commercial   31780      1   Panel Truck    yes        0          0         No         0        10     Highly Rural/ Rural      0.04             0         $314.44   

 1822       2       43       2       14    71964      No       225292      Yes      F        High School       Home Maker      57      Private     21680      4       SUV        no         0          0         No         5         1     Highly Rural/ Rural      0.06             0        $1,126.72  

 1828       0       48       0       12    128974     No       315897      Yes      F          Masters           Lawyer        54      Private     28690     11     Pickup       no         0          0         No         4       13.1    Highly Urban/ Urban      0.14             0         $913.50   

 1833       0       25       1       12    17352      Yes      112808      No       F   Less Than High School Blue Collar      9       Private      9250     14       SUV        no         0          0         No         0         6     Highly Urban/ Urban      0.37             1        $1,854.42  

 1844       0       55       0       13    55532      No       198229      Yes      M        High School      Professional     26     Commercial   24010      4   Panel Truck    no        7903        2         No         1         1     Highly Urban/ Urban      0.24             0        $2,502.36  

 1847       0       31       1        0      0        No         0         Yes      M   Less Than High School   Student        18      Private      4600      9     Pickup       yes       6542        1         No         3         1     Highly Urban/ Urban      0.45             1        $1,842.47  

 1850       0       46       0        8    75614      No       188804      Yes      M          Masters          Manager        35      Private     13660      4     Minivan      yes        0          0         No         3        14     Highly Urban/ Urban       0.1             0         $161.62   

 1854       0       65       0       14    65841      No       231739      Yes      F          Masters           Lawyer        45      Private     13350     10   Sports Car     no       35530        3         Yes        5         9     Highly Urban/ Urban      0.34             1        $2,606.87  

 1858       0       43       2       12    71124      No       227476      Yes      M         Bachelors       Blue Collar      46     Commercial   19610      7       Van        yes       4704        3         No         1        11     Highly Urban/ Urban       0.3             1        $2,301.65  

 1864       0       36       0       12    32278      No       156388      Yes      F         Bachelors       Professional     30      Private      5300      4       SUV        no         0          0         No         0         8     Highly Urban/ Urban      0.13             0        $1,003.74  

 1867       0       29       4       13    62151      No       193997      Yes      F            PhD             Doctor        50      Private     10620     10     Minivan      no         0          0         No         0        12     Highly Urban/ Urban      0.07             0         $-526.55  

 1876       0       27       4        0      0        No         0         Yes      M        High School        Student        45     Commercial    4400      7     Minivan      no         0          0         Yes        1         1     Highly Urban/ Urban      0.72             1        $2,619.22  

 1880       0       47       0      9.87   167760     No         0         No       M            PhD            Manager        23     Commercial   22980      1   Panel Truck    yes        0          0         No         0        17     Highly Urban/ Urban      0.18             0        $1,589.87  

 1881       0       40       0       11    60445      No       207455      Yes      F        High School        Manager        30      Private     11540     15     Minivan      no        1372        2         No         5         1     Highly Urban/ Urban      0.13             0         $112.20   

 1891       0       30       1       11    77170      No       250064      Yes      F          Masters           Lawyer        39      Private      9220      4       SUV        no        1243        1         No         1        16     Highly Urban/ Urban      0.11             0        $1,025.07  

 1894       0       42       0        2    34072      No       160862      Yes      M   Less Than High School   Clerical       38     Commercial   27420     13   Panel Truck    yes      32610        1         No         0         6     Highly Urban/ Urban      0.35             1        $2,024.50  

 1895       1       43       2       13    35193      No       172258      Yes      F        High School      Blue Collar      31     Commercial   12820     14       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.07             0         $422.77   

 1901       0       30       3       13    69512      No       187162      Yes      F         Bachelors       Blue Collar      43     Commercial   13330      1       SUV        no         0          0         No         2         9     Highly Urban/ Urban      0.34             1        $2,296.44  

 1905       0       47       0       12    108892     No       306026      Yes      F         Bachelors       Professional     21      Private     25860      9       SUV        no         0          0         No         1         1     Highly Urban/ Urban      0.11             0         $798.38   

 1912       1       45       1      12.14  63952      No       196368      Yes      F          Masters           Lawyer        50      Private     14620      1       SUV        no        3799        2         No         0        13     Highly Urban/ Urban      0.16             0        $1,708.00  

 1918       1       41       2       14    45298      No       189778      Yes      M        High School      Blue Collar      5      Commercial   16000      1     Minivan      yes       8584        2         No         0         1     Highly Urban/ Urban      0.41             1        $2,031.31  

 1921       0       30       2        8    17532      Yes      34688       No       M        High School        Clerical       53     Commercial    6250      1     Pickup       yes        0          0         Yes        0         1     Highly Rural/ Rural      0.23             0        $2,673.12  

 1923       0       38       0        9    39547      No       129938      Yes      F         Bachelors         Clerical       43      Private     27940      3   Sports Car     no         0          0         Yes        0       8.97    Highly Urban/ Urban      0.35             1        $1,876.23  

 1924       0       38       0       12    116990     No       354624      Yes      F         Bachelors       Professional     33      Private     20850      1   Sports Car     no        7733        3         No         0       8.03    Highly Urban/ Urban      0.09             0        $1,533.09  

 1931       1       40       2       16    84594      No       263300      Yes      F          Masters           Lawyer        26      Private     13960      1     Minivan      no         0          0         No         0        19     Highly Urban/ Urban      0.15             0         $347.23   

 1941       0       52       0       13    40833      No       159144      Yes      M   Less Than High School Blue Collar      66     Commercial   10780      4     Pickup       yes        0          0         No         0         4     Highly Rural/ Rural      0.04             0         $798.18   

 1950       0       46       0       12    132651     No       340258      Yes      F          Masters        Professional     11     Commercial   24800      6     Pickup       no         0          0         No         0        12     Highly Urban/ Urban      0.16             0        $1,139.87  

 1951       0       44       0       12    43650      No       116191      Yes      F          Masters           Lawyer        32      Private     10270      1   Sports Car     no         0          0         No         0        11     Highly Urban/ Urban      0.12             0        $1,302.57  

 1954       0       43       0       11    23486      No         0         No       F         Bachelors        Home Maker      5       Private      8070      1     Minivan      no         0          0         No         0        12     Highly Rural/ Rural      0.03             0        $-1,419.14 

 1961       0       44       0        4    109624     No         0         No       M         Bachelors         Manager        29     Commercial   21170      3       Van        no       54399        4         No         6        14     Highly Urban/ Urban      0.39             1        $2,674.66  

 1966       0       43       2       15    43808      No       176022      Yes      M         Bachelors       Professional     55      Private     10280     10     Minivan      no         0          0         No         2         7     Highly Rural/ Rural      0.02             0         $-800.32  

 1979       0       41       0       13    49662      No       221544      Yes      F         Bachelors         Clerical       31      Private     19730      1     Pickup       no         0          0         No         0         9     Highly Urban/ Urban      0.19             0         $807.69   

 1982       0       55       0       13    91926      No         0         No       M          Masters           Lawyer        8       Private     19710      6     Minivan      yes        0          0         No         0        17     Highly Urban/ Urban      0.18             0         $318.80   

 1987       0       42       0        7    76034      No         0         No       F        High School      Blue Collar      39     Commercial   11880      1       SUV        no         0          0         Yes        0         5     Highly Urban/ Urban      0.62             1        $3,230.13  

 1997       0       52       0       13    160405     No         0         No       M          Masters          Manager        8      Commercial   19170      1       Van        no       16951        5         No         3        11     Highly Urban/ Urban      0.26             0        $2,385.42  

 2004       0       46       0       13    170949     No       458806      Yes      M            PhD            Manager        30      Private     23730      1     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.05             0         $-163.55  

 2011       0       40       1       11    29310      No       118987      Yes      M        High School        Clerical       5      Commercial    9240      1     Pickup       no         0          0         Yes        1         2     Highly Urban/ Urban      0.58             1        $2,508.19  

 2015       0       57       2        0      0        No       82024       Yes      F         Bachelors        Home Maker      14      Private      1500      6       SUV        no        8694        3         No         1         5     Highly Urban/ Urban      0.36             1        $1,515.40  

 2025       0       59       0       11    39763      No       190272      Yes      F         Bachelors        Home Maker      13     Commercial   21190      7     Pickup       no         0          0         No         1        10     Highly Rural/ Rural      0.03             0         $-785.90  

 2033       0       38       2       14    57684      Yes      189247      No       F         Bachelors       Professional     22      Private      5300     10   Sports Car     no        5892        2         No         0        17     Highly Urban/ Urban      0.22             0        $1,985.37  

 2034       1       38       2       13    58193      No       199571      Yes      M         Bachelors       Blue Collar      24      Private     26650     10     Minivan      no         0          0         No         1         8     Highly Rural/ Rural      0.04             0        $-1,013.96 

 2035       1       62       1       11    66784      No       262589      Yes      M         Bachelors         Manager        49      Private     29350      1       SUV        yes        0          0         No         0         1     Highly Urban/ Urban       0.1             0        $1,006.33  

 2036       0       51       0        0      0        No         0         No       F         Bachelors        Home Maker      33      Private      4270      4   Sports Car     no         0          0         No         5         9     Highly Urban/ Urban      0.68             1        $2,983.30  

 2053       0       50       0        8    21567      No       149254      Yes      M   Less Than High School Blue Collar      42     Commercial   17990      1       Van        no        5228        2         No         5         1     Highly Urban/ Urban      0.53             1        $3,869.69  

 2059       0       37       3       15    72019      Yes        0         No       F         Bachelors       Professional     46      Private     12400      1       SUV        no        1109        3         No         8         1     Highly Urban/ Urban      0.46             1        $4,311.33  

 2060       0       33       3       12    14369      No       142305      Yes      F   Less Than High School   Clerical       37      Private     32280     10       SUV        no         0          0         No         4         6     Highly Rural/ Rural      0.06             0         $302.66   

 2073       0       43       0        0      0        No       83260       Yes      F        High School       Home Maker      32      Private     14530      1     Minivan      no        8894        3         No         0        12     Highly Urban/ Urban      0.32             1        $1,162.40  

 2084       0       42       0       12     4215      No         0         Yes      F   Less Than High School   Student        23      Private      6120     12       SUV        no        4995        3         No         5         1     Highly Urban/ Urban      0.35             1        $2,030.11  

 2089       0       40       1       11    71293      Yes      164600      No       F         Bachelors       Blue Collar      27     Commercial    8630      3       SUV        no         0          0         No         0        12     Highly Rural/ Rural      0.07             0        $1,161.55  

 2092       0       32       2       13    34368      No       142365      Yes      F   Less Than High School Blue Collar      48      Private      7640     17   Sports Car     no         0          0         No         2         1     Highly Urban/ Urban      0.23             0        $1,626.23  

 2109       0       49       0       14    28696      No       164841      No       M         Bachelors         Clerical       49     Commercial    5920      4     Pickup       yes        0          0         No         0         7     Highly Urban/ Urban      0.55             1        $2,672.53  

 2129       0       66       1       14    45876      No       207530      Yes      F        High School      Professional     30      Private     18880      3   Sports Car     no       28353        1         No         7         1     Highly Urban/ Urban      0.29             1        $2,930.98  

 2134       0       46       0        6    106711     No       312123      Yes      F        High School      Blue Collar      26     Commercial   12630      4       SUV        no        9091        3         No         0        10     Highly Urban/ Urban      0.24             0        $2,017.34  

 2135       0       39       0       14    167127     No       468778      Yes      M            PhD             Lawyer        25      Private     20910     10     Minivan      yes        0          0         No         1        13     Highly Urban/ Urban      0.09             0         $264.60   

 2148       0       55       1       15    67140      No       228964      Yes      F         Bachelors       Blue Collar      72     Commercial   21130      9     Minivan      no         0          0         No         0        12     Highly Rural/ Rural      0.04             0         $-591.33  

 2149       1       40       2       14    31480      No       123204      Yes      M   Less Than High School Blue Collar      33      Private      7530      6     Minivan      yes        0          0         No         0         1     Highly Rural/ Rural      0.04             0         $-305.97  

 2150       0       46       0       13    23863      No       143184      Yes      M          Masters           Lawyer        44      Private     11320      1     Pickup       yes       7387        2         No         4        18     Highly Urban/ Urban      0.22             0        $1,912.95  

 2165       1       41       2       10    132114     Yes        0         No       M          Masters          Manager        33     Commercial   18810      3       Van        no        943         2         No         5        13     Highly Urban/ Urban      0.45             1        $3,701.63  

 2166       0       45       0       13    117609     No       362233      Yes      M          Masters           Lawyer        5       Private     17760      4       Van        yes        0          0         No         0        23     Highly Urban/ Urban      0.09             0         $111.49   

 2168       0       56       0       12    184068     No         0         No       M            PhD             Doctor        31      Private     33080      7     Minivan      no         0          0         No         2        13     Highly Urban/ Urban      0.12             0         $362.88   

 2170       0       41       0       12    75080      No       237088      Yes      F         Bachelors         Manager        37      Private      9010      1       SUV        no        6244        2         No         4         3     Highly Urban/ Urban      0.11             0        $1,080.90  

 2171       0       46       0       10    76744      No       231484      No       F         Bachelors       Blue Collar      62      Private     15300     16       SUV        no         0          0         No         0        10     Highly Urban/ Urban      0.27             0        $1,139.49  

 2172       0       39       0        7    140469     No       351523      Yes      F         Bachelors         Manager        8       Private     29170      1     Pickup       no         0          0         No         0        13     Highly Urban/ Urban      0.05             0         $-952.67  

 2176       0       53       0       12    38720      No       183228      Yes      M         Bachelors       Blue Collar      29     Commercial   10670      6     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.31             1        $1,457.33  

 2182       0       45       0       13    69852      No       214714      Yes      F         Bachelors       Professional     10      Private      6000     11       SUV        no         0          0         No         0         8     Highly Urban/ Urban      0.11             0         $235.78   

 2189       1       36       1        9     3747      No         0         Yes      F        High School        Student        38     Commercial    5100     10   Sports Car     no         0          0         No         3        10     Highly Rural/ Rural      0.12             0        $1,094.15  

 2191       0       49       0        0      0        No         0         No       M        High School        Student        64      Private      2630     10     Minivan      yes        0          0         No         0         7     Highly Rural/ Rural       0.1             0         $-25.51   

 2197       0       59       2       16    35192      No       165343      Yes      F        High School        Clerical       30      Private     10920      7       SUV        no         0          0         No         0         3     Highly Rural/ Rural      0.03             0         $-454.47  

 2202       0       40       3        0      0        Yes      92488       No       F        High School       Home Maker      28      Private      7120      7   Sports Car     no         0          0         No         3         6     Highly Rural/ Rural      0.14             0        $1,674.46  

 2203       0       53       0       13    189509     No         0         No       F            PhD            Manager        36      Private     27680      1       SUV        no         0          0         No         3        17     Highly Urban/ Urban      0.14             0        $1,361.97  

 2204       0       40       0        9    25505      No         0         No       F        High School      Blue Collar      40     Commercial   17330      1       SUV        no         0          0         No         1        10     Highly Urban/ Urban      0.56             1        $3,014.37  

 2206       1       40       2       15    30324      Yes        0         No       F   Less Than High School Blue Collar      27      Private     11590      1       SUV        no         0          0         No         5         6     Highly Urban/ Urban      0.63             1        $3,920.98  

 2218       0       39       1       11    61793      No       226016      Yes      F          Masters        Professional     26      Private     28290      6     Pickup       no         0          0         No         0         1     Highly Urban/ Urban      0.11             0         $996.12   

 2219       0       57       0       14    62894      No       242043      Yes      M         Bachelors       Professional     38      Private     14870      7     Minivan      yes       3989        1         No         7        11     Highly Urban/ Urban      0.27             0        $1,641.29  

 2221       0       50       0       13    63799      No         0         No       M   Less Than High School Blue Collar      43      Private     16050      1     Minivan      yes       3754        1         No         3         1     Highly Urban/ Urban      0.38             1        $2,445.65  

 2226       1       40       3        9    130051     No       379840      Yes      F         Bachelors       Blue Collar      23     Commercial   23470     11     Minivan      no         0          0         No         2         9     Highly Urban/ Urban      0.39             1        $1,170.90  

 2228       0       46       0       10    35678      No       84985       No       F         Bachelors         Student        73     Commercial   12610     14       SUV        no         0          0         No         0         8     Highly Urban/ Urban      0.41             1        $1,959.15  

 2232       0       51       0       11    51605      No         0         No       M   Less Than High School Blue Collar      41      Private     15100      4     Minivan      yes      30605        1         Yes        5         7     Highly Urban/ Urban      0.66             1        $2,929.06  

 2236       0       35       3       11    88117      Yes      236440      No       F         Bachelors       Blue Collar      55     Commercial   17400      6     Minivan      no         0          0         No         0        10     Highly Urban/ Urban      0.42             1        $2,333.90  

 2241       0       59       0       13    63969      No       187263      No       F        High School      Blue Collar      42     Commercial   16210      4     Pickup       no        4733        3         No        11         1     Highly Urban/ Urban      0.81             1        $4,715.87  

 2245       0       54       0       12    102295     No       299916      No       M            PhD            Manager        18      Private     14320      4     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.11             0         $239.49   

 2251       0       35       2        0      0        No       75659       Yes      F   Less Than High School   Student        29      Private      6140     10   Sports Car     no       10139        1         No         0         1     Highly Urban/ Urban      0.34             1        $1,747.44  

 2255       0       55       0        9    41159      No       190351      Yes      M   Less Than High School   Clerical       28     Commercial   11120      6     Pickup       no         0          0         No         0         6     Highly Rural/ Rural      0.05             0         $331.88   

 2256       0       54       0       15    48466      No       187224      Yes      F         Bachelors       Blue Collar      41     Commercial   29490      4     Minivan      no         0          0         No         0         3     Highly Rural/ Rural      0.04             0         $-325.07  

 2259       0       52       0       10     2680      No         0         No       F            PhD           Home Maker      53      Private     11380     11     Minivan      no         0          0         No         0        17     Highly Rural/ Rural      0.05             0         $-485.76  

 2263       2       36       2        9    69434      No       230609      Yes      M         Bachelors       Blue Collar      49      Private      3860      4     Minivan      yes       3367        2         No         0         7     Highly Urban/ Urban      0.32             1        $1,643.53  

 2264       0       57       0       12    77686      No       240777      Yes      M            PhD             Doctor        27      Private     27020      6     Minivan      yes        0          0         No         3       14.71   Highly Urban/ Urban      0.09             0          $60.96   

 2267       0       45       0        6    75109      No       277896      No       M          Masters           Lawyer        26      Private     15350      1     Minivan      yes        0          0         No         0        19     Highly Urban/ Urban      0.19             0         $841.93   

 2273       1       42       3       11    59800      Yes        0         No       M        High School        Clerical       37      Private     11680      3     Pickup       yes       6914        3         No         5         1     Highly Urban/ Urban      0.61             1        $4,197.81  

 2277       0       29       1        0      0        No         0         Yes      F        High School       Home Maker      42      Private     10860      1       SUV        no         0          0         Yes        0         1     Highly Urban/ Urban       0.5             1        $2,355.97  

 2287       0       47       0       11    46812      No       166668      Yes      M          Masters           Lawyer        36      Private     10880     10     Pickup       no         0          0         Yes        0        16     Highly Urban/ Urban      0.22             0         $890.78   

 2289       0       46       0       11    97475      No       92464       No       F        High School        Manager        51      Private     21440      4   Sports Car     no        8393        1         No         5         7     Highly Urban/ Urban      0.22             0        $2,023.75  

 2291       0       46       0       16    46018      No       203924      Yes      F         Bachelors       Professional     13      Private     16700      4     Minivan      no        1003        1         No         0        12     Highly Urban/ Urban      0.12             0          $29.11   

 2296       0       30       0        0      0        No         0         No       M        High School        Student        25     Commercial    4500      1     Pickup       yes       2409        3         No         3         9     Highly Urban/ Urban      0.78             1        $3,652.24  

 2299       0       43       2       10    27496      No       152043      Yes      F   Less Than High School   Clerical       47     Commercial   35890      6   Panel Truck    yes        0          0         Yes        0       4.67    Highly Rural/ Rural      0.11             0         $924.18   

 2306       0       37       0       12    49548      No         0         No       F        High School        Clerical       29      Private      7120      6       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.05             0         $183.89   

 2314       0       57       0       11    93401      No         0         No       F         Bachelors         Manager        12     Commercial   28100      6     Pickup       no        7314        2         No         5        13     Highly Urban/ Urban      0.37             1        $1,474.08  

 2317       0       51       0       12    82886      No       237613      Yes      F            PhD           Home Maker      26      Private     21480      3   Sports Car     no       26426        2         No         3        17     Highly Rural/ Rural      0.02             0         $222.99   

 2318       3       40       3       12    47456      No       165012      Yes      M        High School      Blue Collar      36     Commercial   25920      1   Panel Truck    no        3402        1         No         0         5     Highly Urban/ Urban      0.63             1        $3,522.63  

 2321       0       32       2       12    39144      Yes        0         No       F   Less Than High School Blue Collar      34      Private      5410      4       SUV        no       23418        3         Yes        5         1     Highly Urban/ Urban      0.68             1        $4,340.58  

 2324       0       46       0        6    34508      No       183694      Yes      F        High School        Clerical       14      Private      8430      1       SUV        no       25401        3         No         1         6     Highly Rural/ Rural      0.03             0          $15.26   

 2340       1       38       1        6    19858      No       113408      Yes      F   Less Than High School   Clerical       52      Private      7340      7       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.33             1        $2,061.66  

 2343       0       50       0       12    73671      No       247904      Yes      F          Masters           Lawyer        6       Private     22420      1     Minivan      no         0          0         No         0        15     Highly Urban/ Urban       0.1             0         $-245.31  

 2349       0       49       0       11    89659      No         0         No       M         Bachelors       Professional     31      Private      1500      4     Minivan      yes       5064        2         No         1        13     Highly Urban/ Urban      0.21             0        $1,271.53  

 2352       0       51       0        7    141546     No       351285      No       M            PhD            Manager        18     Commercial   29330      4   Panel Truck    yes       1184        2         No         4       12.71   Highly Urban/ Urban       0.3             1        $2,424.99  

 2353       0       46       0       14    34705      No       173076      Yes      M        High School      Blue Collar      50     Commercial    9570      7     Pickup       yes        0          0         No         0         7     Highly Urban/ Urban      0.32             1        $2,033.19  

 2365       0       38       0        0      0        No         0         No       F   Less Than High School   Student        40      Private      1630      4   Sports Car     no        9228        2         No         7         6     Highly Urban/ Urban      0.76             1        $3,924.50  

 2370       0       36       2       12    69546      No       186300      Yes      F        High School      Blue Collar      33     Commercial   12050      1   Sports Car     no        5106        2         No         1         1     Highly Urban/ Urban       0.3             1        $2,892.78  

 2378       0       41       1       10    137815     Yes        0         No       F         Bachelors         Manager        33      Private     16160      9     Minivan      no         0          0         Yes        1         1     Highly Urban/ Urban      0.22             0         $872.26   

 2390       0       43       0        9    43505      No       107149      No       F         Bachelors         Clerical       37      Private     10780      4       SUV        no        3904        1         No         5        10     Highly Urban/ Urban      0.52             1        $2,594.56  

 2399       0       41       3       12    48762      No       176946      Yes      F        High School        Clerical       26      Private     28090      1     Minivan      no        3996        2         No         4        12     Highly Urban/ Urban       0.3             1        $1,385.99  

 2402       2       45       2       10    71119      Yes        0         No       F         Bachelors         Clerical       43      Private     15600      1     Minivan      no        3534        3         No         5         4     Highly Urban/ Urban      0.71             1        $3,824.13  

 2403       1       39       2      11.74  40608      Yes      176832      No       F        High School        Clerical       20      Private      9130      9       SUV        no         0          0         No         3         6     Highly Urban/ Urban      0.57             1        $3,019.17  

 2404       0       43       0       11    50260      No       178766      Yes      F        High School      Professional     36      Private     20490      6     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.12             0         $617.45   

 2414       0       36       0        9    32645      No       190491      Yes      M            PhD             Doctor        51      Private      8360      4     Minivan      yes       7466        3         No         0        14     Highly Urban/ Urban      0.08             0         $388.07   

 2422       2       39       2      12.35  64990      No       197575      Yes      F        High School      Professional     5      Commercial   17510     10     Pickup       no         0          0         No         0         7     Highly Urban/ Urban       0.4             1        $1,663.84  

 2424       0       45       0       13    107012     No       322746      Yes      M          Masters          Manager        43     Commercial   28300      4   Panel Truck    yes        0          0         No         3         1     Highly Urban/ Urban      0.16             0        $1,830.29  

 2430       0       46       0        7    76216      No         0         No       F          Masters         Home Maker      56      Private     13720      4       SUV        no         0          0         Yes        3        19     Highly Urban/ Urban      0.45             1        $2,399.55  

 2435       1       51       1        8    77831      No       253662      Yes      M        High School      Blue Collar      5      Commercial   12430      1     Minivan      yes       9000        1         No         0        11     Highly Urban/ Urban      0.37             1        $1,555.52  

 2439       0       55       0       12    51512      No         0         No       M         Bachelors         Clerical       29     Commercial    9160      6     Pickup       no         0          0         No         0         4     Highly Rural/ Rural      0.09             0         $679.99   

 2442       0       51       0       14    37098      No       100515      No       M          Masters        Professional     24     Commercial   10310      7     Pickup       yes       9736        3         No         2        19     Highly Urban/ Urban      0.47             1        $2,852.10  

 2445       1       38       1        9    100796     Yes        0         No       M         Bachelors       Professional     26      Private     16860      6     Minivan      yes       3011        4         No         0       7.31    Highly Urban/ Urban      0.26             0        $2,310.49  

 2449       0       43       1       12    71402      No       210868      Yes      F          Masters          Manager        21     Commercial   27250      1   Panel Truck    no        9712        3         No         1        15     Highly Urban/ Urban      0.14             0        $1,137.04  

 2451       0       50       0        0      0        No       21576       No       F        High School       Home Maker      8       Private      6500      7       SUV        no         0          0         No         0         1     Highly Urban/ Urban       0.5             1        $1,751.67  

 2461       0       29       3       13    24365      Yes        0         No       F        High School        Student        9      Commercial    6840      7       SUV        no       36744        1         Yes        2         1     Highly Urban/ Urban      0.69             1        $3,517.88  

 2464       0       40       2       11    84449      Yes        0         No       M         Bachelors       Professional     5       Private     16080      3     Minivan      yes        0          0         No         0         1     Highly Urban/ Urban      0.19             0        $1,475.99  

 2465       2       43       3       12    53073      Yes      213525      No       F          Masters           Lawyer        39      Private     23100     10     Pickup       no        5328        4         No         5        13     Highly Urban/ Urban      0.59             1        $3,582.15  

 2472       0       52       0        0      0        No       148315      Yes      M   Less Than High School   Student        62      Private      7070      4     Pickup       yes        0          0         No         2         1     Highly Rural/ Rural      0.07             0         $610.67   

 2476       0       51       0        8    46993      No       175488      Yes      F         Bachelors       Blue Collar      40     Commercial   11300      1     Minivan      no        4219        4         No         3         6     Highly Urban/ Urban       0.4             1        $2,345.94  

 2482       0       48       0        9    16468      No       127759      Yes      F   Less Than High School   Clerical       19      Private     16540      1       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.24             0        $1,617.59  

 2487       1       43       2       12    83803      Yes      285833      No       F        High School      Blue Collar      31     Commercial   19050      7       SUV        no        1670        2         No         2       5.53    Highly Rural/ Rural      0.14             0        $2,285.92  

 2498       1       44       2      12.89  63215      No       202136      Yes      F         Bachelors       Professional     9       Private     12930      6       SUV        no        7746        1         No         5        10     Highly Urban/ Urban       0.3             1        $1,753.07  

 2501       0       46       0       12    128026     No       350087      Yes      F            PhD            Manager        27     Commercial   21170      6     Pickup       no         0          0         No         0       12.25   Highly Urban/ Urban       0.1             0         $642.77   

 2504       0       34       1       10    74356      No       233461      Yes      F         Bachelors         Manager        41      Private      1500     13       SUV        no        5926        2         No         8        13     Highly Urban/ Urban      0.19             0         $958.47   

 2511       1       37       3        6    29251      Yes      67945       No       F   Less Than High School   Clerical       37      Private     22300     12     Minivan      no         0          0         No         0         5     Highly Urban/ Urban      0.48             1        $2,084.76  

 2518       0       28       2       11    11550      No       104450      Yes      M   Less Than High School   Clerical       23      Private      6180      1     Minivan      no         0          0         No         0         1     Highly Rural/ Rural      0.03             0         $-377.69  

 2521       0       45       0       11    124745     No         0         No       F          Masters           Lawyer        45      Private     27150      6     Pickup       no         0          0         No         2       15.43   Highly Urban/ Urban      0.21             0        $1,271.33  

 2530       0       51       0       11    71939      No         0         No       M         Bachelors         Manager        14      Private     13790      1     Minivan      no         0          0         No         2         8     Highly Urban/ Urban      0.16             0         $265.79   

 2543       0       37       2       11    36073      No       136128      Yes      M   Less Than High School   Clerical       32     Commercial   22690      6   Panel Truck    yes       8193        4         No         5         6     Highly Urban/ Urban      0.53             1        $3,458.00  

 2545       2       44       2       13    142551     Yes      391566      No       F          Masters           Lawyer        16      Private      5900     11   Sports Car     no       39019        1         No         8        18     Highly Urban/ Urban      0.61             1        $3,661.46  

 2561       0       47       0        7    69496      No         0         No       M        High School      Professional     43     Commercial   24310     10   Panel Truck    yes        0          0         No         0       5.48    Highly Urban/ Urban      0.35             1        $2,463.18  

 2566       0       49       0       10    41068      No         0         No       M        High School      Blue Collar      28     Commercial   21130      6       Van        yes       7463        2         No         0         1     Highly Urban/ Urban      0.48             1        $3,029.24  

 2572       0       45       1        9    51221      No       166715      Yes      M   Less Than High School   Clerical       51      Private     16550      1     Minivan      yes        0          0         No         1         6     Highly Urban/ Urban      0.21             0        $1,434.06  

 2577       0       44       0        0      0        No         0         No       F            PhD           Home Maker      26      Private     22490     11     Minivan      no         0          0         No         1        15     Highly Urban/ Urban      0.54             1        $1,443.47  

 2578       0       49       0       13    96057      No       245655      Yes      M         Bachelors       Professional     76     Commercial   27660      6   Panel Truck    no         0          0         No         2         9     Highly Urban/ Urban      0.23             0        $2,337.06  

 2580       0       35       0        5    37684      No       155474      No       M          Masters        Professional     29      Private     11040      1     Minivan      yes       9788        2         No         3         9     Highly Urban/ Urban      0.33             1        $2,347.41  

 2581       0       41       0       11    56281      No       179309      No       M         Bachelors         Manager        54      Private     11230      1     Minivan      no        5916        1         No         1        13     Highly Urban/ Urban      0.16             0         $586.37   

 2582       0       56       1      11.97  50384      No       191197      Yes      M         Bachelors         Manager        38      Private     14990      1     Minivan      yes        0          0         No         0         9     Highly Urban/ Urban      0.07             0         $-321.72  

 2584       0       51       0      11.81  57910      No       229038      Yes      M          Masters           Lawyer        13      Private     13610     10     Minivan      no         0          0         No         2        13     Highly Urban/ Urban      0.14             0         $163.82   

 2590       0       41       1       12    141776     No       352314      Yes      M            PhD            Manager        62     Commercial   22220      4       Van        no         0          0         No         0        11     Highly Rural/ Rural      0.01             0         $-92.04   

 2598       0       38       4       19    30735      No       136298      Yes      F   Less Than High School   Clerical       15      Private     21430     10     Minivan      no         0          0         No         0         4     Highly Rural/ Rural      0.03             0        $-1,387.74 

 2602       0       51       0      12.12  104346     No       319207      Yes      F        High School      Blue Collar      33     Commercial   24860     17     Minivan      no        2131        1         No         3         1     Highly Urban/ Urban      0.34             1        $1,361.45  

 2605       0       62       0       11    34580      No       195895      Yes      F          Masters           Lawyer        12      Private     20880      1     Minivan      no        6200        1         No         3        12     Highly Rural/ Rural      0.02             0         $-958.36  

 2616       0       47       0        8    130087     No         0         No       F          Masters           Lawyer        28      Private     11980      1       SUV        no         0          0         No         0        22     Highly Urban/ Urban      0.16             0        $1,098.33  

 2618       0       47       0        9    59233      No       167038      No       F         Bachelors       Blue Collar      14     Commercial   21420      1     Minivan      no         0          0         No         1         8     Highly Urban/ Urban      0.49             1        $1,741.27  

 2619       0       53       0       11    91924      No       249756      Yes      M        High School      Blue Collar      5      Commercial   19330     13       Van        no       20463        1         Yes        3         8     Highly Urban/ Urban      0.53             1        $2,193.77  

 2624       0       47       0       12    60936      No       254729      Yes      M         Bachelors       Professional     24      Private     14220     10     Minivan      no         0          0         No         0        10     Highly Urban/ Urban      0.11             0          $61.86   

 2632       0       53       0        8    132536     No       368061      Yes      M         Bachelors       Professional     43     Commercial   20050      1       Van        no         0          0         No         0         9     Highly Urban/ Urban      0.16             0        $2,011.36  

 2640       0       55       0       12    41341      No         0         No       F          Masters           Lawyer        24      Private     10690      7     Minivan      no         0          0         Yes        0         9     Highly Urban/ Urban      0.38             1        $1,092.27  

 2646       0       41       0        7    37771      No       169247      Yes      F         Bachelors        Home Maker      44      Private      9380      4       SUV        no         0          0         No         0        11     Highly Rural/ Rural      0.01             0         $-954.24  

 2651       0       56       0       13    112246     No         0         No       M            PhD             Lawyer        10      Private     17180      7       Van        no         0          0         No         2        10     Highly Urban/ Urban      0.21             0        $1,695.40  

 2660       0       38       0        7    94513      No       256582      Yes      F         Bachelors         Manager        20      Private     19120     10       SUV        no         0          0         No         0        14     Highly Urban/ Urban      0.06             0         $-805.75  

 2661       0       56       0       12    146309     No       426818      Yes      F          Masters           Lawyer        11      Private     34460      6     Pickup       no         0          0         No         3        15     Highly Urban/ Urban      0.12             0         $368.45   

 2668       0       41       0        0      0        No         0         No       F        High School       Home Maker      40      Private     12860      4       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.09             0         $684.13   

 2670       0       54       0       12    40818      No         0         No       F          Masters           Lawyer        34      Private     10980      1       SUV        no        5050        2         No         0        15     Highly Urban/ Urban      0.22             0        $1,788.26  

 2680       0       31       1        8    30348      Yes      128843      No       M         Bachelors         Clerical       47      Private      4600     10     Minivan      no        2118        1         No         4         9     Highly Urban/ Urban      0.51             1        $2,543.02  

 2681       0       61       0       14    203920     No       488199      Yes      M        High School      Blue Collar      42     Commercial   27990      1     Minivan      no         0          0         No         0         9     Highly Rural/ Rural      0.02             0         $-186.58  

 2689       0       52       0       14     7356      No         0         Yes      M        High School        Student        20      Private      3030      1     Minivan      no        6796        2         No         0         7     Highly Urban/ Urban      0.19             0         $814.80   

 2694       0       39       0       10    111619     No       184982      No       M          Masters           Lawyer        24      Private     28390      4     Minivan      yes        0          0         No         0        16     Highly Urban/ Urban      0.17             0         $678.18   

 2695       0       63       0       15    42209      No         0         No       M        High School      Blue Collar      22     Commercial   16250      1       SUV        no        6379        3         No         8         9     Highly Urban/ Urban      0.76             1        $4,513.54  

 2696       0       53       0       12    72537      No         0         No       M         Bachelors       Blue Collar      23     Commercial   18880      1       Van        yes        0          0         No         3         1     Highly Urban/ Urban      0.55             1        $3,217.76  

 2702       0       41       0        0      0        No         0         Yes      F        High School       Home Maker      49      Private      5700      7       SUV        no       50807        3         No         0         7     Highly Rural/ Rural      0.05             0         $185.22   

 2704       0       39       2       12    36143      Yes        0         No       M        High School        Clerical       44      Private      5400      1     Pickup       yes        0          0         No         0        10     Highly Rural/ Rural      0.05             0         $974.70   

 2708       3       45       3       14    54391      No       219806      Yes      M         Bachelors         Clerical       22     Commercial   22720      1   Panel Truck    yes        0          0         No         0         9     Highly Rural/ Rural      0.16             0        $1,309.89  

 2709       0       54       0       11    141318     No       411675      Yes      F          Masters           Lawyer        38      Private     15630     15       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.08             0         $502.52   

 2714       0       35       0       12    58310      No         0         No       M        High School      Blue Collar      33      Private      8470      1     Pickup       no         0          0         No         2         1     Highly Urban/ Urban      0.36             1        $2,339.26  

 2716       0       53       0        9    30012      No         0         No       F          Masters          Manager        17      Private     15990     17     Minivan      no         0          0         Yes        0        15     Highly Urban/ Urban      0.29             1         $-296.59  

 2723       0       47       0      10.55  25620      No       141115      Yes      M        High School        Clerical       64     Commercial    8760      1     Pickup       yes        0          0         No         0        10     Highly Rural/ Rural      0.06             0         $791.53   

 2725       0       40       0       14    25645      No       120237      Yes      F        High School        Clerical       50      Private     15490      1       SUV        no        5375        2         No         0         1     Highly Urban/ Urban      0.22             0        $2,034.06  

 2738       0       54       0      0.62     0        No         0         No       F        High School        Student        29      Private     17160      1       SUV        no         0          0         No         0         1     Highly Rural/ Rural       0.1             0         $644.38   

 2750       1       43       2       13    82356      No       244354      Yes      M   Less Than High School Blue Collar      33     Commercial   21600      1       Van        yes        0          0         No         0         3     Highly Urban/ Urban      0.36             1        $2,813.29  

 2756       0       44       2       15    14041      No       122698      Yes      F        High School        Clerical       30      Private     11100      4     Pickup       yes       1297        2         No         0         1     Highly Urban/ Urban      0.25             0        $1,451.36  

 2758       0       30       2       12    103185     No       299281      Yes      F          Masters           Lawyer        9       Private     11140      7       SUV        no         0          0         No         0        15     Highly Urban/ Urban      0.09             0         $145.45   

 2766       0       50       0        0      0        No       88189       Yes      F         Bachelors        Home Maker      44      Private      1500     11   Sports Car     no       26452        2         No         0         1     Highly Urban/ Urban      0.32             1        $1,746.26  

 2767       0       37       2       12    35738      No       138610      Yes      F        High School        Clerical       46      Private     12900      1       SUV        no         0          0         No         1         1     Highly Urban/ Urban      0.23             0        $1,903.33  

 2771       0       52       0       11    63807      No       199353      No       M          Masters           Lawyer        50      Private      2250      9     Minivan      yes       9155        4         No         0       13.4    Highly Urban/ Urban       0.2             0        $1,333.17  

 2775       2       60       2        9     8287      No       160005      Yes      F         Bachelors        Home Maker      63      Private     10800      1     Minivan      no        937         4         No         0         8     Highly Urban/ Urban      0.35             1        $1,827.94  

 2776       0       44       0       10    61597      No       207095      Yes      M         Bachelors         Manager        25     Commercial   19310      6       Van        yes       2576        1         No         0         4     Highly Urban/ Urban      0.13             0         $916.07   

 2779       2       42       2        8    57379      Yes        0         No       F        High School      Blue Collar      37     Commercial   20040      1   Sports Car     no         0          0         Yes        2         1     Highly Urban/ Urban      0.86             1        $5,359.99  

 2780       1       38       2       12    35653      No       135668      Yes      M   Less Than High School Blue Collar      34      Private      8870      1     Pickup       yes        0          0         No         0         1     Highly Urban/ Urban      0.26             0        $1,963.20  

 2781       0       38       1        7    46138      Yes      196543      No       F         Bachelors       Professional     30      Private     14870     10   Sports Car     no       14954        3         No         2       8.44    Highly Urban/ Urban      0.29             1        $2,810.62  

 2782       0       34       1        9    37364      Yes      173675      No       F          Masters           Lawyer        49      Private      8640      8       SUV        no       43725        3         Yes        1         1     Highly Urban/ Urban      0.42             1        $3,362.10  

 2783       0       54       0        0      0        No       81350       Yes      F        High School       Home Maker      33      Private     13570      7     Minivan      no         0          0         No         0         8     Highly Urban/ Urban      0.32             1         $675.21   

 2796       0       47       0       13    16167      No         0         Yes      M        High School        Student        18     Commercial    6880      6     Minivan      yes        0          0         No         0         1     Highly Urban/ Urban      0.29             1        $1,235.85  

 2798       0       50       0      11.47  70135      No         0         No       M          Masters          Manager        5      Commercial    8510      1     Pickup       yes        0          0         No         3        13     Highly Urban/ Urban      0.32             1        $1,652.15  

 2800       0       45       1       13    65940      No       231593      Yes      M         Bachelors       Professional     43      Private     14510      6     Minivan      no         0          0         No         0        10     Highly Urban/ Urban      0.11             0         $459.21   

 2803       0       47       0        9    108776     No       278542      Yes      F         Bachelors         Manager        47      Private      9150      1       SUV        no         0          0         No         1         2     Highly Urban/ Urban      0.06             0         $413.52   

 2806       0       45       0       10    60245      No       191309      Yes      F         Bachelors        Home Maker      48      Private     26500     13     Minivan      no         0          0         No         0         9     Highly Rural/ Rural      0.01             0        $-2,035.71 

 2813       0       44       0       10    34358      No         0         No       F        High School      Blue Collar      36     Commercial   13930      6   Sports Car     no         0          0         No         1         8     Highly Rural/ Rural      0.11             0        $1,323.83  

 2818       0       60       0       14    105173     No       310049      Yes      F            PhD             Doctor        34      Private     22300      4   Sports Car     no        4634        2         No         0        13     Highly Urban/ Urban      0.06             0         $608.13   

 2821       2       45       3        7    37429      No       181752      Yes      F         Bachelors         Student        38      Private     10810     13   Sports Car     no         0          0         Yes        1       7.76    Highly Urban/ Urban       0.5             1        $1,873.12  

 2825       0       58       0       10    90672      No         0         No       M          Masters          Manager        43      Private      7300      1     Pickup       yes       9090        2         No         0        12     Highly Urban/ Urban      0.12             0        $1,078.44  

 2829       0       59       2       14    15210      No       147599      Yes      F        High School        Student        50      Private     11650      1       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.02             0         $-225.20  

 2830       0       53       0        0      0        No         0         Yes      F        High School        Student        31     Commercial   12530      6     Minivan      no        2796        2         No         7         4     Highly Urban/ Urban      0.75             1        $2,988.72  

 2833       0       41       0       11    71537      No       182239      No       F         Bachelors       Professional     22      Private     25530     13       Van        no         0          0         No         0         7     Highly Urban/ Urban       0.2             0         $890.36   

 2839       2       58       3       18     9750      No         0         Yes      M   Less Than High School   Student        50      Private      2480      1     Minivan      yes       3741        2         Yes        3         1     Highly Urban/ Urban      0.65             1        $3,093.84  

 2843       0       49       0       13    106915     No       306616      Yes      M        High School        Manager        24     Commercial   34580     13   Panel Truck    yes        0          0         No         0        12     Highly Urban/ Urban      0.11             0         $195.37   

 2846       0       56       0        8    59675      No       240945      Yes      M         Bachelors       Professional     39      Private     28790      1     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.11             0         $536.91   

 2847       0       53       0        0      0        No       64888       Yes      F          Masters           Lawyer        24      Private     33290      6     Minivan      no         0          0         No         3        16     Highly Urban/ Urban      0.42             1        $1,053.30  

 2848       0       30       1       15    59388      No       183997      Yes      F         Bachelors       Blue Collar      56     Commercial   21820      4   Sports Car     no         0          0         Yes        1         7     Highly Rural/ Rural      0.09             0        $1,202.66  

 2856       0       26       3        0      0        Yes        0         No       M        High School        Student        41     Commercial    4100      1     Minivan      no         0          0         No         3         1     Highly Urban/ Urban      0.78             1        $4,015.94  

 2863       0       34       5       15    16167      Yes        0         No       F   Less Than High School   Clerical       66      Private      6520      1   Sports Car     no         0          0         Yes        1         1     Highly Rural/ Rural      0.15             0        $2,548.47  

 2867       2       38       2       12    59395      No       209595      Yes      F          Masters           Lawyer        64      Private     11240      1       SUV        no         0          0         No         0        10     Highly Urban/ Urban      0.23             0        $2,088.84  

 2869       0       32       0        7    85402      No         0         No       F         Bachelors         Manager        32      Private     11180      7       SUV        no        5924        1         No         1        11     Highly Urban/ Urban      0.14             0         $476.41   

 2873       0       50       0       11    38462      No       189718      Yes      F        High School        Clerical       37      Private     25900     10     Minivan      no         0          0         No         0         8     Highly Rural/ Rural      0.03             0        $-1,337.55 

 2874       0       45       3       17    61094      No       175634      Yes      F         Bachelors       Blue Collar      45     Commercial    6000      6       SUV        no        5528        1         No         0        10     Highly Urban/ Urban      0.28             1        $1,838.77  

 2875       0       35       0       11     2540      No       107045      Yes      F        High School       Home Maker      35      Private      5220      6   Sports Car     no        7714        2         No         5         1     Highly Urban/ Urban      0.36             1        $2,614.81  

 2880       0       33       3        9    47813      No       185796      Yes      M        High School      Blue Collar      45     Commercial    9120     10     Pickup       yes        0          0         Yes        1         7     Highly Urban/ Urban      0.51             1        $2,396.72  

 2886       1       43       2       11    76159      Yes      92466       No       F         Bachelors       Professional     52      Private     20270      3     Pickup       no        3255        2         No         1       7.58    Highly Urban/ Urban      0.32             1        $2,850.92  

 2887       0       34       4       12    24897      No       166510      Yes      M        High School        Clerical       26     Commercial    7390     17     Pickup       yes      23866        2         No         2         7     Highly Urban/ Urban      0.45             1        $1,958.40  

 2888       2       40       2       13    65759      No       236449      Yes      F        High School      Professional     53      Private     12080      6     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.24             0        $1,494.88  

 2889       0       33       2        0      0        No         0         Yes      F        High School       Home Maker      32      Private      5430      6       SUV        no         0          0         Yes        3         9     Highly Urban/ Urban      0.61             1        $2,299.28  

 2890       0       33       1        4    25037      Yes        0         No       F        High School        Clerical       31      Private     14280      1       SUV        no         0          0         No         0         8     Highly Urban/ Urban      0.38             1        $2,675.03  

 2892       0       36       0       11    39786      No         0         No       M        High School        Manager        5       Private     15960      4     Minivan      no       19115        2         Yes        3         1     Highly Urban/ Urban      0.37             1        $1,220.69  

 2901       0       34       1       11    62708      No       233154      Yes      F         Bachelors       Professional     48      Private     18000     16     Pickup       no       51345        3         Yes        1         1     Highly Urban/ Urban      0.24             0        $1,328.77  

 2902       0       48       0        8    102861     No         0         No       M          Masters           Lawyer        43      Private     19220      1     Minivan      yes        0          0         No         2        17     Highly Urban/ Urban      0.22             0        $1,371.52  

 2905       0       45       0        8    53420      No       190092      Yes      M         Bachelors       Professional     65     Commercial   24910      1   Panel Truck    yes        0          0         No         2         9     Highly Urban/ Urban      0.27             0        $2,595.53  

 2917       0       45       2       15    31497      No       197502      Yes      F   Less Than High School Blue Collar      5       Private     17120      6   Sports Car     no        6680        1         No         8         3     Highly Urban/ Urban      0.44             1        $2,618.83  

 2922       0       33       1       10    83664      No       217763      Yes      M         Bachelors       Blue Collar      54     Commercial   21100      4       Van        yes       5495        3         No         7         8     Highly Urban/ Urban       0.5             1        $3,596.11  

 2924       1       38       2       14    22319      No       132907      Yes      F   Less Than High School Blue Collar      47      Private      7530      3   Sports Car     no         0          0         No         0         4     Highly Rural/ Rural      0.04             0         $626.49   

 2930       0       59       0       13    210115     No       512934      No       M            PhD            Manager        30     Commercial   28560      4   Panel Truck    yes       785         2         No         2        14     Highly Urban/ Urban      0.21             0        $2,123.08  

 2931       0       50       0       13    79941      No       215831      Yes      M          Masters          Manager        12     Commercial   30350      8   Panel Truck    yes        0          0         No         1         8     Highly Urban/ Urban      0.14             0         $751.49   

 2946       1       41       1        5    34304      Yes      97504       No       M        High School        Clerical       57      Private      9030      6     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural      0.08             0        $1,489.36  

 2955       0       46       0       12    33635      No       191957      Yes      F        High School      Blue Collar      55     Commercial   26790      7     Minivan      no        3960        2         No         3         8     Highly Urban/ Urban      0.43             1        $2,172.15  

 2962       0       49       0        8    29844      No       179613      Yes      F        High School        Clerical       47      Private     19080      4     Minivan      no         0          0         No         0         8     Highly Rural/ Rural      0.03             0         $-910.04  

 2964       0       34       2       15    133937     Yes      343257      No       M         Bachelors       Professional     26      Private     18290      1       Van        no         0          0         No         0         8     Highly Rural/ Rural      0.02             0         $583.36   

 2965       0       29       4        0      0        No         0         Yes      F         Bachelors         Student        38     Commercial   20570      4     Pickup       no         0          0         No         2         9     Highly Urban/ Urban      0.59             1        $2,135.51  

 2967       0       43       0        7    58112      No         0         No       M         Bachelors         Clerical       34      Private     15050      3     Minivan      yes        0          0         No         2        11     Highly Rural/ Rural      0.06             0         $-181.15  

 2970       3       42       3       15    96752      No       274947      Yes      M          Masters          Manager        22      Private     13860     10     Minivan      yes        0          0         No         0        13     Highly Urban/ Urban       0.2             0         $311.94   

 2973       0       35       2       15    34385      No       86607       Yes      M        High School        Student        34     Commercial    5000     19     Pickup       no        7788        3         No         4         9     Highly Urban/ Urban      0.38             1        $1,867.84  

 2974       0       36       0       12    101077     No       288301      Yes      M          Masters          Manager        42     Commercial   22850      4   Panel Truck    yes        0          0         No         3        16     Highly Urban/ Urban      0.17             0        $1,418.98  

 2976       0       57       4       19    39953      No       166747      Yes      F        High School      Blue Collar      43     Commercial   22780      1     Pickup       no        7119        1         No         8         1     Highly Urban/ Urban       0.6             1        $3,619.53  

 2977       0       53       0       14    33303      No       161352      Yes      F        High School        Manager        48      Private     29770      6       SUV        no         0          0         Yes        2         1     Highly Urban/ Urban       0.2             0        $1,208.52  

 2978       0       38       0       11    181453     No       460598      Yes      F          Masters           Lawyer        63      Private     23450      4     Minivan      no       19336        2         Yes        3        14     Highly Urban/ Urban      0.21             0        $1,343.27  

 2986       0       47       0        9    40764      No       158061      Yes      F            PhD            Manager        16      Private     11400      1   Sports Car     no         0          0         No         1        14     Highly Urban/ Urban      0.09             0         $785.18   

 2988       0       28       3       11    61972      No       216473      Yes      F          Masters           Lawyer        59      Private     12180     10       SUV        no        7820        3         No         3         8     Highly Urban/ Urban      0.16             0        $1,743.53  

 2989       0       64       0       10    96238      No       290724      Yes      M          Masters           Lawyer        40      Private     13130      1       SUV        yes        0          0         No         2         1     Highly Urban/ Urban      0.12             0        $1,860.62  

 2995       0       17       0        6    40015      No       152243      No       M        High School      Blue Collar      50     Commercial   23400      7   Panel Truck    yes       2047        2         No         7         1     Highly Urban/ Urban      0.73             1        $4,287.35  

 3005       0       46       0      11.36  57136      No       192619      Yes      M        High School      Professional     55     Commercial   11810      8     Pickup       yes       8446        1         No         7         8     Highly Urban/ Urban      0.44             1        $3,236.28  

 3011       0       50       0       13    61082      No       177094      Yes      F         Bachelors         Manager        48      Private     13520      1       SUV        no         0          0         No         0         7     Highly Urban/ Urban      0.07             0         $223.02   

 3013       0       46       0       14    52411      No       158113      Yes      M         Bachelors         Manager        14      Private     11340      6     Minivan      yes        0          0         No         2         8     Highly Urban/ Urban      0.09             0         $-520.05  

 3019       0       35       0       12    67702      No       181552      Yes      M         Bachelors       Blue Collar      11     Commercial   11770      1     Pickup       no       48743        3         Yes        6         9     Highly Urban/ Urban      0.67             1        $3,251.93  

 3021       0       48       0        0      0        No         0         Yes      M        High School        Student        23     Commercial   33540      4     Minivan      yes        0          0         No         0         1     Highly Rural/ Rural       0.1             0         $229.09   

 3022       0       58       0       10    153831     No         0         No       F          Masters          Manager        35     Commercial   37320      6     Pickup       no         0          0         Yes        0        13     Highly Urban/ Urban      0.32             1        $1,420.37  

 3029       2       39       2        0     2399      No       99103       Yes      F        High School       Home Maker      46      Private      5400      1   Sports Car     no         0          0         No         1         1     Highly Rural/ Rural      0.07             0        $1,155.60  

 3037       0       36       0        8    82109      No       267268      No       F            PhD             Doctor        18      Private     13310      1       SUV        no        3087        2         No         0        14     Highly Urban/ Urban      0.12             0         $908.72   

 3042       0       55       0       12    291182     No       669271      Yes      M            PhD            Manager        16     Commercial    7000      8     Pickup       yes      22215        2         Yes        0        12     Highly Urban/ Urban      0.14             0        $1,101.63  

 3043       0       40       0       11    126483     No       388549      Yes      M            PhD            Manager        36     Commercial   30610      6   Panel Truck    yes       1853        1         No         2        14     Highly Urban/ Urban      0.14             0        $1,500.47  

 3049       0       46       0       13    175117     No       213016      No       M          Masters          Manager        28     Commercial   28290      7   Panel Truck    yes        0          0         No         2        16     Highly Urban/ Urban      0.22             0        $1,432.94  

 3050       0       41       2       14    53940      No       182684      Yes      F        High School      Blue Collar      32     Commercial   24510      1     Pickup       no       24295        1         Yes        3         1     Highly Urban/ Urban      0.58             1        $3,033.51  

 3053       0       40       0        9    49182      No       186066      Yes      M         Bachelors       Blue Collar      28     Commercial   10420      4     Pickup       no         0          0         No         0        13     Highly Urban/ Urban       0.3             1        $1,534.98  

 3058       1       41       3       13    104088     No       296329      Yes      F         Bachelors       Professional     23     Commercial   31920      6       Van        no        6274        2         No         0         3     Highly Urban/ Urban      0.26             0        $2,096.94  

 3062       0       37       0       11    24933      No       112656      Yes      M        High School        Clerical       29      Private     14380      1     Minivan      no        5095        2         No         0         1     Highly Urban/ Urban      0.22             0        $1,393.29  

 3063       0       60       1       13    144202     Yes        0         No       M         Bachelors       Professional     50      Private     21970      6       Van        yes      40682        1         No         6       9.49    Highly Urban/ Urban      0.33             1        $3,354.09  

 3065       0       39       3       17     2947      No         0         Yes      F   Less Than High School   Student        24      Private      5690      7       SUV        no         0          0         No         2         1     Highly Rural/ Rural      0.04             0         $-194.68  

 3080       0       47       0       13    116008     No       318397      Yes      F          Masters          Manager        36      Private      6200      6       SUV        no         0          0         No         1        15     Highly Urban/ Urban      0.06             0          $46.79   

 3088       0       37       0        7    113153     No       281454      Yes      M         Bachelors       Professional     45     Commercial   38340     10   Panel Truck    yes       3841        1         No         6         9     Highly Urban/ Urban      0.34             1        $2,636.26  

 3093       1       43       2       11    96011      Yes      320017      No       F         Bachelors       Professional     39      Private     22070      3       SUV        no       44668        1         Yes        0         4     Highly Urban/ Urban      0.44             1        $3,240.68  

 3096       0       52       0        7    73574      No       224049      Yes      M        High School      Professional     13     Commercial   27520      1   Panel Truck    yes        0          0         Yes        0         1     Highly Urban/ Urban      0.34             1        $2,448.14  

 3101       0       49       0       14    34628      No       159544      Yes      M        High School      Professional     43      Private     20310      3       Van        yes       7467        2         No         3         1     Highly Urban/ Urban      0.19             0        $2,458.96  

 3103       3       43       3       15    69245      No       245316      Yes      M          Masters          Manager        16      Private      3520      1     Minivan      no        8167        2         No         5       13.27   Highly Urban/ Urban      0.38             1        $1,773.44  

 3107       0       54       0       10    139157     No         0         No       F            PhD          Professional     23      Private      6900      1       SUV        no         0          0         No         4       13.69   Highly Urban/ Urban      0.27             0        $2,573.95  

 3109       0       41       0       14    139975     No       331751      Yes      M         Bachelors         Manager        26     Commercial   32570     13   Panel Truck    yes        0          0         No         0         6     Highly Urban/ Urban       0.1             0         $145.39   

 3111       0       47       0       15    40495      No       196730      Yes      M   Less Than High School Blue Collar      5       Private     10250     10     Pickup       yes        0          0         No         0         4     Highly Urban/ Urban      0.18             0         $577.09   

 3113       2       36       3        0      0        Yes        0         No       M   Less Than High School   Student        47      Private      5100      9     Pickup       no        7205        2         No         1         8     Highly Urban/ Urban      0.76             1        $3,760.35  

 3116       0       33       1      11.13  111718     No       304908      Yes      F         Bachelors       Blue Collar      44      Private     19890      6     Minivan      no         0          0         No         0         8     Highly Rural/ Rural      0.02             0        $-1,509.43 

 3132       0       31       1       10    56782      No       192337      Yes      M         Bachelors       Professional     29      Private     10280     14     Pickup       yes       2548        2         No         2         1     Highly Urban/ Urban      0.15             0        $1,112.97  

 3141       0       49       0       12    106161     No       282961      Yes      F         Bachelors       Blue Collar      31     Commercial   18020      1       SUV        no         0          0         No         0        16     Highly Urban/ Urban      0.24             0        $1,551.40  

 3153       1       40       2       16    16641      No         0         Yes      M         Bachelors         Student        32     Commercial   22930      6   Panel Truck    yes        0          0         No         0        10     Highly Urban/ Urban      0.39             1        $1,826.72  

 3154       0       65       0       10    85894      No       302832      Yes      M          Masters          Manager        37      Private     23990      3     Minivan      yes        0          0         No         2        19     Highly Urban/ Urban      0.08             0         $-100.26  

 3160       0       38       0       12    27370      No       111642      Yes      M        High School        Clerical       14      Private     22880      4     Minivan      yes        0          0         Yes        0         9     Highly Urban/ Urban      0.37             1        $1,019.14  

 3167       0       54       0       13    63339      No         0         No       M        High School      Blue Collar      33     Commercial    8450     10     Pickup       no         0          0         No         0       3.81    Highly Rural/ Rural      0.08             0         $630.94   

 3170       0       49       0       14    26301      No         0         Yes      F         Bachelors         Student        32     Commercial   19780      4       SUV        no        1645        1         No         3        12     Highly Urban/ Urban      0.36             1        $2,006.36  

 3173       0       49       0       13    46507      No       153166      Yes      F        High School      Professional     32      Private      5590      6       SUV        no       14074        3         Yes        0         7     Highly Urban/ Urban      0.23             0        $1,845.24  

 3174       0       48       0        9    43636      No         0         No       F         Bachelors         Student        34      Private      8910     20       SUV        no        957         3         No         5        14     Highly Urban/ Urban       0.4             1        $1,461.39  

 3177       0       51       0       15    128221     No       303037      No       M          Masters           Lawyer        71      Private     19610      3       Van        yes        0          0         No         0         8     Highly Urban/ Urban      0.16             0        $1,976.49  

 3179       0       41       0       13    40466      No         0         No       F        High School        Clerical       21      Private      5600     10     Minivan      no         0          0         No         1         1     Highly Urban/ Urban      0.38             1        $1,095.10  

 3184       0       31       1       13    42492      No       163297      Yes      M        High School        Clerical       14      Private      8850      1     Pickup       yes       1109        3         No         5         8     Highly Urban/ Urban      0.34             1        $2,226.34  

 3190       0       47       0       10    59963      No       195091      Yes      M            PhD            Manager        18     Commercial   24400      6   Panel Truck    yes      23116        3         Yes        0         9     Highly Urban/ Urban      0.24             0        $1,855.33  

 3193       0       49       0       15    88689      No       274564      Yes      F          Masters           Lawyer        40      Private     14590      4     Minivan      no         0          0         No         0       14.79   Highly Urban/ Urban      0.09             0          $96.31   

 3199       0       55       0       12    39833      No       156508      Yes      F        High School      Blue Collar      32      Private      5480     12   Sports Car     no        8806        1         No         3         1     Highly Urban/ Urban      0.25             0        $1,852.97  

 3201       0       45       0       11    177365     No       395313      Yes      F          Masters           Lawyer        20      Private     49940      7   Sports Car     no         0          0         No         3        14     Highly Urban/ Urban      0.11             0        $1,019.29  

 3202       0       44       0        7    18189      No       128578      Yes      M        High School        Clerical       12     Commercial   17350     10       Van        no         0          0         No         0         8     Highly Urban/ Urban      0.39             1        $1,763.90  

 3203       0       51       0       14    15732      No       104143      Yes      F         Bachelors        Home Maker      45      Private      1500      1       SUV        no        5379        3         No         7        12     Highly Urban/ Urban      0.34             1        $2,483.29  

 3206       0       28       1        8     4843      Yes        0         No       M   Less Than High School   Student        21      Private      1980      9     Minivan      yes       3018        3         No         5         1     Highly Urban/ Urban      0.53             1        $2,955.57  

 3209       0       43       0       13    35293      No         0         No       F   Less Than High School   Clerical       28      Private      9330      6       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.05             0         $324.18   

 3210       1       37       2       13    31212      No       155824      Yes      M        High School        Clerical       36      Private     10100      1     Pickup       yes      11626        2         No         0         1     Highly Urban/ Urban       0.3             1        $2,182.20  

 3217       0       37       2        8    82971      No       240550      Yes      F          Masters        Professional     40     Commercial   23710      1     Pickup       no         0          0         No         2        13     Highly Urban/ Urban      0.24             0        $2,184.89  

 3220       2       42       2       12    72710      Yes        0         No       F          Masters         Home Maker      67      Private     18710     10   Sports Car     no         0          0         No         1        12     Highly Rural/ Rural      0.07             0        $1,606.50  

 3228       0       33       3       12    74546      No       245205      Yes      M         Bachelors       Blue Collar      22     Commercial   12250      1     Minivan      no        3961        3         No         5         9     Highly Urban/ Urban      0.44             1        $2,448.59  

 3232       0       55       0       16    97890      No       325876      Yes      M          Masters           Lawyer        10      Private     25040      4     Minivan      yes        0          0         No         0        18     Highly Urban/ Urban      0.09             0         $-182.83  

 3239       1       44       1       16    173412     No       431274      Yes      M            PhD          Professional     16     Commercial   41710      6   Panel Truck    no         0          0         No         0        14     Highly Urban/ Urban      0.22             0        $2,136.86  

 3243       0       45       3       11    207123     Yes      488301      No       F            PhD            Manager        42     Commercial   34320      1     Pickup       no        583         4         No         3         5     Highly Urban/ Urban      0.24             0        $3,329.43  

 3245       0       46       0        5    75983      No       252802      Yes      M          Masters          Manager        17     Commercial   22100      4       Van        yes        0          0         No         0        14     Highly Urban/ Urban      0.12             0         $832.01   

 3246       0       35       2       14    29250      No       159239      Yes      F        High School      Blue Collar      45     Commercial   23380      1     Pickup       no         0          0         No         1         7     Highly Urban/ Urban      0.36             1        $2,220.25  

 3251       0       49       1       12    98175      No       321272      Yes      F          Masters           Lawyer        27      Private     16220      3     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.09             0         $-31.03   

 3253       0       38       0        9     2726      No         0         Yes      M   Less Than High School   Student        51      Private      1770      1     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.22             0        $1,308.21  

 3257       1       37       1        9    65402      No       202381      Yes      F        High School      Blue Collar      62      Private     11740      1   Sports Car     no         0          0         No         0         7     Highly Rural/ Rural      0.03             0         $508.91   

 3260       0       51       0       14    45771      No       200101      Yes      M        High School      Professional     61      Private     13760      6     Minivan      yes        0          0         No         0         1     Highly Rural/ Rural      0.01             0         $-554.18  

 3261       0       49       0       13    43560      No       174690      Yes      M         Bachelors         Clerical       35     Commercial   10760      4     Pickup       yes        0          0         No         0         7     Highly Urban/ Urban      0.34             1        $1,863.64  

 3263       0       48       0        0      0        No       105542      Yes      F        High School       Home Maker      24      Private     19250     13   Sports Car     no        5245        2         No         2         1     Highly Urban/ Urban      0.39             1        $1,947.53  

 3278       0       50       0       11    167365     No       404405      No       M            PhD            Manager        48     Commercial   35640      4   Panel Truck    yes        0          0         No         1       13.91   Highly Urban/ Urban       0.2             0        $1,985.20  

 3281       0       57       0        0     7242      No         0         Yes      M   Less Than High School   Student        7       Private     21550      3     Minivan      no       42944        1         Yes        0         1     Highly Urban/ Urban      0.33             1        $1,070.23  

 3283       0       48       0        0      0        No         0         Yes      M         Bachelors         Student        45     Commercial    6300      1     Pickup       no         0          0         No         0         7     Highly Rural/ Rural       0.1             0         $638.01   

 3290       0       62       0       13     2861      No       118797      Yes      F        High School       Home Maker      39      Private     23740     11   Sports Car     no         0          0         No         2        11     Highly Rural/ Rural      0.03             0         $-266.01  

 3297       0       30       2       12    56253      No       142627      Yes      M         Bachelors       Professional     9      Commercial    6600     10     Pickup       yes       2986        1         No         5        13     Highly Urban/ Urban      0.37             1        $1,893.37  

 3304       0       53       0       13    114746     No       336124      Yes      F          Masters           Lawyer        13      Private     12970      6       SUV        no         0          0         No         1        15     Highly Urban/ Urban       0.1             0         $422.79   

 3305       0       37       0       11    22632      No       142769      No       F   Less Than High School Blue Collar      56      Private     19970     13     Pickup       no         0          0         Yes        1         7     Highly Urban/ Urban      0.57             1        $2,091.49  

 3307       0       45       0       12    101949     No       322926      Yes      F            PhD            Manager        5       Private     11160      1   Sports Car     no         0          0         No         0        16     Highly Urban/ Urban      0.06             0         $163.86   

 3308       0       42       3       11    124375     No       339138      Yes      M          Masters          Manager        47     Commercial   29920      1   Panel Truck    no        3199        2         No         4         8     Highly Urban/ Urban      0.18             0        $2,175.30  

 3313       0       50       0       13    34101      No         0         No       F   Less Than High School Blue Collar      15      Private     12580      4       SUV        no         0          0         No         0         4     Highly Urban/ Urban      0.32             1        $1,767.86  

 3314       0       53       0       14    18635      No       119212      Yes      M   Less Than High School Blue Collar      14      Private     14970      6     Minivan      yes       1358        3         No         5         1     Highly Urban/ Urban      0.36             1        $1,973.20  

 3317       0       43       0       12     2346      No       99554       Yes      F         Bachelors         Student        25     Commercial   24500     10       Van        no         0          0         No         0         7     Highly Urban/ Urban      0.37             1        $1,328.89  

 3348       2       42       2       11    130454     No       321982      Yes      F          Masters          Manager        27      Private     28370      7     Pickup       no         0          0         No         0        15     Highly Urban/ Urban      0.12             0         $145.10   

 3350       0       50       0       12    109639     No       317460      Yes      F          Masters           Lawyer        44      Private     17460      4   Sports Car     no        5516        3         No         6        20     Highly Urban/ Urban      0.19             0        $2,220.71  

 3359       0       51       0       16    29138      No         0         No       F          Masters           Lawyer        16      Private      6390      1       SUV        no         0          0         No         0        17     Highly Rural/ Rural      0.03             0         $-347.84  

 3367       0       53       0       14    28535      No       145198      Yes      M   Less Than High School Blue Collar      90     Commercial    9650      9     Pickup       no         0          0         No         0         5     Highly Rural/ Rural      0.05             0         $766.13   

 3376       0       56       0       13    59152      No       236150      No       M            PhD             Doctor        49      Private     16150      1     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.13             0        $1,055.01  

 3378       0       40       1        9    42745      No       168433      Yes      M   Less Than High School Blue Collar      25      Private     19670     16       Van        yes      34492        3         Yes        3         6     Highly Urban/ Urban      0.42             1        $2,090.22  

 3384       1       44       3       15    31728      Yes        0         No       F        High School        Clerical       28      Private      9070      6       SUV        no        5897        3         No         5         1     Highly Urban/ Urban      0.66             1        $4,109.32  

 3386       0       32       1        6    100057     Yes      215744      No       M        High School      Blue Collar      45     Commercial   11250      6     Pickup       no         0          0         No         2         1     Highly Rural/ Rural      0.09             0        $1,925.45  

 3387       0       46       0        9    116602     No       295080      No       M            PhD             Doctor        42      Private      6100      7     Pickup       yes        0          0         No         0        13     Highly Urban/ Urban      0.11             0         $604.28   

 3388       0       63       0       13    18213      No       158150      No       F        High School        Clerical       49      Private     18540      1   Sports Car     no        5139        2         No         0         1     Highly Rural/ Rural      0.06             0        $1,252.26  

 3390       0       43       0        8    25713      No         0         Yes      F   Less Than High School   Student        31      Private     12470      1   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.02             0         $-139.94  

 3391       0       33       0       10    101191     No       112181      No       F         Bachelors       Blue Collar      33     Commercial   11620      4       SUV        no         0          0         No         1         4     Highly Urban/ Urban      0.45             1        $2,543.26  

 3396       1       38       1       12    90596      Yes        0         No       M         Bachelors         Manager        19      Private     10560      1     Pickup       no         0          0         No         0       8.38    Highly Urban/ Urban      0.18             0        $1,334.87  

 3398       0       55       0       13    70093      No       210623      Yes      F         Bachelors       Blue Collar      60      Private      8510      1       SUV        no         0          0         No         1         3     Highly Rural/ Rural      0.02             0         $-56.96   

 3404       0       55       0       14    98980      No       335018      Yes      M            PhD             Doctor        36      Private     22460      3     Minivan      yes        0          0         No         0        18     Highly Urban/ Urban      0.06             0         $-337.31  

 3406       0       39       3       14    85127      No       264482      Yes      M         Bachelors       Professional     45     Commercial   23610      1   Panel Truck    no         0          0         No         0         1     Highly Rural/ Rural      0.02             0         $537.20   

 3407       0       35       0       10    32655      No       148303      No       M   Less Than High School   Clerical       43      Private      8270      3     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural      0.05             0         $588.64   

 3414       0       60       0       15    52146      No       207382      No       M            PhD             Doctor        24      Private     12710     11     Minivan      no         0          0         No         0        19     Highly Urban/ Urban      0.14             0         $-175.40  

 3419       0       47       0       11    69339      No       175750      Yes      F          Masters        Professional     50      Private     12560      6       SUV        no         0          0         No         0        25     Highly Urban/ Urban      0.11             0         $883.40   

 3423       0       36       0        5    16034      No         0         No       F   Less Than High School Blue Collar      42      Private      7940      1       SUV        no        9459        1         No         1         1     Highly Urban/ Urban      0.41             1        $2,720.79  

 3427       0       35       2       12    26372      No       180846      Yes      M        High School        Clerical       54      Private      6870      1     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural      0.03             0         $119.23   

 3432       0       54       0       11    63442      No       167921      No       M            PhD             Doctor        33      Private     23220     10     Minivan      yes        0          0         No         0        16     Highly Urban/ Urban      0.13             0          $33.45   

 3434       0       42       0       11    59142      No       180336      Yes      M          Masters          Manager        43      Private     12900      6     Minivan      no         0          0         No         0       12.98   Highly Urban/ Urban      0.07             0         $-289.01  

 3438       0       38       0       10    142002     No       345671      Yes      M         Bachelors         Manager        33      Private     19500      4     Minivan      yes        0          0         No         4        12     Highly Urban/ Urban      0.09             0         $-117.11  

 3442       0       39       0       10    54818      No       244266      Yes      M         Bachelors         Manager        48      Private     10880      4     Pickup       yes        0          0         Yes        0        11     Highly Urban/ Urban      0.14             0         $364.49   

 3443       0       46       0       12    44763      No         0         No       F        High School      Blue Collar      39     Commercial   19070      4     Minivan      no         0          0         No         0         1     Highly Rural/ Rural      0.09             0         $509.49   

 3448       0       56       0       12    42267      No       164891      Yes      F         Bachelors         Manager        7       Private     20170      1       SUV        no         0          0         No         1       8.49    Highly Urban/ Urban      0.09             0         $-153.97  

 3456       0       48       0        0      0        No         0         No       M   Less Than High School   Student        41      Private      7970      1     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural       0.1             0         $819.86   

 3464       0       48       0       12    40743      No       169213      Yes      F        High School        Clerical       14      Private     20040     10     Minivan      no         0          0         Yes        0         1     Highly Urban/ Urban      0.35             1         $645.04   

 3470       0       39       3       16    22626      No       60718       Yes      F   Less Than High School Blue Collar      46      Private      1500      1   Sports Car     no        5764        1         No         3         7     Highly Urban/ Urban      0.29             1        $2,544.75  

 3475       0       39       3       14    51524      Yes        0         No       F   Less Than High School Blue Collar      41      Private     20840      3       SUV        no         0          0         No         1         1     Highly Urban/ Urban      0.33             1        $2,981.02  

 3477       0       45       2       13    136408     Yes        0         No       F            PhD            Manager        26     Commercial   22370      8     Pickup       no        1463        2         No         0        17     Highly Urban/ Urban      0.19             0        $1,848.79  

 3490       0       52       0       14    37239      No       191937      Yes      F          Masters          Manager        22      Private     11900      3       SUV        no         0          0         No         0        12     Highly Urban/ Urban      0.08             0         $130.46   

 3493       0       44       0       13    32713      No       166614      Yes      F        High School        Clerical       84     Commercial   32130      9     Pickup       no         0          0         No         1         6     Highly Urban/ Urban      0.39             1        $2,235.65  

 3502       0       35       3        0     1563      Yes        0         No       M   Less Than High School   Student        15      Private      5000      1     Minivan      yes       3969        2         No         1       3.93    Highly Urban/ Urban      0.42             1        $2,464.90  

 3508       0       35       0       10    44839      No       195156      Yes      M        High School        Clerical       5      Commercial   27030      6       SUV        no        5068        1         No         2         1     Highly Rural/ Rural      0.06             0         $706.13   

 3516       0       45       1       14    77563      No       195375      Yes      F        High School      Blue Collar      21      Private     23750     15       SUV        no         0          0         No         0         4     Highly Urban/ Urban      0.15             0         $497.86   

 3517       0       56       2       15    44022      No         0         Yes      F         Bachelors         Student        41      Private     14670      4   Sports Car     no        8818        2         No         0        13     Highly Urban/ Urban      0.13             0        $1,021.12  

 3525       0       37       0       13    82444      No       226818      No       M          Masters          Manager        5      Commercial    9740      1     Pickup       yes        0          0         No         1        15     Highly Urban/ Urban      0.25             0        $1,226.34  

 3532       0       59       0        0      0        No       145884      No       F        High School        Student        13     Commercial    7400      1   Sports Car     no        5259        1         No         1         8     Highly Urban/ Urban      0.72             1        $3,252.15  

 3535       1       45       2        0      0        No       82151       Yes      F         Bachelors        Home Maker      29      Private      4750      6       SUV        no         0          0         No         0        10     Highly Urban/ Urban      0.43             1        $1,480.27  

 3536       2       41       3       14    13393      No       125873      Yes      F   Less Than High School   Clerical       31      Private      5600      3       SUV        no        1479        2         No         5         7     Highly Urban/ Urban      0.65             1        $3,363.56  

 3540       0       63       0       15    47276      No       203372      Yes      M          Masters           Lawyer        30      Private     30480      3       SUV        no         0          0         No         1         5     Highly Urban/ Urban      0.13             0        $1,498.92  

 3547       0       29       1       12    142531     Yes        0         No       M          Masters        Professional     39      Private     20040      7       Van        no        5077        2         No         2        12     Highly Urban/ Urban      0.21             0        $2,911.71  

 3550       0       25       3       15    71892      No       211306      Yes      F        High School      Blue Collar      21     Commercial   27470      6     Pickup       no        3340        2         No         6         9     Highly Urban/ Urban      0.48             1        $2,565.79  

 3557       0       27       3        9    45803      Yes      88654       No       M        High School      Blue Collar      20     Commercial   11920      4     Pickup       yes       2043        1         No         1         1     Highly Urban/ Urban      0.51             1        $3,475.55  

 3562       0       46       0        0      0        No         0         No       M        High School        Student        23     Commercial   17380      4       Van        yes        0          0         No         3         1     Highly Rural/ Rural      0.26             0        $1,933.96  

 3563       0       56       0       15    122772     No       362667      Yes      F            PhD             Doctor        54      Private     13800      6   Sports Car     no         0          0         No         0       12.95   Highly Urban/ Urban      0.05             0         $469.10   

 3564       0       32       2       11    111655     Yes        0         No       F          Masters           Lawyer        41      Private     18430      4       SUV        no         0          0         No         1        25     Highly Urban/ Urban      0.19             0        $1,863.94  

 3570       0       42       0       12    34810      No         0         No       M        High School      Blue Collar      20     Commercial    9180      1     Pickup       yes        0          0         No         1        11     Highly Rural/ Rural       0.1             0         $962.94   

 3573       0       32       1        0      0        No         0         Yes      M   Less Than High School   Student        48      Private     12500      7     Minivan      no        3983        1         No         3         1     Highly Urban/ Urban      0.45             1        $1,931.57  

 3577       0       45       2       13    46458      No       240926      Yes      F        High School      Blue Collar      41     Commercial   14250     10       SUV        no         0          0         Yes        0         1     Highly Urban/ Urban      0.48             1        $2,413.91  

 3579       0       47       0        8    36302      No         0         No       F        High School        Clerical       50      Private     11170     10       SUV        no        2549        4         No         3       4.45    Highly Urban/ Urban      0.46             1        $2,786.02  

 3581       0       53       0       15    18626      No       99602       Yes      M        High School        Student        45     Commercial    1500      1     Minivan      yes        0          0         No         0         9     Highly Rural/ Rural      0.04             0         $-110.64  

 3587       0       51       0       13    94587      No       258739      No       F         Bachelors        Home Maker      18      Private     10370      7       SUV        no         0          0         Yes        2         7     Highly Urban/ Urban      0.39             1        $1,588.67  

 3602       0       34       2       13    17753      No       113850      Yes      F   Less Than High School   Clerical       37      Private     14760      1       SUV        no         0          0         No         2         1     Highly Urban/ Urban       0.3             1        $2,177.77  

 3609       0       50       0       13    42870      No       186519      Yes      M        High School        Manager        28     Commercial   11190      6     Pickup       no        7812        2         No         6        12     Highly Urban/ Urban      0.29             1        $1,882.77  

 3612       0       54       0      11.04  18917      No       118361      Yes      M         Bachelors       Professional     6      Commercial    9730      6     Pickup       yes        0          0         No         0        11     Highly Urban/ Urban      0.27             0        $1,269.09  

 3621       0       44       2       14    20676      No       148332      Yes      F        High School      Professional     51      Private      3570      1       SUV        no         0          0         No         0         9     Highly Urban/ Urban      0.15             0        $1,588.62  

 3642       0       52       0       10    112953     No         0         No       M          Masters          Manager        33     Commercial   23640     11   Panel Truck    yes        0          0         No         0        12     Highly Urban/ Urban       0.2             0        $1,164.53  

 3647       1       41       3       11    50840      Yes      204326      No       F        High School      Blue Collar      44     Commercial   10680      4       SUV        no         0          0         No         1         1     Highly Urban/ Urban      0.62             1        $4,073.10  

 3649       1       60       2       12    44830      Yes      187429      No       M        High School      Professional     35      Private     20040      4     Minivan      yes       6456        3         No         1         8     Highly Urban/ Urban      0.36             1        $2,889.06  

 3654       0       45       3       15    12158      Yes        0         No       F   Less Than High School   Clerical       22      Private     22410      3     Minivan      no        3636        1         No         5         1     Highly Urban/ Urban      0.61             1        $3,137.80  

 3660       0       39       0       11    33037      No       118221      Yes      M        High School        Clerical       38      Private      9950      6     Pickup       no        5829        3         Yes        1         1     Highly Urban/ Urban       0.4             1        $2,292.34  

 3665       0       47       0       14    19483      No       81685       Yes      M        High School        Clerical       54      Private      9150      4     Pickup       no       20115        1         Yes        6         3     Highly Urban/ Urban      0.62             1        $3,201.97  

 3669       0       43       0        9    121075     No         0         No       F          Masters           Lawyer        16      Private      5800      1       SUV        no        2069        3         No         2        17     Highly Urban/ Urban      0.21             0        $1,742.49  

 3673       0       55       0       14    131277     No         0         No       F            PhD            Manager        30     Commercial   40580     10       Van        no        6680        2         No         3        16     Highly Urban/ Urban      0.27             0        $1,937.12  

 3675       0       49       0        5     9316      No       138563      No       M            PhD            Manager        10     Commercial   23570      6   Panel Truck    no        1208        1         Yes        2         9     Highly Urban/ Urban       0.6             1        $2,698.12  

 3678       1       38       3        0      0        No         0         Yes      F   Less Than High School   Student        32      Private      5340     14       SUV        no        5290        1         No         0         4     Highly Rural/ Rural      0.08             0         $-42.50   

 3680       0       35       0       13    24696      No         0         Yes      F         Bachelors         Student        31     Commercial    7470      6       SUV        no        4350        1         No         2         8     Highly Urban/ Urban      0.33             1        $1,847.12  

 3686       0       49       0        0      0        No         0         Yes      M   Less Than High School   Student        23     Commercial   11610     10     Pickup       no        3996        1         No         5         1     Highly Urban/ Urban      0.69             1        $3,038.44  

 3693       0       43       0        6    132108     No         0         No       M            PhD            Manager        11     Commercial   19010     11       Van        yes      11909        1         No         4        17     Highly Urban/ Urban      0.31             1        $1,884.89  

 3710       0       50       0       14    51064      No       97670       No       M         Bachelors       Blue Collar      50     Commercial   10210      1     Pickup       yes        0          0         No         5         9     Highly Urban/ Urban      0.65             1        $3,472.83  

 3713       0       56       0      10.86  18261      No       98659       Yes      F   Less Than High School Blue Collar      32      Private      7100      1       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.03             0          $40.83   

 3718       0       27       3       12    78418      Yes      224245      No       F        High School      Professional     5       Private     21860      1       SUV        no        4740        3         No         0         8     Highly Urban/ Urban       0.2             0        $2,321.77  

 3725       2       43       3       12    52906      No         0         Yes      F        High School        Student        40      Private     11090      1       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.04             0         $249.92   

 3726       0       47       0       13    16980      No       138507      Yes      F   Less Than High School   Clerical       27      Private     10440      1       SUV        no         0          0         No         3       3.09    Highly Urban/ Urban      0.33             1        $2,178.95  

 3747       0       53       0       13    110911     No       335699      Yes      M         Bachelors       Professional     49     Commercial   25840     17   Panel Truck    yes      10474        2         No         1         7     Highly Urban/ Urban       0.2             0        $1,653.70  

 3753       0       40       3       10    48654      No       157515      Yes      F   Less Than High School Blue Collar      21      Private     17200      4       SUV        no         0          0         No         0         6     Highly Rural/ Rural      0.02             0         $-525.34  

 3754       0       47       0       12    55019      No       206801      Yes      F         Bachelors       Professional     51      Private     11700      4       SUV        no        2257        2         No         3         9     Highly Urban/ Urban      0.17             0        $1,838.57  

 3760       0       34       0        9    15363      No         0         No       M   Less Than High School Blue Collar      27     Commercial   18660      1       Van        yes        0          0         Yes        3         1     Highly Urban/ Urban       0.8             1        $4,224.03  

 3763       0       50       0      11.45  114923     No       298946      Yes      F            PhD             Doctor        30      Private     17990     10     Minivan      no         0          0         No         7        26     Highly Urban/ Urban      0.14             0         $-44.97   

 3765       1       41       2        8    96330      Yes      250551      No       M          Masters           Lawyer        23      Private     22060      1     Minivan      no        4165        1         No         4        18     Highly Urban/ Urban      0.38             1        $2,590.77  

 3769       0       44       0       12    33474      No       78982       Yes      M        High School        Clerical       23      Private      9940     10     Pickup       no        4266        1         No         1         1     Highly Urban/ Urban      0.24             0        $1,268.12  

 3771       0       35       0        9    46255      No         0         No       M        High School        Manager        37     Commercial   21180      4       Van        no        8194        2         No         2         1     Highly Urban/ Urban      0.32             1        $2,521.95  

 3784       0       50       0       10    45620      No       170796      Yes      F         Bachelors         Manager        20      Private     15020     10   Sports Car     no         0          0         No         3         5     Highly Urban/ Urban      0.11             0         $336.99   

 3787       0       44       3       11    84007      No       240372      Yes      M         Bachelors       Professional     24      Private     15980      6     Minivan      yes       6935        2         No         8         8     Highly Urban/ Urban      0.28             0        $1,829.10  

 3794       0       29       3       10    53643      Yes        0         No       F        High School        Clerical       54      Private      9760      1       SUV        no         0          0         Yes        1        11     Highly Rural/ Rural      0.11             0        $1,642.76  

 3796       0       48       0       15    35565      No       186229      Yes      M        High School      Blue Collar      59     Commercial   19510      3       Van        no         0          0         No         1       4.66    Highly Rural/ Rural      0.05             0        $1,090.73  

 3798       0       44       0       12    62741      No       173680      Yes      M          Masters           Lawyer        30      Private     12170      6     Minivan      no         0          0         No         0         9     Highly Urban/ Urban      0.11             0         $358.29   

 3809       0       41       0        7    20766      No       119899      Yes      M   Less Than High School Blue Collar      43      Private     14430      1     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.21             0        $1,396.86  

 3812       1       41       1       13    94116      Yes      263819      No       M          Masters        Professional     18     Commercial   24650     15   Panel Truck    no         0          0         No         3        14     Highly Urban/ Urban      0.55             1        $3,327.52  

 3819       0       45       3       14    61952      Yes      252391      No       F   Less Than High School   Clerical       20      Private     31010      6       Van        no         0          0         No         1       4.96    Highly Urban/ Urban      0.35             1        $2,424.93  

 3828       0       50       0        0      0        No       61314       Yes      F         Bachelors        Home Maker      35      Private     18050     10       SUV        no        3485        1         No         0        12     Highly Urban/ Urban      0.32             1        $1,034.78  

 3831       0       39       0        9    16929      No       147219      Yes      F   Less Than High School Blue Collar      24      Private      7090      4   Sports Car     no         0          0         No         0         1     Highly Urban/ Urban      0.21             0        $1,735.54  

 3833       0       48       0       12    64916      No       282967      Yes      M         Bachelors       Blue Collar      34     Commercial   12790     10     Minivan      yes        0          0         No         0        11     Highly Urban/ Urban      0.28             0         $964.57   

 3837       0       28       3        0      0        No         0         Yes      F   Less Than High School   Student        29      Private      1500      4       SUV        no        3202        2         No         8         5     Highly Urban/ Urban      0.63             1        $3,141.70  

 3839       2       41       2        9    93150      Yes      274760      No       M        High School        Manager        49     Commercial   10810      4     Pickup       no        6985        1         No         2         1     Highly Urban/ Urban      0.49             1        $3,579.38  

 3843       0       40       2       10    50700      Yes        0         No       F        High School      Blue Collar      15     Commercial   10570     17       SUV        no         0          0         No         0         6     Highly Urban/ Urban      0.47             1        $2,400.90  

 3846       0       53       0        0      0        No       32749       No       M   Less Than High School   Student        53     Commercial   18290     10       Van        yes        0          0         No         0         1     Highly Rural/ Rural      0.19             0        $1,563.75  

 3854       0       43       2       14    19916      No       129144      Yes      M        High School        Clerical       43      Private      8340      1     Pickup       yes        0          0         No         0         6     Highly Rural/ Rural      0.03             0         $-84.93   

 3861       0       48       0       13    96479      No       287237      No       F          Masters          Manager        27      Private     15950      9       SUV        no         0          0         No         0        21     Highly Urban/ Urban      0.12             0          $99.80   

 3864       0       51       0       12    50991      No       173234      Yes      M        High School      Blue Collar      41     Commercial   11700      1     Pickup       yes        0          0         No         0         7     Highly Urban/ Urban      0.29             1        $2,170.63  

 3868       0       54       0       12    157057     No         0         No       F          Masters          Manager        21      Private     23440      1     Minivan      no         0          0         No         0        13     Highly Urban/ Urban       0.1             0         $-148.74  

 3869       2       43       2       11    98429      No       260696      Yes      F        High School      Blue Collar      35     Commercial    5800      1       SUV        no         0          0         No         0         7     Highly Rural/ Rural      0.08             0        $1,124.94  

 3870       0       35       2       14    76488      No       233303      Yes      F        High School        Clerical       43      Private     12650      4     Minivan      no         0          0         No         2         9     Highly Urban/ Urban      0.22             0         $884.38   

 3883       0       48       0        6    29523      No       158702      Yes      M        High School        Clerical       35      Private      9830      1     Minivan      no         0          0         No         1         1     Highly Urban/ Urban      0.24             0        $1,395.68  

 3886       0       51       0        0      0        No       85559       Yes      F        High School       Home Maker      47      Private      6600      4       SUV        no         0          0         No         0         7     Highly Rural/ Rural      0.05             0         $-12.29   

 3889       0       49       0       14    116587     No       319596      Yes      F         Bachelors       Blue Collar      45     Commercial   30520      1     Pickup       no        8514        1         No         6        12     Highly Urban/ Urban      0.43             1        $2,618.16  

 3894       0       37       3       13    39923      No       133822      Yes      M   Less Than High School Blue Collar      5      Commercial   16530      6       Van        yes      10546        3         No         2         1     Highly Urban/ Urban      0.38             1        $2,574.14  

 3907       0       47       0       14     2825      No       91520       Yes      F         Bachelors        Home Maker      65      Private      6500      1       SUV        no         0          0         No         2        16     Highly Rural/ Rural      0.03             0         $-123.47  

 3910       0       46       0       13    77743      No       250444      Yes      F          Masters          Manager        36      Private     18930      4       SUV        no         0          0         No         1         1     Highly Urban/ Urban      0.07             0         $605.15   

 3913       0       48       0       13    41443      No       180495      Yes      F         Bachelors         Clerical       40      Private      3200      3       SUV        no         0          0         No         0        10     Highly Rural/ Rural      0.02             0         $-554.34  

 3914       0       61       2       16    119013     Yes        0         No       F          Masters           Lawyer        50      Private     31240     14   Sports Car     no        7204        2         No         1        18     Highly Urban/ Urban      0.19             0        $2,122.73  

 3921       0       46       0        0      0        No         0         Yes      M   Less Than High School   Student        5       Private      6000      1     Pickup       no         0          0         No         1         1     Highly Urban/ Urban      0.37             1        $1,510.64  

 3923       0       58       0       14    20473      No         0         No       F         Bachelors        Home Maker      52      Private     17850      1     Minivan      no         0          0         No         0         8     Highly Rural/ Rural      0.04             0         $-631.03  

 3929       0       41       1       12    46874      Yes        0         No       F         Bachelors       Professional     51     Commercial   23560      1     Pickup       no         0          0         No         0         1     Highly Urban/ Urban      0.38             1        $3,269.59  

 3931       0       46       0       12     6576      No       144646      Yes      F        High School       Home Maker      48      Private     24930      1     Pickup       no       23060        1         Yes        6         1     Highly Urban/ Urban      0.54             1        $2,841.41  

 3932       0       37       0        5    27126      No         0         No       F        High School        Clerical       71      Private      4620      7   Sports Car     no        5481        2         No         7         8     Highly Rural/ Rural      0.15             0        $2,101.98  

 3937       0       34       0        0      0        No       121949      No       F         Bachelors        Home Maker      66      Private      6010      6       SUV        no        6682        3         No         2         9     Highly Urban/ Urban      0.58             1        $2,758.87  

 3943       0       40       3       18    19326      No       123479      Yes      M   Less Than High School   Clerical       32      Private      1500      4     Minivan      yes        0          0         No         2         6     Highly Urban/ Urban      0.29             1        $1,408.22  

 3956       0       24       3      11.02  10471      Yes      92585       No       M          Masters         Home Maker      25      Private     13070      3     Minivan      yes        0          0         Yes        3        14     Highly Urban/ Urban      0.59             1        $2,764.13  

 3957       0       33       0       10    34682      No       183265      No       F        High School      Blue Collar      22      Private      6380      3   Sports Car     no        1564        2         No         0        10     Highly Urban/ Urban      0.32             1        $2,126.52  

 3961       0       38       0       10    59578      No         0         No       M         Bachelors       Blue Collar      51     Commercial   11260      4     Pickup       yes       5436        3         No         0        10     Highly Urban/ Urban      0.45             1        $2,754.11  

 3971       0       52       0       13    81937      No       92680       No       F          Masters           Lawyer        27      Private     13000      4   Sports Car     no         0          0         No         0        12     Highly Urban/ Urban      0.18             0        $1,563.33  

 4004       0       45       0       13    103134     No       117315      No       F          Masters           Lawyer        38      Private     11810      1       SUV        no         0          0         No         1        21     Highly Urban/ Urban       0.2             0        $1,459.50  

 4005       0       56       0       11    134164     No       352609      Yes      M         Bachelors       Professional     45      Private     37200      1     Minivan      yes        0          0         No         1        10     Highly Urban/ Urban       0.1             0         $751.15   

 4006       0       39       0       14    93077      No       244764      Yes      M         Bachelors       Professional     29     Commercial   24480     14   Panel Truck    yes        0          0         No         1         1     Highly Rural/ Rural      0.03             0         $-106.48  

 4011       0       45       0       10    25920      No       141066      Yes      M        High School        Clerical       41      Private     13990      7     Minivan      no         0          0         No         1         5     Highly Urban/ Urban      0.25             0        $1,081.87  

 4013       0       49       0       11    124114     No         0         No       F          Masters          Manager        42      Private     21930     10       SUV        no         0          0         No         3        19     Highly Urban/ Urban      0.16             0         $738.29   

 4014       0       44       0       13    62093      No       202671      Yes      F        High School        Manager        9       Private      8620      9       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.09             0          $8.57    

 4016       2       39       2      11.79  21891      No       167752      Yes      M   Less Than High School Blue Collar      34     Commercial   15110      1     Minivan      no         0          0         No         0         5     Highly Urban/ Urban      0.57             1        $2,766.57  

 4017       0       38       0       13    28231      No       182332      Yes      F         Bachelors        Home Maker      36      Private      8120      1       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.02             0         $-576.45  

 4020       1       60       1       14    54458      No       229652      Yes      M        High School      Blue Collar      33     Commercial   10980     10     Pickup       no         0          0         No         1         1     Highly Rural/ Rural      0.07             0         $679.68   

 4022       0       36       0       11    100788     No       300113      Yes      F          Masters          Manager        18     Commercial   36970      9   Panel Truck    no         0          0         No         6        18     Highly Urban/ Urban      0.24             0        $1,092.71  

 4026       0       55       0       10    52936      No         0         No       F            PhD           Home Maker      61      Private     17720      1     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.22             0        $1,439.67  

 4032       0       48       0       13    75931      No       237478      Yes      M          Masters        Professional     26     Commercial   28210      4   Panel Truck    yes        0          0         No         0        10     Highly Urban/ Urban       0.2             0        $1,985.11  

 4043       0       51       0       12    221817     No       551915      Yes      F            PhD             Doctor        23      Private     43510      1       SUV        no        6302        2         No         2        16     Highly Urban/ Urban      0.06             0         $455.14   

 4045       1       36       2       14    112555     No       323999      Yes      M         Bachelors       Blue Collar      22     Commercial    4560      7     Pickup       yes        0          0         No         1        14     Highly Urban/ Urban      0.37             1        $1,680.24  

 4048       0       49       0       12    30469      No       113356      No       M            PhD             Doctor        49      Private     17070      4     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.16             0         $631.98   

 4051       0       57       1       14    18775      No       182712      Yes      F          Masters         Home Maker      68      Private      9080      1   Sports Car     no       10842        2         No         4        14     Highly Rural/ Rural      0.03             0         $927.11   

 4052       0       63       1       12    32901      Yes        0         No       F          Masters          Manager        48      Private     20490      7   Sports Car     no         0          0         No         0        13     Highly Urban/ Urban      0.16             0        $1,725.56  

 4056       0       40       0        6    38416      No       127952      Yes      F        High School       Home Maker      42      Private      5500      1   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.01             0         $-118.40  

 4059       0       44       0       11    134672     No       336381      No       F          Masters           Lawyer        28      Private     30660      9     Minivan      no         0          0         No         0        20     Highly Urban/ Urban      0.16             0          $94.62   

 4069       2       42       2       14    28524      No       142298      Yes      F        High School       Home Maker      13      Private      9480      4       SUV        no         0          0         No         0         8     Highly Rural/ Rural      0.04             0         $-291.88  

 4074       0       48       0       12    13023      No       154122      Yes      F   Less Than High School   Clerical       37      Private      9550      1   Sports Car     no        7000        1         No         1         8     Highly Urban/ Urban      0.28             1        $2,214.53  

 4076       0       52       0       12    80142      No       224539      No       M         Bachelors       Professional     35     Commercial   23750      7   Panel Truck    no         0          0         No         3       8.44    Highly Urban/ Urban      0.44             1        $2,739.94  

 4077       0       36       1        9    72167      Yes        0         No       M         Bachelors       Professional     24     Commercial   18550      1       Van        yes       725         2         No         4        14     Highly Urban/ Urban      0.49             1        $3,913.78  

 4079       0       42       0       13    56746      No       176509      No       M        High School      Blue Collar      26     Commercial   11370      4     Pickup       no       17393        1         Yes        3         8     Highly Urban/ Urban      0.74             1        $3,464.45  

 4081       0       46       0       10    21534      No       90467       No       F   Less Than High School Blue Collar      27      Private     24360      1       SUV        no       32589        1         Yes        3         1     Highly Urban/ Urban      0.65             1        $3,288.41  

 4088       0       50       0       11    29944      No       160062      Yes      F   Less Than High School   Clerical       33      Private     15070     13       SUV        no         0          0         No         0       2.98    Highly Urban/ Urban      0.21             0        $1,092.04  

 4105       0       43       0       11    75232      No         0         No       M         Bachelors         Manager        44      Private     15800     10     Minivan      yes        0          0         No         5         7     Highly Urban/ Urban      0.23             0         $749.75   

 4125       0       49       0       12    113801     No       354048      Yes      M            PhD            Manager        30     Commercial    9020      1     Pickup       no         0          0         No         1        13     Highly Urban/ Urban      0.12             0        $1,340.97  

 4134       0       49       0       13    100085     No         0         No       M        High School      Blue Collar      40     Commercial    8420     13     Pickup       yes       9239        1         No         3         1     Highly Urban/ Urban      0.52             1        $2,850.00  

 4139       0       39       0       10    77195      No       230121      Yes      F         Bachelors       Professional     26      Private     26470      6     Minivan      no         0          0         No         0         8     Highly Rural/ Rural      0.01             0        $-1,629.85 

 4146       0       41       0        5    58139      No       195097      Yes      F        High School      Blue Collar      27     Commercial   29680      1       SUV        no         0          0         No         3         8     Highly Rural/ Rural      0.06             0         $856.56   

 4149       0       57       0       12    55119      No       232678      Yes      M          Masters           Lawyer        29      Private     17950      1       Van        yes        0          0         No         0        13     Highly Urban/ Urban      0.11             0        $1,088.98  

 4151       0       32       1       12    93741      Yes        0         No       F         Bachelors       Blue Collar      40     Commercial   14070     13       SUV        no        3132        3         Yes        3         8     Highly Urban/ Urban       0.7             1        $3,834.70  

 4155       0       41       0       10    93856      No         0         No       F        High School      Blue Collar      10      Private     14640      1     Minivan      no         0          0         No         0        10     Highly Urban/ Urban      0.26             0         $711.16   

 4157       0       59       0       14    78271      No       299574      Yes      M         Bachelors       Professional     11     Commercial   17560      6       Van        no         0          0         No         0        11     Highly Urban/ Urban      0.19             0        $1,391.66  

 4168       0       34       4       15     3435      Yes        0         No       F        High School       Home Maker      61      Private      9670      6       SUV        no         0          0         No         1         1     Highly Urban/ Urban      0.38             1        $2,934.09  

 4170       0       29       0       12    58319      No       198219      Yes      M            PhD             Doctor        28      Private      7330      7     Pickup       no        8743        3         No         4         8     Highly Urban/ Urban      0.12             0        $1,116.33  

 4174       0       56       0       14    66605      No       246140      Yes      M            PhD             Doctor        39      Private     11620      4     Pickup       no         0          0         No         0        17     Highly Urban/ Urban      0.07             0         $111.46   

 4179       0       63       2       13    63695      Yes        0         No       F          Masters          Manager        30      Private     14170      3   Sports Car     no        2629        1         No         0        12     Highly Urban/ Urban      0.13             0        $1,752.28  

 4185       0       47       0       10    148168     No       348862      Yes      F          Masters           Lawyer        49      Private      6200      4       SUV        no         0          0         No         0        20     Highly Urban/ Urban      0.08             0         $606.74   

 4199       0       45       2       12    52541      Yes        0         No       F         Bachelors       Professional     28      Private     13400      1       SUV        no        5601        5         No         5        10     Highly Urban/ Urban      0.38             1        $3,624.01  

 4205       0       45       0       12    91613      No       269046      Yes      F          Masters           Lawyer        25      Private     15160      1       SUV        no         0          0         No         0        12     Highly Urban/ Urban      0.09             0         $803.32   

 4208       0       53       0       14    67477      No       252228      Yes      F        High School      Blue Collar      20     Commercial   13550     13       SUV        no         0          0         No         0         8     Highly Rural/ Rural      0.04             0         $-351.10  

 4211       0       38       0       10    25603      No         0         No       F        High School        Clerical       12      Private      7060      1   Sports Car     no        985         1         No         5         1     Highly Urban/ Urban      0.56             1        $3,157.85  

 4212       0       52       0        9    107066     No       331728      Yes      M         Bachelors       Professional     39      Private     17740      1     Minivan      yes        0          0         No         0         9     Highly Urban/ Urban      0.09             0         $593.10   

 4215       0       46       0       10    78374      No         0         No       M        High School      Blue Collar      41     Commercial   18620     11       Van        yes       3181        1         No         5         1     Highly Urban/ Urban      0.62             1        $3,572.57  

 4217       0       45       0       10    42770      No       202242      Yes      F         Bachelors        Home Maker      39      Private     25280      1     Pickup       no         0          0         No         2       8.17    Highly Urban/ Urban      0.16             0         $905.75   

 4219       0       33       1       10    23953      Yes        0         No       F        High School        Clerical       39      Private      7200      1   Sports Car     no        1118        2         No         7         8     Highly Urban/ Urban      0.64             1        $4,433.87  

 4226       0       33       3       10    28853      No       181865      Yes      F        High School        Clerical       19      Private      4390      7       SUV        no       11580        2         Yes        0         1     Highly Urban/ Urban      0.37             1        $1,805.66  

 4227       0       38       2        0      0        No       103951      Yes      F         Bachelors        Home Maker      25      Private      5300     10   Sports Car     no        3987        1         No         2         8     Highly Urban/ Urban      0.39             1        $1,618.88  

 4229       0       64       0      12.25  162255     No       444157      Yes      M          Masters           Lawyer        5       Private     18310      4     Pickup       yes        0          0         No         0         1     Highly Urban/ Urban      0.08             0         $419.09   

 4231       2       41       3       10    90991      No       310709      Yes      M         Bachelors       Professional     43      Private     20960      6     Minivan      yes        0          0         No         1         1     Highly Urban/ Urban      0.25             0        $1,571.56  

 4233       0       47       0        7    10376      No       134694      Yes      F         Bachelors        Home Maker      12      Private      6580      7       SUV        no         0          0         No         0         9     Highly Rural/ Rural      0.02             0        $-1,292.69 

 4237       0       49       0       14    76778      No       209440      Yes      F         Bachelors        Home Maker      62      Private     14080      6   Sports Car     no       13397        1         Yes        1         5     Highly Urban/ Urban      0.22             0        $1,801.73  

 4243       0       42       0        5    45623      No       205504      No       F        High School      Blue Collar      23     Commercial   27440     11       SUV        no        6248        4         No         0         4     Highly Urban/ Urban      0.48             1        $2,669.49  

 4248       1       36       2        6    11559      Yes      109456      No       F   Less Than High School  Home Maker      24     Commercial   18570      1     Pickup       no         0          0         No         0         5     Highly Rural/ Rural      0.12             0        $1,711.16  

 4255       1       58       1       14    87644      No       290988      Yes      F         Bachelors         Manager        37      Private     16060      4       SUV        no         0          0         No         1         9     Highly Urban/ Urban      0.11             0         $394.18   

 4262       0       44       2       13    82586      Yes      277844      No       M        High School      Blue Collar      34     Commercial   15440      6     Minivan      no         0          0         No         0         1     Highly Rural/ Rural      0.07             0        $1,142.25  

 4266       0       40       1        0      0        Yes      100489      No       F   Less Than High School  Home Maker      12      Private      7130      4       SUV        no        8288        2         No         2         1     Highly Urban/ Urban      0.58             1        $3,276.32  

 4268       0       50       0       12    29296      No       173233      Yes      F   Less Than High School Blue Collar      34      Private      9430      6       SUV        no         0          0         No         5         1     Highly Urban/ Urban      0.34             1        $2,287.64  

 4270       0       35       2        0      0        Yes        0         No       F   Less Than High School   Student        12      Private     16010      4       SUV        no        5118        2         No         7         1     Highly Urban/ Urban      0.76             1        $4,070.43  

 4273       0       31       1       13    82762      No       267537      Yes      F         Bachelors         Manager        35      Private     12880      1     Minivan      no         0          0         No         0         4     Highly Urban/ Urban      0.06             0         $-552.33  

 4276       0       36       0       11    87659      No       217976      Yes      M          Masters          Manager        13     Commercial   26180      1   Panel Truck    no         0          0         No         0        17     Highly Urban/ Urban      0.12             0         $669.66   

 4277       0       57       0      11.5   70915      No       218477      Yes      M         Bachelors       Professional     22     Commercial   29070      1   Panel Truck    no         0          0         No         0        12     Highly Urban/ Urban       0.2             0        $1,675.49  

 4279       0       57       0       13    89127      No       314698      Yes      M            PhD            Manager        5      Commercial    8540      3     Pickup       yes       2272        2         No         6        18     Highly Urban/ Urban      0.25             0        $1,793.59  

 4299       0       37       0       12    93094      No         0         No       M        High School      Professional     22      Private     14710      6     Minivan      no         0          0         No         0         8     Highly Urban/ Urban      0.19             0         $990.44   

 4313       0       52       0       13    86473      No       285382      No       M        High School      Blue Collar      26     Commercial   20060      7       Van        yes        0          0         No         0        12     Highly Rural/ Rural      0.07             0         $635.42   

 4322       0       58       1       17    52953      No       249239      Yes      F          Masters          Manager        8       Private     29850      6     Pickup       no         0          0         No         2         9     Highly Urban/ Urban      0.09             0         $-198.98  

 4324       0       41       0       11    25699      No         0         Yes      M        High School        Student        39     Commercial    8170      4     Pickup       yes        0          0         No         1         1     Highly Rural/ Rural      0.04             0         $394.32   

 4328       0       22       1        7     2214      No       114501      Yes      F   Less Than High School  Home Maker      32      Private     17470     13       SUV        yes       9453        1         No         6         1     Highly Urban/ Urban       0.4             1        $2,164.10  

 4331       0       45       2        0      0        Yes        0         No       M   Less Than High School   Student        40      Private     13810     11     Minivan      no         0          0         No         0       4.71    Highly Urban/ Urban      0.52             1        $2,183.12  

 4335       0       54       0       12    62013      No       204404      Yes      M          Masters        Professional     48     Commercial   11230      6     Pickup       yes       7211        2         No         0         1     Highly Rural/ Rural      0.03             0         $854.97   

 4337       0       62       0       10    23288      No       69245       No       M   Less Than High School   Clerical       24      Private      3830     11       SUV        yes       5071        3         No         0         1     Highly Urban/ Urban      0.38             1        $2,336.90  

 4338       0       58       0       13    102904     No         0         No       M          Masters          Manager        47     Commercial   30460      4   Panel Truck    yes       5705        2         No         0        18     Highly Urban/ Urban      0.21             0        $1,714.90  

 4343       0       44       0       13    24849      No         0         No       F   Less Than High School   Clerical       36      Private     12970      1       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.06             0         $708.17   

 4347       0       43       0       13    86393      No       272050      Yes      M         Bachelors       Blue Collar      26     Commercial   14440      3     Minivan      no         0          0         No         0        11     Highly Urban/ Urban      0.26             0        $1,150.02  

 4355       0       34       2       12    55353      Yes      203703      No       F        High School      Blue Collar      41     Commercial   14090     13       SUV        no        4519        1         No         6         6     Highly Urban/ Urban      0.68             1        $4,043.58  

 4357       0       49       0       12    105277     No       294480      Yes      F         Bachelors       Professional     30      Private     38000     10       Van        no         0          0         No         0         1     Highly Rural/ Rural      0.01             0        $-1,046.65 

 4359       0       48       0        8    27499      No       118913      Yes      M         Bachelors         Manager        17      Private      6300      6     Minivan      yes        0          0         No         1        10     Highly Urban/ Urban       0.1             0         $-595.35  

 4362       1       38       2       11    50718      Yes        0         No       F   Less Than High School   Clerical       51      Private     16340      6       SUV        no       29017        2         No         1         5     Highly Rural/ Rural      0.09             0        $1,806.08  

 4368       0       46       0        5    25772      No       140649      No       F        High School      Blue Collar      44     Commercial   20030      3       SUV        no         0          0         No         1       5.54    Highly Urban/ Urban      0.56             1        $3,080.83  

 4374       0       47       0       14    138689     No       406449      Yes      M          Masters           Lawyer        26      Private     20230      1       Van        no         0          0         No         0        15     Highly Urban/ Urban      0.08             0         $820.08   

 4375       0       53       0       12    67189      No         0         No       M          Masters          Manager        26     Commercial    6800     10     Pickup       no        4558        2         No         3        18     Highly Urban/ Urban      0.33             1        $1,686.06  

 4378       1       38       2       14    46928      No       161908      Yes      F          Masters           Lawyer        53      Private      6190      1       SUV        no        4939        2         No         0       13.85   Highly Urban/ Urban      0.17             0        $1,764.67  

 4381       0       50       0       13    58504      No         0         No       F         Bachelors       Blue Collar      44     Commercial   20550      1       SUV        no        2916        1         No         6        11     Highly Urban/ Urban      0.68             1        $3,673.16  

 4387       0       36       0        8    51626      No       168683      Yes      F          Masters           Lawyer        39      Private     31480      4     Minivan      no        1007        1         No         5        13     Highly Urban/ Urban      0.21             0        $1,191.51  

 4400       0       53       0        8    66429      No       225996      Yes      M          Masters           Lawyer        5       Private     13440     13     Minivan      yes        0          0         No         0        18     Highly Urban/ Urban       0.1             0         $-663.80  

 4423       0       36       0       11    37869      No       160542      Yes      F         Bachelors         Clerical       13      Private      5290      1       SUV        no         0          0         No         1         7     Highly Urban/ Urban      0.23             0        $1,122.50  

 4424       1       39       4       12    20075      No       117035      Yes      F        High School       Home Maker      21      Private      5400      7   Sports Car     no         0          0         No         0         8     Highly Rural/ Rural      0.03             0         $-379.90  

 4428       0       41       0        0      0        No       56393       No       F          Masters         Home Maker      43      Private      5600      4   Sports Car     no         0          0         No         0        20     Highly Urban/ Urban       0.5             1        $2,292.18  

 4433       0       40       1       11     6947      Yes      131827      No       F         Bachelors        Home Maker      41     Commercial   25170      4   Panel Truck    yes       6985        2         No         8         8     Highly Urban/ Urban      0.76             1        $4,432.11  

 4436       0       33       2       11    33392      No       161864      Yes      F        High School        Clerical       57      Private      8140      4   Sports Car     no         0          0         No         5        10     Highly Urban/ Urban      0.36             1        $2,561.05  

 4437       0       53       0       11    69861      No         0         No       M        High School      Blue Collar      14     Commercial   13970     13     Minivan      yes        0          0         No         0        10     Highly Urban/ Urban      0.44             1        $1,346.10  

 4439       0       54       0       14     6450      No         0         No       M   Less Than High School   Student        32      Private      7550      6     Pickup       yes      19690        1         No         0         1     Highly Urban/ Urban      0.34             1        $1,867.20  

 4449       0       38       1       10    62361      No       185738      Yes      F         Bachelors        Home Maker      32      Private     11540      5       SUV        no        3481        1         No         2         6     Highly Urban/ Urban      0.14             0        $1,046.59  

 4456       0       51       0       15    197224     No       533509      Yes      M            PhD            Manager        25     Commercial   27310      7   Panel Truck    yes        0          0         No         1        15     Highly Urban/ Urban       0.1             0         $916.73   

 4463       0       45       0        9    96599      No       306391      Yes      M         Bachelors       Professional     42      Private     12180      8     Pickup       yes      29820        3         No         1         8     Highly Urban/ Urban      0.11             0        $1,192.42  

 4467       0       48       0       10    86418      No         0         No       M          Masters           Lawyer        26      Private     14940      9     Minivan      yes        0          0         No         1        17     Highly Urban/ Urban      0.21             0         $658.73   

 4468       0       54       0       12    159494     No         0         No       F            PhD            Manager        35      Private     32140      4     Minivan      no         0          0         No         2        14     Highly Urban/ Urban      0.13             0         $489.46   

 4469       0       59       0        9    108403     No       333990      Yes      M         Bachelors         Manager        47      Private     12340      1     Minivan      yes        0          0         No         0         8     Highly Urban/ Urban      0.06             0         $-342.50  

 4472       0       53       0        9    114547     No       330408      Yes      M          Masters          Manager        29     Commercial   23760      1   Panel Truck    yes       824         2         No         4         8     Highly Urban/ Urban      0.18             0        $1,997.25  

 4473       0       44       0       12    29079      No       173696      Yes      M   Less Than High School   Clerical       49      Private     15450      1     Minivan      no         0          0         No         3       4.31    Highly Rural/ Rural      0.04             0         $216.02   

 4476       0       37       0        0      0        No         0         No       F        High School        Student        53     Commercial    5200     11       SUV        no         0          0         No         4         7     Highly Urban/ Urban       0.8             1        $3,438.52  

 4500       0       48       0       14    146632     No       373281      Yes      F          Masters          Manager        25      Private     24700      4     Minivan      no         0          0         No         2        15     Highly Urban/ Urban      0.07             0         $-537.61  

 4509       0       39       0       15    39857      No       147280      Yes      F        High School      Blue Collar      32     Commercial   17940      3     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.31             1        $1,570.47  

 4513       1       41       3       13    18408      No       95813       Yes      F   Less Than High School   Clerical       43      Private      7440      1   Sports Car     no       20380        2         Yes        8         1     Highly Urban/ Urban      0.78             1        $4,540.22  

 4521       0       71       0      11.84  62645      No       199054      Yes      M          Masters        Professional     30      Private     29910      1   Sports Car     no         0          0         No         6        12     Highly Rural/ Rural      0.03             0        $1,137.52  

 4527       0       53       0        0      0        No       92718       Yes      F         Bachelors         Student        12     Commercial   19940      6       SUV        no        1936        1         No         8         7     Highly Urban/ Urban      0.78             1        $3,173.59  

 4530       0       42       3       16    15113      No       133175      Yes      F        High School       Home Maker      5       Private      5800      4       SUV        no        8598        2         No         5         8     Highly Urban/ Urban      0.28             1        $1,599.15  

 4532       0       43       2       15    36614      No       141879      Yes      F        High School      Blue Collar      42     Commercial   25580      1     Pickup       no        4078        2         No         0         1     Highly Urban/ Urban      0.31             1        $2,365.69  

 4533       0       50       0       16    143358     No       400319      Yes      F          Masters           Lawyer        52      Private     20840      6       SUV        no         0          0         No         2        18     Highly Urban/ Urban       0.1             0         $942.32   

 4535       0       37       2       14    32053      No       145859      Yes      F        High School       Home Maker      46      Private     18930      1   Sports Car     no         0          0         No         1         7     Highly Urban/ Urban      0.15             0        $1,629.15  

 4536       0       31       3        9    24965      No       166669      Yes      M        High School        Student        29     Commercial   15440     10     Minivan      no       38197        1         Yes        5         1     Highly Urban/ Urban      0.62             1        $2,533.78  

 4542       0       44       0       12    22960      No       142579      Yes      M        High School      Blue Collar      21     Commercial   11690      4     Pickup       yes        0          0         No         1        10     Highly Urban/ Urban      0.38             1        $1,994.04  

 4551       0       65       0       15     5013      No       107287      Yes      F        High School        Student        32     Commercial    8670      1   Sports Car     no        5900        1         No         8         8     Highly Urban/ Urban      0.63             1        $3,743.96  

 4554       0       51       0        8    61569      No       233243      Yes      F          Masters        Professional     23      Private     30190      1     Pickup       no         0          0         No         0         8     Highly Urban/ Urban      0.11             0        $1,003.20  

 4555       0      45.9      0        9    14484      No         0         No       F   Less Than High School   Clerical       20      Private      2950     10   Sports Car     yes       4518        1         No         1         1     Highly Urban/ Urban      0.45             1        $2,352.13  

 4564       0       48       0       10    144241     No         0         No       F            PhD            Manager        43      Private     20720      1       SUV        no       23013        2         No         4        24     Highly Urban/ Urban      0.17             0        $1,689.40  

 4572       0       48       0       12    49082      No       202791      Yes      F         Bachelors       Blue Collar      34     Commercial   24800      4   Sports Car     no       42845        2         Yes        2        12     Highly Urban/ Urban      0.55             1        $2,937.93  

 4573       0       50       0       12    182872     No       534957      Yes      M            PhD            Manager        24     Commercial   28540      6   Panel Truck    yes       9527        2         No         2        14     Highly Urban/ Urban      0.12             0        $1,381.23  

 4577       0       45       0       12    77337      No         0         No       F         Bachelors       Professional     37      Private     26010      9       SUV        no        6238        2         No         3        12     Highly Urban/ Urban      0.28             1        $1,918.22  

 4579       0       39       3       12    33043      No       135257      Yes      M        High School        Manager        31     Commercial    8700      4     Pickup       no         0          0         No         0         1     Highly Urban/ Urban      0.15             0        $1,119.74  

 4583       0       54       0       11    191330     No         0         No       M            PhD             Lawyer        34      Private      3430     13     Minivan      yes        0          0         No         0        16     Highly Urban/ Urban      0.14             0         $549.33   

 4584       0       35       0       10     1886      No       55001       Yes      F   Less Than High School  Home Maker      27      Private     12690      1       SUV        no         0          0         Yes        0         1     Highly Urban/ Urban      0.36             1        $1,993.15  

 4596       0       49       0       14    54639      No         0         No       M   Less Than High School   Clerical       50      Private      6400     12     Pickup       yes        0          0         No         1         1     Highly Rural/ Rural      0.05             0         $315.18   

 4599       0       54       0       17    97777      No       296937      Yes      F          Masters           Lawyer        47      Private     17260      6   Sports Car     no        1540        2         No         2         9     Highly Urban/ Urban      0.12             0        $1,690.22  

 4607       0       63       0       10    33314      No         0         No       F         Bachelors       Professional     43      Private     24210      6       SUV        no        3165        1         No         3         8     Highly Urban/ Urban      0.34             1        $2,267.41  

 4609       1       37       2       12    15739      No       138776      Yes      F        High School       Home Maker      23      Private      9230      1   Sports Car     no         0          0         No         3         6     Highly Urban/ Urban      0.31             1        $2,207.67  

 4610       0       55       0       13    149854     No         0         No       M            PhD            Manager        23      Private     10250      6     Minivan      no         0          0         No         0        13     Highly Urban/ Urban       0.1             0         $192.94   

 4616       0       33       1        7    157263     Yes        0         No       F            PhD             Lawyer        60      Private     36480      1   Sports Car     no        4597        2         No         0        16     Highly Urban/ Urban      0.15             0        $2,953.78  

 4617       0       50       0       14    257416     No         0         No       F            PhD            Manager        50     Commercial   31630      4       Van        no       19016        2         No         0        13     Highly Urban/ Urban      0.15             0        $1,851.85  

 4633       0       47       0       14    75210      No       258319      Yes      F   Less Than High School Blue Collar      35      Private     19460     13       SUV        no         0          0         Yes        0         1     Highly Urban/ Urban      0.27             0        $1,392.43  

 4638       0       57       0       11     4204      No         0         Yes      M        High School        Student        32     Commercial   22950      4   Panel Truck    yes        0          0         No         0         1     Highly Urban/ Urban      0.35             1        $2,124.99  

 4641       0       57       0        8    145655     No         0         No       M          Masters        Professional     25     Commercial   21770      6       Van        no         0          0         No         2        21     Highly Rural/ Rural      0.05             0         $840.34   

 4653       0       35       1        0      0        No       60714       Yes      F   Less Than High School  Home Maker      58      Private     13820      4   Sports Car     no        4896        1         No         1         7     Highly Urban/ Urban      0.36             1        $2,394.40  

 4655       0       33       2       14     5063      No       118608      Yes      M         Bachelors        Home Maker      28     Commercial   32370      1   Panel Truck    yes       6902        3         No         0        11     Highly Urban/ Urban      0.32             1        $2,122.86  

 4659       0       33       1       12    40990      No       151286      Yes      F        High School      Blue Collar      22     Commercial    8900      4       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.31             1        $2,058.89  

 4669       0       41       0        7    36978      No       145526      Yes      M        High School        Clerical       62     Commercial    9300      1     Pickup       yes        0          0         No         0         7     Highly Rural/ Rural      0.05             0         $803.55   

 4678       1       42       2       10    38519      No       194372      Yes      M        High School      Blue Collar      32     Commercial    9650      4     Minivan      yes        0          0         No         3       4.53    Highly Rural/ Rural       0.1             0         $892.61   

 4685       0       46       0       13    41944      No       100318      No       M        High School        Clerical       47     Commercial   18340      9       Van        no        6018        3         No         3        10     Highly Urban/ Urban      0.63             1        $3,522.46  

 4686       0       30       3       14    49450      Yes      225886      No       F         Bachelors         Clerical       99      Private      9440      6   Sports Car     no        1769        3         No         3        10     Highly Rural/ Rural      0.07             0        $2,086.34  

 4691       0       54       0       11    16739      No       119730      Yes      M   Less Than High School   Clerical       26      Private     16890     11       Van        no        4326        3         No         3         1     Highly Urban/ Urban      0.33             1        $2,239.12  

 4695       0       48       0       13    34071      No         0         No       M        High School        Manager        61      Private     18690      9     Minivan      no       42226        2         No         0         9     Highly Urban/ Urban      0.16             0         $577.81   

 4698       2       44       2       10    44726      No       160877      Yes      F        High School      Professional     54      Private      4970      1       SUV        no       36179        2         No         4         1     Highly Rural/ Rural      0.06             0        $1,699.16  

 4700       0       30       1       11    17619      No       86310       Yes      F   Less Than High School   Clerical       18      Private     16890      1   Sports Car     no         0          0         Yes        5         6     Highly Urban/ Urban      0.59             1        $2,998.31  

 4711       0       53       0       12    127759     No         0         No       M            PhD             Doctor        78      Private     36890      4     Minivan      yes        0          0         No         0        22     Highly Urban/ Urban       0.1             0         $430.48   

 4722       0       43       0       12    50336      No       210941      Yes      F         Bachelors       Blue Collar      48     Commercial   10830     13       SUV        no         0          0         No         3         6     Highly Rural/ Rural      0.06             0         $405.82   

 4727       0       34       1       15    44653      No         0         Yes      F        High School        Student        16     Commercial    9370      6   Sports Car     no        4482        1         No         0         5     Highly Urban/ Urban      0.24             0        $1,732.35  

 4756       0       34       0       12    43821      No       205035      Yes      M   Less Than High School Blue Collar      27      Private      9280      6     Minivan      no         0          0         No         0         5     Highly Rural/ Rural      0.02             0         $-916.34  

 4762       0       46       0       12    23801      No       118402      Yes      M         Bachelors       Professional     49      Private      3880     10     Minivan      yes      19005        3         Yes        2        12     Highly Urban/ Urban      0.33             1        $1,528.89  

 4763       0       54       0       12    53099      No       175695      No       M        High School      Professional     57      Private     17230      9       Van        no       12797        3         No         0         1     Highly Urban/ Urban      0.22             0        $2,432.97  

 4766       0       53       0       14    62731      No       214682      Yes      F          Masters           Lawyer        20      Private     24400      6     Minivan      no        5755        1         No         5        19     Highly Urban/ Urban       0.2             0         $662.52   

 4770       0       30       0       11    100731     No       296085      No       M          Masters           Lawyer        54      Private     13910      4     Minivan      yes        0          0         No         0        14     Highly Urban/ Urban      0.17             0        $1,078.44  

 4784       0       40       0        0      0        No         0         Yes      M         Bachelors         Student        50     Commercial   18010      1     Minivan      no         0          0         No         1         6     Highly Urban/ Urban      0.55             1        $2,196.13  

 4791       0       54       0       13    66334      No         0         No       F        High School      Blue Collar      43     Commercial   13530      7       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.08             0        $1,009.73  

 4795       0       50       0       13    22784      No       119070      Yes      M          Masters           Lawyer        10      Private     13000      3     Minivan      yes        0          0         No         0        10     Highly Urban/ Urban      0.14             0         $323.96   

 4799       1       36       2       12    91729      Yes      307043      No       F         Bachelors       Professional     26      Private     16220      1       SUV        no        8048        3         Yes        0         1     Highly Urban/ Urban      0.44             1        $3,490.29  

 4802       0       31       4        0      0        Yes        0         No       F         Bachelors        Home Maker      54      Private      8880      7       SUV        no         0          0         No         0         6     Highly Urban/ Urban       0.5             1        $2,669.89  

 4805       1       39       2       12    117329     Yes        0         No       M         Bachelors       Professional     37      Private      1910      7     Minivan      no        3486        2         No         8        12     Highly Urban/ Urban      0.53             1        $3,383.51  

 4814       0       51       0        9    69551      No         0         No       M        High School      Blue Collar      60     Commercial    6600      9     Pickup       yes        0          0         No         1         1     Highly Urban/ Urban      0.48             1        $2,849.81  

 4816       0       49       0       12    55755      No       211213      Yes      M        High School      Blue Collar      14     Commercial   11250      1     Pickup       yes        0          0         No         3         1     Highly Urban/ Urban      0.39             1        $2,479.40  

 4817       0       44       3       17    49098      No       157404      Yes      M         Bachelors       Blue Collar      33     Commercial    5900      1     Pickup       yes        0          0         No         2        13     Highly Rural/ Rural      0.05             0         $405.35   

 4822       2       43       2        9    23382      No       175078      Yes      M        High School        Clerical       48      Private     13930      3     Minivan      yes        0          0         No         0        11     Highly Urban/ Urban      0.43             1        $1,775.27  

 4827       0       61       0      11.34  56210      No         0         No       M          Masters           Lawyer        70      Private     17590      1       Van        yes       7076        3         No         3        15     Highly Urban/ Urban      0.29             1        $2,861.24  

 4833       0       50       0       12    60927      No       219040      Yes      M          Masters          Manager        26     Commercial   36320      1   Panel Truck    no         0          0         No         0        19     Highly Urban/ Urban      0.13             0         $878.85   

 4836       0       66       2       10    72539      No       249286      Yes      M         Bachelors       Professional     46      Private     15100      1     Minivan      yes        0          0         No         2       8.32    Highly Rural/ Rural      0.02             0         $-576.29  

 4842       0       37       0        9    29915      No       124567      No       F          Masters         Home Maker      48     Commercial   38300      4       Van        no       50724        1         No         0         1     Highly Urban/ Urban       0.4             1        $2,886.76  

 4844       0       36       0        0      0        No       127935      No       M        High School        Student        86     Commercial   13420     10     Minivan      no         0          0         No         0        10     Highly Rural/ Rural      0.19             0         $890.20   

 4845       0       38       0       10    21147      No       135174      Yes      M        High School      Blue Collar      35     Commercial    7410      4     Pickup       yes        0          0         No         0         6     Highly Urban/ Urban      0.35             1        $2,121.36  

 4849       0       53       0       13    186706     No       476703      Yes      F          Masters           Lawyer        43      Private      6800      1       SUV        no         0          0         Yes        0        13     Highly Urban/ Urban      0.14             0        $1,267.30  

 4850       0       35       0       10    106581     No         0         No       F         Bachelors       Blue Collar      39     Commercial   30080      1     Minivan      no        9185        1         No         0        12     Highly Urban/ Urban       0.4             1        $1,790.75  

 4860       0       39       0       11    59995      No         0         No       M        High School        Clerical       38      Private      9680     10     Pickup       yes        0          0         No         0         6     Highly Rural/ Rural      0.05             0         $-132.46  

 4863       0       48       0       11    40245      No         0         No       F   Less Than High School Blue Collar      20      Private     19060     11       SUV        no       32687        1         No         3         7     Highly Urban/ Urban      0.42             1        $2,023.55  

 4871       0       24       2       10    16811      Yes      15773       No       F        High School        Student        37      Private      8230     13   Sports Car     yes       1395        1         No         6         7     Highly Rural/ Rural      0.09             0        $1,521.48  

 4878       0       34       1       11     4273      No         0         Yes      F   Less Than High School   Student        20      Private      5330      6       SUV        no        2596        2         No         0         4     Highly Urban/ Urban       0.2             0        $1,230.37  

 4881       3       62       3       19    85081      Yes        0         No       F          Masters           Lawyer        19      Private     26420     17   Sports Car     no        9810        4         No         7        18     Highly Urban/ Urban      0.72             1        $4,054.30  

 4888       0       47       0        7    28626      No         0         No       F        High School        Clerical       57      Private     13680      6       SUV        no         0          0         No         4         1     Highly Urban/ Urban      0.52             1        $2,912.30  

 4900       3       39       3       11    76791      No       215433      Yes      F          Masters        Professional     24      Private     33050     13       SUV        no       10265        1         No         2        20     Highly Urban/ Urban      0.39             1        $1,958.56  

 4906       0       38       0        7    33237      No       139952      Yes      F        High School        Clerical       21      Private     15450      1       SUV        no        2588        1         No         7         1     Highly Urban/ Urban      0.43             1        $2,753.23  

 4909       0       55       0       16    138281     No       375117      Yes      M            PhD            Manager        46     Commercial   24770      4   Panel Truck    yes        0          0         No         2        13     Highly Rural/ Rural      0.02             0         $-73.32   

 4916       0       51       0       15    51734      No       233529      Yes      M         Bachelors       Professional     45      Private     11770      4     Pickup       yes        0          0         No         0        14     Highly Urban/ Urban      0.12             0         $869.22   

 4918       0       46       0       12    100253     No       282684      Yes      M         Bachelors       Professional     5      Commercial    6100      1     Pickup       yes       5756        2         No         6        11     Highly Urban/ Urban      0.35             1        $2,449.49  

 4926       0       47       1       12    44452      No       221536      Yes      F        High School      Blue Collar      51     Commercial   13110     10       SUV        no         0          0         No         0         6     Highly Urban/ Urban       0.3             1        $1,946.52  

 4928       0       42       0        9    30588      No       158401      Yes      F         Bachelors         Manager        23      Private     13470      1       SUV        no         0          0         No         3         7     Highly Urban/ Urban      0.12             0         $562.39   

 4941       0       32       2        0      0        Yes        0         No       F        High School       Home Maker      28      Private     15300      1     Minivan      no         0          0         No         0         8     Highly Urban/ Urban       0.5             1        $2,146.11  

 4946       0       51       0       14    90800      No       282708      No       F            PhD             Doctor        54      Private     40610      6       SUV        no         0          0         No         2        17     Highly Urban/ Urban      0.15             0        $1,106.36  

 4949       0       39       0       13    25150      No       128293      Yes      M            PhD             Lawyer        54      Private     14120      9     Minivan      yes        0          0         No         1        14     Highly Urban/ Urban      0.15             0         $933.66   

 4956       0       46       0        6    57625      No       194176      Yes      M        High School        Manager        16      Private     14940      6     Minivan      yes        0          0         No         0         8     Highly Urban/ Urban      0.07             0         $-657.21  

 4966       0       50       0        7    18357      No       133243      Yes      F            PhD             Doctor        25      Private     22670      1     Minivan      no         0          0         No         0        12     Highly Urban/ Urban      0.09             0         $-187.15  

 4969       0       46       0       12    11363      No       104389      Yes      F   Less Than High School   Clerical       26      Private      7240     10       SUV        no       26181        1         Yes        2         5     Highly Urban/ Urban       0.5             1        $2,103.00  

 4973       0       47       0       13    102051     No       289648      Yes      M          Masters           Lawyer        30      Private     21770     10       Van        no         0          0         Yes        0        13     Highly Urban/ Urban      0.17             0         $992.71   

 4978       0       62       0       12    33713      No       171810      Yes      F         Bachelors       Blue Collar      26     Commercial    7700      6   Sports Car     no        2791        3         No         1        15     Highly Urban/ Urban      0.35             1        $2,223.56  

 4982       0       29       1       11    87862      No       226766      Yes      F         Bachelors       Professional     19      Private      5470      6       SUV        no       30300        1         Yes        4         9     Highly Urban/ Urban       0.3             1        $1,788.06  

 4985       0       51       0       14    74576      No       222274      Yes      M         Bachelors         Manager        32      Private     14610     11     Minivan      yes        0          0         No         3        14     Highly Urban/ Urban       0.1             0         $-561.38  

 4991       0       48       0       11    77833      No         0         No       M          Masters          Manager        5      Commercial   27780     10   Panel Truck    yes        0          0         No         1        16     Highly Urban/ Urban      0.25             0         $879.83   

 4998       0       45       0       11    93480      No         0         No       F        High School      Blue Collar      13     Commercial   15350      1     Minivan      no         0          0         No         0       7.16    Highly Rural/ Rural      0.07             0          $3.56    

 5000       0       50       0       15    53924      No       203155      Yes      M        High School      Blue Collar      37     Commercial   25320      1   Panel Truck    yes       5546        2         No         6         1     Highly Urban/ Urban       0.5             1        $3,622.42  

 5004       0       48       0       11    67275      No         0         No       M         Bachelors       Blue Collar      40     Commercial   13030      1     Minivan      yes        0          0         No         3        11     Highly Urban/ Urban      0.56             1        $2,567.66  

 5005       0       25       1        8    66390      Yes        0         No       F         Bachelors       Blue Collar      41     Commercial   22740      9       SUV        no        7019        2         No         1        10     Highly Urban/ Urban      0.48             1        $3,162.08  

 5011       0       27       3       13    35851      No       147018      Yes      F        High School      Blue Collar      47     Commercial    4200      1   Sports Car     no         0          0         No         4         1     Highly Urban/ Urban      0.46             1        $3,446.87  

 5016       0       35       0       10    64530      No         0         No       F          Masters           Lawyer        50      Private      5000      1   Sports Car     no        5202        1         No         0        13     Highly Urban/ Urban       0.2             0        $2,078.57  

 5018       0       45       1       13    71512      No       224539      Yes      F         Bachelors       Professional     26      Private     30270      1     Minivan      no         0          0         No         0       8.96    Highly Urban/ Urban      0.11             0         $271.48   

 5034       0       38       0       15    37746      No       166861      Yes      F   Less Than High School Blue Collar      5       Private      6940      8   Sports Car     no         0          0         No         3         8     Highly Urban/ Urban      0.26             0        $1,398.34  

 5038       0       39       2       12    75701      Yes        0         No       M          Masters           Lawyer        18      Private      1500      6     Minivan      no         0          0         No         0        14     Highly Rural/ Rural      0.02             0         $-407.12  

 5042       0       30       2      10.83  23022      Yes        0         No       M   Less Than High School   Clerical       44      Private      4500      7     Minivan      no         0          0         No         2         1     Highly Rural/ Rural      0.08             0        $1,077.78  

 5046       1       40       1       14    76634      No       241975      Yes      M        High School      Blue Collar      32     Commercial    6040      8     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural      0.06             0         $532.90   

 5051       0       45       2       10    22683      Yes        0         No       F         Bachelors         Clerical       5       Private     16510      1     Minivan      no         0          0         No         1        10     Highly Urban/ Urban      0.42             1        $1,507.87  

 5054       0       57       0       12    129402     No       365111      Yes      F            PhD            Manager        9      Commercial   23950      6     Pickup       no       12714        2         Yes        0         9     Highly Urban/ Urban       0.2             0        $1,088.16  

 5057       2       64       3      13.17  83585      No       252164      Yes      F            PhD            Manager        39      Private     14040      4       SUV        no        925         1         No         4        16     Highly Urban/ Urban      0.23             0        $1,879.01  

 5062       0       31       1       13    90693      No       257011      Yes      F         Bachelors       Blue Collar      59     Commercial    4600      7       SUV        no         0          0         No         1       9.21    Highly Rural/ Rural      0.04             0         $258.16   

 5063       0       51       0       11    126442     No         0         No       M          Masters          Manager        41     Commercial    7820      7     Pickup       yes        0          0         No         0        11     Highly Rural/ Rural      0.02             0         $-327.85  

 5065       0       60       0       15    15261      No       130773      Yes      M   Less Than High School   Clerical       56     Commercial    9030      1     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural      0.06             0        $1,137.53  

 5066       0       47       0       13    108225     No       330943      Yes      M            PhD             Doctor        55      Private     21610      1       Van        yes        0          0         No         3        10     Highly Urban/ Urban      0.08             0        $1,251.41  

 5076       0       40       0        8    118527     No       323324      No       M          Masters          Manager        48     Commercial   22750      6   Panel Truck    no         0          0         No         0        13     Highly Urban/ Urban       0.2             0        $1,523.28  

 5089       0       42       0        8     5824      No       86232       Yes      F   Less Than High School  Home Maker      37      Private      9700     10       SUV        no         0          0         No         1         6     Highly Urban/ Urban      0.21             0        $1,183.49  

 5092       1       42       2       14    251883     Yes      603984      No       F            PhD             Doctor        31      Private      5700      3       SUV        no       33808        1         Yes        4       15.16   Highly Urban/ Urban      0.35             1        $2,743.62  

 5093       0       30       2        0      0        No         0         Yes      F   Less Than High School   Student        21      Private      5430      3       SUV        no         0          0         Yes        0         5     Highly Urban/ Urban      0.52             1        $1,939.00  

 5094       0       45       3       14    14554      No         0         Yes      F        High School        Student        31      Private     16580      4       SUV        no         0          0         No         0         8     Highly Rural/ Rural      0.02             0         $-755.11  

 5098       0       30       1        0      0        Yes      76283       No       F         Bachelors        Home Maker      35      Private      4500      6   Sports Car     no       35477        4         Yes        1         1     Highly Urban/ Urban      0.71             1        $3,954.35  

 5102       0       39       0      10.4   26199      No       88066       Yes      F        High School      Blue Collar      51     Commercial   14440      1     Minivan      no         0          0         No         0         8     Highly Rural/ Rural      0.05             0          $58.14   

 5112       0       46       0       14    112213     No         0         No       M          Masters          Manager        5      Commercial   33610      3   Panel Truck    no       10788        3         No         4        15     Highly Urban/ Urban      0.32             1        $2,004.88  

 5117       0       47       0        9    62216      No       242564      Yes      M        High School      Professional     42     Commercial   24480      3   Panel Truck    no        3884        2         No         3         1     Highly Urban/ Urban      0.29             1        $3,054.94  

 5127       0       35       0        0      0        No         0         Yes      M         Bachelors         Student        30     Commercial    5000      1     Pickup       no         0          0         No         3        10     Highly Urban/ Urban      0.62             1        $2,578.55  

 5130       0       59       0       10    139297     No       412573      Yes      M          Masters          Manager        38     Commercial   23100      4   Panel Truck    yes       7095        3         No         4        15     Highly Urban/ Urban      0.17             0        $1,831.10  

 5131       0       56       0       15    25632      No         0         No       F         Bachelors        Home Maker      32      Private      7320      3       SUV        no        8498        2         No         4         8     Highly Urban/ Urban      0.38             1        $2,276.82  

 5132       0       51       0        7    47204      No         0         No       M          Masters          Manager        47     Commercial   17750      1       Van        no        8303        2         No         0        15     Highly Urban/ Urban      0.26             0        $2,209.12  

 5135       0       43       2        0      0        No         0         Yes      F        High School        Student        61     Commercial    5800      4     Minivan      no        6935        4         No         5         1     Highly Urban/ Urban      0.69             1        $3,337.66  

 5136       0       57       0        0      0        No       114890      Yes      M         Bachelors        Home Maker      43      Private      7200      6     Pickup       yes        0          0         No         0        17     Highly Rural/ Rural      0.05             0         $-666.76  

 5147       0       25       3       15    75385      No       254055      Yes      M         Bachelors       Blue Collar      19     Commercial   17750      1       Van        yes       4640        3         No         4         8     Highly Urban/ Urban       0.4             1        $2,850.88  

 5157       0       49       0       10    73251      No         0         No       M        High School      Blue Collar      48     Commercial   15480      1     Minivan      yes        0          0         No         1         8     Highly Rural/ Rural      0.08             0         $884.94   

 5160       0       45       2       15    20653      No       140294      Yes      F   Less Than High School   Clerical       24      Private     20380      6       SUV        no        572         3         No         0         6     Highly Urban/ Urban      0.23             0        $1,605.24  

 5165       0       59       0       11    25833      No         0         No       M         Bachelors       Professional     13      Private      9980      1     Minivan      yes        0          0         No         0        11     Highly Rural/ Rural      0.03             0         $-645.22  

 5166       1       39       2       11    41869      No       165820      Yes      F        High School      Blue Collar      6      Commercial   12550      1       SUV        no       32747        4         No         0         8     Highly Urban/ Urban      0.41             1        $2,515.42  

 5172       0       34       2        9    33538      Yes        0         No       M   Less Than High School Blue Collar      29      Private      8250      4     Minivan      yes      38845        2         Yes        2         1     Highly Urban/ Urban      0.58             1        $3,264.94  

 5173       0       45       0        8    35316      No       194782      Yes      F   Less Than High School Blue Collar      19      Private     11280      4       SUV        no         0          0         No         1         7     Highly Urban/ Urban      0.21             0        $1,313.21  

 5179       1       36       2       12    82780      No       214103      Yes      M        High School      Blue Collar      24     Commercial    1500      6     Minivan      no        5999        2         Yes        6         5     Highly Urban/ Urban      0.75             1        $3,388.52  

 5184       0       39       2       10    30618      No       157285      Yes      M        High School      Blue Collar      44     Commercial   21320      3       Van        yes       9469        2         No         0         1     Highly Urban/ Urban      0.33             1        $2,793.35  

 5187       1       40       3       15    71771      Yes        0         No       F         Bachelors       Professional     25      Private     17380      9     Minivan      no        4699        1         No         6        10     Highly Rural/ Rural      0.09             0         $923.35   

 5191       0       31       3       10    106985     Yes        0         No       F          Masters          Manager        8       Private     23970      6     Pickup       no         0          0         No         0        13     Highly Urban/ Urban      0.11             0         $464.92   

 5193       0       45       2        0      0        No       61061       Yes      F         Bachelors        Home Maker      5      Commercial   35630      4   Panel Truck    yes        0          0         No         0        10     Highly Urban/ Urban      0.49             1        $1,405.44  

 5194       0       58       0      12.1   229207     No       588059      Yes      M            PhD            Manager        46     Commercial   30220      6   Panel Truck    no       11827        1         No         4         3     Highly Urban/ Urban      0.14             0        $2,114.11  

 5199       0       51       0       14    48680      No       193602      Yes      M        High School      Blue Collar      44     Commercial   24510     10     Minivan      no        8007        1         No         0         1     Highly Urban/ Urban       0.3             1        $1,688.00  

 5212       0       54       0       12    96728      No       278985      Yes      F          Masters           Lawyer        14      Private     17410      6     Minivan      no         0          0         No         0        19     Highly Urban/ Urban      0.09             0         $-474.45  

 5213       0       47       0       16    33717      No       145021      Yes      M        High School        Clerical       45     Commercial    4870     13     Pickup       yes        0          0         Yes        0         1     Highly Urban/ Urban      0.54             1        $2,363.53  

 5224       0       50       0        0      0        No         0         No       F        High School        Student        47      Private      6520      1       SUV        no         0          0         Yes        2         1     Highly Rural/ Rural      0.24             0        $1,615.39  

 5226       0       52       0       14    59713      No       212005      Yes      F         Bachelors       Professional     18      Private     12720      1       SUV        no         0          0         No         0        12     Highly Urban/ Urban      0.11             0         $774.96   

 5239       0       45       0       13     8234      No         0         Yes      M   Less Than High School   Student        12     Commercial   11270      7     Pickup       no         0          0         No         0       3.33    Highly Urban/ Urban      0.32             1        $1,559.81  

 5252       2       43       2       12    62638      Yes        0         No       F         Bachelors       Professional     36     Commercial   23140      6     Pickup       no        7148        2         No         4        11     Highly Urban/ Urban      0.72             1        $4,205.74  

 5264       1       36       4        0      0        Yes      84199       No       F        High School       Home Maker      18      Private      5480      4   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.14             0        $1,681.57  

 5266       0       44       2       13    38544      No       186304      Yes      F        High School      Blue Collar      25      Private     17120     10       SUV        no         0          0         No         0        4.4    Highly Rural/ Rural      0.02             0         $-774.89  

 5271       0       55       0       16    71012      No         0         No       F          Masters         Home Maker      43      Private     18540     16   Sports Car     no         0          0         No         1        11     Highly Rural/ Rural      0.03             0         $-260.43  

 5273       0       35       2        7    25273      No       131584      Yes      F        High School        Clerical       19      Private      6740      4   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.03             0         $-101.69  

 5276       0       43       0       12    46915      No         0         No       M        High School        Clerical       52      Private     11310      1     Pickup       no         0          0         Yes        1         1     Highly Urban/ Urban      0.56             1        $2,895.60  

 5278       0       59       0       12    71690      No       228322      Yes      M          Masters          Manager        29      Private     22490      6       Van        yes        0          0         No         0        22     Highly Urban/ Urban      0.06             0         $-135.03  

 5281       0       49       0        6    11069      No         0         No       F   Less Than High School   Student        60      Private     19520      4       SUV        no        5954        3         No         5         3     Highly Urban/ Urban      0.49             1        $3,253.43  

 5283       0       43       3        0      0        No         0         Yes      M        High School        Student        12     Commercial   14740      1     Minivan      yes       6840        3         No         6         1     Highly Urban/ Urban      0.72             1        $3,215.78  

 5291       0       45       4       15    85727      No       256089      Yes      F          Masters          Manager        47      Private     17010      6       SUV        no         0          0         No         0        14     Highly Urban/ Urban      0.06             0          $76.64   

 5294       0       46       0       13    57323      No         0         No       F         Bachelors       Professional     17      Private     11830      1       SUV        no        5970        3         No         0         6     Highly Urban/ Urban      0.22             0        $1,854.83  

 5296       1       37       2       14    11607      No       132755      Yes      F   Less Than High School   Clerical       11      Private      6360      1   Sports Car     no        4367        2         No         0         1     Highly Urban/ Urban      0.36             1        $2,367.26  

 5297       0       33       1       12    119869     Yes        0         No       F   Less Than High School Blue Collar      48     Commercial   23410      1     Pickup       no       26363        1         Yes        5         1     Highly Urban/ Urban      0.75             1        $4,737.28  

 5313       0       48       0        9    47614      No         0         No       F        High School       Home Maker      36      Private     24610      6     Pickup       no         0          0         No         0         9     Highly Rural/ Rural      0.03             0         $-634.16  

 5314       0       53       0        8    86541      No       281982      Yes      M          Masters          Manager        17     Commercial    6800      1     Pickup       yes        0          0         Yes        1         9     Highly Urban/ Urban      0.25             0        $1,465.45  

 5321       0       67       0        5    52955      No       208565      No       F            PhD             Doctor        28      Private     16990      6       SUV        no        7675        2         No         2        19     Highly Urban/ Urban      0.18             0        $1,090.04  

 5325       0       50       0       14     7751      No       140665      Yes      F          Masters         Home Maker      22      Private      8930      1     Minivan      no         0          0         No         2        17     Highly Rural/ Rural      0.03             0        $-1,003.02 

 5326       0       56       0        7     1336      No       108929      No       M          Masters          Manager        28      Private     17350      1       Van        yes        0          0         No         0        12     Highly Urban/ Urban      0.26             0        $1,424.92  

 5328       0       41       0      10.34  88508      No       231286      Yes      M         Bachelors       Professional     85      Private     21050      1       Van        no         0          0         No         0         9     Highly Rural/ Rural      0.01             0         $-58.55   

 5334       1       43       1       13    78288      No       316436      Yes      M        High School      Professional     31      Private     15380      5     Minivan      yes        0          0         No         1         8     Highly Urban/ Urban      0.18             0        $1,132.92  

 5338       0       39       0        0      0        No       101305      Yes      F        High School       Home Maker      27      Private      6320      1       SUV        no         0          0         No         4         6     Highly Urban/ Urban      0.46             1        $2,295.46  

 5344       1       40       2       14    33787      No       123204      Yes      M   Less Than High School Blue Collar      33     Commercial    7530      4     Pickup       yes        0          0         Yes        2         1     Highly Rural/ Rural      0.18             0        $1,747.17  

 5348       0       36       2       12    115701     Yes        0         No       M         Bachelors         Manager        37      Private     17070      1     Minivan      yes       6297        2         No         0         1     Highly Urban/ Urban      0.11             0        $1,192.91  

 5352       0       47       0       15    44366      No       181082      Yes      M        High School      Blue Collar      26     Commercial   13840      4     Minivan      no         0          0         No         0         7     Highly Urban/ Urban       0.3             1        $1,514.34  

 5353       0       49       0       14    21494      No       145029      Yes      F   Less Than High School Blue Collar      50     Commercial   16860      1       SUV        no         0          0         No         0         4     Highly Rural/ Rural      0.05             0         $953.79   

 5354       0       49       0       12    122433     No         0         No       F   Less Than High School Blue Collar      19      Private     19300      5       SUV        no       10846        2         No         5         9     Highly Urban/ Urban       0.4             1        $2,487.98  

 5361       0       48       0        0      0        No         0         Yes      M        High School        Student        48     Commercial    1500      4     Minivan      yes      25494        3         Yes        6         8     Highly Urban/ Urban      0.85             1        $3,774.03  

 5364       0       41       0       10    69292      No       224779      Yes      M         Bachelors         Manager        31      Private     18690     13     Minivan      yes        0          0         No         0         5     Highly Urban/ Urban      0.07             0         $-919.73  

 5365       0       41       0       10    34473      No       170845      Yes      F        High School      Professional     6       Private     14250     10       SUV        no         0          0         No         1         9     Highly Urban/ Urban      0.15             0         $634.32   

 5367       0       37       2        4    40091      No       154672      Yes      F        High School      Professional     9       Private      5510      3   Sports Car     no         0          0         Yes        2         1     Highly Urban/ Urban      0.29             1        $2,098.83  

 5379       1       37       2       14    75605      No       215859      Yes      F         Bachelors       Blue Collar      61     Commercial   14430      9       SUV        no         0          0         No         1        13     Highly Urban/ Urban       0.4             1        $2,161.00  

 5382       0       43       0       13    78854      No       274939      No       M        High School      Blue Collar      29     Commercial   38900      1   Panel Truck    no         0          0         No         2         6     Highly Urban/ Urban      0.51             1        $3,030.30  

 5386       0       42       0       10     6600      No         0         No       F         Bachelors        Home Maker      32      Private      4050      7       SUV        no         0          0         No         0        10     Highly Urban/ Urban      0.32             1        $1,294.73  

 5395       0       52       0        7    71208      No       285153      Yes      M         Bachelors         Manager        15     Commercial   20870      9       Van        yes        0          0         No         1        14     Highly Urban/ Urban      0.14             0         $385.72   

 5410       0       43       1       11    82918      Yes        0         No       M         Bachelors         Manager        15      Private     21950      6       Van        no        5074        3         No         4        12     Highly Urban/ Urban       0.2             0        $1,804.36  

 5411       0       50       0       14    30292      No       175499      Yes      F        High School        Clerical       50      Private      5470      1   Sports Car     no        8270        2         No         3       4.47    Highly Rural/ Rural      0.04             0        $1,006.29  

 5416       0       44       0        0      0        No         0         No       F            PhD           Home Maker      26      Private      5900      7       SUV        no        8822        2         No         0        15     Highly Urban/ Urban       0.5             1        $2,347.58  

 5424       0       36       1        8    20494      No         0         Yes      M        High School        Student        22     Commercial    5000      1     Pickup       yes       1091        1         No         5         7     Highly Urban/ Urban      0.45             1        $2,661.60  

 5426       0       46       0      11.71  87918      No       195795      Yes      M          Masters          Manager        5      Commercial   27170      4   Panel Truck    no        5788        3         No         6       14.51   Highly Urban/ Urban      0.25             0        $1,757.68  

 5428       0       29       4       10    53758      No       139900      Yes      F         Bachelors         Clerical       45      Private     22540      5   Sports Car     no         0          0         No         0         9     Highly Urban/ Urban      0.19             0        $1,314.98  

 5430       0       49       0        7    67026      No       239518      No       F          Masters          Manager        72      Private      7690      4       SUV        no        4832        2         No         0        19     Highly Urban/ Urban      0.13             0        $1,112.46  

 5433       0       45       0       12    73473      No       251927      Yes      F         Bachelors       Blue Collar      32     Commercial   10710      8       SUV        no         0          0         No         0         9     Highly Urban/ Urban      0.27             0        $1,491.10  

 5437       0       48       0        8    146434     No       381639      No       M          Masters        Professional     27      Private     44050      4     Minivan      no         0          0         No         0        21     Highly Rural/ Rural      0.02             0         $-800.95  

 5440       0       43       2       14    92731      Yes      274126      No       F          Masters           Lawyer        18      Private     18730      4       SUV        no        1558        3         No         0        12     Highly Urban/ Urban      0.18             0        $2,122.94  

 5442       0       34       1        0      0        Yes        0         No       M        High School        Student        32     Commercial   11910      4     Pickup       no        2361        3         No         4         1     Highly Urban/ Urban       0.8             1        $4,628.55  

 5445       0       40       0       11    59822      No       171876      Yes      F        High School      Blue Collar      51     Commercial   18110      1     Minivan      no        7769        3         No         4         1     Highly Urban/ Urban      0.42             1        $2,800.26  

 5449       0       54       0        9     3032      No       96814       Yes      F            PhD             Doctor        51      Private      6900      6       SUV        no         0          0         No         1        16     Highly Urban/ Urban      0.14             0         $773.64   

 5452       0       37       1        0      0        No         0         Yes      F        High School        Student        29      Private      5200      1       SUV        no         0          0         No         1         6     Highly Urban/ Urban      0.37             1        $1,750.18  

 5460       0       48       0       12    144922     No         0         No       M          Masters        Professional     31     Commercial    6300      1     Pickup       no         0          0         Yes        0        20     Highly Urban/ Urban      0.46             1        $2,723.01  

 5461       1       41       2        0      0        No         0         Yes      M   Less Than High School   Student        18      Private      1500     11     Minivan      yes        0          0         No         1         8     Highly Rural/ Rural      0.09             0         $-554.41  

 5465       0       33       3       13    34200      Yes        0         No       M        High School        Manager        5       Private     23460     11     Minivan      no        4675        3         No         1         1     Highly Urban/ Urban      0.18             0         $882.49   

 5467       0       57       0       18    136210     No       407853      Yes      F         Bachelors         Manager        38      Private      3080      9       SUV        no        8982        2         No         2        11     Highly Urban/ Urban      0.07             0          $30.43   

 5471       1       44       3       16    119998     No       331683      Yes      M            PhD            Manager        34     Commercial    5900     10     Pickup       yes        0          0         No         2        11     Highly Urban/ Urban       0.2             0        $1,549.01  

 5474       0       33       2       11    21460      Yes        0         No       M         Bachelors         Student        10     Commercial   27960      6   Panel Truck    yes       2706        3         No         7         1     Highly Urban/ Urban       0.7             1        $4,093.36  

 5475       0       41       0       12    135103     No       321449      Yes      M            PhD             Lawyer        47      Private     15720     14     Minivan      no         0          0         No         0        19     Highly Urban/ Urban      0.08             0          $30.11   

 5480       0       44       3       12    69620      No       239561      Yes      M          Masters          Manager        37      Private     12860      7     Minivan      yes        0          0         No         1        15     Highly Urban/ Urban      0.08             0         $-313.39  

 5481       0       48       0       13    36835      No       167142      Yes      M        High School      Blue Collar      20     Commercial   17360      6     Minivan      no       32434        2         No         2        10     Highly Urban/ Urban      0.38             1        $1,837.93  

 5484       0       45       2        8    32097      No       175005      Yes      F            PhD            Manager        19      Private      9210      1       SUV        no         0          0         No         0        14     Highly Urban/ Urban      0.08             0         $444.22   

 5494       0       41       0        0      0        No         0         No       M         Bachelors         Student        28     Commercial   24450      6   Panel Truck    yes       4033        1         No         1       7.56    Highly Rural/ Rural      0.21             0        $1,176.00  

 5495       0       37       0        7    61790      No         0         No       M        High School      Blue Collar      32     Commercial   13700      4     Minivan      no        7373        3         Yes        2         7     Highly Urban/ Urban       0.7             1        $3,232.60  

 5497       1       42       1       14    52141      No       152990      Yes      F        High School      Blue Collar      38     Commercial   10820     13       SUV        no         0          0         No         0         9     Highly Rural/ Rural      0.06             0         $267.16   

 5499       0       58       0        8    77297      No       280067      No       M         Bachelors       Blue Collar      5      Commercial    7300      4     Pickup       no        3075        4         No         5         1     Highly Urban/ Urban      0.62             1        $3,264.78  

 5507       0       40       0       10    27073      No       126366      Yes      M   Less Than High School Blue Collar      38     Commercial   24870      4   Panel Truck    yes        0          0         No         0         1     Highly Rural/ Rural      0.05             0         $782.98   

 5510       0       51       0       11    48333      No       147634      No       F        High School      Blue Collar      40     Commercial   11430      4       SUV        no         0          0         No         1         1     Highly Rural/ Rural       0.1             0        $1,346.91  

 5515       0       46       0       13    14193      No         0         Yes      F        High School        Student        40     Commercial    2920      1       SUV        no         0          0         No         4         8     Highly Rural/ Rural      0.07             0        $1,003.33  

 5516       0       60       0       15    63192      No       254621      Yes      M            PhD             Lawyer        12      Private     13820      6     Minivan      yes       7575        2         No         0        16     Highly Urban/ Urban      0.11             0         $406.84   

 5517       0       36       0       12    103138     No       290185      No       M            PhD             Lawyer        35      Private     17960      1       Van        yes        0          0         No         3        20     Highly Urban/ Urban      0.25             0        $2,260.02  

 5524       0       53       0       11    168419     No         0         No       M            PhD             Lawyer        17      Private     15340      6     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.15             0         $714.22   

 5530       0       33       1       10    34192      Yes        0         No       F        High School      Blue Collar      22     Commercial   13670      1       SUV        no         0          0         No         0         7     Highly Rural/ Rural      0.09             0        $1,634.71  

 5534       0       30       3       12    31806      No       140927      Yes      F        High School       Home Maker      34      Private     14720      1       SUV        no         0          0         No         3       3.85    Highly Urban/ Urban      0.19             0        $1,677.31  

 5543       0       57       0        9    26222      No       165896      Yes      M   Less Than High School   Clerical       73     Commercial   23720     11   Panel Truck    yes       4006        1         No         0         1     Highly Urban/ Urban      0.37             1        $2,611.24  

 5545       0       56       0       14    22881      No       174663      Yes      M        High School      Blue Collar      19     Commercial    7100      1     Pickup       yes       995         3         No         3         1     Highly Urban/ Urban      0.45             1        $3,018.78  

 5558       0       64       0      11.16  185586     No         0         No       F            PhD            Manager        30      Private     43090      1     Pickup       no        3475        1         No         1        10     Highly Urban/ Urban       0.1             0         $949.97   

 5562       0       44       1       16    89888      Yes      302923      No       M         Bachelors       Professional     13     Commercial   24420     10   Panel Truck    yes        0          0         No         0         8     Highly Urban/ Urban      0.33             1        $2,411.12  

 5573       0       30       5        0      0        No         0         Yes      M        High School        Student        6      Commercial   16810      1       Van        no        1975        3         No         8         1     Highly Urban/ Urban      0.78             1        $4,013.72  

 5581       1       62       1       15    60216      No       227488      Yes      F        High School      Blue Collar      49     Commercial   20490      9       SUV        no         0          0         Yes        0         7     Highly Rural/ Rural      0.12             0        $1,034.67  

 5583       0       45       0       11    53556      No       167505      Yes      M   Less Than High School Blue Collar      63     Commercial   19050      4       Van        yes        0          0         No         3         1     Highly Urban/ Urban      0.39             1        $3,226.77  

 5587       0       44       0       10    63426      No       209773      No       M        High School      Blue Collar      26     Commercial    2330     13     Minivan      yes        0          0         Yes        0         1     Highly Urban/ Urban      0.63             1        $2,225.64  

 5589       0       31       1       14    86794      Yes        0         No       F         Bachelors       Blue Collar      55     Commercial   19910      4       SUV        no        4156        1         Yes        2         8     Highly Urban/ Urban      0.68             1        $4,039.52  

 5591       0       46       0       10    121840     No       326187      No       F          Masters           Lawyer        31      Private     29300      3   Sports Car     no         0          0         No         1       14.39   Highly Urban/ Urban      0.19             0        $1,687.18  

 5596       0       65       0       14    66327      No       231739      Yes      F          Masters           Lawyer        45      Private     13350      6   Sports Car     no        5906        2         No         4         9     Highly Urban/ Urban      0.17             0        $2,084.12  

 5606       0       46       0        0      0        No         0         No       M        High School        Student        32     Commercial    9200      3     Pickup       no       11583        3         No         3         1     Highly Urban/ Urban      0.78             1        $3,863.67  

 5608       0       42       1        7    75626      Yes      246952      No       M         Bachelors       Professional     35      Private     13260      6     Minivan      yes       5754        5         No         0         8     Highly Urban/ Urban       0.2             0        $2,184.89  

 5611       0       24       1        7    51505      No       201604      Yes      F          Masters          Manager        5       Private      8210     10       SUV        no        8401        1         No         0        16     Highly Urban/ Urban      0.07             0         $-584.36  

 5612       0       54       0      12.82  40355      No       188388      Yes      M          Masters           Lawyer        42      Private     17460      1       Van        yes       2629        3         No         1         9     Highly Urban/ Urban      0.14             0        $1,887.37  

 5614       0       45       0        7    18503      No         0         No       M   Less Than High School Blue Collar      23      Private      3350      6     Minivan      yes        0          0         No         0         1     Highly Urban/ Urban      0.36             1        $1,541.10  

 5620       0       51       0       15    108237     No       305752      Yes      F         Bachelors         Manager        27      Private     25840      4     Minivan      no         0          0         No         2        11     Highly Urban/ Urban      0.07             0         $-694.71  

 5623       0       38       0        0      0        No         0         Yes      F   Less Than High School   Student        22      Private     17680     10     Minivan      no         0          0         No         0         9     Highly Urban/ Urban      0.34             1         $404.82   

 5624       0       49       0       14    45321      No       191423      Yes      M          Masters          Manager        33      Private     20120      1     Minivan      no        5996        3         No         4        13     Highly Urban/ Urban      0.13             0         $890.38   

 5626       0       51       0       13    63150      No       190671      Yes      F         Bachelors         Manager        57      Private      9270      1       SUV        no        6662        1         No         5        12     Highly Urban/ Urban      0.13             0        $1,122.21  

 5633       0       67       0       13    94046      No         0         No       F            PhD             Doctor        5       Private     17600      1   Sports Car     no         0          0         No         3        14     Highly Urban/ Urban      0.17             0        $1,168.38  

 5635       0       61       0        5    102203     No       306677      No       F         Bachelors         Manager        23      Private     17820     10       SUV        no         0          0         No         0        10     Highly Urban/ Urban      0.11             0         $-66.31   

 5640       0       54       0        6    43946      No         0         No       F            PhD             Doctor        54      Private     16320      1     Pickup       no         0          0         Yes        2        14     Highly Urban/ Urban      0.33             1        $1,684.17  

 5643       0       50       0        8    82493      No       244793      No       F            PhD             Doctor        36      Private     34440      1     Pickup       no         0          0         No         0         7     Highly Urban/ Urban      0.12             0         $812.62   

 5644       0       47       0        8    59135      No       197231      No       F        High School      Blue Collar      9      Commercial    6200      7   Sports Car     no         0          0         No         0        10     Highly Urban/ Urban      0.46             1        $2,239.70  

 5653       0       38       2       10    35311      No       179004      Yes      M        High School      Blue Collar      35     Commercial   19510     11       Van        yes       956         2         No         0        10     Highly Urban/ Urban      0.32             1        $2,046.92  

 5663       0       41       0       11    23250      No       158854      Yes      F   Less Than High School Blue Collar      23      Private     14020      6   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.03             0         $-90.03   

 5664       0       47       0        0      0        No         0         No       M   Less Than High School   Student        25      Private      6200      9     Pickup       no       25973        1         Yes        0         5     Highly Urban/ Urban       0.7             1        $2,357.99  

 5667       0       48       0        8    54834      No       198651      Yes      M        High School      Blue Collar      21     Commercial   20970      4       Van        no        639         3         No         3         1     Highly Urban/ Urban      0.39             1        $3,000.81  

 5671       0       47       0        7    21517      No       130812      Yes      M        High School        Clerical       12     Commercial    8350     10     Pickup       no        7143        2         No         7         1     Highly Urban/ Urban      0.64             1        $3,114.10  

 5673       0       47       0       13    45431      No       192184      Yes      M   Less Than High School Blue Collar      45     Commercial   16780      4       Van        no        3809        2         No         5         1     Highly Urban/ Urban      0.48             1        $3,646.61  

 5676       0       41       0       14    173691     No       428992      Yes      F            PhD            Manager        18     Commercial   33440      6     Pickup       no        3189        1         No         0        16     Highly Urban/ Urban      0.09             0         $454.16   

 5678       0       42       0        5    13373      No         0         Yes      F         Bachelors         Student        5      Commercial   29730     10     Pickup       no         0          0         No         0        12     Highly Urban/ Urban       0.3             1         $428.36   

 5698       0       44       0       12    82085      No       271926      Yes      M         Bachelors       Blue Collar      33     Commercial   20760      1     Minivan      no         0          0         Yes        0        10     Highly Urban/ Urban      0.43             1        $1,803.32  

 5700       0       34       3       11    159559     No       387220      Yes      M          Masters          Manager        54      Private     42560      4     Minivan      no         0          0         No         0        21     Highly Urban/ Urban      0.05             0         $-503.19  

 5705       0       51       0        0      0        No         0         No       F        High School       Home Maker      5       Private     16760      6       SUV        no         0          0         No         1         4     Highly Urban/ Urban      0.54             1        $1,809.02  

 5706       0       50       0      0.51     0        No         0         No       F   Less Than High School   Student        48      Private      6500      1   Sports Car     no         0          0         No         6         4     Highly Urban/ Urban      0.73             1        $3,817.89  

 5711       0       48       0       12    106409     No       306954      Yes      F         Bachelors       Professional     25      Private     18900     17       SUV        no         0          0         No         1         8     Highly Urban/ Urban      0.11             0         $283.24   

 5712       0       38       0        0      0        No         0         Yes      F         Bachelors         Student        29     Commercial    5300      1   Sports Car     no        8080        1         Yes        5        11     Highly Urban/ Urban      0.83             1        $3,735.15  

 5716       0       50       0       11    54344      No         0         No       M         Bachelors         Manager        50      Private      1500      1     Minivan      yes       3850        1         No         1        10     Highly Urban/ Urban      0.16             0         $638.03   

 5719       0       38       0        9    156060     No       381438      Yes      M         Bachelors       Blue Collar      29     Commercial   25230      1   Panel Truck    yes       8207        1         No         7         9     Highly Urban/ Urban      0.44             1        $2,982.32  

 5725       0       32       1        9    89286      Yes        0         No       F        High School      Blue Collar      37     Commercial    4700      6   Sports Car     no         0          0         Yes        1         9     Highly Urban/ Urban      0.64             1        $3,896.55  

 5728       0       44       2       11    242731     No       435193      Yes      F            PhD             Doctor        37      Private     18490      7       SUV        no         0          0         No         2        17     Highly Urban/ Urban      0.05             0          $74.87   

 5734       0       60       3       17     6104      No         0         Yes      F         Bachelors         Student        31     Commercial    8540      1       SUV        no         0          0         No         0         7     Highly Rural/ Rural      0.05             0         $154.32   

 5735       1       43       2       12    23996      No       150242      Yes      F   Less Than High School  Home Maker      47      Private      7100      6   Sports Car     no         0          0         No         0         7     Highly Rural/ Rural      0.03             0          $71.83   

 5743       0       41       0       14    104032     No       320228      Yes      M          Masters          Manager        35     Commercial   17160     13       Van        yes       2269        3         No         1         1     Highly Urban/ Urban      0.13             0        $1,429.16  

 5754       0       50       0      11.6   22254      No       127571      Yes      F   Less Than High School Blue Collar      56      Private     17420     10       SUV        no         0          0         No         0         1     Highly Urban/ Urban       0.2             0        $1,501.07  

 5755       0       46       0        7    82149      No         0         No       M         Bachelors       Blue Collar      19     Commercial   19980      7       Van        yes       8054        2         No         0        10     Highly Urban/ Urban      0.43             1        $2,305.34  

 5756       0       50       0       12    58643      No       212459      Yes      F         Bachelors       Professional     33      Private     20680     15   Sports Car     no         0          0         No         2         8     Highly Urban/ Urban      0.15             0        $1,013.19  

 5766       0       48       0        6    111135     No       306956      Yes      F          Masters          Manager        39      Private     27530      4     Minivan      no         0          0         No         0        20     Highly Urban/ Urban      0.06             0         $-793.19  

 5770       0       43       0        6    86530      No         0         No       F         Bachelors       Blue Collar      54     Commercial   15490      6   Sports Car     no        2441        2         No         0        13     Highly Urban/ Urban      0.42             1        $2,741.53  

 5774       0       39       0       10    70436      No         0         No       M          Masters        Professional     52      Private     12480      1     Minivan      no         0          0         No         0        14     Highly Urban/ Urban       0.2             0        $1,621.45  

 5775       0       37       0       11    39777      No       123004      No       F   Less Than High School Blue Collar      5       Private     13670      4       SUV        no         0          0         No         0         8     Highly Rural/ Rural      0.04             0         $-257.34  

 5776       0       40       2       15    175263     No       447360      Yes      F         Bachelors       Professional     37     Commercial   34390      1       Van        no         0          0         No         0         9     Highly Urban/ Urban      0.15             0        $1,639.73  

 5778       0       49       0       11    29016      No         0         No       F   Less Than High School Blue Collar      25      Private     16390     10       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.05             0          $62.02   

 5786       0       54       0        0      0        No         0         No       F        High School        Student        38     Commercial    7180      6   Sports Car     no       19036        2         Yes        4         5     Highly Rural/ Rural      0.47             1        $2,814.08  

 5787       0       53       0       13    35516      No         0         No       F        High School        Clerical       21      Private     21770      7     Minivan      no        1105        2         No         6         1     Highly Urban/ Urban      0.58             1        $2,326.07  

 5791       0       39       0       0.6     0        No       80529       Yes      M         Bachelors        Home Maker      52      Private     18420      6     Minivan      yes       8698        1         No         4         7     Highly Urban/ Urban      0.46             1        $1,796.35  

 5794       0       35       1       12     8701      No       80364       Yes      M          Masters        Professional     28      Private      6050     10     Pickup       yes      23176        1         No         6        17     Highly Urban/ Urban      0.35             1        $2,038.82  

 5803       0       54       0       16    63195      No       211882      Yes      F         Bachelors       Blue Collar      29     Commercial   11440      7       SUV        no         0          0         No         0         2     Highly Urban/ Urban      0.28             0        $1,722.32  

 5804       0       49       0       13     7784      No       98722       Yes      F   Less Than High School   Clerical       50      Private     13160      5     Minivan      yes       1943        3         No         0         7     Highly Urban/ Urban      0.27             0        $1,359.58  

 5808       0       55       0       12     8088      No         0         Yes      F        High School        Student        16     Commercial    7810      4       SUV        no         0          0         Yes        2         1     Highly Rural/ Rural      0.12             0         $901.25   

 5810       1       38       2       14     8117      No       99799       Yes      M   Less Than High School   Clerical       22      Private      6110     13     Minivan      yes        0          0         No         2         7     Highly Rural/ Rural      0.08             0         $-373.89  

 5813       0       36       2       12    24612      No       130016      Yes      F         Bachelors         Clerical       36      Private      6580      1   Sports Car     no       21939        2         Yes        1         8     Highly Urban/ Urban      0.42             1        $2,379.45  

 5828       2       45       3       10    64015      Yes        0         No       M        High School      Blue Collar      36     Commercial   12400      6     Minivan      no         0          0         No         0         1     Highly Rural/ Rural      0.17             0        $1,964.67  

 5839       1       40       2        9    214199     Yes      539729      No       F            PhD             Doctor        48      Private     31980      1     Minivan      no       30986        2         Yes        0        17     Highly Urban/ Urban      0.24             0        $1,764.62  

 5842       0       43       0       10    97953      No         0         No       M         Bachelors       Blue Collar      43     Commercial   13080      1     Minivan      no        6748        3         No         0       7.52    Highly Urban/ Urban      0.41             1        $2,434.35  

 5843       0       35       0       12    78021      No       223694      Yes      F         Bachelors         Manager        7       Private     12800     10       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.06             0         $-654.13  

 5844       0       52       0       15    58869      No       173894      Yes      M         Bachelors       Professional     8       Private      7390      3     Pickup       no        2799        2         No         7         9     Highly Urban/ Urban      0.27             0        $1,926.69  

 5847       0       39       2       12    71486      Yes        0         No       M          Masters        Professional     37     Commercial   26380      8   Panel Truck    yes       4718        2         No         6        14     Highly Urban/ Urban      0.57             1        $4,307.15  

 5851       0       46       0        7    38786      No       150824      No       M         Bachelors       Blue Collar      9      Commercial   10580      9     Minivan      yes        0          0         No         2         7     Highly Rural/ Rural      0.12             0         $100.73   

 5854       0       40       0       11    119244     No       349833      No       F         Bachelors       Blue Collar      23     Commercial   29930      4   Sports Car     no         0          0         No         6         1     Highly Rural/ Rural      0.14             0        $1,899.57  

 5857       0       39       0       11    90635      No       251424      Yes      M         Bachelors       Blue Collar      18     Commercial    5400      1     Minivan      no         0          0         No         1         9     Highly Rural/ Rural      0.04             0         $-326.04  

 5866       0       41       2       16    35636      No       150462      Yes      F        High School        Clerical       42      Private     15120      6   Sports Car     no        5358        1         No         7         1     Highly Urban/ Urban      0.43             1        $3,009.73  

 5874       0       50       0       14    78510      No       232988      Yes      F   Less Than High School   Clerical       64      Private      1500      6   Sports Car     no         0          0         No         0         3     Highly Urban/ Urban      0.17             0        $1,821.33  

 5886       0       36       3       12    17663      Yes      134466      No       F        High School       Home Maker      61      Private     20020      4       SUV        no         0          0         No         0         6     Highly Rural/ Rural      0.04             0         $875.80   

 5895       0       53       0        7    34730      No       169666      Yes      F        High School      Professional     5       Private     10270     15       SUV        no         0          0         No         1        4.9    Highly Urban/ Urban      0.15             0         $478.61   

 5897       0       56       0        9    67620      No       245585      Yes      F          Masters           Lawyer        24      Private     20500     25       SUV        no         0          0         No         0        17     Highly Urban/ Urban       0.1             0         $-439.16  

 5898       0       46       0        8    51822      No       174401      Yes      F        High School      Blue Collar      30      Private      7870      1       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.17             0        $1,439.36  

 5900       0       20       0       10    38681      No         0         No       F         Bachelors       Professional     64      Private     17010      9       SUV        yes      30646        1         Yes       10        10     Highly Urban/ Urban      0.75             1        $3,866.28  

 5902       1       39       1        0      0        No       64780       Yes      M        High School       Home Maker      19      Private     22050      1     Minivan      yes       2969        1         No         2         1     Highly Urban/ Urban      0.51             1        $2,043.82  

 5908       0       38       0       10    28917      No         0         No       F        High School        Clerical       29      Private     11310      1       SUV        no         0          0         Yes        1         1     Highly Urban/ Urban      0.59             1        $2,786.21  

 5909       0       58       0       15     3256      No       122217      Yes      F   Less Than High School  Home Maker      60      Private     18400      1     Minivan      no         0          0         No         1         1     Highly Rural/ Rural      0.03             0         $-319.13  

 5912       0       55       0       12    63376      No       225111      Yes      F         Bachelors       Blue Collar      25     Commercial   13340      7       SUV        no         0          0         No         2        14     Highly Rural/ Rural      0.05             0          $7.31    

 5913       0       51       0        7    70195      No       269925      Yes      M         Bachelors         Manager        71      Private     18950     10       Van        no         0          0         No         2         8     Highly Urban/ Urban      0.09             0         $450.39   

 5917       0       38       0        9    34648      No         0         No       M        High School      Blue Collar      47     Commercial   10760      1     Pickup       no         0          0         Yes        2         1     Highly Rural/ Rural      0.22             0        $2,160.13  

 5918       0       29       2       11    47621      Yes      196036      No       F        High School      Blue Collar      26     Commercial   17130      9     Minivan      no        5584        3         No         6         1     Highly Urban/ Urban      0.69             1        $3,770.31  

 5921       0       43       2        9    159443     No       423784      Yes      M         Bachelors       Professional     20      Private     21740      3       Van        yes       4538        1         No         3         5     Highly Urban/ Urban      0.12             0        $1,498.92  

 5931       0       48       0        0      0        No       127576      Yes      F        High School       Home Maker      30      Private      6300      4       SUV        no         0          0         No         0         9     Highly Urban/ Urban      0.32             1        $1,424.53  

 5942       0       44       0       12     6591      No       65192       No       F   Less Than High School  Home Maker      33      Private      2160      9       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.39             1        $2,084.23  

 5943       0       47       0       12    101498     No         0         No       M          Masters        Professional     51     Commercial   11770     10     Pickup       yes      21063        1         Yes        6        12     Highly Urban/ Urban      0.71             1        $3,925.35  

 5950       0       50       0       11    134152     No         0         No       M            PhD             Doctor        5       Private     29550     10     Minivan      yes        0          0         No         1        11     Highly Urban/ Urban      0.12             0         $-268.24  

 5954       0       39       0       12    44738      No       217422      Yes      F         Bachelors         Clerical       26      Private     29640      6     Minivan      no         0          0         No         3        10     Highly Rural/ Rural      0.04             0        $-1,029.62 

 5983       0       49       0        6    173894     No       423673      Yes      F            PhD             Doctor        8       Private     23790      6     Minivan      no         0          0         No         3        15     Highly Urban/ Urban      0.07             0         $-673.47  

 5995       0       19       0        6     5336      No         0         No       F        High School        Clerical       26      Private     11650      6   Sports Car     yes       1845        2         No         7         1     Highly Urban/ Urban      0.71             1        $3,765.37  

 6002       0       45       1        8    47389      Yes      204888      No       F         Bachelors        Home Maker      23      Private     26730     20     Pickup       no         0          0         No         2         9     Highly Urban/ Urban      0.28             0        $1,009.46  

 6005       0       38       2       10    23536      No       98782       Yes      F        High School       Home Maker      84      Private     10430     10       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.02             0         $-375.98  

 6009       0       56       0       12    25891      No       127035      Yes      F         Bachelors        Home Maker      42      Private     19280      6       SUV        no       35012        3         Yes        0         1     Highly Urban/ Urban      0.25             0        $1,691.78  

 6011       0       59       0        9    28818      No       153289      Yes      F         Bachelors        Home Maker      6       Private     29230      6     Pickup       no         0          0         No         1         1     Highly Rural/ Rural      0.02             0        $-1,424.90 

 6012       0       31       0       11    86264      No         0         No       M          Masters        Professional     32      Private     14930      1     Minivan      no         0          0         No         0        18     Highly Rural/ Rural      0.02             0         $-406.66  

 6019       0       51       0       11    93785      No       287311      Yes      F          Masters           Lawyer        31      Private      6600      1       SUV        no        1230        3         No         1        12     Highly Urban/ Urban      0.11             0        $1,366.49  

 6021       0       40       2       14    140171     No       352820      Yes      M        High School        Manager        16      Private      5600      4     Pickup       yes       5735        1         No         8         6     Highly Urban/ Urban      0.15             0        $1,157.25  

 6029       0       49       0       11    39220      No       201872      No       F   Less Than High School Blue Collar      34     Commercial   16430     10       SUV        no        5161        1         No        11         7     Highly Urban/ Urban      0.83             1        $4,449.36  

 6036       0       50       0       12    45215      No         0         No       F        High School      Blue Collar      33     Commercial   26460      6     Minivan      no         0          0         No         4        13     Highly Urban/ Urban      0.63             1        $2,372.69  

 6037       0       39       0       14    93077      No       244764      Yes      M         Bachelors       Professional     29      Private     14710      1     Minivan      yes        0          0         No         0         1     Highly Rural/ Rural      0.01             0         $-947.97  

 6038       0       55       0        9    162585     No       436688      Yes      F            PhD             Doctor        12      Private     17760      7       SUV        no         0          0         No         2        20     Highly Urban/ Urban      0.06             0         $-261.23  

 6043       0       48       0       13    38896      No       214165      Yes      M   Less Than High School   Clerical       75      Private     10190      1     Pickup       yes        0          0         No         1         1     Highly Rural/ Rural      0.03             0         $505.24   

 6045       0       58       0      12.34  73463      No       229325      Yes      M          Masters           Lawyer        34      Private     20710      6       Van        yes      11061        2         No         2        18     Highly Urban/ Urban      0.13             0        $1,276.57  

 6047       2       57       3       14    106140     Yes      347576      No       F          Masters           Lawyer        39      Private      7200      4       SUV        no         0          0         Yes        4        15     Highly Urban/ Urban      0.67             1        $3,828.46  

 6048       0       49       0       13    112039     No       278669      Yes      F            PhD             Doctor        34      Private     29650     11     Pickup       no         0          0         No         0        14     Highly Urban/ Urban      0.05             0         $-542.04  

 6061       0       32       3       11    62615      No       184803      Yes      M          Masters          Manager        18     Commercial   24660      1   Panel Truck    no        2130        2         No         4        14     Highly Urban/ Urban      0.21             0        $1,794.83  

 6063       0       54       0       12    38349      No       169694      No       F         Bachelors        Home Maker      27      Private     10620      6   Sports Car     no         0          0         No         0        7.8    Highly Urban/ Urban      0.23             0        $1,376.13  

 6064       0       31       4       12    15292      Yes        0         No       F   Less Than High School   Clerical       24      Private     15190      6       SUV        no         0          0         No         1         1     Highly Rural/ Rural      0.08             0        $1,199.24  

 6068       0       49       0       10    42071      No       160036      No       F   Less Than High School Blue Collar      48      Private     10610     10       SUV        no       36189        3         Yes        8       4.23    Highly Urban/ Urban      0.76             1        $3,968.48  

 6069       0       52       0       12    201192     No       493471      Yes      M            PhD            Manager        34      Private     17210     10       Van        yes        0          0         No         3        17     Highly Urban/ Urban      0.07             0         $463.54   

 6070       0       42       0        8    52292      No       172461      Yes      M        High School      Blue Collar      38     Commercial   22960      6   Panel Truck    yes       6597        2         No         3         1     Highly Urban/ Urban      0.39             1        $2,887.60  

 6071       0       31       4       14    48317      No       133939      Yes      F        High School        Clerical       41      Private     26130      7       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.19             0        $1,347.90  

 6074       0       30       1       10    63425      Yes      222135      No       F        High School        Manager        36      Private     17230      9     Minivan      no        4927        2         No         6         9     Highly Urban/ Urban      0.27             0        $1,654.66  

 6079       0       53       0       12    180034     No         0         No       F            PhD            Manager        27     Commercial   32950      6     Pickup       no        3488        2         No         3        15     Highly Urban/ Urban      0.25             0        $1,820.76  

 6082       0       53       0       11    114179     No       310405      Yes      M          Masters          Manager        20      Private     23080      6     Minivan      no         0          0         No         4        16     Highly Urban/ Urban       0.1             0         $-89.54   

 6088       0       27       3        9    43915      Yes        0         No       M        High School      Blue Collar      39     Commercial    3260      1     Minivan      yes       5476        3         No         2       4.71    Highly Urban/ Urban      0.55             1        $3,781.26  

 6094       0       52       0        7    115756     No       312262      Yes      M          Masters          Manager        15     Commercial   16760     10       Van        no         0          0         No         3         1     Highly Urban/ Urban      0.16             0        $1,299.52  

 6095       0       51       0       15    57782      No       187295      Yes      F        High School      Blue Collar      26     Commercial   12380      6     Pickup       no         0          0         No         1         6     Highly Urban/ Urban      0.32             1        $1,687.91  

 6098       0       35       2       10    86997      No       234307      Yes      F          Masters          Manager        57     Commercial   28700      1     Pickup       no        6459        3         No         4        16     Highly Urban/ Urban       0.2             0        $1,877.30  

 6102       1       38       2       15    40342      No       189439      Yes      F         Bachelors         Clerical       5       Private      9330      4   Sports Car     no         0          0         No         0        14     Highly Rural/ Rural      0.04             0         $-618.70  

 6105       0       35       2       14    65102      No       233449      Yes      F         Bachelors       Blue Collar      11     Commercial   15120     13       SUV        no       19508        2         Yes        5        11     Highly Urban/ Urban      0.63             1        $2,410.64  

 6113       0       46       0       10    132560     No       319774      No       M          Masters           Lawyer        21      Private     14760      4     Minivan      yes        0          0         No         4        11     Highly Urban/ Urban      0.26             0        $1,420.43  

 6116       0       45       0        8    39472      No       111469      Yes      M        High School      Blue Collar      31      Private      2230      1     Minivan      yes        0          0         No         5         9     Highly Urban/ Urban      0.32             1        $1,706.91  

 6120       0       52       0       12    114635     No       321942      No       M        High School        Manager        30     Commercial   18160     10       Van        yes       7202        3         No         3         1     Highly Urban/ Urban      0.29             1        $2,267.31  

 6121       0       47       0        0      0        No       91949       No       M            PhD           Home Maker      52      Private      6200      6     Pickup       no         0          0         No         0        20     Highly Urban/ Urban       0.5             1        $2,264.85  

 6126       0       55       0       13    70839      No         0         No       M         Bachelors       Professional     8      Commercial   24120      1   Panel Truck    yes        0          0         No         1        11     Highly Urban/ Urban      0.38             1        $2,228.71  

 6144       0       48       0       14    78890      No       211819      Yes      M          Masters           Lawyer        52      Private     19160     10     Minivan      no        4824        2         No         3        14     Highly Urban/ Urban      0.15             0         $944.36   

 6145       0       46       0        0      0        No       151139      No       F         Bachelors        Home Maker      37      Private     24700      1     Pickup       no         0          0         No         0         4     Highly Rural/ Rural      0.09             0         $221.14   

 6153       0       41       2       11    29936      Yes        0         No       M         Bachelors       Professional     5      Commercial   30540     21   Panel Truck    no        6257        5         No         2        14     Highly Urban/ Urban      0.48             1        $2,600.08  

 6156       0       47       0       11    127129     No       369418      No       M         Bachelors       Professional     15     Commercial   18910      9       Van        yes        0          0         No         0         5     Highly Urban/ Urban       0.3             1        $1,993.40  

 6159       0       46       0        8    30111      No       164877      No       M   Less Than High School Blue Collar      28      Private      3910      4     Minivan      yes        0          0         No         1         1     Highly Urban/ Urban      0.37             1        $1,806.24  

 6162       1       48       0       13    14522      No       109990      Yes      M   Less Than High School   Clerical       29      Private     14940      6     Minivan      no        7310        3         No         8         9     Highly Rural/ Rural      0.15             0        $1,277.49  

 6184       0       45       1        9    24178      No       115381      Yes      F   Less Than High School   Clerical       67      Private     19100      6       SUV        no        7727        3         Yes        2         1     Highly Urban/ Urban      0.45             1        $2,933.19  

 6188       0       48       0       13    208667     No       482291      No       M            PhD            Manager        31     Commercial   24880      6   Panel Truck    no       12014        1         Yes        3         6     Highly Urban/ Urban       0.4             1        $2,759.24  

 6189       1       55       1       17    83076      No       254660      Yes      M        High School      Professional     31      Private     13000      4     Minivan      no       22887        2         No         6         1     Highly Urban/ Urban      0.31             1        $2,429.53  

 6191       0       56       0       11    76845      No         0         No       F         Bachelors       Professional     46      Private     22460      4       SUV        no       37932        2         Yes        0        13     Highly Urban/ Urban      0.35             1        $2,147.04  

 6211       1       42       3       12    106194     Yes        0         No       F          Masters        Professional     33     Commercial   18760      6     Pickup       no         0          0         No         0         8     Highly Urban/ Urban      0.42             1        $3,238.33  

 6216       0       35       1       12    31616      Yes      133918      No       F        High School        Clerical       47      Private     14430      1       SUV        no         0          0         Yes        0         7     Highly Rural/ Rural      0.11             0        $1,600.20  

 6218       0       35       2        7    50872      No       190621      Yes      F        High School      Blue Collar      46     Commercial   14980      6       SUV        no       35500        1         Yes        0         4     Highly Urban/ Urban      0.47             1        $2,665.39  

 6222       0       57       0        6    79670      No       242651      Yes      M        High School      Blue Collar      5      Commercial    9470      6     Pickup       yes        0          0         No         2       4.98    Highly Urban/ Urban      0.33             1        $1,697.12  

 6235       0       53       0       11    55861      No         0         No       M   Less Than High School Blue Collar      12      Private      1500      6     Minivan      yes        0          0         No         0         7     Highly Urban/ Urban      0.29             1        $1,035.39  

 6245       0       43       0       12    116044     No         0         No       F         Bachelors       Professional     25      Private     16900      4       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.18             0        $1,511.27  

 6248       1       42       4       15     9950      No         0         Yes      F        High School        Student        37      Private     18800      8   Sports Car     no        7942        3         No         7         1     Highly Urban/ Urban       0.5             1        $3,180.08  

 6253       0       46       0       15    25324      No       109034      Yes      M        High School        Clerical       21      Private      6100      1     Pickup       no         0          0         No         2         1     Highly Urban/ Urban      0.28             0        $1,773.88  

 6256       0       53       0       11    48421      No       201603      No       M          Masters        Professional     36      Private     25290     13     Minivan      yes        0          0         No         0         1     Highly Rural/ Rural      0.03             0         $-365.71  

 6257       0       35       0        5    18004      No         0         No       M        High School        Clerical       36      Private     15290      4     Minivan      yes        0          0         Yes        0         1     Highly Urban/ Urban      0.58             1        $2,196.98  

 6259       0       58       0        8    38462      No       188530      Yes      M         Bachelors       Blue Collar      56     Commercial   11150      4     Minivan      yes      10353        3         No         2         5     Highly Urban/ Urban      0.38             1        $2,385.19  

 6266       0       59       0       14    110323     No       327486      Yes      M         Bachelors       Professional     10     Commercial   40760     15   Panel Truck    yes       5169        2         No         4        13     Highly Urban/ Urban      0.28             1        $1,588.26  

 6268       0       44       2       14    16800      No       136818      Yes      F   Less Than High School   Clerical       47      Private      7580      6       SUV        no         0          0         No         0         5     Highly Urban/ Urban      0.24             0        $1,597.00  

 6275       0       41       0        8    67014      No       91629       No       M         Bachelors       Professional     39      Private     24050      1     Minivan      yes       5296        2         No         2         5     Highly Urban/ Urban      0.26             0        $1,949.08  

 6280       0       54       0        6    55977      No         0         No       M         Bachelors       Professional     45     Commercial    9790      1     Pickup       yes       6193        1         No         4         8     Highly Urban/ Urban      0.51             1        $3,385.11  

 6283       0       47       0       12    112923     No         0         No       M          Masters        Professional     40     Commercial   21360      6       Van        no         0          0         No         2        20     Highly Urban/ Urban      0.38             1        $2,771.32  

 6288       0       48       0        9    53412      No       160356      Yes      M        High School      Blue Collar      37     Commercial   11640      1     Pickup       no         0          0         No         0         1     Highly Rural/ Rural      0.04             0         $610.81   

 6289       1       41       2       13     7594      No         0         Yes      F   Less Than High School   Student        57      Private      5600      7   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.04             0         $359.99   

 6301       0       44       0       12    52406      No       228990      No       M   Less Than High School   Clerical       39      Private     12180      1     Pickup       yes        0          0         No         2         1     Highly Rural/ Rural      0.06             0         $909.33   

 6308       0       56       0        9    132115     No       373191      Yes      M            PhD            Manager        16     Commercial   26770      1   Panel Truck    no         0          0         Yes        2        14     Highly Urban/ Urban      0.25             0        $1,792.93  

 6314       0       56       0       10    188809     No       484306      No       M            PhD             Doctor        25      Private     35810      9     Minivan      yes        0          0         No         1        21     Highly Urban/ Urban       0.1             0         $-204.44  

 6315       0       61       0       11    80153      No       272445      No       F          Masters          Manager        32      Private     16370      9   Sports Car     no         0          0         No         0        15     Highly Urban/ Urban      0.12             0         $615.63   

 6316       0       42       2       15    151826     Yes        0         No       F            PhD            Manager        55     Commercial   20880      1     Pickup       no         0          0         No         4        14     Highly Urban/ Urban      0.29             1        $3,017.85  

 6317       0       47       0       11    54467      No       205511      No       F         Bachelors       Blue Collar      38     Commercial   11650     13   Sports Car     no        9377        2         No         2        10     Highly Urban/ Urban      0.54             1        $2,756.26  

 6318       0       47       0       11    113496     No       291034      Yes      M          Masters           Lawyer        38      Private     12850     10     Minivan      yes        0          0         No         1       14.3    Highly Urban/ Urban       0.1             0         $170.98   

 6323       0       38       0        9    12216      No         0         No       F        High School        Student        53     Commercial    5200      7   Sports Car     no         0          0         No         2         1     Highly Urban/ Urban      0.55             1        $3,243.09  

 6329       0       19       0        5     3871      No       76851       Yes      F        High School        Manager        49      Private      3790      3       SUV        no        5194        3         No         8         5     Highly Urban/ Urban      0.32             1        $2,410.47  

 6336       0       40       3       14     2292      Yes        0         No       F   Less Than High School  Home Maker     105      Private      5730      4       SUV        no         0          0         No         0         6     Highly Rural/ Rural      0.05             0        $1,501.81  

 6341       1       39       3       13    45437      Yes      87598       No       F        High School      Blue Collar      43     Commercial   10760      6     Pickup       no        2697        2         No         5         1     Highly Urban/ Urban      0.76             1        $4,576.44  

 6348       0       28       0        6    11100      No       121671      No       M   Less Than High School   Clerical       52     Commercial    8820      4     Pickup       no         0          0         No         4         1     Highly Rural/ Rural      0.22             0        $2,279.65  

 6349       0       43       0       12    50755      No       155641      Yes      M        High School      Blue Collar      24     Commercial   30380      4   Panel Truck    yes        0          0         No         2         6     Highly Rural/ Rural      0.05             0         $623.24   

 6365       0       52       0       14    31519      No       162052      Yes      M         Bachelors         Manager        33      Private     20740      6     Minivan      yes        0          0         No         0        12     Highly Urban/ Urban      0.08             0         $-625.68  

 6372       0       54       0       14    164420     No       402031      Yes      F            PhD             Lawyer        48      Private      1500      4       SUV        no       10878        1         No         2        21     Highly Urban/ Urban       0.1             0        $1,289.89  

 6376       0       50       0        8    41985      No         0         No       F         Bachelors        Home Maker      47      Private     17970      4       Van        yes        0          0         No         0         7     Highly Rural/ Rural      0.03             0         $-306.87  

 6378       0       50       0       13    109950     No       293399      Yes      F            PhD             Doctor        45      Private     17500      6       SUV        no         0          0         No         0        15     Highly Urban/ Urban      0.05             0          $95.87   

 6379       0       51       0       13    72334      No         0         No       F        High School      Blue Collar      36     Commercial   11290      4       SUV        no         0          0         Yes        4       4.79    Highly Urban/ Urban      0.75             1        $3,751.19  

 6382       0       36       3       12    45590      No       172745      Yes      F        High School      Professional     9       Private     16650      3       SUV        no         0          0         No         0         5     Highly Urban/ Urban      0.12             0         $937.91   

 6383       0       55       0       13    71003      No       256253      Yes      M         Bachelors       Blue Collar      33     Commercial   11180      3     Pickup       yes       9111        2         No         6         3     Highly Urban/ Urban      0.48             1        $3,092.44  

 6389       0       45       1        0      0        Yes        0         No       F        High School        Student        44      Private      1500      4   Sports Car     no         0          0         No         1         7     Highly Urban/ Urban      0.56             1        $3,243.15  

 6390       0       45       3       12    152563     No       455931      Yes      M         Bachelors         Manager        43      Private     19700      3     Minivan      yes        0          0         No         0         7     Highly Urban/ Urban      0.05             0         $-521.78  

 6392       0       57       2       15    14989      No       84309       Yes      F        High School       Home Maker      43      Private     26140     10   Sports Car     no         0          0         Yes        0         1     Highly Rural/ Rural      0.04             0          $26.09   

 6394       0       43       0        8    166192     No         0         No       M          Masters        Professional     52     Commercial   21110      1       Van        yes       4962        3         No         2       14.47   Highly Urban/ Urban      0.34             1        $3,519.58  

 6402       0       55       0       14    113534     No       339933      Yes      F            PhD            Manager        21     Commercial   24640      6       Van        no         0          0         No         0         7     Highly Urban/ Urban      0.11             0         $959.22   

 6404       2       45       2       12     8467      No       105059      Yes      F   Less Than High School   Clerical       28      Private      6900      9       SUV        no         0          0         No         0         6     Highly Urban/ Urban      0.49             1        $2,051.66  

 6405       0       54       0       12    246164     No       636835      No       F            PhD             Doctor        46      Private     31520     13     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.08             0         $-475.85  

 6406       0       56       0        0     1591      No         0         Yes      F   Less Than High School   Student        5       Private      7100      4       SUV        no         0          0         No         2         7     Highly Urban/ Urban      0.29             1        $1,151.88  

 6409       0       38       0       10    142002     No       345671      Yes      M         Bachelors         Manager        33     Commercial   27750      4   Panel Truck    yes        0          0         No         2        12     Highly Urban/ Urban      0.13             0         $834.47   

 6410       0       32       2       13    72188      No       229982      Yes      F         Bachelors       Professional     29      Private      9790     17       SUV        no        3176        2         No         1        13     Highly Urban/ Urban      0.12             0         $485.25   

 6411       0       48       1        3    80522      No       244552      Yes      F         Bachelors         Manager        16      Private     14350      1       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.08             0         $291.14   

 6421       0       46       0       12    35852      No       142093      Yes      M   Less Than High School Blue Collar      21      Private     13460     10     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.18             0         $626.89   

 6428       0       43       0        9    53431      No         0         No       F         Bachelors       Professional     5       Private      8050      3       SUV        no        4408        1         No         5        12     Highly Urban/ Urban      0.37             1        $1,994.13  

 6429       0       41       1       14     6712      No       96130       Yes      F         Bachelors        Home Maker      37      Private      2910      7   Sports Car     no         0          0         No         2        11     Highly Urban/ Urban      0.23             0        $1,315.74  

 6432       0       49       0       12    45471      No       170808      Yes      F         Bachelors         Clerical       14      Private     10670      1       SUV        no         0          0         No         0         7     Highly Urban/ Urban      0.19             0         $941.11   

 6436       0       44       0       14    134967     No       335456      Yes      F          Masters          Manager        31      Private     16020      4     Minivan      no         0          0         No         0        18     Highly Urban/ Urban      0.05             0         $-868.19  

 6437       0       50       0       13    46952      No       223769      Yes      F         Bachelors       Blue Collar      26     Commercial    6200      1       SUV        no         0          0         No         0         1     Highly Urban/ Urban       0.3             1        $2,049.05  

 6438       0       47       0       11    69692      No       243839      Yes      F          Masters           Lawyer        58      Private     18370      4   Sports Car     no        3314        2         No         0        10     Highly Urban/ Urban       0.1             0        $1,581.54  

 6445       0       57       0       12    97083      No         0         No       F         Bachelors       Professional     20      Private     18800     13     Minivan      no        4925        1         No         4        13     Highly Urban/ Urban      0.29             1         $837.20   

 6447       0       48       0        6    14410      No         0         No       F   Less Than High School   Clerical       27      Private      7740      7       SUV        no        1001        1         No         3         1     Highly Urban/ Urban      0.52             1        $2,678.89  

 6450       0       39       2       13    192426     No       483998      Yes      M            PhD             Doctor        46      Private     33460      1     Minivan      yes        0          0         No         0        17     Highly Urban/ Urban      0.04             0         $-252.30  

 6462       0       54       0       12    46074      No         0         No       M         Bachelors         Manager        42      Private     11510      3     Pickup       yes        0          0         No         0         6     Highly Urban/ Urban      0.14             0         $686.19   

 6467       0       43       0      1.32     0        No       84656       Yes      M        High School        Student        36     Commercial   24520      1   Panel Truck    no        1119        1         No         8       4.04    Highly Urban/ Urban      0.78             1        $4,058.31  

 6478       0       51       0        9    95713      No       302676      Yes      F            PhD            Manager        32      Private     23040      9     Pickup       no         0          0         No         0        17     Highly Urban/ Urban      0.06             0         $-340.93  

 6484       0       38       0        7    116933     No       372067      No       M         Bachelors       Professional     19     Commercial   25740      1   Panel Truck    yes        0          0         No         0        14     Highly Urban/ Urban      0.31             1        $2,082.25  

 6492       0       40       0       10    90377      No       251223      No       M         Bachelors       Blue Collar      21     Commercial    5500      1     Pickup       yes        0          0         No         2         7     Highly Urban/ Urban      0.49             1        $2,584.19  

 6497       0       57       2       16    86232      No       272326      Yes      F          Masters          Manager        8       Private     15820      9       SUV        no         0          0         No         0        15     Highly Urban/ Urban      0.06             0         $-629.42  

 6504       0       45       0       13    103134     No       166262      No       F          Masters           Lawyer        38      Private     16310      1   Sports Car     no         0          0         No         0        21     Highly Urban/ Urban      0.17             0        $1,543.40  

 6505       0       53       0       13    69268      No       238236      Yes      M         Bachelors       Blue Collar      31     Commercial   13730      6     Minivan      no       23381        1         No         1        12     Highly Urban/ Urban       0.3             1        $1,359.78  

 6513       0       39       2       17    23094      No       140813      Yes      F        High School      Blue Collar      27     Commercial    9310      4   Sports Car     no        4732        2         No         0         1     Highly Urban/ Urban      0.34             1        $2,679.08  

 6525       0       45       0       12    37407      No       138623      Yes      F         Bachelors         Manager        32      Private      7940      4   Sports Car     no       47712        1         Yes        0        12     Highly Urban/ Urban      0.15             0         $650.37   

 6526       0       57       0       14    111970     No       342129      Yes      M          Masters          Manager        28     Commercial   23780      3   Panel Truck    no       20369        1         Yes        5        15     Highly Urban/ Urban      0.35             1        $2,199.49  

 6528       0       41       2       12      50       No       60765       Yes      M         Bachelors         Student        19     Commercial    5610      1     Pickup       yes        0          0         No         0        14     Highly Rural/ Rural      0.08             0          $16.40   

 6540       0       34       1       12    62044      No       201347      Yes      F         Bachelors       Professional     37      Private     11100     17       SUV        no         0          0         No         0         7     Highly Rural/ Rural      0.01             0        $-1,290.04 

 6542       0       47       0       12    80577      No         0         No       M          Masters           Lawyer        34      Private     13610     11     Minivan      no         0          0         No         3        12     Highly Urban/ Urban      0.26             0        $1,151.88  

 6544       0       44       0        8    27127      No       49944       No       F   Less Than High School   Clerical       36      Private     21960      6     Minivan      no       35472        2         Yes        2         1     Highly Urban/ Urban      0.63             1        $2,453.12  

 6548       0       40       0      11.47  122543     No       326327      Yes      M         Bachelors         Manager        28     Commercial   25100      7   Panel Truck    no         0          0         No         2        15     Highly Urban/ Urban      0.14             0         $579.49   

 6552       0       49       0       10    122192     No       337259      No       M          Masters          Manager        32     Commercial   24120      1   Panel Truck    no         0          0         No         0       12.27   Highly Urban/ Urban       0.2             0        $1,607.70  

 6558       0       50       0       13    53568      No       202687      Yes      M         Bachelors       Blue Collar      37     Commercial   22250     13     Minivan      no         0          0         No         0         7     Highly Rural/ Rural      0.04             0         $-676.99  

 6567       0       53       1        6    86100      No       268336      Yes      M          Masters          Manager        48      Private     15410      8     Minivan      no         0          0         No         1        15     Highly Urban/ Urban      0.07             0         $-288.32  

 6569       0       34       1       12    34887      Yes      156214      No       F         Bachelors       Blue Collar      38     Commercial   23260      1       SUV        no         0          0         No         3        11     Highly Urban/ Urban      0.61             1        $3,717.61  

 6572       0       44       0       11    178864     No       428679      No       F          Masters           Lawyer        43      Private     23790      4     Pickup       no         0          0         No         0        15     Highly Urban/ Urban      0.14             0         $939.42   

 6577       0       46       0       13    128994     No       369612      No       F            PhD            Manager        43      Private     20440      1     Minivan      no         0          0         No         0         7     Highly Urban/ Urban       0.1             0         $615.03   

 6581       0       50       0       13    56566      No       222820      Yes      M          Masters          Manager        27     Commercial   24850      1   Panel Truck    no        1203        3         No         3        11     Highly Urban/ Urban       0.2             0        $1,958.03  

 6588       0       55       0       12    37794      No         0         No       M        High School       Home Maker      38      Private     17050      1     Minivan      no       39617        3         Yes        4         1     Highly Urban/ Urban      0.54             1        $2,882.00  

 6591       1       38       3       15    20145      No       128953      Yes      F        High School       Home Maker      56      Private      5200      3   Sports Car     no       38063        1         Yes        0         1     Highly Urban/ Urban      0.37             1        $2,604.83  

 6594       0       37       3       17    91045      No       206587      Yes      M          Masters          Manager        22     Commercial   27390      1   Panel Truck    no        2215        3         No         3        13     Highly Urban/ Urban      0.17             0        $1,749.77  

 6600       1       40       2       11    85273      Yes      257283      No       F          Masters           Lawyer        55      Private     19070     13       SUV        no        2907        2         No         5        15     Highly Urban/ Urban      0.43             1        $3,169.16  

 6602       1       40       3       14    51401      Yes      179590      No       M         Bachelors       Blue Collar      15     Commercial    9050      1     Pickup       no         0          0         Yes        0         6     Highly Rural/ Rural      0.23             0        $2,056.77  

 6604       0       58       0       11    220178     No       561085      No       M            PhD             Doctor        41      Private     13880      7     Minivan      yes       4323        2         No         1        11     Highly Urban/ Urban       0.1             0         $530.68   

 6605       0       54       0        5    79315      No       255491      Yes      F         Bachelors         Manager        7       Private     14830      4     Minivan      no         0          0         No         2       9.99    Highly Urban/ Urban      0.08             0         $-945.22  

 6614       1       63       1       11    54297      No       231033      Yes      M         Bachelors       Professional     36      Private     12150      4   Sports Car     yes        0          0         No         0        12     Highly Urban/ Urban      0.17             0        $1,759.67  

 6616       0       30       2       12    102113     Yes      255135      No       M        High School        Manager        37      Private     19720      3       Van        no        6998        1         No         0         1     Highly Urban/ Urban      0.11             0        $1,792.17  

 6621       0       48       0       12    64916      No       282967      Yes      M         Bachelors       Blue Collar      18     Commercial    6200      4     Pickup       yes       5893        1         No         6        11     Highly Urban/ Urban      0.49             1        $2,534.20  

 6640       0       51       0      11.76  103328     No       323740      Yes      M         Bachelors       Blue Collar      53     Commercial   16930      7       Van        no        3204        2         No         3        10     Highly Urban/ Urban      0.34             1        $2,558.28  

 6641       0       27       0        8    46293      No         0         No       F   Less Than High School Blue Collar      35      Private     23900      6     Minivan      no        2838        1         No         6         4     Highly Urban/ Urban      0.52             1        $2,357.21  

 6643       0       53       0       16    109040     No       327237      Yes      M            PhD             Doctor        48      Private     28850      1     Minivan      yes        0          0         No         1        15     Highly Urban/ Urban      0.06             0         $115.25   

 6644       0       43       2       13    158180     Yes      163661      No       F          Masters           Lawyer        5       Private     21620      1       SUV        no         0          0         No         2        15     Highly Urban/ Urban      0.19             0        $1,826.88  

 6649       0       48       0       12    63260      No         0         No       F        High School      Blue Collar      7      Commercial   24160      4     Minivan      no        7858        2         No         9         1     Highly Urban/ Urban      0.76             1        $3,398.32  

 6650       0       47       0       10    53758      No         0         No       F        High School      Blue Collar      55     Commercial   15810      4   Sports Car     no        684         1         No         0         1     Highly Urban/ Urban      0.46             1        $3,339.74  

 6655       0       50       0        6    15905      No         0         Yes      M        High School        Student        20     Commercial    8090      1     Minivan      yes       5672        2         No         3         8     Highly Urban/ Urban      0.39             1        $2,041.20  

 6661       0       49       0       15    34050      No       172329      Yes      F   Less Than High School   Clerical       37      Private      9800      9       SUV        no         0          0         No         0        3.3    Highly Rural/ Rural      0.03             0         $-374.19  

 6672       2       46       0        9    69158      No       234203      Yes      M          Masters           Lawyer        40      Private      7940     13       SUV        no        1495        1         No         3       13.61   Highly Urban/ Urban      0.31             1        $2,033.19  

 6677       0       64       0       17    116518     No       376273      Yes      F            PhD            Manager        49      Private     16110     17   Sports Car     no         0          0         No         0        15     Highly Urban/ Urban      0.05             0          $30.92   

 6688       0       45       0       11    91324      No       261739      No       M         Bachelors         Manager        31      Private      6000     11     Pickup       yes        0          0         No         0         1     Highly Urban/ Urban      0.12             0         $199.11   

 6689       0       44       3       13    103057     No       302922      Yes      F          Masters           Lawyer        25      Private     15450     10       SUV        no         0          0         No         0        15     Highly Urban/ Urban      0.09             0         $267.39   

 6691       0       56       0       13    222379     No       535687      Yes      F            PhD            Manager        37      Private     29340      1     Pickup       no         0          0         No         1        13     Highly Urban/ Urban      0.05             0         $196.16   

 6692       0       36       0        6    20800      No         0         Yes      F        High School        Student        57      Private      5400      3       SUV        no         0          0         No         1         6     Highly Urban/ Urban      0.18             0        $1,410.29  

 6694       1       46       0       10    21238      No         0         No       M   Less Than High School   Clerical       41      Private      6000      1       SUV        no        6524        2         No         1         7     Highly Urban/ Urban      0.54             1        $3,302.21  

 6702       0       36       0        0      0        No         0         No       F         Bachelors         Student        38     Commercial   16280      4     Minivan      no        3365        3         No         2        11     Highly Urban/ Urban      0.75             1        $2,641.58  

 6714       0       46       0        4    45996      No       192429      No       F        High School        Clerical       49      Private      6100     13       SUV        no         0          0         No         1         1     Highly Rural/ Rural      0.06             0         $245.93   

 6716       1       39       2       15     5538      No       78372       Yes      F         Bachelors        Home Maker      49      Private      5950      1   Sports Car     no        6127        1         No         0         7     Highly Urban/ Urban      0.27             0        $1,996.14  

 6724       0       36       2        9    12938      No         0         Yes      F        High School        Student        31     Commercial   15520      1       SUV        no         0          0         No         1         1     Highly Rural/ Rural      0.05             0         $594.85   

 6725       0       47       0       11    153941     No       421045      Yes      F            PhD             Lawyer        41      Private     23630      9   Sports Car     no         0          0         No         3        12     Highly Urban/ Urban      0.12             0        $1,560.89  

 6730       0       56       0       14    13614      No       96941       No       M          Masters           Lawyer        34      Private     25250      1     Minivan      yes       4188        2         No         0        13     Highly Urban/ Urban      0.28             0        $1,573.03  

 6735       0       48       0        9    44808      No       199470      Yes      M        High School      Blue Collar      25     Commercial   10780      6     Pickup       yes       5001        2         No         4         1     Highly Urban/ Urban      0.44             1        $2,828.38  

 6738       0       40       3      11.35  46395      Yes        0         No       F         Bachelors       Blue Collar      25     Commercial   22240     10     Minivan      no        5091        2         No         1         5     Highly Urban/ Urban      0.51             1        $2,457.77  

 6739       2       37       2       10    32520      No         0         Yes      M         Bachelors         Student        5      Commercial   12250      4     Minivan      no         0          0         No         0        11     Highly Urban/ Urban      0.46             1        $1,263.22  

 6743       0       55       0       10    146240     No         0         No       M          Masters        Professional     63      Private     11860      6     Pickup       yes        0          0         No         2        13     Highly Urban/ Urban      0.21             0        $2,065.43  

 6747       0       51       0       11    134582     No       371127      Yes      M         Bachelors       Professional     41     Commercial   30950      4   Panel Truck    yes        0          0         No         1        14     Highly Urban/ Urban      0.19             0        $1,749.26  

 6750       0       40       0       11    67700      No         0         No       F        High School      Blue Collar      16     Commercial   12230      7       SUV        no        1429        3         No         7         1     Highly Urban/ Urban       0.7             1        $3,857.35  

 6751       0       47       0        0      0        No         0         No       M          Masters         Home Maker      51      Private      6200      6     Pickup       no       32418        1         Yes        0        10     Highly Urban/ Urban      0.68             1        $2,778.15  

 6753       0       26       4        0      0        No       12201       Yes      M   Less Than High School   Student        16      Private      4100      1     Minivan      yes       6819        2         No         4         8     Highly Urban/ Urban      0.48             1        $1,915.64  

 6754       0       37       2        4    18127      No       129798      Yes      M   Less Than High School Blue Collar      40      Private     23270      6     Minivan      yes       2015        2         No         7         4     Highly Urban/ Urban      0.44             1        $2,470.56  

 6755       0       42       3       16    113486     Yes      360227      No       F            PhD             Doctor        32      Private     17050      3     Minivan      no         0          0         No         1        14     Highly Urban/ Urban      0.12             0         $866.83   

 6762       0       57       0       11    14500      No       112458      Yes      F         Bachelors        Home Maker      32      Private      8650     12       SUV        no        1662        1         No         3         9     Highly Urban/ Urban      0.23             0        $1,013.49  

 6764       0       40       3       14    14535      No       122827      Yes      F            PhD            Manager        41      Private     16950     17   Sports Car     no         0          0         No         0        21     Highly Urban/ Urban       0.1             0         $118.38   

 6772       0       36       0       10    38317      No         0         No       M   Less Than High School Blue Collar      24     Commercial    5330      4     Pickup       yes        0          0         No         4         1     Highly Urban/ Urban      0.64             1        $3,421.65  

 6774       0       55       0       11    109258     No       359318      Yes      F         Bachelors       Blue Collar      17     Commercial   17930     13       SUV        no         0          0         No         0         8     Highly Urban/ Urban      0.24             0        $1,000.15  

 6787       0       46       0       11    35362      No         0         No       M        High School        Clerical       8       Private     13140      7     Minivan      no         0          0         No         4         7     Highly Urban/ Urban       0.5             1        $1,621.10  

 6789       0       49       0       14    45451      No       173561      Yes      F        High School        Clerical       29      Private     20970      1   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.02             0          $89.72   

 6793       0       46       0       14    38871      No       178677      Yes      F            PhD            Manager        20     Commercial   38870      7       Van        no         0          0         No         1         1     Highly Urban/ Urban      0.17             0        $1,423.18  

 6798       0       59       0       15    40878      No       247147      Yes      M        High School        Clerical       11      Private     16470     10       Van        no         0          0         No         1         1     Highly Rural/ Rural      0.03             0         $-511.80  

 6799       0       41       0       11    27613      No       176749      Yes      M   Less Than High School Blue Collar      39      Private      8360      6     Pickup       no         0          0         No         0        3.6    Highly Rural/ Rural      0.02             0         $-306.31  

 6800       0       50       0       15    90942      No       262261      Yes      F         Bachelors       Professional     33      Private     19170      4       SUV        no         0          0         No         1        13     Highly Urban/ Urban      0.11             0         $896.99   

 6802       0       50       0       10    67453      No       242737      Yes      M        High School      Blue Collar      57     Commercial   13250      6     Minivan      no         0          0         No         0         9     Highly Rural/ Rural      0.04             0         $-56.83   

 6808       0       30       1       11    37307      Yes        0         No       F        High School       Home Maker      71      Private      9040     10     Minivan      no         0          0         No         0        10     Highly Urban/ Urban      0.23             0        $1,461.48  

 6809       0       67       0       12    56946      No       246083      Yes      M          Masters           Lawyer        47      Private     26020      1     Minivan      yes        0          0         No         0        20     Highly Urban/ Urban      0.11             0         $494.47   

 6812       0       48       0       12    32256      No       175861      Yes      F        High School       Home Maker      38      Private     22110      1     Minivan      no         0          0         No         1         5     Highly Rural/ Rural      0.02             0         $-996.53  

 6814       1       48       1       11    48198      Yes        0         No       F   Less Than High School Blue Collar      40      Private     11280      7   Sports Car     no        2667        2         No         7         1     Highly Urban/ Urban      0.67             1        $4,659.56  

 6816       0       35       2       10    71827      No       193298      Yes      M        High School      Blue Collar      46     Commercial    5000      1     Minivan      no        5406        2         No         3        10     Highly Urban/ Urban      0.37             1        $2,442.58  

 6822       0       39       0        5    26727      No       148853      Yes      M        High School        Clerical       69      Private     21990      7     Minivan      no        2053        3         No         9       4.89    Highly Rural/ Rural       0.1             0        $1,344.69  

 6829       0       59       0      12.1   46087      No       180425      Yes      F         Bachelors       Blue Collar      18     Commercial   15750      1     Minivan      no       31406        1         Yes        4         1     Highly Urban/ Urban      0.63             1        $2,494.17  

 6834       0       40       1        7    34512      Yes        0         No       M        High School      Blue Collar      51     Commercial    8950      6     Pickup       no        4955        1         No         7         1     Highly Urban/ Urban      0.74             1        $4,801.37  

 6836       0       40       2       12    19984      No       129313      Yes      M   Less Than High School   Clerical       41      Private      5500      1     Minivan      yes        0          0         No         0         1     Highly Rural/ Rural      0.03             0         $-231.94  

 6839       0       41       0        4    152677     No         0         No       F            PhD             Lawyer        21      Private     34680      1   Sports Car     no         0          0         No         0         8     Highly Urban/ Urban      0.15             0        $1,904.10  

 6840       0       50       0        0      0        No       117445      Yes      F         Bachelors        Home Maker      72      Private      1500      1   Sports Car     no         0          0         No         1         8     Highly Urban/ Urban      0.36             1        $2,233.59  

 6843       0       56       0        9    91558      No       294494      No       M   Less Than High School Blue Collar      70     Commercial   29110     10   Panel Truck    yes        0          0         No         2         5     Highly Rural/ Rural      0.09             0        $1,418.91  

 6846       0       41       0       12    70478      No         0         No       F        High School        Manager        32      Private     12650      4       SUV        no         0          0         Yes        2         1     Highly Urban/ Urban       0.3             1        $1,614.27  

 6848       0       41       0       13    62803      No       180931      Yes      M         Bachelors       Professional     17     Commercial   17610      7       Van        no         0          0         No         0         9     Highly Rural/ Rural      0.03             0         $-129.19  

 6852       0       29       2       15    74854      No       210374      Yes      M         Bachelors       Professional     20      Private     11890      3     Minivan      no         0          0         No         0        10     Highly Urban/ Urban      0.11             0         $303.38   

 6856       0       41       3        8    38813      No       127229      Yes      F         Bachelors         Clerical       31      Private      5600      3       SUV        no         0          0         No         0         9     Highly Urban/ Urban       0.2             0        $1,057.65  

 6860       0       48       0       12    51834      No       205761      Yes      F         Bachelors       Blue Collar      34     Commercial   28190      7     Minivan      no         0          0         No         0        16     Highly Urban/ Urban      0.29             1         $761.57   

 6866       0       58       0       11    20575      No       187632      Yes      F   Less Than High School   Clerical       50      Private      6590      6       SUV        no         0          0         No         4         7     Highly Urban/ Urban      0.36             1        $2,226.62  

 6870       0       47       0       11    31392      No       142235      Yes      M   Less Than High School   Clerical       38      Private      1500      1     Minivan      yes        0          0         Yes        1         7     Highly Urban/ Urban       0.4             1        $1,788.61  

 6878       0       34       4       13    14903      No       1e+05       Yes      F   Less Than High School   Clerical       31      Private      2990      4   Sports Car     no        5403        1         No         5       3.84    Highly Urban/ Urban      0.41             1        $2,783.18  

 6880       0       56       0       16    35133      No       216843      Yes      M         Bachelors         Manager        65      Private     15780      1     Minivan      yes       5369        3         No         0         8     Highly Urban/ Urban      0.08             0         $336.39   

 6885       0       55       0        0      0        No         0         Yes      M         Bachelors         Student        43      Private      5630      7     Pickup       no         0          0         No         0        10     Highly Rural/ Rural      0.05             0         $-580.77  

 6897       0       53       0       12    47927      No       193615      Yes      M        High School      Blue Collar      35     Commercial    6800      1     Pickup       yes        0          0         No         0       3.96    Highly Rural/ Rural      0.04             0         $525.18   

 6902       0       39       2       12    35362      Yes        0         No       M   Less Than High School   Clerical       38     Commercial    8940      7     Pickup       no        2610        3         No         0         7     Highly Urban/ Urban      0.53             1        $3,636.20  

 6904       0       47       0       12    59164      No         0         No       M            PhD            Manager        20     Commercial    6200      1     Pickup       yes        0          0         No         3         7     Highly Urban/ Urban      0.34             1        $2,438.24  

 6907       0       48       0        8    134646     No       359803      Yes      F          Masters           Lawyer        28      Private     20660      7     Pickup       no         0          0         No         2        10     Highly Urban/ Urban      0.11             0         $567.19   

 6909       0       54       0       13    55723      No       237823      Yes      M          Masters        Professional     29     Commercial   37670      1   Panel Truck    yes        0          0         No         1        12     Highly Urban/ Urban      0.24             0        $2,336.76  

 6914       1       42       3       16    39302      Yes      146365      No       F        High School        Clerical       37      Private      5700      7       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.46             1        $2,959.30  

 6915       0       40       0       12    58335      No       177245      Yes      M   Less Than High School Blue Collar      41     Commercial   25910      1   Panel Truck    yes       8052        1         No         4       3.75    Highly Urban/ Urban      0.42             1        $3,226.44  

 6922       0       30       1       11    29042      No       109832      Yes      M        High School        Clerical       32      Private      6370      6     Pickup       no        3142        1         No         1         4     Highly Urban/ Urban      0.24             0        $1,511.97  

 6924       0       44       0       10    99034      No       300616      Yes      M         Bachelors       Professional     9      Commercial   11400      7     Pickup       no        2026        3         No         0       9.14    Highly Urban/ Urban      0.18             0        $1,401.40  

 6933       0       44       0       13    105870     No       339220      Yes      F          Masters           Lawyer        22      Private      5900      7       SUV        no         0          0         No         0        17     Highly Urban/ Urban      0.09             0         $309.48   

 6934       0       31       3       14    17839      No       96399       Yes      F   Less Than High School   Clerical       64     Commercial   18780      3     Pickup       no         0          0         No         1         7     Highly Rural/ Rural      0.07             0         $848.76   

 6941       0       43       0       12    72606      No         0         No       F         Bachelors       Professional     34      Private     13060      4       SUV        no       11613        2         No         0         9     Highly Urban/ Urban       0.2             0        $1,706.35  

 6957       0       40       1       10    21628      Yes      60877       No       F   Less Than High School  Home Maker      44      Private     12260     10     Minivan      no         0          0         No         0       3.95    Highly Urban/ Urban      0.26             0        $1,567.50  

 6960       0       45       0       11    160894     No       402158      Yes      M         Bachelors         Manager        32     Commercial   23810     10   Panel Truck    yes        0          0         No         0         1     Highly Urban/ Urban      0.09             0         $470.00   

 6969       0       52       0        9    65529      No       121950      No       M         Bachelors         Manager        10      Private     14530      4     Minivan      yes        0          0         No         0         9     Highly Urban/ Urban      0.13             0         $-306.42  

 6975       0       46       0        8    87396      No       174416      No       M          Masters        Professional     5      Commercial   31510     11   Panel Truck    yes        0          0         No         0        13     Highly Urban/ Urban      0.33             1        $1,763.80  

 6980       1       43       2       11    37520      Yes      157574      No       M   Less Than High School Blue Collar      19     Commercial    9550      6     Pickup       no        1459        2         No         0         7     Highly Urban/ Urban      0.61             1        $3,644.00  

 6983       0       45       2       17    82693      No       166168      Yes      F          Masters          Manager        14      Private     26280      7   Sports Car     no         0          0         No         1        16     Highly Urban/ Urban      0.07             0          $-7.26   

 6987       2       43       4        0      0        No       98245       Yes      F        High School       Home Maker      39      Private     14000      6       SUV        no         0          0         No         2         1     Highly Rural/ Rural      0.14             0        $1,070.93  

 6994       0       58       0        0      0        No       115457      Yes      F         Bachelors        Home Maker      74      Private      7500      4   Sports Car     no         0          0         No         0        10     Highly Rural/ Rural      0.05             0         $205.50   

 6997       0       30       0       12    57771      No       139826      Yes      F         Bachelors         Clerical       18      Private     13320      4     Minivan      no         0          0         No         1        12     Highly Rural/ Rural      0.03             0        $-1,486.08 

 7002       0       41       0       11    111407     No       320420      Yes      M          Masters        Professional     33     Commercial   24130      6   Panel Truck    yes        0          0         No         0         9     Highly Urban/ Urban      0.17             0        $1,928.68  

 7010       0       58       0      11.41  22877      No       142186      Yes      M   Less Than High School  Home Maker      41      Private     18530      6       Van        yes        0          0         No         1       4.54    Highly Rural/ Rural      0.02             0         $-204.63  

 7015       0       54       0       13    50624      No         0         No       F         Bachelors         Manager        50      Private      9070      1       SUV        no         0          0         Yes        1         6     Highly Urban/ Urban      0.29             1        $1,508.68  

 7019       0       39       0       10    116247     No         0         No       M         Bachelors       Blue Collar      25     Commercial    1500     13     Minivan      no         0          0         No         2         8     Highly Urban/ Urban      0.47             1        $1,625.66  

 7022       0       48       0       14    51982      No       169672      Yes      F         Bachelors       Professional     5       Private     23390      1   Sports Car     no       38267        3         Yes        5         5     Highly Urban/ Urban      0.38             1        $2,588.97  

 7025       0       45       2        8    102658     No       315103      Yes      F         Bachelors       Blue Collar      58     Commercial   16270      9       SUV        no         0          0         No         1         1     Highly Rural/ Rural      0.04             0         $355.45   

 7029       0       48       0       12    131641     No       311314      No       M          Masters           Lawyer        23      Private     25010      1     Minivan      no         0          0         No         0        11     Highly Urban/ Urban      0.16             0         $911.43   

 7031       0       52       0       12    120123     No       345102      Yes      M          Masters          Manager        29     Commercial   18710     11       Van        no        5866        3         No         1        13     Highly Urban/ Urban      0.12             0        $1,095.36  

 7037       0       42       1       15    19796      No       127000      Yes      F   Less Than High School   Clerical       30      Private     10460      4       SUV        no        6488        1         No         4         1     Highly Urban/ Urban      0.36             1        $2,388.31  

 7038       0       39       2       15    54315      No       171738      Yes      M        High School      Professional     5       Private     15220      6     Minivan      yes       4845        4         No         5         1     Highly Urban/ Urban      0.22             0        $1,634.97  

 7043       0       57       0       13    119975     No       339052      Yes      F            PhD             Doctor        40      Private     13500     10       SUV        no         0          0         Yes        0        13     Highly Urban/ Urban      0.11             0         $325.84   

 7049       0       61       0       11    75912      No       274531      Yes      M            PhD            Manager        6       Private     16900      1   Sports Car     yes        0          0         No         0        14     Highly Urban/ Urban      0.06             0         $550.96   

 7052       0       51       0       12    105936     No       297381      Yes      F            PhD             Doctor        58      Private      6600      1       SUV        no        8112        4         No         0        16     Highly Urban/ Urban      0.06             0         $864.44   

 7053       0       49       0        9    10359      No         0         No       F   Less Than High School   Student        32      Private     15960      5       SUV        no         0          0         No         0         5     Highly Urban/ Urban      0.31             1        $1,706.43  

 7056       0       46       0        8    73872      No       245878      Yes      F          Masters           Lawyer        43      Private     25510      4     Minivan      no         0          0         No         1        16     Highly Rural/ Rural      0.01             0        $-1,376.14 

 7057       1       39       3       16    28585      No       125387      Yes      F   Less Than High School Blue Collar      50      Private      8260      4       SUV        no        5116        2         No         1         9     Highly Urban/ Urban      0.31             1        $2,240.49  

 7080       0       46       0       13    60829      No       192496      Yes      M         Bachelors       Professional     23     Commercial   32630      1   Panel Truck    yes       6626        2         No         0        16     Highly Urban/ Urban      0.21             0        $1,821.21  

 7086       0       73       0        6    62664      No         0         No       M         Bachelors         Manager        33      Private     15070      1     Minivan      yes        0          0         No         5         8     Highly Urban/ Urban      0.25             0        $1,067.60  

 7087       0       45       0        8    144467     No         0         No       F          Masters          Manager        39      Private     24890      1     Minivan      no         0          0         No         0        19     Highly Urban/ Urban       0.1             0         $-75.10   

 7105       0       33       1       11    14277      No       109348      Yes      F   Less Than High School Professional     34      Private      6230      6       SUV        no        1225        3         No         3         5     Highly Urban/ Urban      0.23             0        $2,265.19  

 7108       0       52       0       13    41137      No       201548      Yes      M          Masters        Professional     47      Private     15770      4     Minivan      no         0          0         No         0        15     Highly Rural/ Rural      0.01             0         $-782.42  

 7121       0       50       0        6    40681      No       192334      Yes      F        High School      Professional     32      Private      1500      1   Sports Car     no        9111        3         No         1        10     Highly Urban/ Urban      0.14             0        $2,013.36  

 7122       0       46       0       12    63084      No       221121      Yes      F        High School      Professional     23      Private     25140      4       SUV        no         0          0         Yes        0         1     Highly Urban/ Urban      0.21             0        $1,618.42  

 7125       0       41       2       12     9785      No       92435       Yes      F   Less Than High School   Clerical       41      Private     16130      4       SUV        no        7663        2         No         4         1     Highly Urban/ Urban       0.4             1        $2,703.11  

 7132       0       40       0        8    59603      No         0         No       F          Masters        Professional     30     Commercial   26330      4     Pickup       no         0          0         No         1        17     Highly Urban/ Urban      0.39             1        $2,309.95  

 7134       0       34       1       13    11513      Yes        0         No       F   Less Than High School   Clerical       37      Private      6050      1       SUV        no         0          0         No         1         1     Highly Rural/ Rural      0.08             0        $1,629.04  

 7151       0       45       0      11.07  37417      No       140449      Yes      F        High School      Professional     51      Private      7440      6   Sports Car     no         0          0         No         0         1     Highly Urban/ Urban      0.13             0        $1,739.13  

 7152       0       25       1       11    23245      Yes        0         No       M        High School        Clerical       47      Private      7410      7     Pickup       yes       965         2         No         4         7     Highly Urban/ Urban      0.53             1        $3,434.83  

 7157       1       40       2        9    67295      No       220104      Yes      F         Bachelors       Blue Collar      44     Commercial   19620     14     Minivan      no         0          0         No         1        12     Highly Urban/ Urban      0.41             1        $1,145.56  

 7159       0       37       1        8    86372      No       256431      Yes      M            PhD            Manager        31      Private     14670      1     Minivan      yes      32575        3         Yes        2         1     Highly Urban/ Urban      0.16             0        $1,472.45  

 7166       0       28       0        0      0        No         0         No       F         Bachelors        Home Maker      49      Private      4300      6       SUV        no       52102        2         Yes        6        10     Highly Urban/ Urban      0.84             1        $3,592.19  

 7167       0       57       0        9    50443      No       206150      Yes      F          Masters           Lawyer        24      Private     17960      4       SUV        no         0          0         No         0        19     Highly Urban/ Urban      0.11             0         $560.62   

 7177       0       33       1       12    12510      No       122649      Yes      M   Less Than High School   Clerical       60      Private      6050      7     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural      0.03             0          $79.89   

 7179       0       44       3        0      0        No       79582       Yes      F        High School       Home Maker      43      Private     11530      6   Sports Car     no        6602        2         No        10         1     Highly Urban/ Urban      0.68             1        $3,866.68  

 7181       0       38       2        9    122439     Yes        0         No       M         Bachelors       Blue Collar      32     Commercial   24900      9   Panel Truck    no         0          0         No         0        11     Highly Urban/ Urban      0.39             1        $2,575.30  

 7183       0       42       0       12    83613      No       287044      No       M          Masters          Manager        6      Commercial   25430      4   Panel Truck    yes      26118        1         No         2        10     Highly Urban/ Urban      0.28             0        $1,624.57  

 7186       0       47       0       13    77537      No       227804      Yes      M          Masters        Professional     47     Commercial    6200      8     Pickup       yes        0          0         No         1        15     Highly Rural/ Rural      0.03             0         $280.61   

 7193       0       59       0        9    25323      No       154839      No       M         Bachelors       Professional     60      Private     24700      6     Minivan      yes        0          0         No         3        10     Highly Rural/ Rural      0.05             0         $206.58   

 7205       0       34       3       14    139801     No       386903      Yes      F         Bachelors         Clerical       24      Private     28580      4     Minivan      no         0          0         No         0        10     Highly Urban/ Urban      0.14             0          $-9.60   

 7207       0       35       0       12    43222      No       199576      No       M         Bachelors       Professional     55      Private      1500      6     Minivan      yes        0          0         No         0        15     Highly Rural/ Rural      0.03             0         $-566.11  

 7209       0       52       0       13    43393      No       202835      Yes      F        High School        Clerical       23      Private     11040      1       SUV        no        6624        2         No         5         1     Highly Urban/ Urban      0.34             1        $2,506.50  

 7216       0       59       0       14    75714      No       221496      No       M         Bachelors       Professional     13      Private     17210      1       Van        no         0          0         Yes        0         6     Highly Urban/ Urban      0.35             1        $2,020.15  

 7232       1       42       4        0      0        Yes      93311       No       F        High School        Student        51     Commercial    9090     16       SUV        no        6195        2         No         0         1     Highly Urban/ Urban      0.78             1        $3,897.35  

 7235       0       48       0      10.93  27433      No       147243      Yes      F   Less Than High School Blue Collar      33      Private     27420      7     Pickup       no       34616        2         No         0         6     Highly Urban/ Urban      0.19             0        $1,155.93  

 7238       0       48       0        0     1724      No         0         No       F        High School       Home Maker      5       Private     10220      4       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.44             1        $1,872.70  

 7240       3       45       3        6    29955      No       86034       Yes      F        High School        Clerical       33      Private     11510      1       SUV        no        4436        2         No         1         1     Highly Urban/ Urban      0.56             1        $3,137.17  

 7243       0       37       0       12    78124      No       198561      Yes      F        High School      Blue Collar      29     Commercial   13010      6       SUV        no         0          0         No         0         6     Highly Urban/ Urban      0.26             0        $1,807.73  

 7252       0       51       0        8    74343      No       222957      No       M          Masters          Manager        52     Commercial   44130      7   Panel Truck    no        5689        2         No         0        18     Highly Urban/ Urban      0.23             0        $1,680.39  

 7269       0       44       2       11    48718      Yes        0         No       M   Less Than High School   Clerical       62      Private     22390      1       Van        yes       9484        4         No         1         6     Highly Rural/ Rural      0.06             0        $2,129.39  

 7275       0       48       0       12    28573      No       159254      Yes      M   Less Than High School   Clerical       60      Private      9160      6     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural      0.03             0          $20.42   

 7281       0       55       0       15    61441      No       213976      Yes      M         Bachelors       Professional     21     Commercial   23120      4   Panel Truck    yes        0          0         No         0         1     Highly Urban/ Urban      0.21             0        $1,845.61  

 7283       0       38       2       12     7619      Yes        0         No       F   Less Than High School   Student        36      Private     22630      7       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.05             0         $766.84   

 7287       0       46       0      9.73   71869      No       246071      No       M          Masters        Professional     53     Commercial   30710      8   Panel Truck    yes        0          0         No         0        15     Highly Urban/ Urban      0.34             1        $2,557.37  

 7289       0       44       0        7    86510      No         0         No       M         Bachelors       Professional     40     Commercial   31300      3   Panel Truck    yes       8898        1         No         0         9     Highly Urban/ Urban      0.33             1        $2,551.36  

 7291       0       50       0        8    93870      No       286090      Yes      M        High School      Blue Collar      60     Commercial   27140      7   Panel Truck    yes       5841        2         No         3         1     Highly Urban/ Urban      0.35             1        $2,944.11  

 7294       0       54       0       12    17050      No         0         No       M        High School        Clerical       33      Private      8600      7     Minivan      yes        0          0         No         0         5     Highly Rural/ Rural      0.06             0         $-192.93  

 7304       0       36       3        0      0        No         0         Yes      M         Bachelors         Student        30      Private      5100      1     Pickup       yes        0          0         Yes        0         7     Highly Urban/ Urban      0.52             1        $1,754.96  

 7308       0       39       0      10.85  94059      No       286323      Yes      M         Bachelors       Professional     33      Private      5300      9     Pickup       yes       4914        3         No         7         6     Highly Urban/ Urban      0.24             0        $2,130.50  

 7313       0       37       1       12    18651      Yes      93886       No       M        High School        Clerical       19      Private      7070      9     Pickup       no         0          0         No         1         1     Highly Rural/ Rural      0.07             0         $801.55   

 7319       0       41       1        0      0        No         0         Yes      F         Bachelors        Home Maker      19      Private      8760     11       SUV        no        6307        2         No         7        14     Highly Urban/ Urban      0.58             1        $2,026.67  

 7325       0       48       0       11    62617      No       239733      No       M          Masters          Manager        37      Private     14640      1     Minivan      yes        0          0         No         0        17     Highly Urban/ Urban      0.13             0         $368.67   

 7326       0       55       0      11.37  77531      No       248573      No       M          Masters           Lawyer        28      Private     14750      4     Minivan      no         0          0         No         2        11     Highly Urban/ Urban      0.24             0        $1,279.24  

 7330       0       36       0       11    20948      No         0         No       F        High School       Home Maker      35      Private     13980      6       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.26             0        $1,676.70  

 7332       0       42       0      11.2   87610      No       286147      Yes      F         Bachelors       Professional     33      Private      5700     11       SUV        no         0          0         No         2        11     Highly Rural/ Rural      0.02             0         $-879.70  

 7337       0       33       2       12    60707      No       208744      Yes      F         Bachelors       Professional     43      Private     10870      1   Sports Car     no        2714        2         No         3        12     Highly Urban/ Urban      0.17             0        $2,059.71  

 7341       0       50       0       11    93034      No       273493      No       F          Masters          Manager        30      Private      6600      1   Sports Car     no        7013        2         No         0        19     Highly Urban/ Urban      0.12             0        $1,050.76  

 7346       0       54       0        9    69667      No       66506       No       F         Bachelors         Manager        50      Private     19440      1   Sports Car     no        3152        2         No         7        13     Highly Urban/ Urban       0.3             1        $2,318.50  

 7353       1       37       3       13    88137      No       256436      Yes      M          Masters        Professional     52     Commercial   17680      4       Van        yes      25208        2         Yes        0        14     Highly Urban/ Urban      0.44             1        $3,281.62  

 7354       0       44       3       14    53303      No       207701      Yes      F        High School      Blue Collar      43     Commercial   11230      1   Sports Car     no        4444        2         No         3         8     Highly Urban/ Urban      0.39             1        $3,195.41  

 7361       0       38       0       15    14525      No       115933      No       F          Masters         Home Maker      26     Commercial   28820     10     Pickup       no         0          0         Yes        1        13     Highly Urban/ Urban      0.67             1        $2,392.89  

 7366       0       54       0       12    52722      No         0         No       M        High School      Professional     55     Commercial   21390      6       Van        yes        0          0         No         0         1     Highly Urban/ Urban      0.37             1        $3,067.42  

 7368       0       47       0       14    27192      No       169143      Yes      F   Less Than High School Blue Collar      22      Private      4220      4   Sports Car     no         0          0         No         0       4.41    Highly Rural/ Rural      0.02             0         $-124.04  

 7372       0       34       1       12    115617     No       257496      Yes      M          Masters        Professional     17      Private     13060      7     Minivan      yes        0          0         No         0        18     Highly Urban/ Urban      0.09             0         $118.16   

 7375       0       45       2       10    30415      No       121494      Yes      F   Less Than High School   Clerical       39      Private      9040      6       SUV        no        3456        2         No         3         1     Highly Urban/ Urban       0.3             1        $2,271.71  

 7377       0       34       2        0      0        No         0         Yes      F        High School        Student        26      Private      4900      7       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.41             1        $1,733.33  

 7380       0       50       0        5    28299      No       183581      Yes      F         Bachelors        Home Maker      40      Private     21330      6       SUV        no         0          0         No         1        11     Highly Urban/ Urban      0.15             0         $797.26   

 7382       0       38       3        9    45468      No       201166      Yes      F         Bachelors       Blue Collar      30     Commercial   30600      7     Pickup       no       38664        2         Yes        2        10     Highly Urban/ Urban      0.55             1        $2,254.40  

 7385       0       43       4        0      0        Yes        0         No       F         Bachelors         Student        44     Commercial   14080      6       SUV        no        3073        1         No         1         7     Highly Urban/ Urban      0.72             1        $3,643.90  

 7392       0       46       0       12    38388      No         0         No       F        High School      Blue Collar      33     Commercial   14480     17   Sports Car     no       12192        3         No         7         1     Highly Urban/ Urban      0.73             1        $3,959.20  

 7395       0       46       0       11    119870     No       321592      Yes      M          Masters          Manager        32      Private     17370      7     Minivan      no         0          0         Yes        0         1     Highly Urban/ Urban      0.11             0         $174.92   

 7397       1       45       1       14    49557      No       189358      Yes      F          Masters           Lawyer        52      Private     10960      4       SUV        no         0          0         No         0        24     Highly Urban/ Urban      0.17             0        $1,109.49  

 7403       0       38       0       10    123567     No       185625      No       F            PhD             Doctor        5       Private     13860     10       SUV        no         0          0         No         1        19     Highly Urban/ Urban      0.12             0         $-49.85   

 7406       1       45       3       12    80127      No       223205      Yes      F         Bachelors       Professional     48      Private     29850      8   Sports Car     no       10931        1         Yes        3         9     Highly Urban/ Urban      0.38             1        $2,511.18  

 7409       0       39       2        0      0        Yes      14596       No       M   Less Than High School   Student        32      Private      5440      3     Pickup       yes        0          0         No         3         1     Highly Urban/ Urban      0.63             1        $3,453.66  

 7410       0       48       0        7    70308      No         0         No       F         Bachelors       Professional     46      Private     13330      4     Minivan      no         0          0         No         4        11     Highly Urban/ Urban      0.32             1        $1,582.19  

 7412       0       50       0       13    98890      No       288461      Yes      M          Masters           Lawyer        37      Private     34840     10     Minivan      yes        0          0         Yes        0        17     Highly Urban/ Urban      0.18             0         $377.85   

 7419       0       40       0       11    32265      No         0         No       F        High School        Clerical       46      Private     15850      1     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.36             1        $1,681.19  

 7425       0       46       0       10    111343     No       343846      Yes      F          Masters           Lawyer        23      Private      1500      6       SUV        no         0          0         No         0        17     Highly Urban/ Urban      0.09             0         $361.16   

 7435       0       39       0      10.99  67390      No         0         No       F          Masters           Lawyer        14      Private     10970     10       SUV        no         0          0         No         0         1     Highly Urban/ Urban       0.2             0        $1,167.23  

 7438       0       48       0       13    75849      No       231596      Yes      M        High School      Blue Collar      55     Commercial   17610     10       Van        no         0          0         No         0         1     Highly Urban/ Urban      0.27             0        $2,198.84  

 7440       0       57       0       12    49856      No       221500      Yes      M          Masters          Manager        70     Commercial   18210     11       Van        yes        0          0         No         0        10     Highly Urban/ Urban      0.14             0        $1,243.29  

 7447       0       31       0        7    31908      No         0         No       F          Masters           Lawyer        29      Private     20360     15     Minivan      no        2858        3         No         0        15     Highly Urban/ Urban      0.23             0         $535.61   

 7449       0       51       0       13    18273      No         0         No       F   Less Than High School   Clerical       56      Private      6600     10       SUV        no        959         1         No         5         1     Highly Urban/ Urban      0.58             1        $3,150.13  

 7456       0       53       0       13    48144      No       77449       No       M        High School        Clerical       36      Private     12640      7     Minivan      yes        0          0         No         3        10     Highly Urban/ Urban      0.44             1        $1,739.92  

 7464       1       47       0        6    77885      No       234009      Yes      F         Bachelors         Manager        20     Commercial   19040      4     Minivan      no         0          0         No         0        15     Highly Urban/ Urban      0.18             0          $27.77   

 7478       0       60       0       15    84006      No       295624      Yes      M          Masters          Manager        13     Commercial   27240      7   Panel Truck    yes      26992        2         No         4         1     Highly Urban/ Urban       0.2             0        $1,727.52  

 7480       0       49       0       11    172230     No       488497      Yes      F         Bachelors       Professional     17      Private     32320      7       SUV        no         0          0         No         0         8     Highly Urban/ Urban      0.08             0         $372.47   

 7481       0       36       0        0      0        No       50322       No       F   Less Than High School   Student        5       Private     12270     10       SUV        no        7635        3         No         4         1     Highly Urban/ Urban      0.66             1        $2,574.10  

 7483       0       45       0       15    65166      No       254586      Yes      F            PhD             Doctor        41      Private     11500      3   Sports Car     no       38411        1         Yes        0        15     Highly Urban/ Urban      0.13             0        $1,094.30  

 7484       0       48       0       11    64579      No       250109      No       F         Bachelors         Manager        30      Private     13140     13       SUV        no        7503        2         No         5         9     Highly Urban/ Urban      0.24             0        $1,061.17  

 7491       0       46       0        5    136371     No         0         No       M            PhD            Manager        25     Commercial   27540      1   Panel Truck    no       21880        2         Yes        3         8     Highly Urban/ Urban      0.44             1        $3,070.77  

 7494       0       48       0        0      0        No         0         No       M        High School        Student        54     Commercial    8750      4     Pickup       no        1058        2         No         6         9     Highly Rural/ Rural      0.36             1        $2,549.95  

 7501       0       27       3        0      0        No         0         Yes      F         Bachelors         Student        17     Commercial   22500      1     Pickup       no         0          0         No         5        14     Highly Urban/ Urban      0.69             1        $2,382.51  

 7503       1       58       2       14    36626      Yes        0         No       M        High School      Blue Collar      34     Commercial   19790      3       Van        yes        0          0         No         4        10     Highly Urban/ Urban      0.74             1        $4,501.22  

 7509       0       35       4       14    163734     No       466537      Yes      F            PhD             Doctor        52      Private     24020      7       SUV        no         0          0         Yes        3        18     Highly Urban/ Urban      0.14             0         $894.49   

 7517       0       48       0       13    58974      No       218410      Yes      M         Bachelors       Professional     26      Private      8380      1     Pickup       no         0          0         No         0        13     Highly Urban/ Urban      0.11             0         $804.63   

 7518       0       50       0       13    41240      No       187815      Yes      F        High School        Clerical       16      Private     24810      6       SUV        no        4053        3         No         0         1     Highly Urban/ Urban       0.2             0        $1,424.42  

 7519       0       44       2       13    57267      No       208613      Yes      M        High School        Manager        23     Commercial   25570     10   Panel Truck    no        5053        2         No         5         1     Highly Urban/ Urban      0.25             0        $1,810.61  

 7521       0       56       1        0      0        No       119201      Yes      F   Less Than High School  Home Maker      43      Private      7100      7       SUV        no        2882        2         No         2         5     Highly Urban/ Urban      0.39             1        $2,188.98  

 7522       1       40       1        6    24498      Yes        0         No       F        High School        Clerical       36      Private      9920     11       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.49             1        $2,826.44  

 7536       0       46       0       12    71855      No         0         No       F        High School      Blue Collar      64     Commercial   37760      6       Van        no         0          0         No         0         1     Highly Rural/ Rural      0.07             0        $1,157.06  

 7539       0       45       0        6    87444      No       247573      Yes      M         Bachelors       Blue Collar      26     Commercial   13110      3     Minivan      yes        0          0         No         5         5     Highly Rural/ Rural      0.07             0         $490.92   

 7547       0       53       0        0      0        No       19516       Yes      M        High School        Student        42     Commercial   21470      6     Minivan      no        4372        3         No         2         5     Highly Urban/ Urban      0.59             1        $2,584.39  

 7549       0       53       0       14    107700     No       311832      Yes      M          Masters           Lawyer        27      Private     14140     10     Minivan      no         0          0         No         2        14     Highly Urban/ Urban      0.12             0         $232.07   

 7552       0       47       0       15    34132      No       147155      Yes      F        High School      Blue Collar      53     Commercial    9610      4     Minivan      no        5047        1         No         3         8     Highly Urban/ Urban      0.42             1        $2,188.11  

 7554       0       44       2       17    24469      No       128238      Yes      M   Less Than High School Blue Collar      5      Commercial   27450      4   Panel Truck    yes        0          0         No         4         6     Highly Urban/ Urban      0.49             1        $2,495.61  

 7556       1       43       1       14    115960     Yes        0         No       F        High School      Blue Collar      17     Commercial   29570     17     Pickup       no         0          0         No         0         7     Highly Rural/ Rural       0.1             0         $650.18   

 7564       0       59       0       11    40219      No       226113      Yes      F         Bachelors       Professional     21      Private     13820      4       SUV        no         0          0         No         1        10     Highly Urban/ Urban      0.14             0         $967.16   

 7566       0       52       0        8    174993     No         0         No       M            PhD            Manager        40     Commercial   34720      3   Panel Truck    yes        0          0         No         1        12     Highly Urban/ Urban       0.2             0        $1,995.46  

 7570       0       53       0       12    27652      No       145983      No       M        High School        Clerical       19      Private     21460      4       Van        no        6348        1         No         0         6     Highly Urban/ Urban      0.37             1        $2,047.59  

 7571       0       57       0       13    63010      No       224623      Yes      M          Masters        Professional     62     Commercial    7800     13     Pickup       yes        0          0         No         0        11     Highly Rural/ Rural      0.03             0         $153.24   

 7572       0       49       0       13    30762      No       133502      No       F        High School      Professional     25      Private     14710      8       SUV        no         0          0         No         0       4.98    Highly Urban/ Urban      0.25             0        $1,626.93  

 7575       0       52       0       11    123426     No       361688      Yes      M         Bachelors         Manager        35     Commercial   36200      1   Panel Truck    yes        0          0         No         0        12     Highly Urban/ Urban       0.1             0         $689.16   

 7586       0       54       0       13    129222     No       376824      No       M          Masters           Lawyer        41      Private      8470      6     Minivan      yes        0          0         No         0        16     Highly Urban/ Urban      0.16             0         $751.81   

 7589       0       52       0        9    71093      No       229315      Yes      M         Bachelors       Blue Collar      35     Commercial   26270      1     Minivan      no         0          0         Yes        2        10     Highly Rural/ Rural       0.1             0         $519.03   

 7590       0       54       0       12    228160     No       569361      No       F            PhD            Manager        21      Private     30490      4     Minivan      no         0          0         No         4        18     Highly Urban/ Urban      0.14             0         $460.99   

 7597       0       38       0        8    83304      No       234493      Yes      F         Bachelors         Clerical       10      Private     16160      1       SUV        no       20337        2         Yes        3        17     Highly Urban/ Urban       0.4             1        $1,644.91  

 7602       0       50       0       12    56079      No       228205      Yes      M         Bachelors         Manager        32      Private     25110     10     Minivan      no         0          0         No         0         9     Highly Urban/ Urban      0.07             0         $-837.45  

 7604       0       46       0       12    15951      No       123642      Yes      M        High School        Student        63     Commercial   17580      6       Van        yes        0          0         No         0         1     Highly Urban/ Urban      0.29             1        $2,318.74  

 7605       0       35       0       10    44681      No       174091      Yes      M         Bachelors         Clerical       21     Commercial    6410      6     Pickup       yes       783         3         No         1        12     Highly Urban/ Urban      0.37             1        $1,942.02  

 7612       0       35       2      11.13  62783      Yes        0         No       M        High School      Blue Collar      33     Commercial    4900     10     Pickup       yes       2723        1         No         7         7     Highly Urban/ Urban       0.7             1        $4,162.57  

 7615       0       43       0       12    92798      No         0         No       F            PhD            Manager        42      Private     13520     13     Minivan      no       22305        3         No         0        15     Highly Urban/ Urban      0.12             0         $199.06   

 7617       0       48       0        6    18651      No       134791      Yes      M        High School       Home Maker      38      Private     27430      1     Minivan      yes        0          0         No         1       5.07    Highly Urban/ Urban      0.17             0         $999.54   

 7624       0       45       0       10    47484      No         0         No       M   Less Than High School Blue Collar      42     Commercial   10750      7     Pickup       yes        0          0         No         1         9     Highly Rural/ Rural       0.1             0        $1,047.56  

 7632       0       48       0       14    58291      No       244454      Yes      M          Masters           Lawyer        47      Private     16200      1     Minivan      yes       4751        3         No         0        15     Highly Urban/ Urban      0.11             0         $949.81   

 7639       0       44       2       15    159230     Yes        0         No       M          Masters        Professional     24     Commercial    4850     10     Pickup       yes        0          0         No         0        16     Highly Urban/ Urban      0.28             0        $2,500.56  

 7642       0       43       0       11    151058     No       406619      Yes      M            PhD            Manager        16     Commercial    5800      6     Pickup       no       35106        3         No         8        16     Highly Urban/ Urban      0.26             0        $2,279.62  

 7643       0       54       0        9    145319     No       395969      No       F          Masters        Professional     21     Commercial   24290      8     Pickup       no       10727        1         No         0         9     Highly Urban/ Urban      0.29             1        $1,984.23  

 7649       0       50       0        0      0        No       110784      No       F          Masters         Home Maker      17      Private     16780      1     Pickup       no         0          0         Yes        0        15     Highly Urban/ Urban      0.68             1        $2,124.69  

 7650       0       44       0       12    50593      No       192822      Yes      F        High School      Blue Collar      88      Private     18100      6   Sports Car     no        815         1         No         3        12     Highly Urban/ Urban      0.24             0        $2,292.72  

 7653       0       28       1       13    84448      Yes        0         No       M         Bachelors       Professional     18      Private     12740      4     Minivan      yes      13415        3         No         3         8     Highly Urban/ Urban      0.27             0        $2,335.25  

 7654       0       41       0       11     1953      No       137081      Yes      F        High School       Home Maker      40      Private     14080      7       SUV        no        3552        3         No         0         9     Highly Urban/ Urban      0.21             0        $1,421.17  

 7657       0       46       0        0      0        No       66699       No       F         Bachelors        Home Maker      35      Private     12240      6       SUV        no        1186        2         No         7       9.99    Highly Urban/ Urban      0.74             1        $3,184.37  

 7662       0       46       0       10    40047      No       153059      Yes      M        High School        Clerical       29      Private     12530      1     Minivan      yes       8292        1         No         3         1     Highly Urban/ Urban      0.28             1        $1,727.76  

 7669       0       44       1       12    51120      Yes        0         No       M        High School      Professional     36     Commercial   26840      1   Panel Truck    yes        0          0         Yes        2         8     Highly Urban/ Urban      0.63             1        $4,221.64  

 7671       0       50       0        0      0        No       105910      Yes      F          Masters         Home Maker      25      Private      6500      1     Minivan      no         0          0         No         0         8     Highly Rural/ Rural      0.05             0         $-640.53  

 7675       0       51       0       11    66336      No       261916      Yes      M          Masters           Lawyer        26      Private     13230      4     Minivan      yes        0          0         No         0       14.7    Highly Urban/ Urban       0.1             0         $237.10   

 7678       0       31       1       12    77624      Yes        0         No       F            PhD            Manager        15     Commercial   25460     13     Pickup       no         0          0         No         1         8     Highly Urban/ Urban      0.25             0        $1,762.32  

 7682       0       45       2       12    51113      Yes      204071      No       M         Bachelors         Clerical       68     Commercial   11110      1     Pickup       yes      16558        1         Yes        0        13     Highly Urban/ Urban      0.68             1        $3,911.23  

 7688       0       34       2        0      0        No         0         Yes      F        High School        Student        39      Private     15890      1       SUV        no        4631        1         No         0         1     Highly Urban/ Urban      0.34             1        $1,938.41  

 7689       0       42       0       11    61530      No         0         No       M         Bachelors         Manager        27      Private     16620      6       Van        no         0          0         No         2       8.15    Highly Urban/ Urban      0.17             0         $834.51   

 7690       0       52       0       16    135523     No       388666      Yes      M         Bachelors         Manager        18     Commercial   20250     10       Van        no       31672        3         No         4        13     Highly Urban/ Urban      0.17             0        $1,121.80  

 7692       0       34       3        8    27008      No       152314      Yes      F        High School      Blue Collar      17     Commercial   25190      1     Pickup       no         0          0         No         5         7     Highly Urban/ Urban      0.52             1        $2,571.14  

 7699       0       53       0        6    67816      No       247605      Yes      M        High School      Blue Collar      30     Commercial   22800      1   Panel Truck    yes        0          0         No         2         1     Highly Urban/ Urban      0.34             1        $2,605.58  

 7705       0       37       0       10    21484      No         0         No       M        High School        Clerical       35      Private      9780     10     Pickup       no       40648        3         Yes        2         1     Highly Urban/ Urban      0.64             1        $2,901.34  

 7712       2       45       3        0      0        No       71936       Yes      F        High School       Home Maker      36      Private      1500      1       SUV        no         0          0         No         2         1     Highly Rural/ Rural      0.14             0        $1,277.58  

 7726       0       41       0       10    48835      No       249596      No       M        High School      Blue Collar      35     Commercial   10480      6     Pickup       yes       2702        1         No         3         9     Highly Urban/ Urban      0.58             1        $3,039.87  

 7728       0       66       0       13    70618      No       263650      Yes      F            PhD           Home Maker      89      Private     19810      6   Sports Car     no         0          0         No         0        13     Highly Urban/ Urban      0.11             0        $1,742.08  

 7735       0       52       0       13    43393      No       174526      Yes      F        High School        Clerical       23      Private     12890      1       SUV        no       10782        3         No         1         1     Highly Urban/ Urban      0.22             0        $1,931.56  

 7737       0       40       0        0      0        No         0         Yes      M        High School        Student        45     Commercial    6550     11     Pickup       no        1176        2         No         4         7     Highly Urban/ Urban      0.66             1        $2,916.88  

 7739       0       51       0      1.04     0        No       93915       Yes      F        High School       Home Maker      38      Private      8620     10       SUV        no         0          0         No         4         1     Highly Rural/ Rural      0.08             0         $456.31   

 7743       0       19       3       11     5228      Yes        0         No       F        High School        Student        28     Commercial   15080     14       SUV        no         0          0         No         4        10     Highly Urban/ Urban      0.67             1        $3,214.87  

 7744       0       36       0        9    78760      No         0         No       F            PhD             Doctor        51      Private     12980      6       SUV        no       32996        1         No         1       13.4    Highly Urban/ Urban      0.14             0        $1,141.58  

 7746       0       28       1      10.91  24814      No       103896      Yes      M   Less Than High School   Clerical       26      Private      7750      4     Minivan      yes       5556        1         No         1         8     Highly Urban/ Urban      0.25             0        $1,182.35  

 7749       0       46       0        6    112465     No         0         No       M          Masters          Manager        36     Commercial   24330      1   Panel Truck    yes       1401        1         No         0        14     Highly Urban/ Urban       0.2             0        $1,729.84  

 7750       0       53       0        0      0        No       66839       Yes      F        High School       Home Maker      6       Private      6800      1   Sports Car     no         0          0         No         1         1     Highly Urban/ Urban      0.36             1        $1,811.56  

 7752       0       44       0        7    68820      No       197831      Yes      F        High School      Blue Collar      16     Commercial   12780      1   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.04             0         $603.65   

 7755       0       42       0       12    85921      No       270346      Yes      F          Masters           Lawyer        41      Private     29080      7     Pickup       no        1551        3         No         2        15     Highly Urban/ Urban      0.13             0         $988.96   

 7756       0       35       2       12    30111      Yes        0         No       M        High School        Clerical       48      Private      4510      6     Pickup       yes       7654        2         No         9         1     Highly Urban/ Urban      0.69             1        $4,473.54  

 7762       1       40       2        7    50272      No       180265      Yes      M        High School      Blue Collar      32     Commercial   10530      6     Pickup       no         0          0         No         5         1     Highly Rural/ Rural      0.13             0        $1,554.96  

 7764       0       47       0       12    28107      No         0         No       F        High School        Clerical       58      Private      9010      1   Sports Car     no        8598        1         No         3         9     Highly Urban/ Urban      0.48             1        $3,134.01  

 7769       0       53       0       10    41924      No         0         No       F        High School       Home Maker      81      Private      6800      1       SUV        no         0          0         No         0         7     Highly Rural/ Rural      0.03             0         $384.36   

 7770       0       52       0        7    66063      No       208162      No       M          Masters        Professional     33     Commercial    6700     11     Pickup       yes       7684        2         No         3        19     Highly Urban/ Urban      0.46             1        $2,740.90  

 7776       0       39       0       13    31348      No       148483      Yes      F          Masters           Lawyer        19      Private      8530      4     Minivan      no         0          0         Yes        0        15     Highly Urban/ Urban      0.24             0         $439.47   

 7778       0       50       0       10    12623      No         0         Yes      M        High School        Student        30      Private      2760      4     Minivan      yes       6748        3         No         0         1     Highly Urban/ Urban      0.17             0        $1,017.64  

 7784       0       48       0       13    38879      No         0         No       F          Masters           Lawyer        35      Private     11330      3       SUV        no        3396        3         No         4         1     Highly Urban/ Urban      0.35             1        $2,885.98  

 7786       1       45       2       14    46684      No       168591      Yes      F        High School      Professional     22      Private     10670     10       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.23             0        $1,651.38  

 7789       0       56       0       13    69152      No       250572      No       F         Bachelors       Professional     7       Private     14020      7       SUV        no         0          0         Yes        0        14     Highly Urban/ Urban      0.35             1        $1,232.19  

 7793       0       47       0        0      0        No         0         No       F          Masters         Home Maker      13      Private     20890      1       SUV        no         0          0         No         1        15     Highly Urban/ Urban      0.54             1        $2,097.86  

 7794       0       53       0        7    97495      No       292386      Yes      M          Masters          Manager        25      Private     20940      6       Van        yes        0          0         No         3       13.13   Highly Urban/ Urban      0.09             0         $511.74   

 7804       0       48       0        7    55050      No       223804      No       F         Bachelors       Professional     31      Private      6300      1       SUV        no         0          0         No         1       9.32    Highly Urban/ Urban      0.24             0        $1,810.67  

 7811       0       57       0       13    117612     No       337799      Yes      M            PhD            Manager        24     Commercial    7390      6     Pickup       no         0          0         No         2        16     Highly Urban/ Urban      0.14             0        $1,106.51  

 7813       0       45       0        5    56351      No       219589      Yes      M        High School      Blue Collar      5      Commercial   21580      9       Van        yes        0          0         No         0         8     Highly Urban/ Urban      0.29             1        $1,419.91  

 7815       0       45       0       15    15151      No       119434      Yes      F   Less Than High School   Clerical       40      Private     10380      4       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.31             1        $2,086.19  

 7817       0       39       3       16    42535      No       189139      Yes      M        High School        Clerical       22      Private     13350      1     Minivan      yes        0          0         No         0         8     Highly Rural/ Rural      0.02             0         $-859.88  

 7818       2       61       3       14    108990     Yes        0         No       M            PhD             Doctor        34      Private     37510      6       SUV        yes        0          0         No         0        12     Highly Urban/ Urban      0.24             0        $2,309.18  

 7821       0       43       1       15    80012      No       250971      Yes      M          Masters           Lawyer        27      Private     13800      4     Minivan      no        4778        3         No         5        21     Highly Urban/ Urban      0.19             0        $1,217.46  

 7825       0       50       0      11.41  160103     No       376152      Yes      F          Masters           Lawyer        29      Private     22460     13     Pickup       no         0          0         No         0        14     Highly Urban/ Urban      0.08             0         $-195.95  

 7830       0       33       3        9    94866      No       271416      Yes      F        High School      Blue Collar      50     Commercial    4800      4   Sports Car     no         0          0         No         3        11     Highly Urban/ Urban      0.35             1        $2,718.77  

 7832       0       39       0       13    86737      No       231682      Yes      M         Bachelors       Blue Collar      6      Commercial   10370      1     Pickup       yes        0          0         No         0         9     Highly Urban/ Urban      0.26             0        $1,311.25  

 7835       0       47       0      11.74  99417      No       299437      Yes      M   Less Than High School Blue Collar      30      Private     16140      1     Minivan      no         0          0         No         0         3     Highly Rural/ Rural      0.02             0         $-730.41  

 7839       0       52       0       10    136123     No       348357      Yes      M            PhD           Home Maker      5       Private     10810      1   Sports Car     no        1810        1         No         5         1     Highly Urban/ Urban      0.16             0        $2,435.94  

 7842       0       51       0       14    91428      No       309772      Yes      M          Masters          Manager        50      Private     15740     13     Minivan      yes        0          0         No         2         9     Highly Urban/ Urban      0.08             0         $-184.43  

 7849       0       30       3       15    20944      Yes        0         No       M   Less Than High School Blue Collar      33      Private     10510      6     Pickup       yes      40386        1         No         5         1     Highly Urban/ Urban      0.54             1        $3,615.52  

 7856       0       61       0       13    58566      No       286204      Yes      M        High School      Blue Collar      48     Commercial   24340      1   Panel Truck    yes        0          0         No         2         1     Highly Urban/ Urban      0.35             1        $2,823.66  

 7857       0       41       1        9    125574     No       305880      Yes      M         Bachelors       Professional     38      Private     21810      9     Minivan      yes        0          0         No         0         8     Highly Rural/ Rural      0.01             0        $-1,479.83 

 7863       0       60       1       15    70695      No       260977      Yes      M          Masters           Lawyer        22      Private     14570      1     Minivan      yes        0          0         No         0        13     Highly Urban/ Urban       0.1             0         $361.90   

 7866       0       50       0        7    43445      No       149248      Yes      F         Bachelors        Home Maker      56      Private     10010      7       SUV        no         0          0         No         1        11     Highly Urban/ Urban      0.14             0         $838.17   

 7871       0       50       0       10    16917      No       92745       Yes      F   Less Than High School   Clerical       23      Private     14990     10     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.24             0         $572.92   

 7875       0       38       0       10    24037      No         0         No       F        High School        Clerical       12      Private      7060      1   Sports Car     no        7898        2         No         0         1     Highly Urban/ Urban      0.38             1        $2,421.10  

 7882       0       35       0       13    62971      No         0         No       M   Less Than High School   Manager        36     Commercial   19760      1       Van        yes       7908        1         No        10         1     Highly Urban/ Urban      0.59             1        $3,958.65  

 7887       1       38       3       13    28065      Yes      112596      No       M         Bachelors         Clerical       33      Private      4310     10     Minivan      no       30254        3         Yes        0         8     Highly Urban/ Urban      0.67             1        $2,778.63  

 7888       2       40       2       11    51418      Yes        0         No       M        High School      Blue Collar      27      Private     13420      6     Minivan      no        7865        4         No         3         1     Highly Urban/ Urban      0.63             1        $3,681.65  

 7891       2       36       4       11    36844      Yes        0         No       F         Bachelors         Clerical       38      Private     21660      1       SUV        no       20731        1         Yes        7         9     Highly Urban/ Urban      0.89             1        $4,974.29  

 7895       0       46       0       11    114924     No       298660      Yes      M        High School      Blue Collar      51     Commercial   38600      9   Panel Truck    yes        0          0         No         0         8     Highly Rural/ Rural      0.03             0         $134.81   

 7901       0       52       0       13    64776      No       218142      Yes      M          Masters          Manager        68     Commercial    9560      1     Pickup       no       11409        1         No         0        15     Highly Urban/ Urban      0.13             0        $1,401.96  

 7906       0       44       0       12    69357      No         0         No       F         Bachelors       Professional     46      Private     13240      4       SUV        no         0          0         No         1         5     Highly Urban/ Urban      0.23             0        $1,906.73  

 7908       0       37       0        8    26500      No       169170      No       F        High School      Blue Collar      33     Commercial   10250      1       SUV        no       30081        1         Yes        5         1     Highly Urban/ Urban      0.83             1        $4,404.00  

 7917       0       52       0       13    70055      No       106457      No       F          Masters          Manager        35      Private      8510      3       SUV        no         0          0         No         0        13     Highly Urban/ Urban      0.13             0         $762.15   

 7924       0       50       0       13     5263      No         0         No       F        High School        Student        29     Commercial   10620     11       SUV        no        3553        3         No         2         7     Highly Urban/ Urban      0.59             1        $2,791.22  

 7948       1       45       1       15    197836     No       504107      Yes      M            PhD            Manager        15     Commercial   25780      3   Panel Truck    yes      45436        2         Yes        1        12     Highly Urban/ Urban      0.27             0        $2,066.71  

 7950       0       37       3       14    26425      No       127470      Yes      M   Less Than High School Blue Collar      50     Commercial    9030      4     Pickup       yes       1602        2         No         6         6     Highly Urban/ Urban      0.56             1        $3,580.89  

 7955       0       54       0       14    86120      No       126751      No       F          Masters          Manager        26     Commercial   29890     10     Pickup       no         0          0         No         0        17     Highly Urban/ Urban      0.22             0         $694.09   

 7957       0       52       0       11    95892      No       274044      Yes      F         Bachelors         Manager        21      Private     11090      7     Pickup       no         0          0         No         1         9     Highly Urban/ Urban      0.07             0         $-648.54  

 7959       0       46       0       15    24276      No       107542      Yes      M        High School        Clerical       28      Private     11900      1     Pickup       no         0          0         No         0         1     Highly Urban/ Urban      0.22             0        $1,532.63  

 7967       0       52       0       11    103831     No       324828      No       F            PhD             Doctor        53      Private     17080     11     Minivan      no         0          0         No         0        11     Highly Urban/ Urban      0.11             0         $-12.93   

 7969       0       59       0       12    80217      No       275635      Yes      M         Bachelors       Blue Collar      26     Commercial   26630      1   Panel Truck    no        8938        2         No         6        12     Highly Rural/ Rural      0.08             0        $1,258.80  

 7971       0       48       0       12    108601     No       320455      Yes      M        High School      Blue Collar      23     Commercial   17160     17       Van        yes      31227        2         No         4         1     Highly Urban/ Urban      0.37             1        $2,344.49  

 7974       0       57       0       13    110330     No         0         No       M          Masters          Manager        13     Commercial   18230     10       Van        no        3253        1         No         2       14.4    Highly Urban/ Urban      0.26             0        $1,443.76  

 7976       0       48       0        8    139380     No       388124      Yes      M          Masters           Lawyer        53      Private     14740      3     Minivan      yes        0          0         No         1        12     Highly Urban/ Urban      0.09             0         $674.25   

 7986       0       31       3       15     6393      Yes        0         No       F        High School        Student        50      Private      1500      8   Sports Car     no        5540        2         No         5         8     Highly Urban/ Urban      0.52             1        $3,583.63  

 7987       0       29       0       11    24276      No       60972       No       F   Less Than High School Blue Collar      43      Private      6830      1       SUV        no        5808        1         No         5         1     Highly Urban/ Urban      0.53             1        $3,358.80  

 7993       0       48       1       13    37074      No       184181      Yes      F        High School      Professional     48      Private     15190      1     Minivan      no        4848        3         No         1         1     Highly Urban/ Urban      0.15             0        $1,520.59  

 7996       2       45       2        9    14640      No       87100       Yes      F   Less Than High School Blue Collar      37      Private     23940      1       SUV        no         0          0         No         2         5     Highly Urban/ Urban      0.49             1        $2,784.38  

 7998       0       40       0       10    78589      No         0         No       F         Bachelors         Manager        25      Private      9360      4       SUV        no        800         3         No         0        12     Highly Urban/ Urban      0.12             0         $564.87   

 8018       0       51       0       10    144742     No         0         No       F          Masters          Manager        14      Private     26790     13     Pickup       no         0          0         No         2        18     Highly Urban/ Urban      0.13             0         $-250.12  

 8019       0       32       0      10.96  24506      No       117746      Yes      M         Bachelors         Clerical       66     Commercial   18260      3       Van        yes        0          0         No         0        10     Highly Urban/ Urban      0.37             1        $2,436.05  

 8027       0       47       0        0      0        No       83712       Yes      F         Bachelors        Home Maker      48      Private     13300     11     Pickup       no         0          0         No         0        13     Highly Rural/ Rural      0.05             0         $-994.37  

 8036       0       51       0       10    104355     No       286694      No       F          Masters          Manager        38      Private     17040      3     Minivan      no         0          0         No         1        15     Highly Urban/ Urban      0.13             0         $166.46   

 8040       0       40       0        9    70381      No       267721      Yes      F          Masters          Manager        24      Private     15880      8   Sports Car     no         0          0         No         0        14     Highly Urban/ Urban      0.07             0          $12.43   

 8044       0       46       0        0      0        No         0         Yes      M        High School        Student        40     Commercial   28070      1   Panel Truck    yes        0          0         No         2       4.25    Highly Rural/ Rural      0.13             0        $1,290.27  

 8050       0       26       1        0      0        Yes        0         No       F         Bachelors        Home Maker      65      Private     25940      6     Minivan      no         0          0         No         0         7     Highly Rural/ Rural      0.09             0         $441.50   

 8052       0       50       1      11.18  96013      Yes        0         No       M          Masters          Manager        52     Commercial   26400      3   Panel Truck    no        2243        3         No         0        13     Highly Urban/ Urban      0.21             0        $2,710.40  

 8054       0       34       3        0      0        No       74744       Yes      F         Bachelors        Home Maker      36      Private      4900      7       SUV        no        8272        2         No         0         6     Highly Urban/ Urban      0.32             1        $1,461.66  

 8057       0       48       0        0      0        No         0         No       F         Bachelors        Home Maker      31      Private      1500      6   Sports Car     no        3521        1         No         6         7     Highly Urban/ Urban      0.71             1        $3,197.04  

 8058       0       52       0        8    153688     No       418418      No       F            PhD            Manager        23      Private      8470      6       SUV        no         0          0         Yes        0       13.72   Highly Urban/ Urban      0.19             0        $1,023.79  

 8059       0       35       0       12    73647      No         0         No       F         Bachelors       Blue Collar      57     Commercial   19200      4     Minivan      no         0          0         Yes        1         7     Highly Urban/ Urban      0.66             1        $2,526.51  

 8066       1       43       1        9    111656     Yes        0         No       F         Bachelors       Professional     55      Private      7700      1   Sports Car     no       30378        1         Yes        5         9     Highly Urban/ Urban      0.61             1        $4,431.43  

 8070       0       59       2       18    137183     No       374393      Yes      M          Masters          Manager        5      Commercial   40580     13   Panel Truck    no         0          0         No         1        10     Highly Urban/ Urban      0.11             0         $187.02   

 8072       0       62       0       15    59807      No       194391      Yes      M          Masters           Lawyer        25      Private      8230      1   Sports Car     yes      41794        3         Yes        3        10     Highly Urban/ Urban      0.29             1        $2,706.66  

 8078       0       47       0       14     6150      No         0         Yes      M   Less Than High School   Student        39      Private      8240     13     Pickup       yes        0          0         No         2         6     Highly Rural/ Rural      0.03             0         $-565.01  

 8079       0       62       0       14    43775      No       173539      Yes      M         Bachelors       Blue Collar      32     Commercial    1500      1   Sports Car     yes        0          0         No         0         1     Highly Rural/ Rural      0.04             0         $961.81   

 8080       0       44       4        0      0        No       100846      Yes      F         Bachelors        Home Maker      36      Private      1500      4   Sports Car     no        9637        1         No         0        13     Highly Urban/ Urban      0.32             1        $1,559.83  

 8081       0       58       0       15    109878     No       298537      Yes      M            PhD            Manager        28     Commercial   22260      1       Van        no         0          0         No         1        15     Highly Urban/ Urban      0.12             0        $1,497.17  

 8088       0       50       0       13    93454      No       236061      Yes      M         Bachelors       Professional     13     Commercial   24090      6   Panel Truck    yes        0          0         No         1        10     Highly Urban/ Urban      0.21             0        $1,466.50  

 8091       0       39       3       14    44857      Yes        0         No       F   Less Than High School Blue Collar      41      Private     16070      1       SUV        no        4338        2         No         1        2.9    Highly Urban/ Urban      0.34             1        $3,261.69  

 8094       0       47       0        0    10651      No         0         No       F          Masters         Home Maker      13      Private     11780      3     Minivan      no         0          0         No         4        15     Highly Urban/ Urban      0.44             1        $1,395.70  

 8095       0       24       1       10     9761      No       92374       Yes      F         Bachelors       Professional     66      Private     11320     10   Sports Car     yes      14584        2         Yes       10         0     Highly Urban/ Urban      0.67             1        $4,050.45  

 8099       0       46       0       14    129798     No       312180      Yes      F          Masters          Manager        19     Commercial   23550      1     Pickup       no         0          0         No         0        12     Highly Urban/ Urban       0.1             0         $480.20   

 8101       0       29       2       14    60157      No       158830      Yes      M         Bachelors       Blue Collar      5      Commercial   10420      6     Pickup       yes       3761        3         No         2         8     Highly Urban/ Urban      0.35             1        $1,800.65  

 8102       0       56       0        5    82624      No       323568      No       F         Bachelors       Professional     25      Private     22700      9       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.02             0         $-335.98  

 8116       0       35       0        9    22543      No       150019      No       F   Less Than High School   Clerical       32      Private      7250      4       SUV        no        3002        1         No         0         6     Highly Urban/ Urban      0.38             1        $2,176.93  

 8125       0       47       0       14    76638      No       264483      Yes      M        High School        Manager        41     Commercial   14020      4     Minivan      yes       1620        1         No         4         7     Highly Urban/ Urban       0.2             0        $1,352.79  

 8134       0       46       0       12    40992      No       165542      Yes      F        High School      Blue Collar      5      Commercial   10200     13       SUV        no       30520        1         No         7         1     Highly Urban/ Urban      0.56             1        $2,604.20  

 8139       0       41       0       12    100258     No       282717      Yes      M         Bachelors       Professional     30      Private     30660      9     Minivan      yes        0          0         No         0        10     Highly Urban/ Urban       0.1             0          $94.22   

 8141       0       52       0       16    61299      No       260164      Yes      M        High School      Blue Collar      10     Commercial   37360     19   Panel Truck    yes        0          0         No         0         1     Highly Urban/ Urban      0.28             1        $1,114.44  

 8147       2       37       2        9    20050      No       89548       Yes      M   Less Than High School Blue Collar      35      Private     10690      7     Pickup       no         0          0         No         2       3.04    Highly Rural/ Rural      0.08             0         $756.30   

 8158       0       50       0        0      0        No       110784      No       F          Masters         Home Maker      17      Private     18660      1       SUV        no        1427        1         No         0        15     Highly Urban/ Urban       0.5             1        $2,103.21  

 8160       0       56       0       10    99606      No       113318      No       M          Masters          Manager        14      Private      9050      6     Pickup       no         0          0         No         0        12     Highly Urban/ Urban      0.11             0         $233.14   

 8165       0       43       2        0      0        No         0         Yes      M        High School        Student        42      Private      8260      3     Pickup       no         0          0         No         0         6     Highly Urban/ Urban      0.34             1        $1,570.70  

 8187       0       51       1       11    66296      No       205130      Yes      M         Bachelors       Professional     58     Commercial    8970      1     Pickup       yes        0          0         No         0         1     Highly Urban/ Urban       0.2             0        $2,277.17  

 8205       0       50       0       14    49256      No       212649      Yes      M         Bachelors         Manager        34     Commercial   11430      4     Pickup       no        5556        4         No         2         1     Highly Urban/ Urban      0.18             0        $1,676.53  

 8209       0       45       0       11    49957      No       191130      No       M         Bachelors       Professional     22     Commercial   18710      4       Van        yes        0          0         No         1         2     Highly Urban/ Urban      0.41             1        $2,767.92  

 8211       0       49       0       13    30644      No       174753      Yes      F            PhD           Home Maker      32      Private      9460      4       SUV        no        8861        4         No         5        10     Highly Urban/ Urban      0.25             0        $2,582.73  

 8232       0       49       0       11    126918     No       384029      Yes      M          Masters        Professional     21      Private     23170      7     Minivan      no         0          0         No         0        18     Highly Rural/ Rural      0.01             0        $-1,514.74 

 8236       0       39       0       11    134432     No       387474      Yes      M            PhD             Lawyer        23      Private      5400      3     Pickup       yes        0          0         No         0        20     Highly Urban/ Urban      0.08             0         $619.29   

 8237       0       32       1       13    22243      Yes        0         No       F         Bachelors        Home Maker      5      Commercial   19470     13     Pickup       no         0          0         No         0        10     Highly Urban/ Urban      0.42             1        $1,578.03  

 8238       0       48       0        8    36954      No         0         No       M        High School      Blue Collar      37     Commercial   10000      1     Pickup       yes       3654        2         No         3         1     Highly Urban/ Urban       0.6             1        $3,672.64  

 8245       0       48       0        5    14938      No         0         No       F         Bachelors         Student        16      Private      6300      6       SUV        no        7998        1         No         5        10     Highly Urban/ Urban      0.47             1        $1,933.94  

 8256       0       39       0        9    133060     No         0         No       F            PhD             Lawyer        44      Private      5400      7   Sports Car     no        2897        2         No         1        18     Highly Urban/ Urban      0.18             0        $2,028.73  

 8268       0       52       0        8    129561     No       336369      Yes      M         Bachelors       Professional     46      Private     19660      6     Minivan      yes        0          0         No         1        12     Highly Urban/ Urban       0.1             0         $474.20   

 8269       0       44       0       12    1e+05      No       238931      Yes      F   Less Than High School Blue Collar      38      Private     14810      1       SUV        no         0          0         No         0         6     Highly Rural/ Rural      0.02             0         $-301.87  

 8270       0       32       3       10    22901      No       87839       Yes      M        High School        Clerical       49      Private     13200      6     Minivan      no         0          0         Yes        1         6     Highly Urban/ Urban      0.42             1        $1,633.36  

 8286       0       43       0       11    30183      No       87809       Yes      F          Masters         Home Maker      17      Private      8820      6       SUV        no         0          0         No         0       12.61   Highly Urban/ Urban      0.13             0         $637.61   

 8289       0       58       2       17    51318      No       201105      Yes      M         Bachelors       Professional     16      Private     13080      4     Minivan      yes        0          0         No         0         5     Highly Urban/ Urban      0.12             0         $396.34   

 8301       1       45       3       18     7696      No         0         Yes      M   Less Than High School   Student        43      Private      9790      1     Pickup       yes        0          0         No         0         1     Highly Urban/ Urban      0.27             0        $1,875.58  

 8305       0       54       0       14    114422     No       294941      Yes      F          Masters           Lawyer        33      Private     23350      1       SUV        no        4091        1         No         0        16     Highly Urban/ Urban      0.09             0         $855.35   

 8310       0       30       4       12    58248      Yes        0         No       M            PhD             Doctor        25      Private     14380      1     Minivan      no         0          0         No         2       12.37   Highly Urban/ Urban      0.17             0        $1,463.03  

 8312       0       49       0        7    86847      No       228889      No       M          Masters        Professional     33     Commercial   23210      1   Panel Truck    yes        0          0         No         0         6     Highly Rural/ Rural      0.05             0        $1,226.36  

 8318       0       37       1       11    22401      Yes        0         No       F   Less Than High School Blue Collar      33      Private      7440      4   Sports Car     no       30099        3         Yes        6         4     Highly Urban/ Urban      0.74             1        $4,752.68  

 8321       0       47       0       12    120030     No       321152      No       F          Masters        Professional     6       Private      6200      4       SUV        no        6949        1         No         3        16     Highly Urban/ Urban      0.25             0        $1,729.02  

 8328       0       57       0       15    98323      No       334600      Yes      F         Bachelors         Manager        21      Private     11330      7       SUV        no         0          0         No         0        11     Highly Urban/ Urban      0.06             0         $-572.83  

 8331       0       56       2       13    60286      No       213596      Yes      F         Bachelors       Blue Collar      43     Commercial   13130      6       SUV        no         0          0         No         0        11     Highly Rural/ Rural      0.04             0          $11.73   

 8334       0       39       2        0      0        No       105472      Yes      F   Less Than High School  Home Maker      10      Private      5400      1   Sports Car     no         0          0         No         0         1     Highly Urban/ Urban      0.32             1        $1,834.54  

 8344       0       45       0        4    83111      No       237263      No       M         Bachelors         Manager        31     Commercial   18610      7       Van        no         0          0         No         2         7     Highly Urban/ Urban      0.28             0        $1,642.51  

 8345       0       40       0        0      0        No         0         No       F        High School        Student        53     Commercial   22180      3   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.19             0        $1,883.77  

 8352       0       33       2       13    35263      No       169916      Yes      F   Less Than High School Blue Collar      41     Commercial   10620     13     Minivan      no         0          0         No         3         1     Highly Urban/ Urban      0.42             1        $1,820.70  

 8358       0       42       0      11.71  92395      No       277497      Yes      M         Bachelors       Blue Collar      20     Commercial   10470      1     Pickup       no       27667        1         Yes        4        11     Highly Urban/ Urban      0.57             1        $2,736.77  

 8359       0       48       0       10    34606      No       163682      Yes      M   Less Than High School Blue Collar      59      Private      3920      1     Minivan      yes        0          0         No         1         1     Highly Urban/ Urban      0.21             0        $1,644.09  

 8360       0       32       2        9    27462      Yes        0         No       F        High School        Clerical       30      Private     11630      6       SUV        no         0          0         Yes        0         1     Highly Rural/ Rural      0.11             0        $1,363.70  

 8365       0       45       1       11     3006      Yes        0         No       F        High School       Home Maker      39     Commercial   30050      6       Van        no         0          0         Yes        2         1     Highly Rural/ Rural      0.24             0        $2,420.46  

 8366       0       49       0       15    22978      No       144545      Yes      M   Less Than High School   Clerical       5       Private     20010      1       Van        yes        0          0         No         0         9     Highly Urban/ Urban      0.23             0        $1,242.81  

 8369       3       45       3       14     3532      No       71734       Yes      F        High School       Home Maker      35      Private      6350      1       SUV        no       11564        2         No         2         6     Highly Urban/ Urban      0.58             1        $3,053.95  

 8373       0       34       3       13    20299      No       66016       Yes      F        High School       Home Maker      45      Private     18140      6       SUV        no         0          0         No         3         1     Highly Rural/ Rural      0.03             0          $21.14   

 8378       0       39       0      11.18  94059      No       286323      Yes      M         Bachelors       Professional     33     Commercial   42320      1   Panel Truck    yes        0          0         No         0         6     Highly Urban/ Urban      0.18             0        $1,927.44  

 8392       0       45       0        0      0        No       77453       No       F          Masters         Home Maker      24      Private     30130      4     Minivan      no         0          0         No         0        15     Highly Urban/ Urban       0.5             1        $1,286.54  

 8397       1       45       1       14    26156      No       179165      Yes      F         Bachelors       Professional     48      Private     14460      1       SUV        no       28959        1         Yes        0        10     Highly Urban/ Urban      0.36             1        $2,234.05  

 8399       0       56       2       16    66868      No       204146      Yes      F        High School      Blue Collar      17      Private     21050     10     Pickup       no         0          0         Yes        0         6     Highly Urban/ Urban      0.28             1         $776.72   

 8400       0       55       0       16    42815      No       205232      Yes      M          Masters           Lawyer        47      Private     14690      1     Minivan      yes       8762        1         No         0         8     Highly Urban/ Urban      0.12             0         $978.76   

 8405       1       41       2       14    86860      Yes        0         No       M         Bachelors       Blue Collar      33     Commercial   16020      3     Minivan      no         0          0         No         4         1     Highly Urban/ Urban      0.68             1        $3,812.67  

 8406       0       56       0       15    82370      No       274135      Yes      F          Masters          Manager        15      Private     15340      6       SUV        no         0          0         No         0        15     Highly Urban/ Urban      0.06             0         $-338.81  

 8410       0       33       1       12    66803      No       193201      Yes      M          Masters           Lawyer        32      Private     14390      6     Minivan      yes        0          0         Yes        0        17     Highly Urban/ Urban       0.2             0         $585.97   

 8413       0       33       0        9    74138      No       263173      No       M        High School      Blue Collar      5       Private     13640     13     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.27             0         $553.86   

 8414       0       49       0       13    59743      No       239955      Yes      M         Bachelors       Blue Collar      11     Commercial   12370      1     Minivan      no       51188        2         Yes        4        10     Highly Urban/ Urban      0.61             1        $2,435.37  

 8416       0       35       2       12     3028      Yes      39116       No       M         Bachelors         Student        40      Private      5300      1     Pickup       no       32063        2         Yes        4        10     Highly Urban/ Urban      0.69             1        $3,597.46  

 8426       0       34       5      10.53  17698      No       137278      Yes      F   Less Than High School  Home Maker      35      Private      6670      1   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.02             0          $14.86   

 8434       0       53       0       14    107394     No       318906      Yes      F        High School      Blue Collar      20     Commercial   17540      1       SUV        no         0          0         No         1         1     Highly Urban/ Urban      0.27             0        $2,172.62  

 8439       0       39       2      12.18  111072     No       297741      Yes      F         Bachelors         Manager        33      Private      9560      4       SUV        no         0          0         No         4        10     Highly Urban/ Urban       0.1             0         $410.20   

 8440       2       45       2       13    109361     No       306852      Yes      F         Bachelors         Manager        9       Private      1500      1       SUV        no         0          0         No         0        16     Highly Urban/ Urban      0.13             0          $99.43   

 8475       0       52       0        8    96707      No       270614      Yes      M        High School      Blue Collar      32     Commercial   29370     13   Panel Truck    yes        0          0         No         0         1     Highly Rural/ Rural      0.03             0         $-26.46   

 8480       0       39       0       11    16459      No       64192       No       F        High School       Home Maker      52      Private      6620      5   Sports Car     no        3884        2         No         1         1     Highly Rural/ Rural      0.04             0         $892.37   

 8497       0       61       2       18    34446      No       168224      Yes      M          Masters           Lawyer        35      Private     11040      4       SUV        yes       1465        2         No         0         9     Highly Urban/ Urban      0.12             0        $1,492.94  

 8499       0       53       0       10    30699      No         0         No       M         Bachelors         Clerical       42     Commercial   22730      4   Panel Truck    no       19644        2         Yes        5        13     Highly Urban/ Urban      0.84             1        $4,031.90  

 8500       0       43       0       12    46671      No       183055      No       M   Less Than High School Blue Collar      63      Private      9400     13     Pickup       yes        0          0         No         3         5     Highly Urban/ Urban      0.41             1        $2,252.87  

 8501       0       52       0        9    46188      No       163879      No       F          Masters          Manager        26      Private     18910      6     Minivan      no         0          0         No         0        12     Highly Urban/ Urban      0.14             0         $-59.77   

 8502       0       43       0       11    47309      No       178766      Yes      F        High School      Professional     51      Private      6530      1   Sports Car     no        8487        2         No         3         1     Highly Urban/ Urban      0.18             0        $2,667.35  

 8518       0       33       3        9    58195      No       173288      Yes      F        High School      Professional     37      Private      8090      1   Sports Car     no        504         1         No         0         1     Highly Urban/ Urban      0.11             0        $1,873.36  

 8520       0       40       1       11    40252      Yes      201112      No       M        High School      Blue Collar      41      Private      7240     13     Pickup       yes        0          0         Yes        0         1     Highly Urban/ Urban      0.49             1        $2,649.44  

 8523       0       54       0       14    59291      No         0         No       M   Less Than High School Blue Collar      5       Private     12830      1     Minivan      no        6815        1         No         6         1     Highly Urban/ Urban       0.5             1        $2,397.11  

 8525       0       48       0       10    86106      No       155212      Yes      M          Masters          Manager        18     Commercial   30500      1   Panel Truck    yes        0          0         No         2        18     Highly Urban/ Urban      0.15             0        $1,071.14  

 8532       0       47       0       14    106484     No       328359      Yes      M          Masters          Manager        49     Commercial   28380      4   Panel Truck    no         0          0         No         0        19     Highly Urban/ Urban      0.11             0         $883.32   

 8535       0       56       0       13    69790      No       198028      Yes      M        High School      Blue Collar      44     Commercial   15960     17     Minivan      yes       7825        3         No         6         1     Highly Urban/ Urban      0.48             1        $2,529.20  

 8543       0       43       2       16    98666      No       319269      Yes      F          Masters           Lawyer        37      Private      3800      6       SUV        no       35062        2         Yes        0        16     Highly Urban/ Urban      0.18             0        $1,232.83  

 8554       0       48       0       13    54108      No       183134      Yes      M        High School      Professional     23      Private     10060      1     Pickup       yes       3149        2         No         0         1     Highly Urban/ Urban      0.12             0        $1,509.42  

 8560       2       45       2        0      0        No       100508      Yes      F         Bachelors        Home Maker      60      Private      6000     10       SUV        no         0          0         No         4        11     Highly Rural/ Rural      0.18             0         $959.00   

 8561       0       57       0       14    177908     No       467833      Yes      M            PhD            Manager        41     Commercial   25380      1   Panel Truck    yes      35371        3         Yes        0        13     Highly Urban/ Urban      0.18             0        $2,054.66  

 8563       0       53       0       13    70195      No         0         No       M         Bachelors       Professional     34      Private     17750      1     Minivan      no         0          0         No         2         9     Highly Rural/ Rural      0.03             0         $-113.26  

 8566       0       40       0        0      0        No         0         No       F        High School        Student        40     Commercial    5500     17       SUV        no         0          0         Yes        5        13     Highly Urban/ Urban      0.91             1        $3,465.34  

 8570       0       39       0        9    42141      No       181281      No       F        High School      Blue Collar      5      Commercial   20080      4     Pickup       no         0          0         No         2         4     Highly Urban/ Urban      0.56             1        $2,283.41  

 8572       0       36       1       12    25081      No       119233      Yes      M   Less Than High School   Clerical       66      Private      7610      1     Pickup       no        7054        1         No         0       4.26    Highly Rural/ Rural      0.03             0         $345.70   

 8582       0       42       0        4    17574      No       83322       Yes      M          Masters        Professional     44      Private      5700      6     Pickup       no         0          0         No         0        16     Highly Urban/ Urban      0.15             0        $1,222.82  

 8583       0       28       2        8    66783      No       227215      Yes      F         Bachelors       Blue Collar      5      Commercial   10980     10       SUV        no        8079        2         No         3        10     Highly Urban/ Urban      0.37             1        $1,657.81  

 8587       0       36       2       11    13509      Yes        0         No       F        High School        Clerical       39      Private      2850     13   Sports Car     no        1468        1         No         5         1     Highly Rural/ Rural      0.13             0        $2,002.87  

 8592       0       33       0        5    12067      No       102281      Yes      F   Less Than High School   Clerical       19     Commercial   16930     10     Pickup       no         0          0         No         0         1     Highly Urban/ Urban      0.41             1        $1,747.81  

 8593       0       48       0       11    73806      No       216274      No       F        High School      Blue Collar      16     Commercial    8850      3       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.44             1        $2,517.33  

 8607       0       69       1       14     5622      No       181254      Yes      F        High School       Home Maker      26      Private      9350     13   Sports Car     no         0          0         No         0         1     Highly Rural/ Rural      0.02             0         $-639.26  

 8609       0       33       1      10.44  86321      Yes      227138      No       M          Masters           Lawyer        17      Private     13430      1     Minivan      yes        0          0         No         4        24     Highly Urban/ Urban      0.29             1        $1,873.51  

 8610       0       61       0        0      0        No         0         No       M        High School        Student        29      Private     20480      6       SUV        no         0          0         No         0         9     Highly Rural/ Rural       0.1             0         $432.88   

 8614       0       49       0        7    32763      No       191657      Yes      F         Bachelors       Blue Collar      25     Commercial    8010     17       SUV        no       21383        2         No         7        11     Highly Urban/ Urban      0.58             1        $2,460.19  

 8616       0       42       0       11    50613      No         0         No       F        High School        Clerical       45      Private     18170      4     Minivan      no        6784        2         No         4         1     Highly Urban/ Urban      0.48             1        $2,354.05  

 8622       0       55       0       15    34745      No       184274      Yes      M        High School      Blue Collar      15      Private     10470     18     Pickup       yes       2752        1         No         4       4.03    Highly Urban/ Urban      0.29             1        $1,124.73  

 8623       0       41       0       11    39066      No       171066      Yes      F        High School        Clerical       14      Private     14320      1     Minivan      no         0          0         No         0         1     Highly Urban/ Urban       0.2             0         $647.14   

 8624       0       47       0        9    18896      No       106991      No       M         Bachelors       Blue Collar      14     Commercial   12040      6     Minivan      yes        0          0         No         2         8     Highly Urban/ Urban      0.61             1        $2,091.78  

 8633       1       43       2       15    28948      No       189468      Yes      F         Bachelors         Manager        43      Private     13260      5       SUV        no       32281        1         No         0         9     Highly Urban/ Urban      0.13             0         $530.14   

 8641       0       44       0       10    77919      No       238871      No       F         Bachelors       Blue Collar      29     Commercial   15810      1       SUV        no         0          0         No         0        14     Highly Urban/ Urban      0.43             1        $2,243.45  

 8644       0       25       1        9    23413      Yes        0         No       F        High School        Clerical       12      Private      7530      3       SUV        no        4885        3         No         3         7     Highly Urban/ Urban      0.49             1        $3,170.73  

 8649       0       45       1      10.64  29836      Yes      130714      No       M   Less Than High School   Clerical       28     Commercial   10240      4     Pickup       yes        0          0         No         1         6     Highly Urban/ Urban      0.58             1        $3,565.37  

 8653       0       42       0       12    103050     No       270986      Yes      M          Masters        Professional     26     Commercial   11860      4     Pickup       yes        0          0         No         0        16     Highly Urban/ Urban      0.18             0        $1,661.13  

 8657       0       53       0       11    178768     No       469094      No       M            PhD            Manager        23     Commercial   24680      6   Panel Truck    no         0          0         No         1        12     Highly Urban/ Urban       0.2             0        $1,644.45  

 8658       0       36       0        8    51358      No       178375      Yes      F         Bachelors       Professional     25      Private      1500      7       SUV        no         0          0         No         0         6     Highly Urban/ Urban      0.12             0         $778.97   

 8663       0       47       0       11    190579     No       471490      No       F            PhD             Doctor        39      Private     13040      6       SUV        no         0          0         No         0        16     Highly Urban/ Urban      0.09             0         $490.06   

 8672       0       52       0        0      0        No         0         Yes      F        High School        Student        62     Commercial   19240     17     Minivan      no        6902        2         Yes        3         9     Highly Urban/ Urban      0.78             1        $2,383.60  

 8680       0       48       0       14    58132      No         0         No       F        High School        Manager        32      Private      6860      6       SUV        no        7926        3         No         3         1     Highly Urban/ Urban       0.2             0        $1,610.00  

 8684       0       61       0       11    53354      No         0         No       F   Less Than High School Blue Collar      41      Private      1500      7   Sports Car     no         0          0         No         0       5.24    Highly Urban/ Urban       0.3             1        $2,108.95  

 8687       0       54       0       14    67290      No       269448      Yes      F         Bachelors         Manager        24      Private      8230      6   Sports Car     no         0          0         No         2        10     Highly Urban/ Urban      0.09             0         $210.87   

 8688       0       42       0       10    90937      No       287892      Yes      M         Bachelors         Manager        11      Private      1500      4     Minivan      yes       943         2         No         0        13     Highly Urban/ Urban      0.06             0         $-843.65  

 8690       0       36       4        0      0        No         0         Yes      F        High School        Student        35     Commercial   15130     10       SUV        no         0          0         Yes        0         1     Highly Rural/ Rural      0.19             0         $946.74   

 8712       0       46       0       12     5070      No         0         No       M        High School        Student        8       Private      1790      1     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.35             1        $1,185.53  

 8717       0       37       0        9    45464      No         0         No       F          Masters           Lawyer        35      Private     11920     14       SUV        no        3964        1         No         4        15     Highly Urban/ Urban      0.34             1        $1,735.55  

 8730       0       45       0       12    11261      No       151509      Yes      M          Masters          Manager        26      Private     13700      4     Minivan      yes        0          0         No         0        18     Highly Urban/ Urban       0.1             0         $-290.52  

 8739       0       25       0        8    66923      No       231852      No       M         Bachelors       Professional     18      Private     15010     10     Minivan      yes       5960        1         No         5       9.36    Highly Urban/ Urban      0.36             1        $1,537.88  

 8744       0       41       0       11    67338      No       205470      Yes      F         Bachelors       Blue Collar      6      Commercial   19840     10       SUV        no         0          0         Yes        0        14     Highly Rural/ Rural      0.08             0         $-391.27  

 8747       0       44       0        7    16976      No       165890      Yes      F        High School       Home Maker      53      Private      9680      1       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.15             0        $1,522.09  

 8748       0       46       0       11    95550      No         0         No       M          Masters        Professional     21     Commercial   16590      7       Van        no        2169        1         No         0        18     Highly Urban/ Urban      0.32             1        $2,346.86  

 8751       0       47       0      10.24   3663      No       122332      Yes      F        High School        Student        57     Commercial    9310      1   Sports Car     no        1348        2         No         4         7     Highly Urban/ Urban       0.5             1        $3,475.58  

 8758       0       37       0        7    34038      No       161587      No       M          Masters           Lawyer        61      Private     15450      9     Minivan      no        3721        3         No         2        14     Highly Urban/ Urban      0.29             1        $1,750.72  

 8761       0       48       0       10    44770      No       162374      No       M          Masters           Lawyer        66      Private      5980      1     Pickup       yes        0          0         No         4        14     Highly Urban/ Urban      0.34             1        $2,514.23  

 8763       0       44       0       12    33833      No       172826      Yes      F   Less Than High School Blue Collar      26      Private     22330     11     Minivan      no         0          0         No         1         1     Highly Rural/ Rural      0.03             0        $-1,095.35 

 8764       0       37       0        8    95502      No         0         No       F         Bachelors       Professional     37      Private     26290      1   Sports Car     no        7460        1         No         0        11     Highly Urban/ Urban      0.19             0        $1,923.89  

 8765       0       42       2       13    38092      No       150907      Yes      F        High School        Clerical       15      Private     15320      7   Sports Car     no         0          0         No         0         1     Highly Urban/ Urban       0.2             0        $1,304.74  

 8773       0       53       0       13    74334      No       254789      Yes      F            PhD            Manager        24      Private      6800     10       SUV        no        5854        1         No         1        16     Highly Urban/ Urban      0.07             0         $169.90   

 8780       0       36       0       12    77526      No       262675      Yes      M         Bachelors       Professional     31      Private     12850      7     Minivan      yes       8271        3         No         5        11     Highly Urban/ Urban       0.2             0        $1,398.03  

 8781       0       43       1       11    72421      No       217974      Yes      F         Bachelors         Manager        35      Private     13760      3       SUV        no        1018        1         No         1        18     Highly Urban/ Urban      0.07             0         $-61.71   

 8782       0       48       0       11    101806     No       296076      No       F          Masters        Professional     36     Commercial   20860      7     Pickup       no       26433        3         Yes        0        23     Highly Urban/ Urban       0.5             1        $2,558.02  

 8785       0       49       0        7    67258      No       222040      No       M          Masters           Lawyer        28      Private     21760      6       Van        no         0          0         No         1        10     Highly Urban/ Urban      0.22             0        $1,657.65  

 8786       3       44       4       18    59352      No       192373      Yes      M        High School        Manager        17      Private     15470      1     Minivan      yes        0          0         No         0         1     Highly Urban/ Urban      0.23             0         $916.27   

 8797       0       47       0        6    32267      No         0         No       F   Less Than High School Blue Collar      63      Private     18210      1   Sports Car     no         0          0         Yes        6       4.37    Highly Urban/ Urban      0.72             1        $4,161.09  

 8799       0       57       0       14    89448      No       255481      Yes      F            PhD            Manager        20      Private     18020      1       SUV        no         0          0         No         0        14     Highly Urban/ Urban      0.06             0         $286.31   

 8807       2       37       2       10    47473      No       190556      Yes      M        High School      Blue Collar      37     Commercial    9950      4     Pickup       no        2981        2         No         3         8     Highly Urban/ Urban      0.63             1        $3,448.93  

 8816       0       51       0       13    32159      No       195096      No       F   Less Than High School Blue Collar      46      Private      9820      4       SUV        no         0          0         No         0         6     Highly Rural/ Rural      0.05             0         $432.78   

 8817       1       43       2        5     2599      Yes        0         No       M         Bachelors         Student        38      Private      1760      3     Minivan      yes        0          0         No         0         5     Highly Rural/ Rural      0.09             0         $638.31   

 8826       0       27       2      11.48  11882      No         0         Yes      F        High School        Student        39      Private     32510      1     Pickup       no       10780        2         No         1         8     Highly Urban/ Urban       0.2             0        $1,255.75  

 8833       0       53       0       11    115204     No       326631      Yes      M          Masters          Manager        48     Commercial   18320      6       Van        no         0          0         No         0        15     Highly Urban/ Urban      0.11             0        $1,000.25  

 8834       0       54       0       12    71316      No       266967      Yes      M          Masters          Manager        13     Commercial   32660      7   Panel Truck    no         0          0         No         0        17     Highly Urban/ Urban      0.13             0         $420.96   

 8835       0       54       0       15    74208      No       277531      Yes      M         Bachelors         Manager        13     Commercial   22330      7       Van        no         0          0         No         2        10     Highly Urban/ Urban      0.16             0         $718.97   

 8840       0       40       2        8    76036      No       209793      Yes      M         Bachelors       Blue Collar      32     Commercial   14430     10     Minivan      yes        0          0         No         0         9     Highly Urban/ Urban      0.27             0         $968.02   

 8843       0       58       0       11    101448     No       329765      Yes      M         Bachelors       Professional     32      Private     17440      1       Van        no         0          0         No         0        12     Highly Urban/ Urban       0.1             0        $1,034.69  

 8849       0       41       0       11    39066      No       151151      Yes      F        High School        Clerical       25      Private      7920      7   Sports Car     no         0          0         No         3         1     Highly Urban/ Urban      0.29             1        $1,961.93  

 8855       0       37       4        5    79846      Yes        0         No       F   Less Than High School Blue Collar      35     Commercial   20460      6       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.07             0        $1,680.03  

 8861       0       45       0       10    93996      No       316275      Yes      F          Masters        Professional     47      Private     11640      1       SUV        no        3731        1         No         5        13     Highly Urban/ Urban      0.19             0        $2,327.30  

 8862       0       45       0       10    49675      No       181340      No       M            PhD          Professional     36      Private      1500      1     Minivan      yes        0          0         No         0        12     Highly Urban/ Urban      0.22             0        $1,870.76  

 8865       0       50       0       11    53567      No       225043      Yes      M   Less Than High School Blue Collar      15     Commercial   27630      1   Panel Truck    no         0          0         No         2         8     Highly Urban/ Urban      0.36             1        $2,340.30  

 8868       2       37       2        7    125309     No       284477      Yes      F         Bachelors       Professional     21      Private     19900     11     Minivan      no         0          0         No         0         8     Highly Rural/ Rural      0.02             0        $-1,278.66 

 8870       0       43       3       14    132449     No       354193      Yes      F          Masters          Manager        17      Private     27530     10     Minivan      no         0          0         No         2        14     Highly Urban/ Urban      0.07             0         $-891.61  

 8880       0       44       2       13    44200      No       160351      Yes      F        High School        Clerical       35      Private     10910      4       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.25             0        $1,782.36  

 8885       0       46       0        5    133912     No         0         No       M          Masters           Lawyer        19      Private     14890     13     Minivan      yes        0          0         No         0        14     Highly Urban/ Urban      0.16             0         $193.46   

 8894       0       45       0       15    128801     No         0         No       F          Masters           Lawyer        27      Private     25900      3     Minivan      no        5994        2         No         6        17     Highly Urban/ Urban      0.32             1        $1,698.74  

 8895       0       50       0        9    139452     No       364308      Yes      F            PhD             Doctor        43      Private     11900      8     Pickup       no         0          0         Yes        1       14.73   Highly Urban/ Urban      0.12             0         $237.59   

 8899       2       58       3       15    41781      No       195766      Yes      F        High School        Clerical       43      Private      8260      4     Minivan      no         0          0         No         0         1     Highly Rural/ Rural      0.06             0         $-54.37   

 8912       0       45       0       10    48344      No         0         No       M          Masters           Lawyer        59      Private     13020      9     Minivan      no        7102        3         No         4       13.66   Highly Urban/ Urban      0.33             1        $2,028.87  

 8922       0       46       0       12    16468      No       100941      Yes      F          Masters         Home Maker      44      Private      7750     10       SUV        no         0          0         No         0        11     Highly Rural/ Rural      0.02             0         $-769.26  

 8924       0       42       0       12    64019      No       249488      Yes      F            PhD             Doctor        38      Private     14590      4   Sports Car     no        7465        1         No         0        13     Highly Urban/ Urban      0.07             0         $638.03   

 8928       0       49       0       16    25371      No       143256      Yes      M        High School      Blue Collar      20      Private      4690      4     Pickup       yes        0          0         No         3        11     Highly Urban/ Urban      0.28             0        $1,449.91  

 8932       0       30       0        7    54275      No       121341      Yes      F        High School      Professional     17      Private      7220      1   Sports Car     no         0          0         No         5         1     Highly Urban/ Urban      0.22             0        $2,370.91  

 8943       0       54       0       12    40818      No         0         No       F          Masters           Lawyer        34      Private     15890     13       SUV        no         0          0         No         0        15     Highly Urban/ Urban      0.22             0         $999.76   

 8945       0       40       0       13    58231      No       209820      Yes      M         Bachelors         Manager        23      Private      5400      1     Minivan      yes       2983        1         No         3        13     Highly Urban/ Urban       0.1             0         $-18.64   

 8946       0       43       3       14    22485      Yes        0         No       F   Less Than High School Blue Collar      14      Private      8050     13       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.05             0         $429.51   

 8954       0       53       0       10    123954     No         0         No       M          Masters          Manager        18     Commercial   17850     10       Van        yes       1644        3         No         3        10     Highly Urban/ Urban      0.28             0        $2,010.67  

 8958       0       59       0      10.57   2238      No       96941       Yes      F        High School       Home Maker      32      Private      7620      1       SUV        no        2490        2         No         2         8     Highly Urban/ Urban      0.26             0        $1,870.74  

 8960       0       41       2      0.72     0        Yes      22015       No       F        High School        Student        19      Private     14540      1   Sports Car     no        3641        1         No         0         1     Highly Urban/ Urban      0.52             1        $3,186.79  

 8965       0       47       0       10    82503      No         0         No       F         Bachelors       Professional     38      Private     21800     13   Sports Car     no        6633        4         No         0        15     Highly Urban/ Urban       0.2             0        $1,600.58  

 8966       0       29       2        0     2061      No       52142       Yes      F        High School       Home Maker      37      Private      5830      4       SUV        no         0          0         No         1         8     Highly Rural/ Rural      0.03             0         $-269.77  

 8967       0       46       0       12    111318     No       330183      Yes      M            PhD             Doctor        43      Private     35730      1     Minivan      no        2935        1         No         0        14     Highly Urban/ Urban      0.05             0          $26.15   

 8969       0       57       0       14    11977      No       130295      Yes      F        High School        Student        39     Commercial   16360      9     Pickup       no         0          0         No         2         9     Highly Urban/ Urban      0.37             1        $1,630.04  

 8980       0       45       2       14    20757      Yes      142511      No       F        High School      Blue Collar      52     Commercial    3580     10       SUV        no         0          0         No         0        10     Highly Rural/ Rural       0.1             0        $1,526.55  

 8984       0       52       0        0      0        No         0         Yes      M   Less Than High School   Student        29      Private      6700      6     Minivan      yes        0          0         No         1         5     Highly Rural/ Rural      0.06             0         $-458.16  

 8985       0       29       1        0      0        Yes        0         No       M        High School        Student        32      Private      4400      6     Minivan      yes       3359        3         No         8         7     Highly Urban/ Urban      0.78             1        $3,858.17  

 8988       0       51       0       13    50446      No       190849      Yes      F         Bachelors       Blue Collar      50     Commercial   26130     10     Pickup       no        1412        3         No         3         1     Highly Urban/ Urban       0.4             1        $2,395.66  

 8989       1       47       0        7    33767      No       153272      Yes      F        High School        Clerical       43     Commercial   28140      6     Pickup       no         0          0         No         0         1     Highly Urban/ Urban      0.47             1        $2,372.44  

 8995       0       40       0       13    41747      No       199444      Yes      F        High School       Home Maker      5       Private     14340      4       SUV        no         0          0         No         0         7     Highly Urban/ Urban      0.12             0         $417.45   

 9004       0       48       0        8    35090      No       158460      Yes      M        High School        Clerical       68     Commercial   21270      1       Van        no         0          0         No         0        10     Highly Rural/ Rural      0.05             0        $1,007.11  

 9010       0       54       0       14    100816     No       281563      Yes      F          Masters           Lawyer        33      Private     21680      6     Minivan      no         0          0         No         1        20     Highly Urban/ Urban       0.1             0         $-73.95   

 9012       0       56       0        9    19712      No         0         No       M         Bachelors         Manager        28      Private     10730      6     Pickup       yes        0          0         No         3        8.3    Highly Urban/ Urban      0.25             0         $957.49   

 9018       0       33       0       10    44315      No       193380      No       F        High School        Manager        15      Private      5930      1   Sports Car     no         0          0         Yes        2        11     Highly Urban/ Urban      0.33             1        $1,579.65  

 9036       0       40       0      10.77  21104      No       106870      Yes      F   Less Than High School Blue Collar      29      Private      3610      4       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.21             0        $1,516.96  

 9037       0       39       0       12    49652      No       208319      Yes      M         Bachelors         Manager        46      Private     10370      6     Pickup       yes        0          0         Yes        1        10     Highly Urban/ Urban      0.16             0         $464.09   

 9040       0       49       0        7    56462      No       173487      Yes      F         Bachelors       Professional     39      Private     22720     13     Minivan      no        5495        1         No         5        10     Highly Urban/ Urban      0.22             0         $822.42   

 9041       0       51       0       11     8260      No       124947      No       M        High School        Student        31     Commercial   15620      6     Minivan      yes        0          0         No         1         9     Highly Urban/ Urban      0.54             1        $2,041.06  

 9044       0       57       0       13    196889     No       484353      No       M          Masters        Professional     42     Commercial   43250      1   Panel Truck    yes       9784        2         No         6        15     Highly Urban/ Urban      0.47             1        $3,816.55  

 9045       0       50       0       10    45620      No       170796      Yes      F         Bachelors         Manager        20      Private     14790      4       SUV        no         0          0         No         1         5     Highly Urban/ Urban      0.09             0          $28.38   

 9047       0       26       3       15    69789      No       206181      Yes      F        High School        Manager        37      Private     11770      1       SUV        no        2960        3         No         5         7     Highly Urban/ Urban      0.13             0        $1,447.77  

 9049       0       43       0       13    45355      No       151271      Yes      F   Less Than High School Blue Collar      12      Private     10340      1       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.02             0         $-381.23  

 9061       0       40       0       12    43072      No       120442      Yes      M        High School        Clerical       38      Private     13980      1     Minivan      yes        0          0         No         0         1     Highly Rural/ Rural      0.02             0         $-473.95  

 9062       0       45       2       15    135768     No       347575      Yes      M          Masters          Manager        22     Commercial   19580      1       Van        yes       8176        2         No         6        15     Highly Urban/ Urban      0.22             0        $2,146.43  

 9076       0       34       1       11    96606      Yes        0         No       F          Masters          Manager        22      Private     20490      4   Sports Car     no         0          0         No         0        18     Highly Urban/ Urban      0.12             0        $1,250.73  

 9079       0       40       2       14    23095      No       140824      Yes      F   Less Than High School   Clerical       19      Private      7810      1     Minivan      no        5128        2         No         1        2.9    Highly Urban/ Urban      0.25             0        $1,237.48  

 9081       0       41       0        9    173557     No       450715      No       M          Masters          Manager        34     Commercial   22960      7   Panel Truck    yes       5447        3         No         0        15     Highly Urban/ Urban      0.18             0        $1,514.72  

 9082       0       41       3       12    62943      No       229852      Yes      M        High School        Clerical       28      Private     27820      1     Minivan      yes        0          0         No         2         1     Highly Urban/ Urban      0.23             0        $1,362.61  

 9089       0       40       3        9    17372      No       107484      Yes      F        High School        Clerical       33      Private      7240      6       SUV        no       20134        2         Yes        3         1     Highly Urban/ Urban      0.51             1        $2,617.57  

 9092       1       43       2       15    58025      No       211109      Yes      M         Bachelors         Clerical       16     Commercial   28840      6   Panel Truck    yes        0          0         No         0         8     Highly Urban/ Urban      0.42             1        $1,916.54  

 9094       1       60       2       17    52002      Yes      242854      No       M          Masters        Professional     5      Commercial   28140      4   Panel Truck    no         0          0         No         0        12     Highly Urban/ Urban      0.48             1        $3,237.69  

 9115       0       52       0       11    41408      No       199056      No       F         Bachelors         Clerical       32      Private      5640      4       SUV        no         0          0         No         0        10     Highly Rural/ Rural      0.05             0         $-88.72   

 9117       0       44       0       11    38988      No       152614      No       F   Less Than High School  Home Maker      11      Private      5700      6       SUV        no        525         1         No         1         1     Highly Urban/ Urban      0.26             0        $1,619.50  

 9118       1       41       3       13     257       Yes        0         No       F   Less Than High School  Home Maker      14      Private      5630      4       SUV        no        7902        1         No         5         1     Highly Rural/ Rural       0.2             0        $2,242.67  

 9120       0       41       2       14    146370     No       381878      Yes      M        High School        Manager        34      Private     20420      7     Minivan      yes        0          0         No         0         1     Highly Urban/ Urban      0.05             0         $-449.65  

 9124       0       56       0       12    17546      No         0         No       F         Bachelors        Home Maker      20      Private     27740      4     Pickup       no         0          0         No         0         7     Highly Rural/ Rural      0.04             0         $-727.52  

 9128       2       42       3       12    62386      No       202871      Yes      M         Bachelors       Professional     19      Private     11940      4     Minivan      yes      39058        2         No         6         9     Highly Urban/ Urban      0.44             1        $2,292.26  

 9135       1       42       2       12    38504      No       172963      Yes      M        High School      Blue Collar      34     Commercial   21600      1     Minivan      no         0          0         No         1         5     Highly Urban/ Urban      0.46             1        $2,379.64  

 9136       0       26       0        9    24722      No         0         No       F   Less Than High School   Clerical       31      Private      7900      4       SUV        no        1320        2         No        10         4     Highly Urban/ Urban      0.73             1        $4,020.32  

 9138       0       22       2        0      0        No         0         Yes      F            PhD           Home Maker      47      Private     13000      6       SUV        yes       7191        1         No         0        11     Highly Urban/ Urban      0.32             1        $2,029.18  

 9157       0       50       0        0      0        No       56441       No       F        High School       Home Maker      16      Private     12460      4       SUV        no         0          0         No         2         1     Highly Urban/ Urban      0.58             1        $2,391.61  

 9176       0       50       0       12    134293     No       351880      Yes      M          Masters           Lawyer        43      Private     15890      1     Minivan      no         0          0         No         0        23     Highly Urban/ Urban      0.08             0         $208.96   

 9183       0       45       1       11    73543      No       225263      Yes      M          Masters          Manager        46     Commercial   17860      6       Van        no         0          0         No         2        12     Highly Urban/ Urban      0.16             0        $1,491.02  

 9187       0       50       0       13    36504      No       209726      No       F   Less Than High School Blue Collar      35      Private     15550      6       SUV        no         0          0         Yes        0         3     Highly Urban/ Urban       0.5             1        $2,395.19  

 9188       0       53       0        0    11205      No       72115       Yes      F            PhD           Home Maker      19      Private      6800      4   Sports Car     no        7236        3         No         4        19     Highly Urban/ Urban      0.27             0        $2,269.92  

 9190       0       64       0        0      0        No         0         No       F        High School        Student        36      Private      8750      4   Sports Car     no         0          0         No         3         9     Highly Rural/ Rural      0.15             0        $1,128.56  

 9197       0       51       0       15    16750      No       142254      Yes      M   Less Than High School   Clerical       28      Private      8280      1     Pickup       yes        0          0         No         0         1     Highly Rural/ Rural      0.03             0          $6.00    

 9200       2       40       3       13    20681      No         0         Yes      F        High School        Student        5       Private      6710      6       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.05             0         $-390.89  

 9201       0       55       0       12    32227      No       134375      Yes      F          Masters           Lawyer        21      Private     10220      7       SUV        no        4285        2         No         3        14     Highly Urban/ Urban      0.19             0        $1,309.16  

 9203       0       51       0       13    27450      No       115618      Yes      M        High School        Clerical       40      Private      9340      1     Minivan      yes        0          0         No         1         1     Highly Rural/ Rural      0.03             0         $-214.28  

 9212       0       40       0      11.06  71502      No       213441      Yes      F         Bachelors       Blue Collar      20     Commercial    5500      7       SUV        no         0          0         Yes        0        10     Highly Urban/ Urban      0.44             1        $1,794.20  

 9213       0       49       0       10    88937      No       276837      Yes      M          Masters        Professional     56      Private     15290      1     Minivan      yes        0          0         No         0        18     Highly Urban/ Urban       0.1             0         $902.44   

 9214       0       44       1       14    81369      No       226959      Yes      F   Less Than High School Blue Collar      52      Private     13760      4       SUV        no       28499        2         Yes        5         1     Highly Rural/ Rural      0.07             0        $1,372.80  

 9217       0       34       1       11    82251      No       215483      Yes      F          Masters           Lawyer        46      Private     10500      6       SUV        no         0          0         Yes        0       14.65   Highly Urban/ Urban      0.19             0        $1,182.87  

 9219       0       33       1       10    118861     No       270664      Yes      F         Bachelors       Professional     37      Private     16690      4     Minivan      no         0          0         No         0         7     Highly Rural/ Rural      0.01             0        $-1,460.28 

 9220       0       47       0        0    36336      No         0         Yes      F            PhD             Doctor        42      Private     13860      6       SUV        no        4451        2         No         0        13     Highly Urban/ Urban      0.08             0         $530.05   

 9221       0       61       0       11    44470      No       215628      Yes      F         Bachelors       Professional     53      Private     12850      7     Minivan      no         0          0         No         6        11     Highly Urban/ Urban      0.26             0        $1,321.91  

 9237       0       46       0        8    73872      No       245878      Yes      F          Masters           Lawyer        43      Private     17550     10       SUV        no         0          0         No         3        16     Highly Rural/ Rural      0.02             0         $-653.21  

 9240       0       54       0       15    43821      No         0         No       F          Masters           Lawyer        6       Private     11770      1     Minivan      no         0          0         No         2        15     Highly Urban/ Urban      0.27             0         $786.41   

 9241       0       52       0       13    41137      No       188289      Yes      M          Masters        Professional     49      Private     14080      6     Minivan      yes        0          0         No         0        15     Highly Rural/ Rural      0.01             0         $-858.94  

 9248       0       29       3       10    30254      No       118302      Yes      F        High School      Blue Collar      30     Commercial   18020      4     Minivan      no         0          0         No         0         1     Highly Urban/ Urban      0.33             1        $1,540.45  

 9253       0       36       0        9    73430      No       235484      No       M        High School      Blue Collar      10     Commercial   12440      4     Minivan      no       33999        1         Yes        2         1     Highly Urban/ Urban      0.69             1        $2,821.51  

 9259       1       42       1       15    37586      No       120221      Yes      M   Less Than High School   Clerical       7      Commercial   23390      1   Panel Truck    yes       4101        4         No         3         1     Highly Urban/ Urban      0.57             1        $3,464.84  

 9267       0       54       0       13    73985      No       242788      Yes      M          Masters          Manager        20     Commercial   33190      6   Panel Truck    no         0          0         No         2        18     Highly Urban/ Urban      0.16             0         $890.64   

 9271       0       57       0       14    40122      No       171054      No       F            PhD             Lawyer        37      Private     11210     10   Sports Car     no        9171        1         No         7        15     Highly Urban/ Urban      0.45             1        $3,029.61  

 9273       0       45       0       13    16736      No       102335      Yes      F   Less Than High School   Clerical       44      Private      7670     11   Sports Car     no         0          0         No         0         9     Highly Urban/ Urban      0.24             0        $1,473.32  

 9285       0       48       0       11    110915     No       350621      Yes      M          Masters          Manager        36      Private     21290      4     Minivan      no         0          0         No         0        14     Highly Urban/ Urban      0.06             0         $-412.66  

 9290       0       49       0       10    138368     No       348250      No       M         Bachelors         Manager        37      Private     20240      4       Van        yes       2758        1         No         4         1     Highly Urban/ Urban      0.17             0        $1,536.24  

 9291       0       47       0        2    55527      No         0         No       F         Bachelors       Blue Collar      81     Commercial   23470      1     Pickup       no         0          0         No         1        11     Highly Rural/ Rural      0.09             0        $1,055.08  

 9293       0       57       0       14    154207     No       408267      Yes      F            PhD             Doctor        38      Private     36180      4   Sports Car     no         0          0         No         2         8     Highly Urban/ Urban      0.06             0         $836.39   

 9294       0       42       1       15    135276     No       332701      Yes      M            PhD             Doctor        25      Private     19230      1       Van        yes        0          0         No         0        13     Highly Urban/ Urban      0.05             0         $290.86   

 9301       0       50       0        7    26630      No       102987      No       M        High School        Manager        47      Private     17290      6     Minivan      no         0          0         No         0         6     Highly Urban/ Urban      0.17             0         $498.56   

 9302       0       63       0       13    157720     No       449806      Yes      F            PhD             Doctor        19      Private     23570      6       SUV        no         0          0         No         3        17     Highly Urban/ Urban      0.07             0         $165.02   

 9312       0       61       0       14    120074     No         0         No       F            PhD             Doctor        17      Private      8030      6   Sports Car     no         0          0         No         0        18     Highly Rural/ Rural      0.01             0        $-1,165.59 

 9316       0       56       3        0      0        No         0         Yes      F        High School        Student        39     Commercial    7420      6       SUV        no        5442        2         No         9         8     Highly Rural/ Rural       0.3             1        $2,303.84  

 9319       0       32       3        9    72367      Yes        0         No       F          Masters           Lawyer        42      Private      1500      6   Sports Car     no       27582        4         No         3        16     Highly Urban/ Urban      0.27             0        $3,133.85  

 9328       0       54       0       12    104313     No       296150      Yes      M            PhD            Manager        22      Private     18680      1       Van        no         0          0         No         1        14     Highly Urban/ Urban      0.07             0         $626.03   

 9331       1       41       3        0      0        No       65293       Yes      F        High School       Home Maker      42      Private      1500      7   Sports Car     no       19425        1         Yes        1         1     Highly Urban/ Urban      0.65             1        $2,978.17  

 9338       0       53       0        0      0        No       134371      Yes      M          Masters         Home Maker      49      Private     11450      4     Pickup       yes        0          0         No         4        16     Highly Rural/ Rural      0.08             0         $553.66   

 9350       0       47       0       13    47213      No         0         No       F          Masters           Lawyer        40      Private     27260      5       Van        no        1957        3         No         1        16     Highly Urban/ Urban      0.24             0        $1,812.01  

 9356       0       52       0        8    44432      No       149078      No       M          Masters           Lawyer        22      Private     18100      6       Van        yes        0          0         No         0        13     Highly Urban/ Urban      0.22             0        $1,395.03  

 9359       0       50       0       11    17671      No       130075      Yes      F   Less Than High School   Clerical       81      Private      8840      1       SUV        no        5787        1         No         1         1     Highly Urban/ Urban      0.27             0        $2,501.89  

 9362       0       52       0       10    146020     No       372705      No       M            PhD            Manager        40     Commercial   21300      1       Van        yes       6730        2         No         3        13     Highly Urban/ Urban      0.27             0        $2,787.32  

 9364       0       53       0        9    103645     No       327281      Yes      M            PhD            Manager        30     Commercial   17160      6       Van        yes        0          0         No         1        13     Highly Urban/ Urban      0.13             0        $1,349.32  

 9370       0       41       0       13    72146      No       206294      Yes      F        High School      Blue Collar      38     Commercial   17900      6     Pickup       no        3736        2         No         0         6     Highly Urban/ Urban      0.27             0        $1,834.04  

 9380       2       42       2       15    161203     No       401918      Yes      M            PhD            Manager        36      Private      5700     10     Pickup       no         0          0         No         0       13.01   Highly Urban/ Urban      0.11             0         $659.52   

 9386       0       44       3       19    71292      No       245771      Yes      F   Less Than High School Blue Collar      14      Private     23570      5       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.15             0        $1,061.56  

 9394       0       47       0       10    59936      No       183741      No       F        High School        Manager        6       Private     12190      1   Sports Car     no        6856        3         No         3         9     Highly Urban/ Urban       0.2             0        $1,453.07  

 9407       0       49       0        9    45325      No       177957      Yes      M        High School      Blue Collar      43     Commercial    8670     10     Pickup       yes        0          0         No         2       4.85    Highly Urban/ Urban      0.37             1        $2,180.26  

 9411       0       47       0        0      0        No         0         No       F            PhD           Home Maker      28     Commercial   18040      6   Sports Car     no         0          0         No         6        10     Highly Urban/ Urban      0.84             1        $4,450.98  

 9422       0       42       0       10    55341      No         0         No       M         Bachelors         Clerical       63      Private     20200      1       Van        no         0          0         No         1        10     Highly Urban/ Urban      0.36             1        $2,324.99  

 9423       0       46       0       10    70307      No       226429      Yes      F         Bachelors       Blue Collar      36     Commercial    8870      4   Sports Car     no         0          0         No         0        10     Highly Urban/ Urban      0.27             0        $1,962.84  

 9429       1       42       3       12    35933      No       148959      Yes      F   Less Than High School   Clerical       5       Private      7240      1       SUV        no         0          0         No         0         5     Highly Urban/ Urban      0.29             1        $1,495.07  

 9433       0       40       0        9    28747      No       149708      No       M          Masters           Lawyer        55      Private     10520      3     Minivan      no         0          0         No         1        12     Highly Urban/ Urban      0.27             0        $1,572.87  

 9439       0       51       0       16    77035      No       165641      Yes      M         Bachelors       Professional     7       Private     34180      6     Minivan      no         0          0         No         2        14     Highly Urban/ Urban      0.14             0         $143.58   

 9451       0       55       0       10    20046      No       154672      Yes      F          Masters          Manager        57      Private      5300      3       SUV        no         0          0         No         2        20     Highly Urban/ Urban      0.12             0         $718.87   

 9452       0       53       1       10    37172      Yes      195043      No       F        High School      Blue Collar      5      Commercial   10520     10       SUV        no         0          0         No         1         1     Highly Urban/ Urban      0.53             1        $2,876.27  

 9453       0       41       0        6    30676      No       150713      Yes      F        High School        Clerical       26      Private      5600      6     Minivan      no         0          0         No         1         9     Highly Rural/ Rural      0.03             0        $-1,099.55 

 9460       0       47       0        7    54157      No       234317      No       M         Bachelors         Clerical       37      Private      4210      6     Minivan      yes        0          0         No         0         7     Highly Rural/ Rural      0.05             0         $-510.37  

 9465       0       54       0       13    25929      No       187573      Yes      M   Less Than High School   Clerical       5      Commercial    9490      6     Pickup       no         0          0         No         2         7     Highly Rural/ Rural      0.08             0         $309.12   

 9470       0       46       0       10    10720      No         0         No       F        High School        Student        16      Private      8510      1       SUV        no         0          0         No         0        11     Highly Rural/ Rural      0.04             0         $-264.38  

 9476       0       63       0       12    42862      No         0         No       F        High School      Professional     17      Private      7800     11   Sports Car     no         0          0         Yes        0         1     Highly Urban/ Urban      0.39             1        $2,115.31  

 9485       0       23       3       13    16193      Yes        0         No       M        High School        Clerical       36      Private      7290      7     Minivan      yes        0          0         Yes        3         1     Highly Urban/ Urban      0.69             1        $3,220.73  

 9486       0       38       0       13    146981     No       384011      Yes      F         Bachelors       Professional     46      Private     21900      7     Pickup       no         0          0         No         0         6     Highly Urban/ Urban      0.08             0         $508.92   

 9488       0       44       0       11    42275      No       190963      Yes      M        High School      Blue Collar      34     Commercial   11330      6     Pickup       yes        0          0         No         0         1     Highly Urban/ Urban      0.31             1        $2,051.05  

 9507       0       47       0       13    113356     No       380945      Yes      F          Masters          Manager        9      Commercial   16580      6     Pickup       no         0          0         No         0        16     Highly Rural/ Rural      0.01             0        $-1,695.73 

 9508       0       29       1       12    95884      Yes        0         No       F         Bachelors       Blue Collar      16     Commercial   31520      4     Minivan      no        4394        1         No         5        11     Highly Urban/ Urban       0.6             1        $2,892.91  

 9517       0       43       0       14    54067      No       168626      Yes      M   Less Than High School Blue Collar      5      Commercial    6910      6     Pickup       yes       7076        4         No         0         1     Highly Urban/ Urban      0.29             1        $2,062.34  

 9521       0       54       0       14    97664      No       293118      Yes      F         Bachelors       Blue Collar      27     Commercial   33200      7       SUV        no         0          0         No         1         7     Highly Urban/ Urban      0.28             0        $1,649.69  

 9528       0       66       0        8    47667      No       179034      Yes      F         Bachelors       Professional     11      Private     14500      3   Sports Car     no         0          0         No         2        12     Highly Urban/ Urban      0.16             0        $1,189.97  

 9532       0       39       0       11    80021      No       264048      No       M         Bachelors       Blue Collar      41     Commercial    9500     10     Pickup       yes       7014        3         No         3        13     Highly Urban/ Urban      0.54             1        $2,745.53  

 9536       0       45       0       12    103249     No       175645      No       M          Masters        Professional     6      Commercial   31920      1   Panel Truck    yes        0          0         No         0        13     Highly Urban/ Urban      0.32             1        $2,238.00  

 9540       0       62       0      3.71     0        No         0         Yes      F   Less Than High School   Student        39      Private     28120      1   Sports Car     no        3804        2         No         3         6     Highly Rural/ Rural      0.08             0        $1,098.78  

 9542       0       60       0       13    22796      No       140908      Yes      M          Masters           Lawyer        52      Private      9780     13     Minivan      yes       9818        3         No         3        17     Highly Urban/ Urban       0.2             0        $1,023.49  

 9546       0       43       0       12    89575      No       233553      Yes      M          Masters          Manager        32     Commercial   16930      1       Van        yes        0          0         No         3        12     Highly Urban/ Urban      0.17             0        $1,714.67  

 9548       0       43       1       16    59379      No       188278      Yes      F         Bachelors         Clerical       38      Private     17110      1   Sports Car     no         0          0         No         0         1     Highly Urban/ Urban      0.18             0        $1,637.22  

 9549       1       42       3        7    40036      No       190348      Yes      M        High School      Blue Collar      55     Commercial    9700      1     Pickup       no         0          0         No         0         7     Highly Rural/ Rural      0.07             0        $1,046.25  

 9554       0       51       0       11    61046      No       217699      Yes      F         Bachelors         Manager        12     Commercial   23520      9     Pickup       no         0          0         No         4         8     Highly Urban/ Urban      0.22             0         $559.12   

 9555       0       38       0       14    37999      No       171351      Yes      M        High School        Clerical       43     Commercial    6120     11     Pickup       yes      37481        2         No         4         1     Highly Urban/ Urban      0.49             1        $2,882.89  

 9558       0       33       3       13    86861      Yes      253088      No       M          Masters          Manager        5       Private     26030     17     Minivan      no         0          0         No         0         8     Highly Urban/ Urban      0.12             0         $-76.63   

 9573       0       47       0       14    40777      No       170485      Yes      F        High School      Blue Collar      36     Commercial   10280      6       SUV        no       20372        3         Yes        3         1     Highly Urban/ Urban       0.6             1        $3,406.13  

 9575       1       43       2        9    39720      Yes        0         No       M   Less Than High School Blue Collar      22      Private     13390      9     Minivan      no        892         4         No         4         1     Highly Urban/ Urban      0.57             1        $3,405.46  

 9584       2       42       2       12    110240     No       278571      Yes      M   Less Than High School Blue Collar      46     Commercial   16720      4       Van        no        4925        1         No         3         6     Highly Urban/ Urban      0.56             1        $3,664.06  

 9586       0       38       3      12.05  10653      Yes        0         No       F   Less Than High School   Clerical       16      Private     14270      4   Sports Car     no         0          0         No         3         1     Highly Rural/ Rural      0.11             0        $1,813.78  

 9588       1       42       1        9    42989      Yes      182292      No       F        High School      Blue Collar      12     Commercial   19970      1     Pickup       no         0          0         No         0         1     Highly Rural/ Rural      0.13             0        $1,672.38  

 9591       0       57       0       14    151637     No         0         No       M          Masters          Manager        21     Commercial   23690      4   Panel Truck    yes       1839        2         No         3        19     Highly Urban/ Urban      0.26             0        $1,817.05  

 9592       0       33       2       14    28403      No       101889      Yes      F   Less Than High School Blue Collar      53      Private     15420      1       SUV        no        1037        3         No        12         1     Highly Urban/ Urban       0.6             1        $4,239.13  

 9597       1       40       3       16    189555     No       452019      Yes      F            PhD            Manager        35     Commercial   22010      1     Pickup       no         0          0         Yes        1        16     Highly Urban/ Urban      0.28             0        $1,770.29  

 9600       0       46       0       10    47889      No       249798      Yes      F         Bachelors        Home Maker      49      Private      8200     10     Minivan      no        3916        1         No         0        14     Highly Urban/ Urban      0.12             0         $-199.69  

 9603       0       49       0       10    64884      No         0         No       F   Less Than High School Blue Collar      33      Private     12890      3       SUV        no        864         3         No         3         4     Highly Urban/ Urban      0.38             1        $2,792.48  

 9605       1       39       2       14    89362      No       243922      Yes      F         Bachelors       Blue Collar      5      Commercial   11620      1       SUV        no         0          0         No         5        10     Highly Urban/ Urban      0.54             1        $2,537.96  

 9614       1       39       1       14    55311      No       178545      Yes      F         Bachelors       Blue Collar      40     Commercial   11780      6   Sports Car     no        8156        2         No         5         8     Highly Urban/ Urban      0.58             1        $3,451.37  

 9616       2       40       3      11.76  22926      No         0         Yes      F        High School        Student        5       Private     16910      7     Minivan      no         0          0         No         0         1     Highly Rural/ Rural      0.04             0        $-1,121.35 

 9622       1       39       2       13    31924      Yes        0         No       M        High School        Clerical       50      Private     11300     11     Pickup       yes       3774        2         No         0         7     Highly Urban/ Urban      0.48             1        $2,921.63  

 9624       0       55       0       13    72391      No       254334      Yes      F         Bachelors       Professional     24      Private     13740      4     Pickup       no        9119        3         No         2        15     Highly Urban/ Urban      0.14             0         $958.72   

 9629       0       57       0       16     7280      No         0         Yes      M         Bachelors         Student        14     Commercial   36360      1     Minivan      yes      15724        2         Yes        6         9     Highly Urban/ Urban      0.72             1        $2,765.84  

 9633       0       55       0       13    133959     No       396631      Yes      F          Masters          Manager        31      Private     35750      1     Pickup       no         0          0         No         3        19     Highly Urban/ Urban      0.08             0         $123.69   

 9640       0       63       0       11    60719      No       187827      No       F         Bachelors       Blue Collar      52      Private     14900     12   Sports Car     no         0          0         No         3        12     Highly Urban/ Urban      0.39             1        $1,995.91  

 9644       0       29       1       12    22819      Yes      145084      No       F         Bachelors        Home Maker      12      Private      7160      1       SUV        no        4428        2         No         1        10     Highly Urban/ Urban      0.29             1        $2,173.26  

 9645       0       47       0        0      0        No         0         Yes      M        High School        Student        58      Private      6100      1     Pickup       no         0          0         No         2         1     Highly Urban/ Urban      0.41             1        $2,295.46  

 9646       0       51       0       12    120824     No         0         No       F            PhD             Doctor        30      Private     20650      1     Minivan      no         0          0         No         2        21     Highly Urban/ Urban      0.14             0         $261.77   

 9648       3       44       4        0      0        Yes        0         No       F        High School        Student        17      Private      1500      3   Sports Car     no        2602        3         No         8         9     Highly Urban/ Urban      0.94             1        $5,549.52  

 9649       0       54       0       16    204766     No       521764      Yes      M            PhD             Doctor        34      Private     15910      1     Minivan      no         0          0         No         2        15     Highly Urban/ Urban      0.06             0          $3.16    

 9660       0       58       0       10    129230     No       337720      Yes      M         Bachelors       Professional     21     Commercial   23510      1   Panel Truck    yes       9937        1         No         2         1     Highly Urban/ Urban      0.21             0        $2,295.22  

 9664       0       40       0       12     8585      No         0         No       M        High School        Student        34     Commercial   13540      7     Minivan      yes       4451        2         No         0         1     Highly Urban/ Urban       0.5             1        $2,288.04  

 9675       0       50       0        6    110311     No       293832      Yes      M          Masters           Lawyer        28      Private     13450      4     Minivan      no         0          0         No         2        15     Highly Urban/ Urban      0.12             0         $499.37   

 9679       0       28       4        7     3985      No         0         Yes      F   Less Than High School   Student        24      Private      4700      6       SUV        no       13538        3         Yes        7         3     Highly Urban/ Urban      0.61             1        $3,056.75  

 9680       0       51       0       12    30969      No       181779      Yes      M        High School        Clerical       40     Commercial   23650     10   Panel Truck    yes       4674        4         No         3         8     Highly Urban/ Urban      0.47             1        $2,882.89  

 9682       1       36       3        0      0        Yes        0         No       M         Bachelors         Student        8       Private      1500      4     Minivan      no         0          0         No         0        11     Highly Rural/ Rural      0.15             0         $299.03   

 9697       0       49       0        9    49610      No       221470      Yes      F         Bachelors       Professional     71      Private     13940      4       SUV        no         0          0         No         0        14     Highly Rural/ Rural      0.01             0         $-512.10  

 9701       0       55       0       12    154165     No       405227      Yes      M          Masters           Lawyer        47      Private     21280      1       Van        yes       615         1         No         5        17     Highly Urban/ Urban      0.15             0        $1,935.19  

 9704       0       32       3       19    22330      No       106556      Yes      F        High School        Clerical       37      Private      4700      1       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.23             0        $1,707.49  

 9705       0       60       0       11    83639      No       268714      No       F            PhD             Lawyer        40      Private     35530     10   Sports Car     no        3868        1         No         3        17     Highly Urban/ Urban      0.26             0        $2,198.23  

 9707       0       39       0       12    63190      No       212219      Yes      F          Masters          Manager        31      Private     13810      1       SUV        no       19618        4         Yes        1        16     Highly Urban/ Urban      0.15             0        $1,180.21  

 9714       0       35       1       12    117579     No       296271      Yes      F         Bachelors         Manager        18      Private     14080      7   Sports Car     no         0          0         No         0        11     Highly Urban/ Urban      0.05             0         $-399.27  

 9718       0       39       0       12    40177      No       120876      Yes      F          Masters        Professional     27      Private     18170      1       SUV        no         0          0         No         0         9     Highly Urban/ Urban      0.13             0        $1,405.46  

 9722       0       36       2      12.36  94958      No       321534      Yes      M         Bachelors       Professional     19     Commercial   12490      1     Minivan      yes        0          0         No         0         1     Highly Urban/ Urban      0.18             0        $1,416.00  

 9739       0       38       0       12    104288     No         0         No       M          Masters           Lawyer        47      Private     19450      4     Minivan      yes        0          0         No         1        18     Highly Urban/ Urban      0.19             0        $1,066.79  

 9747       0       36       3        0      0        No         0         Yes      F         Bachelors         Student        58     Commercial    5100      1       SUV        no         0          0         No         3        10     Highly Urban/ Urban      0.62             1        $2,920.63  

 9751       0       32       3        0      0        No         0         Yes      F   Less Than High School  Home Maker      55      Private      2530      1   Sports Car     no         0          0         No         2         1     Highly Rural/ Rural      0.06             0        $1,065.10  

 9757       0       53       0       10    81900      No       268602      Yes      F         Bachelors       Professional     18      Private     16200      6       SUV        no        8125        3         No         2        12     Highly Urban/ Urban      0.13             0        $1,141.96  

 9759       0       47       0       12    36150      No       174964      Yes      F   Less Than High School Blue Collar      16      Private      9810      4       SUV        no         0          0         No         0         7     Highly Rural/ Rural      0.02             0         $-583.06  

 9760       1       41       2       15    30984      No       121365      Yes      F        High School        Clerical       32      Private      9980      1   Sports Car     no         0          0         No         1         1     Highly Rural/ Rural      0.05             0         $732.17   

 9764       0       50       0       13    124092     No         0         No       F         Bachelors         Clerical       46      Private     14880      1     Minivan      no        1597        2         Yes        7        10     Highly Urban/ Urban      0.69             1        $2,853.94  

 9776       0       57       0       13    43482      No         0         No       F         Bachelors       Professional     61      Private     11550      9       SUV        no         0          0         No         5        14     Highly Urban/ Urban      0.39             1        $2,317.73  

 9778       0       54       0       13    53388      No       194362      Yes      F         Bachelors       Professional     32      Private     14630      4       SUV        no        4957        1         No         2        11     Highly Urban/ Urban      0.15             0        $1,313.97  

 9786       0       49       0       12    55087      No       230249      No       F        High School      Blue Collar      60     Commercial   11910     13       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.08             0         $912.57   

 9803       1       41       3       15     6232      No         0         Yes      F        High School        Student        40      Private     14370      1   Sports Car     no        6953        1         No         1         1     Highly Urban/ Urban      0.31             1        $2,357.79  

 9804       0       50       0       13    64489      No       180165      Yes      F         Bachelors       Professional     73      Private     12950      6   Sports Car     no         0          0         Yes        4        15     Highly Rural/ Rural      0.05             0         $707.23   

 9815       0       55       0       11    98129      No       232845      Yes      F         Bachelors         Manager        35      Private      9790      4       SUV        no         0          0         No         1         7     Highly Urban/ Urban      0.07             0          $28.39   

 9824       0       46       0        5    112226     No       317347      Yes      M         Bachelors       Professional     44     Commercial   30630      6   Panel Truck    yes        0          0         No         1       9.56    Highly Rural/ Rural      0.02             0         $169.28   

 9825       0       38       0       12    107333     No       291184      Yes      M         Bachelors       Blue Collar      5      Commercial   16030      1     Minivan      no        5344        3         No         4        12     Highly Urban/ Urban      0.37             1        $1,800.38  

 9826       0       58       0       12    73283      No       251025      Yes      M         Bachelors       Professional     37     Commercial   24130      6   Panel Truck    no        3862        3         No         3         1     Highly Urban/ Urban      0.28             1        $2,751.02  

 9827       1       36       2       13    57170      No       189135      Yes      F         Bachelors         Clerical       34      Private     13520      6       SUV        no         0          0         No         0        13     Highly Rural/ Rural      0.04             0         $-521.76  

 9833       0       47       0       14    35021      No       180400      Yes      M         Bachelors         Manager        26      Private      9700      4     Pickup       no         0          0         No         0         8     Highly Urban/ Urban      0.08             0         $-158.73  

 9835       0       49       0       10    82749      No       279333      Yes      F          Masters          Manager        44      Private     14670      6       SUV        no         0          0         No         0        21     Highly Urban/ Urban      0.06             0         $-138.67  

 9860       2       42       2       13    30129      No       111591      Yes      F        High School        Clerical       67      Private     18950      6       SUV        no         0          0         No         0        10     Highly Urban/ Urban      0.41             1        $2,211.33  

 9865       0       49       0       15    28567      No       163796      Yes      M        High School      Blue Collar      31     Commercial   23370      7   Panel Truck    no         0          0         No         0         1     Highly Urban/ Urban      0.33             1        $2,128.26  

 9871       0       57       0       11    73903      No       224303      No       M          Masters        Professional     44     Commercial   28760      6   Panel Truck    yes        0          0         No         0        12     Highly Urban/ Urban      0.34             1        $2,644.68  

 9874       0       49       0        8    38723      No       168698      No       M   Less Than High School   Clerical       14      Private     10270      4     Pickup       yes        0          0         No         3        11     Highly Urban/ Urban      0.46             1        $2,052.85  

 9880       0       55       0       14    35263      No       130757      Yes      F        High School      Blue Collar      27     Commercial   18880      7     Pickup       no         0          0         No         0         1     Highly Urban/ Urban      0.32             1        $1,699.55  

 9882       0       56       0        6    82964      No       302661      No       M          Masters        Professional     33     Commercial   39480      1   Panel Truck    yes       5715        2         No         4        18     Highly Urban/ Urban      0.48             1        $3,476.40  

 9885       1       40       2       14    21733      No         0         Yes      M        High School        Student        30     Commercial   14070      1     Minivan      yes        0          0         No         0         1     Highly Rural/ Rural      0.06             0         $302.67   

 9888       2       44       4       17    60707      No       228661      Yes      M        High School      Blue Collar      26     Commercial    6420      6     Minivan      yes       3494        2         No         5         1     Highly Urban/ Urban      0.68             1        $3,352.41  

 9892       0       53       0        9    180465     No       506109      Yes      F            PhD             Doctor        32      Private     30920      5       SUV        no         0          0         No         0       14.42   Highly Urban/ Urban      0.05             0         $-86.00   

 9893       0       40       0       10    99002      No         0         No       M         Bachelors       Blue Collar      19     Commercial   23520      1     Minivan      yes       4609        2         No         0         1     Highly Urban/ Urban      0.41             1        $2,212.67  

 9896       0       54       0      11.34  74330      No         0         No       M          Masters           Lawyer        51      Private     30440      1     Minivan      no         0          0         Yes        0        19     Highly Urban/ Urban      0.33             1        $1,549.56  

 9902       0       52       0       13    40709      No       181938      Yes      M          Masters          Manager        27      Private      1500      1     Minivan      no         0          0         No         0        13     Highly Urban/ Urban      0.08             0         $-169.33  

 9906       0       41       2        9    59936      Yes        0         No       F         Bachelors       Professional     69      Private      5600      9   Sports Car     no        7551        1         No         0       9.21    Highly Rural/ Rural      0.03             0         $938.39   

 9910       0       45       0       12    80358      No       232459      Yes      F        High School        Manager        25      Private      6000      1       SUV        no         0          0         Yes        2         1     Highly Urban/ Urban      0.16             0        $1,044.78  

 9914       0       59       0      7.82    1249      No       116783      Yes      F         Bachelors        Home Maker      28      Private      1500      1   Sports Car     no         0          0         No         1         1     Highly Urban/ Urban      0.25             0        $1,739.64  

 9918       0       55       0        9    17206      No       171616      Yes      F   Less Than High School   Clerical       27      Private      7000      6       SUV        no       25033        1         Yes        2       4.01    Highly Urban/ Urban      0.48             1        $2,284.40  

 9920       0       39       0       12    38924      No       185320      Yes      M        High School      Professional     16      Private      9290      7     Pickup       yes       1794        2         No         3       4.17    Highly Urban/ Urban      0.19             0        $1,594.88  

 9926       0       40       0       15    46393      No         0         No       F          Masters           Lawyer        27      Private     17340      1     Minivan      no         0          0         Yes        0        16     Highly Urban/ Urban      0.37             1        $1,207.71  

 9931       0       51       0       8.5   11070      No         0         Yes      M   Less Than High School   Student        34     Commercial    6300      6     Pickup       no         0          0         No         1         1     Highly Rural/ Rural      0.05             0         $449.15   

 9935       0       35       0        7    74194      No       210282      No       M        High School      Blue Collar      35     Commercial   25610      4   Panel Truck    yes        0          0         No         0         1     Highly Urban/ Urban      0.44             1        $2,764.80  

 9945       1       42       2       11    47880      Yes      208837      No       F   Less Than High School   Clerical       33      Private      6290      1       SUV        no        3224        2         Yes        2         1     Highly Urban/ Urban       0.7             1        $4,259.55  

 9953       0       34       0        3    48292      No       154000      No       F   Less Than High School Blue Collar      5       Private     25000      4       SUV        no        3685        3         No         0       4.77    Highly Urban/ Urban       0.3             1        $1,796.87  

 9957       0       43       0       14    24748      No       135512      Yes      M   Less Than High School   Clerical       44      Private     27000     10     Minivan      no         0          0         No         0         5     Highly Rural/ Rural      0.03             0         $-770.75  

 9963       0       45       0        5    110575     No       340631      Yes      M          Masters          Manager        36     Commercial   17060      9       Van        no         0          0         No         0        14     Highly Urban/ Urban      0.11             0         $769.50   

 9972       1       40       2       10    56335      No       204619      Yes      F         Bachelors         Clerical       37      Private     14270      1       SUV        no         0          0         No         0        10     Highly Urban/ Urban      0.27             0        $1,510.35  

 9976       0       36       3       13    61472      Yes      121295      No       M         Bachelors         Clerical       38     Commercial   29850      1   Panel Truck    no         0          0         No         0        10     Highly Urban/ Urban      0.49             1        $3,244.82  

 9979       2       36       3       12    49515      Yes      209725      No       M        High School      Blue Collar      47      Private     14490      9     Minivan      yes        0          0         No         0         7     Highly Urban/ Urban      0.52             1        $2,658.65  

 9980       0       31       2       11    66592      No       175461      Yes      M         Bachelors         Clerical       52      Private     19530      1       Van        no         0          0         No         0        12     Highly Rural/ Rural      0.02             0         $-305.40  

 9982       0       51       0        8    102244     No       307424      Yes      M          Masters          Manager        39     Commercial   24180      6   Panel Truck    yes        0          0         No         1        15     Highly Urban/ Urban      0.13             0         $976.18   

 9991       0       30       3        0      0        Yes        0         No       F        High School       Home Maker      30      Private     10160      5       SUV        no         0          0         No         6         1     Highly Urban/ Urban      0.71             1        $3,864.03  

 10000      0       37       0        0      0        No       105758      Yes      F        High School       Home Maker      19      Private     20060      1       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.32             1        $1,639.72  

 10003      0       43       0       10    75544      No         0         No       F         Bachelors         Clerical       59      Private     15550     11       SUV        no         0          0         No         0       8.87    Highly Urban/ Urban       0.3             1        $1,448.14  

 10005      2       42       2       11     4913      Yes        0         No       F        High School       Home Maker      47     Commercial    7130      1     Pickup       no         0          0         No         5         1     Highly Urban/ Urban      0.85             1        $4,974.11  

 10014      0       55       0       12    165632     No       413216      Yes      F            PhD             Lawyer        11      Private     20280     19       SUV        no         0          0         No         0        18     Highly Urban/ Urban      0.08             0         $-273.92  

 10032      0       37       0       12    53840      No       162697      Yes      M        High School      Professional     36      Private     10580      1     Minivan      no        2577        4         No         6         1     Highly Urban/ Urban      0.25             0        $2,545.20  

 10034      0       53       0       11    108763     No         0         No       F          Masters          Manager        37     Commercial   28290      1     Pickup       no         0          0         No         0        15     Highly Urban/ Urban      0.21             0        $1,264.43  

 10041      0       53       0      10.28  25931      No       183292      Yes      F            PhD           Home Maker      54      Private     22880      3     Pickup       no         0          0         No         0        15     Highly Rural/ Rural      0.02             0         $-521.37  

 10042      0       52       0       13    35093      No       184784      Yes      F        High School        Clerical       26      Private      7100      1       SUV        no         0          0         No         0        3.9    Highly Rural/ Rural      0.03             0         $-241.94  

 10044      0       40       2        0      0        No       96384       Yes      F        High School       Home Maker      58      Private      5500      7       SUV        no         0          0         No         0         1     Highly Rural/ Rural      0.05             0         $110.00   

 10045      0       31       1       11     6068      No       56199       Yes      F   Less Than High School  Home Maker      40      Private     10730      4       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.18             0        $1,465.46  

 10054      1       36       2        8    88236      Yes        0         No       F         Bachelors       Professional     20      Private     13920      1       SUV        no        4432        1         No         2        13     Highly Urban/ Urban      0.34             1        $2,776.26  

 10061      0       40       0        9    88956      No       262533      No       F         Bachelors         Manager        42      Private     30630      4     Minivan      no         0          0         Yes        0        11     Highly Urban/ Urban      0.22             0         $209.67   

 10062      0       47       0       11    65136      No       218705      Yes      F         Bachelors       Blue Collar      59     Commercial   12710      1       SUV        no        5468        2         No         3        15     Highly Urban/ Urban      0.38             1        $2,677.15  

 10073      0       50       0       11    105198     No       310110      Yes      M          Masters          Manager        60      Private      8860      6     Pickup       yes       7792        3         No         3        17     Highly Urban/ Urban      0.09             0         $847.45   

 10081      0       41       0       10    98154      No       314175      No       F        High School      Professional     35      Private     11320      4       SUV        no         0          0         No         1         4     Highly Rural/ Rural      0.03             0         $265.45   

 10084      0       60       0       12    47451      No         0         No       F          Masters           Lawyer        37      Private     11600      4       SUV        no        977         1         No         5        18     Highly Urban/ Urban      0.37             1        $2,317.05  

 10086      0       60       0       11    186590     No       501867      No       M            PhD            Manager        31     Commercial   26160      4   Panel Truck    yes        0          0         No         0        10     Highly Urban/ Urban      0.17             0        $1,717.10  

 10093      0       46       0        1     6554      No         0         No       M        High School        Student        25      Private      9120      1     Pickup       yes      27883        2         No         0         7     Highly Urban/ Urban      0.33             1        $1,860.92  

 10101      0       37       0        4    32542      No       109803      Yes      F        High School        Clerical       37      Private     11490      1       SUV        no       43599        2         Yes        7        10     Highly Urban/ Urban      0.62             1        $3,250.00  

 10105      0       54       0       14    57361      No       227490      Yes      F        High School        Manager        57     Commercial   30240      4       Van        no         0          0         No         4         1     Highly Urban/ Urban      0.22             0        $1,957.69  

 10110      0       61       0       14    24546      No         0         No       F        High School      Professional     39      Private     11100      9       SUV        no        5890        2         No         0         8     Highly Urban/ Urban      0.26             0        $1,907.81  

 10113      1       42       1       11    53357      No       209447      Yes      M        High School      Professional     18     Commercial   26810      1   Panel Truck    no        6517        1         No         8         1     Highly Urban/ Urban       0.6             1        $4,002.53  

 10115      0       40       1        0      0        No       104638      Yes      F         Bachelors        Home Maker      58      Private      7180      1       SUV        no        1035        3         No         4        12     Highly Urban/ Urban      0.46             1        $2,587.38  

 10119      0       47       0       10    52456      No       234158      Yes      M         Bachelors       Blue Collar      63     Commercial    9830      1     Pickup       no        4215        3         No         3       9.28    Highly Urban/ Urban      0.39             1        $2,954.52  

 10121      0       37       0      0.73     0        No       76867       Yes      F   Less Than High School  Home Maker      33      Private      5200      6       SUV        no        4327        3         No         0        4.8    Highly Urban/ Urban      0.32             1        $1,900.56  

 10124      0       38       0      9.91   20148      No         0         No       F         Bachelors       Professional     50      Private      5300      7   Sports Car     no       14850        3         Yes       10         2     Highly Urban/ Urban      0.78             1        $4,621.12  

 10126      0       28       1       12    12841      No       85755       Yes      F         Bachelors        Home Maker      52      Private     24690      6     Minivan      no        3031        2         No         5        10     Highly Urban/ Urban      0.29             1        $1,273.17  

 10127      0       56       0        6    103503     No       235845      No       M          Masters        Professional     31     Commercial   40950      4   Panel Truck    yes        0          0         No         0        15     Highly Rural/ Rural      0.04             0         $777.91   

 10145      0       27       4        9    34276      No       99323       Yes      F         Bachelors         Clerical       36      Private     11770      9       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.21             0        $1,066.98  

 10147      0       33       2       13    28329      Yes        0         No       F        High School      Blue Collar      32      Private      8010      1   Sports Car     no         0          0         No         0        11     Highly Urban/ Urban      0.34             1        $2,780.19  

 10148      0       57       0       14    62343      No       216524      Yes      F         Bachelors       Professional     38      Private     27120      3     Pickup       no         0          0         No         0        11     Highly Rural/ Rural      0.01             0        $-1,026.61 

 10162      0       38       0        8    62177      No       178852      Yes      M        High School      Blue Collar      34      Private      4110      1     Minivan      no         0          0         Yes        0         8     Highly Urban/ Urban      0.29             1        $1,276.43  

 10163      0       53       0      9.41   14034      No         0         Yes      M   Less Than High School   Student        16     Commercial   21870     13       Van        yes        0          0         No         1         1     Highly Rural/ Rural      0.05             0          $72.58   

 10166      0       35       2       10    13365      Yes        0         No       F         Bachelors         Student        38     Commercial    5690      4       SUV        no        4792        1         No         6         9     Highly Urban/ Urban      0.69             1        $3,999.54  

 10172      0       49       0       16    25371      No       143256      Yes      M        High School      Blue Collar      10      Private      9030     11     Minivan      yes        0          0         No         1        11     Highly Urban/ Urban      0.22             0         $237.70   

 10173      0       40       2       13    31080      No       127150      Yes      M        High School      Professional     37      Private      9980      7     Pickup       yes       7104        4         No         5         1     Highly Urban/ Urban      0.25             0        $2,547.77  

 10175      0       57       0        5    123051     No       377108      Yes      F   Less Than High School Blue Collar      32      Private      7200      1       SUV        no         0          0         No         1         1     Highly Rural/ Rural      0.02             0         $-102.90  

 10180      1       37       2        0      0        No       96897       Yes      F         Bachelors        Home Maker      48      Private      1500      1   Sports Car     no         0          0         No         0        12     Highly Rural/ Rural      0.07             0         $448.88   

 10186      0       52       0       11    84147      No       236742      Yes      F          Masters          Manager        19      Private     23410      7     Pickup       no         0          0         No         0        17     Highly Urban/ Urban      0.06             0         $-687.36  

 10192      0       44       3       11    38290      Yes      148303      No       F        High School      Blue Collar      5       Private      9470      6       SUV        no       30328        2         No         4         1     Highly Urban/ Urban      0.46             1        $2,959.91  

 10199      0       34       3       12    18247      Yes        0         No       F   Less Than High School   Clerical       38      Private     15480     13     Minivan      no        3846        1         No         0         1     Highly Urban/ Urban       0.4             1        $1,952.55  

 10209      1       45       2       15    59763      Yes      193504      No       M         Bachelors       Professional     84     Commercial    6000      1     Pickup       yes      12751        3         Yes        2         8     Highly Urban/ Urban      0.72             1        $5,027.05  

 10210      0       53       0       14    59375      No       244565      Yes      F         Bachelors         Clerical       35      Private     12140      4       SUV        no         0          0         No         3        12     Highly Urban/ Urban      0.26             0        $1,415.56  

 10214      0       39       2       13    88189      No       253315      Yes      F         Bachelors       Professional     52      Private     20960      9     Minivan      no       35324        1         No         0         9     Highly Urban/ Urban       0.1             0         $236.12   

 10215      0       37       0       11    51103      No       2e+05       Yes      M        High School      Blue Collar      15     Commercial   17080     13     Minivan      no        3519        1         No         6         1     Highly Urban/ Urban      0.51             1        $2,193.85  

 10216      0       35       2       12    60755      Yes        0         No       F   Less Than High School Blue Collar      44      Private     11080     11       SUV        no        5208        3         No         7         1     Highly Urban/ Urban      0.54             1        $3,946.08  

 10232      0       53       0       13    75777      No       277382      Yes      M         Bachelors       Blue Collar      56     Commercial   14380     10     Minivan      no        5071        1         No         7        10     Highly Urban/ Urban      0.51             1        $2,484.50  

 10239      0       50       0        8    34273      No         0         No       F   Less Than High School   Clerical       52      Private     11770      9     Minivan      no         0          0         No         2         6     Highly Urban/ Urban      0.43             1        $1,649.06  

 10249      0       62       0       14    156031     No       439165      Yes      F            PhD             Doctor        15      Private     28360      6   Sports Car     no         0          0         No         0       13.79   Highly Urban/ Urban      0.05             0         $-65.90   

 10253      0       36       0       11    88167      No       285652      Yes      M         Bachelors       Blue Collar      18     Commercial    1500      1     Minivan      no        3547        2         No         5         9     Highly Urban/ Urban      0.42             1        $2,250.62  

 10255      0       47       0       15    55841      No       211559      Yes      F         Bachelors       Professional     39     Commercial   45410      6   Panel Truck    no         0          0         No         0         6     Highly Urban/ Urban      0.21             0        $1,601.71  

 10262      0       56       2       18    112420     No       314882      Yes      F         Bachelors       Professional     35      Private     45420      6       Van        no         0          0         No         0         7     Highly Urban/ Urban      0.09             0         $699.26   

 10264      0       49       0       12    24840      No       158850      Yes      F        High School       Home Maker      24      Private      5820      1       SUV        no         0          0         No         1         8     Highly Rural/ Rural      0.02             0         $-540.55  

 10266      0       45       0       12    37564      No         0         No       M            PhD            Manager        30      Private     16770      1       Van        yes        0          0         No         0        20     Highly Urban/ Urban      0.15             0        $1,175.80  

 10268      0       55       0        8    110140     No       318086      Yes      M         Bachelors       Professional     57     Commercial   30870      1   Panel Truck    no         0          0         No         2        15     Highly Urban/ Urban      0.22             0        $2,229.25  

 10271      2       41       3       12     9991      Yes        0         No       F        High School        Student        27     Commercial   18460     12       SUV        no         0          0         No         0         9     Highly Rural/ Rural       0.2             0        $1,656.20  

 10272      0       47       0       15    31045      No       138614      Yes      F         Bachelors         Clerical       23      Private      9300      6       SUV        no       44376        1         Yes        0       7.92    Highly Urban/ Urban      0.37             1        $1,417.33  

 10276      0       43       0        7    119579     No       331156      No       F         Bachelors       Blue Collar      27     Commercial   17760      4       SUV        no       10137        1         No         5        12     Highly Urban/ Urban      0.58             1        $3,006.44  

 10277      0       41       0        9    126829     No       334777      Yes      M          Masters          Manager        9       Private     18280      4     Minivan      yes        0          0         No         2        20     Highly Urban/ Urban      0.07             0         $-661.83  

 10279      0       46       0        0      0        No         0         Yes      F        High School        Student        32     Commercial    1500      6   Sports Car     no       20519        1         Yes        3         8     Highly Rural/ Rural      0.26             0        $1,784.60  

 10281      0       46       0       12    43501      No       134977      Yes      M        High School      Professional     60      Private     16080      3     Minivan      no         0          0         No         2         1     Highly Rural/ Rural      0.02             0         $-69.93   

 10285      0       55       0       10    141083     No       393624      Yes      F          Masters           Lawyer        42      Private     21110     10   Sports Car     no         0          0         No         0        22     Highly Rural/ Rural      0.01             0        $-1,213.63 

 10294      0       51       0       10    128523     No         0         No       M          Masters          Manager        18     Commercial   32960      6   Panel Truck    no        3995        3         No         1        15     Highly Urban/ Urban      0.22             0        $1,587.84  

 10300      0       48       0       15    39837      No       170611      Yes      F   Less Than High School Blue Collar      12      Private     13820      7       SUV        no         0          0         No         0         1     Highly Urban/ Urban      0.18             0        $1,026.98  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

\elandscape
\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 0}
\newpage
\normalsize

# Appendix A

## Session Info

\begin{itemize}\raggedright
  \item R version 3.3.2 (2016-10-31), \verb|x86_64-w64-mingw32|
  \item Locale: \verb|LC_COLLATE=English_United States.1252|, \verb|LC_CTYPE=English_United States.1252|, \verb|LC_MONETARY=English_United States.1252|, \verb|LC_NUMERIC=C|, \verb|LC_TIME=English_United States.1252|
  \item Base packages: base, datasets, graphics, grDevices,
    methods, parallel, stats, utils
  \item Other packages: abc~2.1, abc.data~1.0, bibtex~0.4.0,
    boot~1.3-18, car~2.1-3, corrplot~0.77, data.table~1.9.6,
    doParallel~1.0.10, dplyr~0.5.0, e1071~1.6-7, foreach~1.4.3,
    forecast~7.3, Formula~1.2-1, ggplot2~2.1.0, glmulti~1.0.7,
    highlight~0.4.7, Hmisc~4.0-0, iterators~1.0.8,
    itertools~0.1-3, knitcitations~1.0.7, knitr~1.15,
    lattice~0.20-34, leaps~2.9, locfit~1.5-9.1, magrittr~1.5,
    MASS~7.3-45, matrixStats~0.51.0, missForest~1.4, nnet~7.3-12,
    pacman~0.4.1, pracma~1.9.5, purrr~0.2.2, quantreg~5.29,
    randomForest~4.6-12, readr~1.0.0, rJava~0.9-8, scales~0.4.1,
    SparseM~1.74, stargazer~5.2, stringr~1.1.0, survival~2.40-1,
    tibble~1.2, tidyr~0.6.0, tidyverse~1.0.0, timeDate~3012.100,
    xlsx~0.5.7, xlsxjars~0.6.1, xtable~1.8-2, zoo~1.7-13
  \item Loaded via a namespace (and not attached): acepack~1.4.1,
    assertthat~0.1, bitops~1.0-6, chron~2.3-47, class~7.3-14,
    cluster~2.0.5, codetools~0.2-15, colorspace~1.3-0, DBI~0.5-1,
    digest~0.6.10, evaluate~0.10, foreign~0.8-67, fracdiff~1.4-2,
    grid~3.3.2, gridExtra~2.2.1, gtable~0.2.0, highr~0.6,
    htmlTable~1.7, htmltools~0.3.5, httr~1.2.1,
    latticeExtra~0.6-28, lazyeval~0.2.0, lme4~1.1-12,
    lubridate~1.6.0, Matrix~1.2-7.1, MatrixModels~0.4-1,
    mgcv~1.8-16, minqa~1.2.4, munsell~0.4.3, nlme~3.1-128,
    nloptr~1.0.4, pbkrtest~0.4-6, plyr~1.8.4, quadprog~1.5-5,
    R6~2.2.0, RColorBrewer~1.1-2, Rcpp~0.12.7, RCurl~1.95-4.8,
    RefManageR~0.13.0, RJSONIO~1.3-0, rmarkdown~1.1, rpart~4.1-10,
    splines~3.3.2, stringi~1.1.2, tools~3.3.2, tseries~0.10-35,
    XML~3.98-1.5, yaml~2.1.13
\end{itemize}

## Data Dictionary

\footnotesize

 Variable Code   Definition                               
---------------  -----------------------------------------
     INDEX       Identification Variable (do not use)     
  TARGET_FLAG    Was Car in a crash? 1=YES 0=NO           
  TARGET_AMT     If car was in a crash, what was the cost 
      AGE        Age of Driver                            
   BLUEBOOK      Value of Vehicle                         
    CAR_AGE      Vehicle Age                              
   CAR_TYPE      Type of Car                              
    CAR_USE      Vehicle Use                              
   CLM_FREQ      # Claims (Past 5 Years)                  
   EDUCATION     Max Education Level                      
   HOMEKIDS      # Children at Home                       
   HOME_VAL      Home Value                               
    INCOME       Income                                   
   KIDSDRIV      # Driving Children                       
    MSTATUS      Marital Status                           
    MVR_PTS      Motor Vehicle Record Points              
   OLDCLAIM      Total Claims (Past 5 Years)              
    PARENT1      Single Parent                            
    RED_CAR      A Red Car                                
    REVOKED      License Revoked (Past 7 Years)           
      SEX        Gender                                   
      TIF        Time in Force                            
   TRAVTIME      Distance to Work                         
  URBANICITY     Home/Work Area                           
      YOJ        Years on Job                             
\normalsize

## R source code

Please see [Homework 4.rmd](https://github.com/ChristopheHunt/DATA-621-Group-1/blob/master/Homework%204/Homework%204.Rmd) on GitHub for source code.   

https://github.com/ChristopheHunt/DATA-621-Group-1/blob/master/Homework%204/Homework%204.Rmd

