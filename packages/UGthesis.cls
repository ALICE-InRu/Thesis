\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UGthesis}
              [2000/08/18 
 Improved UGthesis class by Ludde Edgren]
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions
\LoadClass{report}

%%%%%%%%%%%%%% Defining a font family %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareFontFamily{OT1}{large}{}
\DeclareFontShape{OT1}{large}{m}{n}{
%		<-7>	cmss17
%		<8>	cmss8
%		<9>	cmss9
%		<10>	cmss10
%		<11>	cmss17
%		<12>	cmss12
%		<12-59>	cmss17
		%<0-21> fixed * [20.74] cmr17
		%<21-30> fixed * [24.88] cmr 17
		%<30-60> fixed * [29.9] cmr17
		<60-> sfixed * [69.1] cmss17}{}
%\DeclareFontShape{OT1}{cmr}{m}{n}{
%		<5><6><7><8><9><10><12><17> sgen * cmr
%		<11>	cmr17
%		<12-16>	cmr17
%		<18->	cmr17}{}
%\DeclareFontShape{OML}{cmm}{m}{it}{
%		<5><6><7><8><9><10> sgen * cmmi
%		<10->	cmmi10}{}
%\DeclareFontShape{OMS}{cmsy}{m}{n}{
%		<5><6><7><8><9><10> sgen * cmsy
%		<10->	cmsy10}{}
%\DeclareFontShape{OMX}{cmex}{m}{n}{
%		<->	cmex24}{}
%\DeclareFontShape{U}{msa}{m}{n}{
%		<10->	msam10}{}
%\DeclareFontShape{OT1}{cmss}{m}{it}{
%		<-> ssub * cmss/m/sl }{}
%\DeclareFontShape{OT1}{cmss}{bx}{it}{
%		<-> ssub * cmss/bx/n }{}

%\DeclareFontFamily{U}{scr}{}%
%\DeclareFontShape{U}{scr}{m}{n}{<-6>rsfs5<6-8>rsfs7<8->rsfs10}{}%
%\DeclareMathAlphabet\scr{U}{scr}{m}{n}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                               %
%       Define script letters as rsfs                           %
%               (or redefine as cal)                            %
%                                                               %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\count18=12%CP latex sista fonten
\newfam\scrfam
\batchmode\font\tenscr=rsfs10 \errorstopmode
\ifx\tenscr\nullfont
        \message{rsfs script font not available. Replacing with calligraphic.}
\else   \font\sevenscr=rsfs7 
        \font\fivescr=rsfs5 
        \skewchar\tenscr='177 \skewchar\sevenscr='177 \skewchar\fivescr='177
        \textfont\scrfam=\tenscr \scriptfont\scrfam=\sevenscr
        \scriptscriptfont\scrfam=\fivescr
        \def\scr{\fam\scrfam}
%        \def\scr{\cal}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                               %
%       Blackboard bold (or redefine as boldface)               %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newfam\msbfam
%\batchmode\font\twelvemsb=msbm10 scaled\magstep1 \errorstopmode
%\ifx\twelvemsb\nullfont\def\Bbb{\bf}
%        \message{Blackboard bold not available. Replacing with boldface.}
%\else   \catcode`\@=11
%        \font\tenmsb=msbm10 \font\sevenmsb=msbm7 \font\fivemsb=msbm5
%5        \textfont\msbfam=\tenmsb
%        \scriptfont\msbfam=\sevenmsb \scriptscriptfont\msbfam=\fivemsb
%        \def\Bbb{\relax\expandafter\Bbb@}
%        \def\Bbb@#1{{\Bbb@@{#1}}}
%        \def\Bbb@@#1{\fam\msbfam\relax#1}
%        \catcode`\@=\active
%\fi

%%%%%%%%%%%%% Define the pagestyle PLheadings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \def\ps@PLheadings{
      \def\@oddfoot{\vbox{\sffamily\center\thepage}}
      \def\@evenfoot{\vbox{\sffamily\center\thepage}}
      \def\@oddhead{\vbox{\hbox to \textwidth{\hfil
		\quad {\sffamily\leftmark}}\vspace{2pt}\hrule height.8pt
		\vspace{1.5pt}\hrule height.2pt}}
      \def\@evenhead{\vbox{\hbox to \textwidth{{\sffamily\rightmark}\hfil}
		\vspace{2pt}\hrule height.8pt
		\vspace{1.5pt}\hrule height.2pt}}
      \let\@mkboth\markboth
      \def\chaptermark##1{
        \markboth {\ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ \fi
            ##1}{}}
      \def\sectionmark##1{
        \markright {\ifnum \c@secnumdepth >\z@
            \thesection. \ \fi
            ##1}}}

%%%%%%%%%%%%%%%% change the margins to centered text %%%%%%%%%%%%%%%%%

%\paperwidth 210mm
%\paperheight 297mm
%\textwidth 137mm

%\setlength\oddsidemargin    {.5 \paperwidth}
%\addtolength\oddsidemargin    {-.5\textwidth}
%\addtolength\oddsidemargin    {-1in}
%\setlength\evensidemargin   {\oddsidemargin}

%%%%%%%%%%%%%%%%%%%% DINA4 format DESY %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%
\newlength{\dinwidth}
\newlength{\dinmargin}
\setlength{\dinwidth}{21.0cm}
\textheight21.5cm \textwidth13.0cm  % Change height for US paper format!
\setlength{\dinmargin}{\dinwidth}
\addtolength{\dinmargin}{-\textwidth}
\setlength{\dinmargin}{0.5\dinmargin}
\oddsidemargin -1.0in


\addtolength{\oddsidemargin}{\dinmargin}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\marginparwidth}{0.9\dinmargin}
%\marginparsep 8pt \marginparpush 5pt
%\topmargin -42pt
%\headheight 12pt
%\headsep 30pt \footheight 12pt \footskip 24pt

%%%%%%%%%%%%%%%%%% Fonts for different headings %%%%%%%%%%%%%%%%%%%%

\newcommand{\mychnumber}{\fontsize{65}{1}\usefont{OT1}{large}{m}{n}}


%%%%%%%%%%%%%%%%%% Parts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\part{\cleardoublepage
                 \thispagestyle{empty}%
                 \if@twocolumn
                     \onecolumn
                     \@tempswatrue
                   \else
                     \@tempswafalse
                 \fi
                 \hbox{}\vfil
                 \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\sffamily\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{\sffamily\bfseries\Huge#1}%
    \fi
    \markboth{}{}
    {\centering
     \interlinepenalty \@M
     \reset@font
     \ifnum \c@secnumdepth >-2\relax
       \sffamily\huge\bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \sffamily \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \reset@font
     \sffamily \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
                \hbox{}%
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}


%%%%%%%%%%%%%%%%%% Chapters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\sffamily\bfseries\thechapter}\sffamily\bfseries#1}%
                    \else
                      \addcontentsline{toc}{chapter}{\sffamily\bfseries#1}
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}


\def\@makechapterhead#1{
  \vspace*{50\p@}
  {\parindent \z@ \raggedright \reset@font
    \ifnum \c@secnumdepth >\m@ne
	\vbox{\mychnumber 
	\center \begin{tabular}{c}
  	\thechapter\\
	%\ifthenelse{\value{chapter}<10}{\rule[-2mm]{11mm}{2.7pt}}{\rule[-2mm]{22mm}{2.7pt}}\\
	%\rule[-.4mm]{20mm}{.2pt}
	\end{tabular}}
	\par
         \vskip 30\p@
      \fi
	\sffamily \bfseries \Huge \upshape \center#1\par
    \nobreak
    \vskip 40\p@
  }}

%%%%%%% Sections %%%%%%%%%%%%%%%


\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\reset@font\sffamily\bfseries\Large\upshape}}%{\reset@font\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                    {\reset@font\sffamily\bfseries\large\upshape}}%{\reset@font\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                    {\reset@font\sffamily\bfseries\normalsize\upshape}}%{\reset@font\normalsize\bfseries}}

%%%%%%%% Figure captions %%%%%%%%%%%%

%\renewcommand\thefigure{\thechapter.\@arabic\c@figure}
%\renewcommand\figurename{\sffamily Figure}
%\renewcommand\tablename{\sffamily Table}

%%%%%%%% Redefine makeschapterhead for the \chapter* command %%%%%%%%%%%%

\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \reset@font
    \sffamily \Huge \bfseries  #1\par%\LARGE \scshape #1\par
    \nobreak
    \vskip 40\p@
  }}

