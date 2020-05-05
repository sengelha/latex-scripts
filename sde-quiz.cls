\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sde-quiz}[2018/03/20 Steven Engelhardt's quiz LaTeX class]

% Passes and class options to the underlying exam class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions

% Load LaTeX's exam class
\LoadClass{exam}

% Redefine the page margins
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{amsmath}

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
  \noindent\textbf {\the\coursename} \\%
  \textbf {\the\term} \\%
  \textbf {\the\assignment} \\%
  \textbf {Due Date: \the\duedate} \\%
  \textbf {\the\totalpoints} \\%

  \noindent\textbf{Submit your answers to D2L by \the\duedate. Late quizzes will not be accepted.}
  \vskip\bigskipamount
  \nointerlineskip
}

% Configure listings to match sde-lecture.cls
\RequirePackage{listings}
\RequirePackage{xcolor}

\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\definecolor{gray}{rgb}{0.4,0.4,0.4}
\definecolor{darkblue}{rgb}{0.0,0.0,0.6}
\definecolor{cyan}{rgb}{0.0,0.6,0.6}
\definecolor{background}{HTML}{F7F7F7}
\definecolor{delim}{RGB}{20,105,176}
\colorlet{punct}{red!60!black}
\colorlet{numb}{magenta!60!black}

\lstset{
  backgroundcolor=\color{background},   % choose the background color
  basicstyle=\ttfamily,
  captionpos=b,                    % sets the caption-position to bottom
  columns=fullflexible,
  commentstyle=\color{mygreen},    % comment style
  frame=lines,
  keepspaces=true,
  keywordstyle=\color{blue},       % keyword style
  stringstyle=\color{mymauve},     % string literal style
  showstringspaces=false
}

\lstdefinelanguage{csharp}{
  keywords={abstract, event, new, struct, as, explicit, null, switch, base, extern, object,
            this, bool, false, operator, throw, break, finally, out, true, byte, fixed,
            override, try, case, float, params, typeof, catch, for, private, uint, char,
            foreach, protected, ulong, checked, goto, public, unchecked, class, if, readonly,
            unsafe, const, implicit, ref, ushort, continue, in, return, using, decimal, int,
            sbyte, virtual, default, interface, sealed, volatile,delegate, internal, short,
            void, do, is, sizeof, while, double, lock, stackalloc, else, long, static,
            enum, namespace, string},
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]"
}

\lstdefinelanguage{javascript}{
  keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break},
  ndkeywords={class, export, boolean, throw, implements, import, this},
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]"
}

\lstdefinelanguage{json}{
    literate=
     *{0}{{{\color{numb}0}}}{1}
      {1}{{{\color{numb}1}}}{1}
      {2}{{{\color{numb}2}}}{1}
      {3}{{{\color{numb}3}}}{1}
      {4}{{{\color{numb}4}}}{1}
      {5}{{{\color{numb}5}}}{1}
      {6}{{{\color{numb}6}}}{1}
      {7}{{{\color{numb}7}}}{1}
      {8}{{{\color{numb}8}}}{1}
      {9}{{{\color{numb}9}}}{1}
      {:}{{{\color{punct}{:}}}}{1}
      {,}{{{\color{punct}{,}}}}{1}
      {\{}{{{\color{delim}{\{}}}}{1}
      {\}}{{{\color{delim}{\}}}}}{1}
      {[}{{{\color{delim}{[}}}}{1}
      {]}{{{\color{delim}{]}}}}{1},
}

\lstdefinelanguage{xml}
{
  morestring=[b]",
  morestring=[s]{>}{<},
  morecomment=[s]{<?}{?>},
  stringstyle=\color{black},
  identifierstyle=\color{darkblue},
  keywordstyle=\color{cyan},
  morekeywords={xmlns,version,type}% list your attributes here
}

% Set up our desired header and footer
\RequirePackage{lastpage}
\pagestyle{headandfoot}
\headrule
\header{\the\coursename}{\the\assignment}{Due Date: \the\duedate}
\footer{}{}{Page \thepage\ of \pageref*{LastPage}}
\endinput
