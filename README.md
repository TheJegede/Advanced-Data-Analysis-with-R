# Advanced Data Analysis with R

A comprehensive collection of advanced statistical analysis projects and techniques implemented in R, covering regression analysis, missing data techniques, longitudinal data modeling, power analysis, and exploratory data analysis.

## 📋 Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Projects and Analyses](#projects-and-analyses)
- [R Scripts](#r-scripts)
- [Reports and Documentation](#reports-and-documentation)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Key Topics Covered](#key-topics-covered)

## 🔍 Overview

This repository contains a collection of advanced data analysis projects completed using R programming language. The projects demonstrate proficiency in various statistical modeling techniques, data preprocessing, visualization, and interpretation of complex datasets.

## 📁 Repository Structure

```
Advanced-Data-Analysis-with-R/
├── Root Directory/
│   ├── R Scripts (*.R files)
│   ├── Reports (*.pdf, *. docx files)
│   └── Data files (*.csv files)
└── Exploring the concept of regression/
    ├── R Scripts
    ├── Reports
    └── Visualization outputs (*.png files)
```

## 🔬 Projects and Analyses

### 1. **Linear Regression Analysis**
- **R Script:** `Linear Regression.R`
- **Report:** `Linear Regression and EDA.pdf`
- **Description:** Implementation of linear regression models using the FoodExpenditure dataset
- **Key Features:**
  - Model fitting with multiple predictors (income, persons)
  - Assumption testing (linearity, homoscedasticity, normality)
  - Beta regression modeling with logit link
  - Diagnostic plots and statistical tests (ncvTest, Shapiro-Wilk, Anderson-Darling)

### 2. **Missing Data Analysis**
- **R Scripts:** 
  - `Missing Data Analysis.R`
  - `Missing Data Techniques.R`
- **Reports:** 
  - `Missing Data Analysis.pdf`
  - `Missing Data Technique Report.pdf`
- **Description:** Comprehensive analysis of missing data patterns and imputation techniques
- **Key Features:**
  - Missing data proportion calculation and visualization
  - Little's MCAR test and mcar_test implementation
  - Multiple imputation using MICE (Multivariate Imputation by Chained Equations)
  - Comparison of imputed vs.  original data statistics
  - Visualization tools:  flux plots, matrix plots, aggregation plots, density plots
  - Graduate climate dataset analysis (gradClimate. csv)

### 3. **Longitudinal Data Analysis**
- **R Scripts:** 
  - `Longitudinal Data analysis.R`
  - `Longitudinal Data Modelling Analysis.R`
- **Reports:** 
  - `Longitudinal Data Analysis.pdf`
  - `Longitudinal Data Modelling Report Analysis.pdf`
- **Description:** Analysis of longitudinal health data from the Framingham Heart Study
- **Key Features:**
  - Framingham Heart Study data analysis (frmgham2.csv)
  - Time-series modeling of health indicators
  - Missing data handling with median imputation
  - Correlation analysis of health metrics (BMI, cholesterol, heart rate)
  - Linear modeling of cholesterol trends with age
  - Residual analysis and model diagnostics

### 4. **Power and Sample Size Analysis**
- **R Scripts:** 
  - `Power and Sample Size.R`
  - `Basic Power and Sample Size Analysis.R`
- **Reports:** 
  - `Power and Sample Size. pdf`
  - `Basic Power and Sample Size Analysis.pdf`
- **Description:** Statistical power calculations and sample size determination
- **Key Features:**
  - Two-sample and paired t-test power analysis
  - Effect size calculation using Cohen's d
  - Power curves visualization across multiple significance levels (α = 0.05, 0.01)
  - Sample size requirements for various power levels (0.70 - 0.95)
  - Pre/post intervention analysis design
  - Interactive power vs. sample size plots using ggplot2

### 5. **Exploring Regression Concepts**
- **Directory:** `Exploring the concept of regression/`
- **R Scripts:** 
  - `Exploring the concept of Regression.R`
  - `new modelling.R`
- **Report:** `Assignment 2.pdf`
- **Description:** Ship accidents data analysis with advanced regression diagnostics
- **Key Features:**
  - Ship accident prediction modeling (ShipAccidents.csv)
  - Multiple regression with categorical variables (construction types)
  - Model assumption validation
  - Durbin-Watson test for autocorrelation
  - Box-Cox transformation analysis
  - Log transformation for non-normal responses
  - Binary response variable creation and logistic modeling
  - Comprehensive diagnostic visualizations

#### Visualization Outputs: 
- `linearity. png` / `linearity 2.png` - Linearity assumption checks
- `homoscedaticity.png` / `homodescaticity.png` / `hmom.png` - Variance homogeneity tests
- `normality.png` / `qq plot.png` - Normality diagnostic plots
- `independ.png` - Independence assumption verification
- `new 1 linear.png` - Transformed model diagnostics

### 6. **Nonlinear Models and Non-Normal Responses**
- **R Scripts:** 
  - `Nonlinear Models and Non-Normal Responses Part 1.R`
  - `Nonlinear Models and Non-Normal Responses Part 2.R`
- **Report:** `Nonlinear Models and Non-Normal Responses - Report Analysis. docx`
- **Description:** Advanced modeling techniques for non-standard distributions

### 7. **Exploratory Data Analysis**
- **Report:** `Exploratory Data Analysis with R.pdf`
- **Description:** Comprehensive EDA techniques and best practices

## 📄 R Scripts

| Script Name | Purpose | Key Packages Used |
|------------|---------|-------------------|
| `Linear Regression.R` | Linear and beta regression modeling | betareg, car, nortest |
| `Missing Data Analysis.R` | MICE imputation and missing data diagnostics | VIM, mice, BaylorEdPsych, naniar |
| `Missing Data Techniques.R` | Advanced missing data handling methods | mice, VIM |
| `Longitudinal Data analysis.R` | Framingham data time-series analysis | ggplot2, GGally, tidyverse, lmtest |
| `Longitudinal Data Modelling Analysis.R` | Advanced longitudinal modeling | (specialized packages) |
| `Power and Sample Size.R` | Power analysis calculations | pwr |
| `Basic Power and Sample Size Analysis.R` | Sample size determination with visualization | pwr, ggplot2 |
| `Exploring the concept of Regression.R` | Ship accidents regression analysis | ggplot2 |
| `new modelling.R` | Advanced regression diagnostics and transformations | car, MASS, nortest |
| `Nonlinear Models and Non-Normal Responses Part 1.R` | Nonlinear modeling techniques | (various) |
| `Nonlinear Models and Non-Normal Responses Part 2.R` | Non-normal response modeling | (various) |

## 📊 Reports and Documentation

### PDF Reports
1. **Basic Power and Sample Size Analysis.pdf** - Statistical power calculations documentation
2. **Exploratory Data Analysis with R.pdf** - EDA methodology and techniques
3. **Linear Regression and EDA.pdf** - Combined regression and exploratory analysis
4. **Longitudinal Data Analysis.pdf** - Time-series analysis findings
5. **Longitudinal Data Modelling Report Analysis.pdf** - Advanced longitudinal modeling results
6. **Missing Data Analysis.pdf** - Missing data diagnostics and solutions
7. **Missing Data Technique Report.pdf** - Imputation methods comparison
8. **Power and Sample Size.pdf** - Comprehensive power analysis guide

### Word Documents
1. **Nonlinear Models and Non-Normal Responses - Report Analysis.docx** - Detailed analysis of complex models

### Additional Documentation
- **Assignment 2.pdf** (in `Exploring the concept of regression/`) - Ship accidents analysis report

## 🛠️ Requirements

### R Packages
```r
# Regression and Diagnostics
install.packages("betareg")
install.packages("car")
install.packages("nortest")
install.packages("MASS")
install.packages("lmtest")

# Missing Data Analysis
install.packages("mice")
install.packages("VIM")
install.packages("BaylorEdPsych")
install.packages("mvnmle")
install.packages("naniar")

# Data Manipulation and Visualization
install. packages("ggplot2")
install.packages("tidyverse")
install.packages("GGally")

# Power Analysis
install.packages("pwr")
```

### R Version
- Recommended: R version 4.0.0 or higher

## 🚀 Getting Started

1. **Clone the repository:**
```bash
git clone https://github.com/TheJegede/Advanced-Data-Analysis-with-R.git
cd Advanced-Data-Analysis-with-R
```

2. **Install required packages:**
```r
source("install_packages.R")  # If available, or install manually
```

3. **Set working directory in R scripts:**
```r
setwd('path/to/Advanced-Data-Analysis-with-R')
```

4. **Ensure data files are in the correct location:**
   - `gradClimate.csv` - For missing data analysis
   - `frmgham2.csv` - For longitudinal analysis
   - `ShipAccidents.csv` - For regression analysis
   - FoodExpenditure dataset (from betareg package)

5. **Run analyses:**
```r
source("Linear Regression.R")
# or open individual scripts in RStudio
```

## 📚 Key Topics Covered

### Statistical Methods
- ✅ Linear Regression (OLS)
- ✅ Beta Regression
- ✅ Logistic Regression
- ✅ Longitudinal Data Modeling
- ✅ Nonlinear Models
- ✅ Multiple Imputation (MICE)
- ✅ Power Analysis and Sample Size Determination

### Diagnostic Techniques
- ✅ Assumption Testing (Linearity, Homoscedasticity, Normality, Independence)
- ✅ Residual Analysis
- ✅ Box-Cox Transformations
- ✅ Durbin-Watson Test
- ✅ Shapiro-Wilk Test
- ✅ Anderson-Darling Test
- ✅ Little's MCAR Test
- ✅ Non-constant Variance Test (ncvTest)

### Visualization
- ✅ Diagnostic Plots (Q-Q plots, residual plots, scale-location plots)
- ✅ Missing Data Visualizations (flux plots, matrix plots, aggregation plots)
- ✅ Power Curves
- ✅ Density Plots
- ✅ Correlation Matrices
- ✅ Time Series Plots

### Data Preprocessing
- ✅ Missing Data Detection and Analysis
- ✅ Data Imputation Techniques
- ✅ Data Transformation
- ✅ Outlier Detection
- ✅ Variable Selection

## 📈 Datasets Used

1. **FoodExpenditure** - Built-in dataset from betareg package
2. **gradClimate. csv** - Graduate climate survey data
3. **frmgham2.csv** - Framingham Heart Study data
4. **ShipAccidents.csv** - Maritime accident records

## 👤 Author

**TheJegede**
- GitHub: [@TheJegede](https://github.com/TheJegede)
- Repository: [Advanced-Data-Analysis-with-R](https://github.com/TheJegede/Advanced-Data-Analysis-with-R)

## 📝 License

Please refer to the repository for license information.

## 🤝 Contributing

This repository serves as a portfolio of completed coursework and projects. For questions or collaboration opportunities, please contact the repository owner.

## 📧 Contact

For inquiries about the analyses or methodologies used, please open an issue in the GitHub repository.

---

**Note:** This repository demonstrates advanced statistical analysis techniques for academic and professional purposes. All analyses follow best practices in statistical modeling and data science. 
