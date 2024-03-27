%% Adapted from the Overleaf AIAA template
% https://www.overleaf.com/latex/templates/preparation-of-papers-for-aiaa-technical-conferences/rsssbwthkptn
% Yevgeniy Gorbachev, 2023
% Rochester Institute of Technology 

\ProvidesClass{sac}
% Option report: Project Technical Report
% Option eabstract: Extended abstract
\newif\if@report
\newif\if@eabstract
\DeclareOption{report}{\@reporttrue}
\DeclareOption{eabstract}{\@eabstracttrue}

\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass[10pt]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage{txfonts}
%\RequirePackage{newtxtext,newtxmath}

\RequirePackage[letterpaper,margin=1in]{geometry}
\RequirePackage{enumitem}
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