\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sde-lecture}[2019/05/12 Steven Engelhardt's lecture LaTeX class]

% Passes and class options to the underlying exam class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions

% Load LaTeX's exam class
\LoadClass{beamer}

\usepackage{booktabs}
\usepackage{graphicx}
\usepackage{listings}
\usepackage{mathtools}
\usepackage{multicol}
\usepackage{tabularx}
\usepackage{tikz}
\usepackage{wrapfig}
\usepackage{xcolor}

\RequirePackage{sde-listings}

% Add Beamer equivalents of Exam question/answers
\newcommand{\question}{}
\newenvironment{parts}{}{}
\renewcommand{\part}{\framebreak}
\newenvironment{choices}{\begin{enumerate}}{\end{enumerate}}
\newenvironment{oneparchoices}{\begin{enumerate}}{\end{enumerate}}
\newcommand{\choice}{\normalfont\item}
\newcommand{\CorrectChoice}{\only<1>{\normalfont\item}\only<2>{\normalfont\bfseries\item}}
\renewenvironment{solution}{\begin{block}<2>{}}{\end{block}}

\def\signed #1{{\leavevmode\unskip\nobreak\hfil\penalty50\hskip1em
  \hbox{}\nobreak\hfill --- #1%
  \parfillskip=0pt \finalhyphendemerits=0 \endgraf}}
\newsavebox\mybox
\newenvironment{aquote}[1]
  {\savebox\mybox{#1}\begin{quote}}
  {\vspace*{1mm}\signed{\usebox\mybox}\end{quote}}

\lstnewenvironment{tabularlstlisting}[1][]
 {%
  \lstset{aboveskip=-1.3ex,belowskip=-3.5ex,#1}%
 }
 {}
 
\usetheme{depaul}

\endinput
