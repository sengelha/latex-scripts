\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sde-exam}[2018/04/15 Steven Engelhardt's exam LaTeX class]

% Passes and class options to the underlying exam class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions

% Load LaTeX's exam class
\LoadClass{exam}

% Load up related packages
\RequirePackage{amsmath}

% Do not indent paragraphs
\setlength{\parindent}{0ex}
% Add a blank line between paragraphs
\setlength{\parskip}{1em}

% Add various syllabus-specific global settings
\newtoks\coursename
\newtoks\term
\newtoks\examname
\newtoks\timelimit

% Adjust the title design
\renewcommand{\maketitle}{
\begin{tabular}{@{}p{0.48\textwidth}p{0.48\textwidth}@{}}
\textbf{\the\coursename} & \textbf{Name (Print):}\enspace\hrulefill\\
\textbf{\the\term}\\
\textbf{\the\examname}\\
\textbf{Time Limit: \the\timelimit}\\
\end{tabular}

\rule[1ex]{\textwidth}{.1pt}

This exam contains \numpages\ pages (including this cover page) and
\numquestions\ questions. Check to see if any pages are missing. Enter
all requested information on the top of this page, and put your initials
on the top of every page, in case the pages become separated.

You may \textit{not} use your books, notes, or any calculator on this
exam.

Please be aware of the following:

\begin{itemize}

\item \textbf{Mysterious or unsupported answers will not receive full credit.} Make sure that your responses
are clear enough that I can easily understand how your arrived at your conclusions. I try to give
partial credit where possible, but you've got to help me understand your thought process.

\item \textbf{Write legibly.} If I can't read it, then I won't grade it.

\item \textbf{If you need more space, use the back of the pages.} Clearly indicate when you have done this and
make sure I can tell where the continuation on the back starts and ends for each question.
\end{itemize}

Do not write in the table below.

\addpoints
\begin{center}
\multirowgradetable{3}
\end{center}

\newpage
}

% Set up our desired header and footer
\pagestyle{headandfoot}
\firstpageheader{}{}{}
\runningheader{\the\coursename}{\the\examname}{\the\term}
\runningheadrule
\firstpagefooter{}{}{}
\runningfooter{}{Page \thepage\ of \numpages}{}
\runningfootrule

\endinput
