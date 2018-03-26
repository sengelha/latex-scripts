\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2018/03/20 Steven Engelhardt's assignment LaTeX class]

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

% Load LaTeX's article class
\LoadClass{article}

% Redefine the page margins
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

% Do not indent paragraphs
\parindent 0ex
% Add a blank line between paragraphs
\setlength{\parskip}{1em}

% Load hyperref, set it up, add \emailurl command
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    urlcolor=blue
}
\def\emailurl#1{\href{mailto:#1}{\nolinkurl{#1}}}

% Remove the numbers from all the headings (\section, \subsection, etc.)
\setcounter{secnumdepth}{-1}

% Create a questions environment and question command
\RequirePackage{mdframed}
\newenvironment{questions}{\begin{enumerate}}{\end{enumerate}}
\newcommand{\question}[3]{%
  \item (#1 points) #2

  \begin{mdframed}
  \textbf{Solution: } #3
  \end{mdframed}
}

% Add various syllabus-specific global settings
\def\coursename#1{\gdef\@coursename{#1}}
\def\term#1{\gdef\@term{#1}}
\def\assignment#1{\gdef\@assignment{#1}}
\def\duedate#1{\gdef\@duedate{#1}}
\def\totalpoints#1{\gdef\@totalpoints{#1}}

% Adjust the title design
\renewcommand{\maketitle}{%
  {\textbf \@coursename \\}%
  {\textbf \@term \\}%
  {\textbf \@assignment \\}%
  {\textbf {Due On: \@duedate} \\}%
  {\textbf \@totalpoints}%
}

% Set up our desired header and footer
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\pagestyle{fancyplain}
\fancyhf{}
\lhead{ \fancyplain{}{\@coursename\ -- \@assignment} }
\rhead{ \fancyplain{}{Page \thepage\ of \pageref*{LastPage}} }

\endinput
