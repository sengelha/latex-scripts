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

% Add support for code listings
\RequirePackage{sde-listings}

% Add Beamer equivalents of Exam question/answers
\newcommand{\question}[1][]{(#1 point(s))}
\newenvironment{parts}{}{}
\renewcommand{\part}{\framebreak}
\newenvironment{checkboxes}{\begin{enumerate}}{\end{enumerate}}
\newenvironment{choices}{\begin{enumerate}}{\end{enumerate}}
\newenvironment{oneparcheckboxes}{\begin{enumerate}}{\end{enumerate}}
\newenvironment{oneparchoices}{\begin{enumerate}}{\end{enumerate}}
\newcommand{\choice}{\normalfont\item}
\newcommand{\correctchoice}{%
  \only<1>{\normalfont\item}%
  \only<2>{\normalfont\bfseries\item}%
}
\newcommand{\CorrectChoice}{%
  \only<1>{\normalfont\item}%
  \only<2>{\normalfont\bfseries\item}%
}
\renewenvironment{solution}[1][]{%
  \begin{block}<2>{}%
}{%
  \end{block}%
}
\newlength{\fillinlinelength}
\newcommand{\fillin}[1][]{%
  \only<1>{\underline{\qquad}}%
  \only<2>{\underline{\text{\textbf{#1}}}}%
}

\def\signed #1{{\leavevmode\unskip\nobreak\hfil\penalty50\hskip1em
  \hbox{}\nobreak\hfill --- #1%
  \parfillskip=0pt \finalhyphendemerits=0 \endgraf}}
\newsavebox\mybox
\newenvironment{aquote}[1]
  {\savebox\mybox{#1}\begin{quote}}
  {\vspace*{1mm}\signed{\usebox\mybox}\end{quote}}

\usetheme{depaul}

% Color hyperlinks
\hypersetup{
  colorlinks=true,
  linkcolor=depaul@blue,
  urlcolor=depaul@blue,
}

\endinput
