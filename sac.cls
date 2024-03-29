%% Adapted from the Overleaf AIAA template: 
% https://www.overleaf.com/latex/templates/preparation-of-papers-for-aiaa-technical-conferences/rsssbwthkptn

%% Released under Creative Commons BY 4.0:
% https://creativecommons.org/licenses/by/4.0/deed.en

%% Modified for use in the Spaceport America Cup 
% Project Technical Report and Project Technical Presentation, includes
% - Formatted title accoridng to SAC R&R 
% - Conditionally-compiled section descriptions taken from SAC R&R
% - Helper macros

% Yevgeniy Gorbachev
% Rochester Institute of Technology 
% RIT Launch Avionics Lead 2022-2023, Director of Operations 2023-2024

\ProvidesClass{sac}
\newif\if@report
\newif\if@eabstract
\DeclareOption{report}{\@reporttrue} % Use Project Technical Report formatting
\DeclareOption{eabstract}{\@eabstracttrue} % Use Extended Abstract formatting

\newif\if@wip
\newif\if@nofig
\newif\if@nodwg
\DeclareOption{wip}{\@wiptrue} % Inlucde DRAFT, description text, formatting examples
\DeclareOption{nofig}{\@nofigtrue} % Omit figures and tables for length-checking
\DeclareOption{nodwg}{\@nodwgtrue} % Omit drawings to save compilation time

\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass[10pt]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage{txfonts}

\RequirePackage[letterpaper,margin=1in]{geometry}
\RequirePackage[shortlabels]{enumitem}
\setlist{labelindent=\parindent,leftmargin=*,nosep}
\setlist[enumerate]{label={\arabic*)}}

\RequirePackage[symbol*]{footmisc}

\RequirePackage[style]{abstract}
\renewcommand{\abstitlestyle}[1]{}
\renewcommand{\abstracttextfont}{\bfseries\normalsize}
\setlength{\absleftindent}{0.5in}
\setlength{\absrightindent}{0.5in}

\RequirePackage[blocks]{authblk}
\renewcommand{\Authfont}{\normalsize\upshape}
\renewcommand{\Affilfont}{\normalsize\itshape}
\setlength{\affilsep}{0pt}
\def\@sacteam{XXX}
\def\@sacyear{YYYY}
\newcommand{\sacteam}[1]{\def\@sacteam{#1}}
\newcommand{\sacyear}[1]{\def\@sacyear{#1}}

\newcommand{\subtitle}[1]{\def\@subtitle{#1}}

%%% Automatic required titles
% Extended Abstract required subtitle
\if@eabstract
\subtitle{Team \@sacteam{} Project Technical Presentation \\ to the \\ \@sacyear{} Spaceport America Cup}
\fi

% Project Technical Report required subtitle
\if@report
\subtitle{Team \@sacteam{} Project Technical Report \\ to the \\ \@sacyear{} Spaceport America Cup}
\fi

% Automatic title and subtitile
\renewcommand{\maketitle}{
  \begingroup
  \renewcommand\and{\\[\baselineskip]}
  \centering
  {\LARGE\bfseries\@title\par}
  \vskip1\baselineskip
  {\LARGE\@subtitle\par}
  \vskip2\baselineskip

  \@author\par
  \endgroup
  \vskip\baselineskip
  \setcounter{footnote}{0}
}

%%% Section header formatting
\RequirePackage[explicit]{titlesec}

% Default formatting
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\thesection.\Alph{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% Extended Abstract formatting
\if@eabstract

\titleformat{\section}
  {\large\bfseries}
  {}{0pt}{\uppercase{#1}}[]
\titlespacing{\section}{0pt}{0.5\baselineskip}{0pt}

\fi

% Report formatting
\if@report

\titleformat{\section}
  {\large\bfseries\centering}
  {\thesection.\space}{0pt}{#1}[]
\titlespacing{\section}{0pt}{0.5\baselineskip}{0pt}
\titleformat{\subsection}
  {\normalsize\bfseries}
  {\Alph{subsection}.\space}{0pt}{#1}[]
\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0pt}
\titleformat{\subsubsection}
  {\normalsize\itshape}
  {\arabic{subsubsection}.\space}{0pt}{#1}[]
\titlespacing{\subsubsection}{0pt}{0.5\baselineskip}{0pt}

% Report appendix formatting
\let\baseappendix\appendix
\renewcommand{\appendix}{
    \pagebreak
    \baseappendix
    \renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
    \renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
    \titleformat{\subsection}
      {\normalsize\bfseries}
      {\arabic{subsection}.\space}{0pt}{##1}[] % two ## becuase this is a nested command
    \titlespacing{\subsection}{0pt}{0.5\baselineskip}{0pt}
    \titleformat{\subsubsection}
      {\normalsize\itshape}
      {\arabic{subsubsection}.\space}{0pt}{##1}[] % two ## because ditto
    \titlespacing{\subsubsection}{0pt}{0.5\baselineskip}{0pt}
}

\fi

\RequirePackage{lettrine}
\setlength{\DefaultNindent}{0pt}

\RequirePackage[tableposition=top]{caption}
\renewcommand{\figurename}{Fig.}
\captionsetup*{font=bf,labelsep=quad}
\renewcommand{\arraystretch}{1.2}

\RequirePackage[indentfirst=false,font+=small,leftmargin=0.4in,rightmargin=0pt,vskip=0pt]
{quoting}

\setlength{\abovedisplayskip}{\baselineskip}
\setlength{\belowdisplayskip}{\baselineskip}
\setlength{\abovedisplayshortskip}{\baselineskip}
\setlength{\belowdisplayshortskip}{\baselineskip}

\RequirePackage[sort&compress,numbers]{natbib}
\bibliographystyle{lib/new-aiaa}
\renewcommand{\bibfont}{\small}

\if@eabstract
\RequirePackage{comment}
\renewcommand{\refname}{\large REFERENCES}
\fi

\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}

%%% Conditionally-compiled helper macros
% Include helper text if work-in-progress mode is enabled
\newcommand\wiptext[1]{#1}
\newcommand\helptext[1]{
    \wiptext{\begingroup
    \small\em#1
    \endgroup}
}

% Include engineering drawings true-to-size
\RequirePackage{pdfpages}
\newcommand{\putdrawings}[1]{\includepdf[pages=-,fitpaper]{#1}}

\if@wip
\RequirePackage{draftwatermark}
\RequirePackage{fancyhdr}
\SetWatermarkText{DRAFT}
\SetWatermarkScale{1}
\SetWatermarkLightness{0.95}

\pagestyle{fancy}
\fancyhead{}
\fancyhead[c]{\uppercase{
Work-in-progress mode: includes section descriptions and formatting examples
}}

\else 
\renewcommand{\wiptext}[1]{\relax\empty} % not in WIP mode: get rid of WIP text
\fi

\if@nofig
\renewenvironment{figure}{\comment}{\endcomment}
\renewenvironment{table}{\comment}{\endcomment}
\fi

\if@nodwg
\renewcommand{\putdrawings}[1]{\relax\empty}
\fi

\newcommand\pageleftblank{
\begin{center}
    \par
    THIS PAGE INTENTIONALLY LEFT BLANK
    \par
\end{center}
\pagebreak}
