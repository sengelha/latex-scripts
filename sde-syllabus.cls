\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{syllabus}[2018/03/20 Steven Engelhardt's syllabus LaTeX class]

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

% Load LaTeX's article class
\LoadClass{article}

% Redefine the page margins
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

% Do not indent paragraphs
\setlength{\parindent}{0ex}
% Add a blank line between paragraphs
\setlength{\parskip}{1em}
% Reduce the spacing between headings because of parskip
\RequirePackage{titlesec}
\titlespacing*{\section}{0pt}{0pt}{0pt}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}

% Load hyperref, set it up, add \emailurl command
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    urlcolor=blue
}
\def\emailurl#1{\href{mailto:#1}{\nolinkurl{#1}}}

% Remove the numbers from all the headings (\section, \subsection, etc.)
\setcounter{secnumdepth}{-1}

% Add various syllabus-specific global settings
\def\coursename#1{\gdef\@coursename{#1}}
\def\college#1{\gdef\@college{#1}}
\def\university#1{\gdef\@university{#1}}
\def\term#1{\gdef\@term{#1}}
\def\meetingtime#1{\gdef\@meetingtime{#1}} \def\location#1{\gdef\@location{#1}}
\def\coursehomepage#1{\gdef\@coursehomepage{#1}}
\def\dropdate#1{\gdef\@dropdate{#1}}
\def\instructor#1{\gdef\@instructor{#1}}
\def\office#1{\gdef\@office{#1}}
\def\officehours#1{\gdef\@officehours{#1}}
\def\phone#1{\gdef\@phone{#1}}
\def\email#1{\gdef\@email{#1}}

% Adjust the title design
\renewcommand{\maketitle}{
  \begin{center}
    \LARGE{\@coursename}\\
    \large{\@college}\\
    \large{\@university}\\
    \vskip 1em
    Term: \@term\\
    Classroom section: \@meetingtime, \@location\\
    Course homepage: \url{\@coursehomepage}\\
    Drop date (no penalty): \@dropdate\\
    \vskip 1em
    Instructor: \@instructor\\
    Office hours: \@officehours, \@office\\
    \ifx \@phone \undefined
    \else
    Phone \#: \@phone\\
    \fi
    Email: \emailurl{\@email}
  \end{center}
}

\endinput
