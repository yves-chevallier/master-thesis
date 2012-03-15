%@author Y.Chevallier <yves.chevallier@epfl.ch>

% Declare Class
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{kepfl}[2012/02/12 EPFL Masters Thesis]   

% Load mother's class
\LoadClass[11pt,a4paper,twoside,final]{book}

% Include some packages
\usepackage[latin1]{inputenc}   
\usepackage[T1]{fontenc} 	
\usepackage[english]{babel} 	
\usepackage[nofancy]{svninfo} 	
\usepackage{lmodern}
\usepackage{graphicx}		
\usepackage{fancyhdr}		
\usepackage{lastpage} 	
\usepackage{makeidx} 		
\usepackage{framed}             
\usepackage{tabularx}
\usepackage{color}
\usepackage{float} 
\usepackage{siunitx}
\usepackage{parskip}  
\usepackage{multicol}
\usepackage{listings}
%\usepackage{fix-cm}
\usepackage{siunitx}
\usepackage{lipsum}
\usepackage[fleqn]{amsmath} 
%\usepackage{silence}
%\WarningFilter{latexfont}{Font shape}
%\WarningFilter{latexfont}{Size substitutions}

\usepackage[pdftex, 
	    a4paper, 
	    top=2.5cm, 
	    bottom=2.5cm, 
	    left=3cm, 
	    right=4cm,
	    headheight=6mm, 
	    headsep=5mm, 
	    marginparwidth=3cm, 
	    marginparsep=4mm, 
	    heightrounded, 
	    includehead]{geometry} 

\usepackage[pdftex, 
	    pagebackref=true, 
	    colorlinks=true, 
	    plainpages=true, 
	    linkcolor=black,
	    citecolor=black,
	    urlcolor=black]{hyperref}  

% Specific changes
\AtBeginDocument{\renewcommand{\labelitemi}{\textbullet}}

\newcommand{\clearemptydoublepage}{%
	\newpage{\pagestyle{empty}\cleardoublepage}}

\def\cleardoublepage{\clearpage\ifodd\c@page\else
  \null\thispagestyle{empty}\newpage\fi}

\setlength{\parindent}{0pt}
\setlength\parskip{\medskipamount}

% Figures macros
\def\graphicsExt{pdf}
\newcommand{\figi}[3]{
   \begin{figure}[!h]
   \begin{center}
   \includegraphics[width=#2]{fig/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#3}
   \end{figure}   
} 

\newcommand{\figs}[2]{
   \begin{figure}[!ht]
   \begin{center}
   \includegraphics{fig/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#2}
   \end{figure}   
}

\newcommand{\fig}[2]{
   \begin{figure}[!ht]
   \begin{center}
   \includegraphics[width=\textwidth]{fig/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#2}
   \end{figure}   
}

\newcommand{\figc}[3]{
   \begin{figure}[!ht]
   \begin{center}
   \includegraphics[width=\textwidth]{fig/#1.\graphicsExt}
   \end{center}
   \caption[#2]{\label{#1}#3}
   \end{figure}   
}

\newcommand{\figh}[2]{
   \begin{figure}[H]
   \begin{center}
   \includegraphics[width=\textwidth]{fig/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#2}
   \end{figure}   
}

% Page title
\newcommand\subtitle[1]{\def\@subtitle{#1}}
\newcommand\teacher[1]{\def\@teacher{#1}}

\renewcommand\maketitle{%
\null
\vskip 2em%
\begin{center}%
\includegraphics[width=5cm]{fig/epfl-logo.pdf}\par%	  
\vspace{4cm}
\let \footnote \thanks
\reset@font
%{\usefont{T1}{cmr}{bx}{n}\fontsize{20pt}{20pt}\selectfont\@title\\\vspace{0.5em}
{\usefont{T1}{cmr}{bx}{n}\huge\selectfont\@title\\\vspace{0.5em}
\large{\@subtitle}\par}%
\vskip 10em% 
{\large
\lineskip .5em%
\begin{tabular}[t]{c}%
\@author%
\end{tabular}\par}%
\vskip 1em%
{\large \@date}%
\vskip 4cm%
Supervised by:\\
\@teacher\\
\end{center}%
\par
\vskip 1.5em}

% Table of contents
\newcommand\toc{%
	\pagenumbering{roman}
	\tableofcontents
	\cleardoublepage
	\pagenumbering{arabic}
}

%\newcommand{\todo}[1]{\mbox{}\marginpar{\raggedright\tiny\textcolor{red}{\textbf{TODO:} \emph{#1}}}\hspace{-0.5em}}
\newcommand{\todo}[1]{\textcolor{red}{\begin{center}\textbf{TODO:} \emph{#1}\end{center}}}
%

% Acknowledgements
\newcommand\ackname{Acknowledgements}
\if@titlepage
  \newenvironment{acknowledgements}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \ackname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{acknowledgements}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \ackname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi

% Abstract

\newenvironment{abstract}
{\chapter*{Abstract}}
{}

% Asterism
\newcommand{\asterism}{\hfill\smash{% 
    \raisebox{-.5ex}{% 
      \setlength{\tabcolsep}{-.5pt}% 
      \begin{tabular}{@{}cc@{}}% 
        \multicolumn2c*\\[-2ex]*&*% 
      \end{tabular}}}\hfill}


% headers and footers
% 	% Tables des matières, liste des figures...
	\fancypagestyle{empty}{
	\fancyhf{}
   \renewcommand{\headrulewidth}{0pt}  	
   \renewcommand{\footrulewidth}{0pt}} 

	\fancypagestyle{heading}{
	\fancyhf{}
   \renewcommand{\headrulewidth}{0pt}  	
   \renewcommand{\footrulewidth}{0pt}} 
	
	% Première page de chapitre
   \fancypagestyle{plain}{
   \fancyhead{}
   \fancyfoot{}	
   \renewcommand{\headrulewidth}{0pt}  	
   \renewcommand{\footrulewidth}{0pt}}
	

% Corps du document
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\textbf{\thepage}}
\fancyhead[LO]{\textsl{\rightmark}}
\fancyhead[RE]{\textsl{\leftmark}}
\fancyfoot{}	
\renewcommand{\headrulewidth}{0pt}  	
\renewcommand{\footrulewidth}{0pt} 

%///////////////////////////////////////////////////////////////////////////////
% Redéfinition des chapitres                                                    
%///////////////////////////////////////////////////////////////////////////////
\renewcommand{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}												  
						  
\renewcommand{\@makechapterhead}[1]{%
  \vspace*{2\p@}%
  {\parindent \z@ \raggedleft \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
		\fontsize{72pt}{12pt}\selectfont{\textbf\thechapter}
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M			   
		{\itshape\Huge\textbf{#1}}\par\nobreak
    \vskip 40\p@
  }}

%///////////////////////////////////////////////////////////////////////////////
% Redéfinition des sections et sous sections                                    
%///////////////////////////////////////////////////////////////////////////////
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-2.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.0ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries\itshape}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-2.5ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\large\bfseries\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-2.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries\itshape}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
					{1.25ex \@plus1ex \@minus.2ex}%
					{1.0ex}%
					{\normalfont\normalsize\itshape}}
%\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {2.5ex \@plus .2ex}%
%                                    {\normalfont\normalsize\bfseries\itshape}}
%\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
%                                       {3.25ex \@plus1ex \@minus .2ex}%
%                                       {1.5ex \@plus .2ex}%
%                                      {\normalfont\normalsize\bfseries\itshape}}
												  
%///////////////////////////////////////////////////////////////////////////////
% Redéfinition de Tables des matières & Liste des figures ...                   
%///////////////////////////////////////////////////////////////////////////////
\renewcommand{\@makeschapterhead}[1]{%
  \thispagestyle{empty}
  \vspace*{50\p@}%
  {\parindent \z@ 
    \normalfont
    \interlinepenalty\@M
	 \begin{center}
	 \Huge\textit{#1}\par\nobreak
	 \end{center}
    \vskip 40\p@
  }}   

\newcommand{\maraja}[1]{\mbox{}\marginpar{\raggedright\tiny#1}\hspace{-0.5em}}
