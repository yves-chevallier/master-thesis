%@author Y.Chevallier <yves.chevallier@epfl.ch>

% Declare Class
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{kepfl}[2011/05/15 Extension pour RAPPORT EPFL]   

% Load mother's class
\LoadClass[10pt,onecolumn,a4paper,twoside,final]{article}

% Include some packages
\usepackage[latin1]{inputenc}   
\usepackage[T1]{fontenc} 	
\usepackage[english]{babel} 	
\usepackage[nofancy]{svninfo} 	
%\usepackage{aeguill}
\usepackage{lmodern}
\usepackage{graphicx}		
\usepackage{fancyhdr}		
\usepackage{lastpage} 		
%\usepackage{helvet}             
%\usepackage{courier}            
\usepackage{framed}             
\usepackage{tabularx}
\usepackage{color}
\usepackage{float} 
\usepackage{siunitx}
\usepackage{parskip}  
\usepackage{multicol}
\usepackage{listings}
\usepackage[fleqn]{amsmath} 

\usepackage[dvips, 
	    a4paper, 
	    top=1cm, 
	    bottom=2cm, 
	    left=2cm, 
	    headheight=6mm, 
	    headsep=5mm, 
	    marginparwidth=2cm, 
	    marginparsep=4mm, 
	    heightrounded, 
	    includehead]{geometry} 

\usepackage[dvips, 
	    pagebackref=true, 
	    colorlinks=true, 
	    plainpages=true, 
	    linkcolor=black,
	    citecolor=black,
	    urlcolor=black]{hyperref}  

% Some specific changes
\AtBeginDocument{\renewcommand{\labelitemi}{\textbullet}}

\newcommand{\clearemptydoublepage}{%
	\newpage{\pagestyle{empty}\cleardoublepage}}

% Figures macros
\def\graphicsExt{eps}
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

\renewcommand\@maketitle{%
\null
\vskip 2em%
\begin{center}%
\includegraphics[width=5cm]{fig/epfl-logo.eps}\par%	  
\vspace{4cm}
\let \footnote \thanks
\reset@font
{\usefont{T1}{cmr}{bx}{n}\fontsize{29.86pt}{29.86pt}\selectfont\@title\\\vspace{0.5em}
\large{\@subtitle}\par}%
%{\LARGE \@title \par}%
\vskip 10em% 
{\large
\lineskip .5em%
\begin{tabular}[t]{c}%
\@author
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

\newcommand{\todo}[1]{\textcolor{red}{\begin{center}\textbf{TODO:} \emph{#1}\end{center}}}

