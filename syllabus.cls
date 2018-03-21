\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{syllabus}[2018/03/20 Steven Engelhardt's syllabus LaTeX class]

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

% Load LaTeX's article class
\LoadClass{article}

% Redefine the page margins
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

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
\def\meetingtime#1{\gdef\@meetingtime{#1}}
\def\location#1{\gdef\@location{#1}}
\def\coursehomepage#1{\gdef\@coursehomepage{#1}}
\def\dropdate#1{\gdef\@dropdate{#1}}
\def\instructor#1{\gdef\@instructor{#1}}
\def\office#1{\gdef\@office{#1}}
\def\officehours#1{\gdef\@officehours{#1}}
\def\phone#1{\gdef\@phone{#1}}
\def\email#1{\gdef\@email{#1}}

% Adjust the title design
\renewcommand{\maketitle}{%
  \begin{center}%
    {\LARGE \@coursename \par}%
    {\large \@college \par}%
    {\large \@university \par}%
    \vskip 1em%
    {Term: \@term \par}%
    {Classroom section: \@meetingtime, \@location \par}%
    {Course homepage: \url{\@coursehomepage} \par}%
    {Drop date (no penalty): \@dropdate \par}%
    \vskip 1em%
    {Instructor: \@instructor \par}%
    {Office hours: \@officehours, \@office \par}%
    {Phone \#: \@phone \par}%
    {Email: \emailurl{\@email} \par}%
  \end{center}\par
}

\endinput
