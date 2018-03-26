\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2018/03/20 Steven Engelhardt's assignment LaTeX class]

% Passes and class options to the underlying exam class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions

% Load LaTeX's exam class
\LoadClass{exam}

% Redefine the page margins
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

% Do not indent paragraphs
\setlength{\parindent}{0ex}
% Add a blank line between paragraphs
\setlength{\parskip}{1em}

% Load hyperref, set it up, add \emailurl command
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    urlcolor=blue
}
\def\emailurl#1{\href{mailto:#1}{\nolinkurl{#1}}}

% Add various syllabus-specific global settings
\newtoks\coursename
\newtoks\term
\newtoks\assignment
\newtoks\duedate
\newtoks\totalpoints

% Adjust the title design
\renewcommand{\maketitle}{%
  \textbf {\the\coursename} \\%
  \textbf {\the\term} \\%
  \textbf {\the\assignment} \\%
  \textbf {Due Date: \the\duedate} \\%
  \textbf {\the\totalpoints}%
}

% Set up our desired header and footer
\RequirePackage{lastpage}
\pagestyle{headandfoot}
\headrule
\header{\the\coursename}{\the\assignment}{Due Date: \the\duedate}
\footer{}{}{Page \thepage\ of \pageref*{LastPage}}

\endinput
