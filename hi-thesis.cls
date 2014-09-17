% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "hi-thesis.cls",
%     version         = "0.1",
%     date            = "11 May 2012",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, hi-thesis",
%     supported       = "send email to hei2@hi.is",
%     docstring       = "A thesis class for a University of Iceland dissertation.",
%     note            = "Based on the Harvard dissertation class by Jordan Suchow (suchow@fas.harvard.edu)"
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hi-thesis}[2012/05/11 v0.1 University of Iceland Thesis Class]
\LoadClass[11pt,b5paper,twoside]{book} % UGthesis

% Required packages
\RequirePackage{pdfpages}
\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.eps, .ps, .pdf}
\graphicspath{{figures/EPS/}{figures/}}

% Colors
\RequirePackage{color} 
% official color definitions at the University of Iceland:
\definecolor{blue}{RGB}{0, 69, 124}
\definecolor{gray}{RGB}{90,91,94}
\definecolor{bluegreen}{RGB}{0,152,170}
\definecolor{red}{RGB}{172,26,64}
\definecolor{green}{RGB}{113,149,0}
\definecolor{yellow}{RGB}{245,207,71}
\definecolor{orange}{RGB}{235, 113, 37}

\definecolor{themecolor}{RGB}{0, 69, 124} % <- for Blue PhD theme, such at UI

\RequirePackage{hyperref}
\hypersetup{
	linktocpage,
    colorlinks,
    citecolor=black, % could be themecolor
    filecolor=black,
    linkcolor=black,
    urlcolor=black, % could be themecolor
    pdfauthor={\@author},
    pdftitle={\@title}   
}

\RequirePackage[centertags]{amsmath}
\RequirePackage{amssymb}

%\RequirePackage[numbers, comma, sort&compress]{natbib}
\RequirePackage[comma, sort&compress]{natbib}
\RequirePackage[small, md, sc]{titlesec}
\RequirePackage[tight,nice]{units}
\RequirePackage{verbatim}

\RequirePackage{url}
\RequirePackage[titles]{tocloft}
\setcounter{tocdepth}{2}
\setcounter{lofdepth}{2}
\setcounter{lotdepth}{2}
\renewcommand{\cftchapfont}{\normalsize \scshape}

\renewcommand\bibname{References}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}
% \raggedright % if you want mainmatter to be rightaligned 


\RequirePackage{pdfsync} %do pdf synchronization [andy]
\RequirePackage[closeFloats, noSeparatorLine]{packages/fltpage2} %use the custom modified fltpage package

\synctex=1 % turn synctex on automatically to sync between pdf viewer [andy]

%   list an entire bibliography entry inline. Useful for acknowledging when my paper was previously published
\RequirePackage{bibentry} 
\nobibliography*        

\RequirePackage{lettrine} % big letter at start of chapter
\newcommand{\FirstSentence}[2]{\lettrine[lines=2,slope=4pt,nindent=0pt,findent=0pt]{\textcolor{themecolor}{#1}}{#2}}

%showframe
\RequirePackage[margin=2.3cm,b5paper,includehead]{geometry} % showframe option good for draft mode
\RequirePackage[b5]{crop}

\RequirePackage{fancyhdr} 
\pagestyle{fancy} % options: empty , plain , fancy
\renewcommand{\headrulewidth}{0pt}
\lhead[\fancyplain{}{\thepage}]{\fancyplain{}{\rightmark}}
\rhead[\fancyplain{}{\leftmark}]{\fancyplain{}{\thepage}}
\cfoot{}
\setlength\headheight{14pt}

\newcommand{\HeaderQuote}[2]{ \begin{savequote}[75mm] #1 \qauthor{#2} \end{savequote}}

\RequirePackage[palatino]{quotchap} % for quotes at top of chapters
%\definecolor{chaptergrey}{rgb}{0.6,0,0} % color for the chapter numbers reddish 
\definecolor{chaptergrey}{RGB}{0,69,124} % color for the chapter numbers blueish 
\RequirePackage{titling}
\RequirePackage{setspace} 
\RequirePackage{booktabs} % for much better looking tables
\onehalfspacing
%\raggedright

\parindent 12pt
\RequirePackage{mathspec}

% use fonttype Arno Pro (a copy is located in subdirectory fonts/) instead of standard LaTeX fonts,
% Note that you may have to install them into your font directory. In a terminal type:
% cp fonts/* /usr/local/share/fonts/.
\setmathsfont(Digits,Latin,Greek)[Numbers={OldStyle,Proportional}]{Arno Pro}
\setmathrm{Arno Pro}

\RequirePackage{fontspec,xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text, Numbers=OldStyle}
%\setromanfont[Mapping=tex-text, 
%			  Numbers=OldStyle, 
%			  Ligatures={Common}, 
%			  SizeFeatures={%
%		          {Size={-10}, Font=* Caption},
%		          {Size={10-13.0}, Font=*},
%		          {Size={13.01-19.9}, Font=* Subhead, Ligatures=Rare, Contextuals={Swash,Alternate}},
%		       {Size={19.91-},Font=* Display, Ligatures=Rare, Contextuals={Swash,Alternate}}}]
%			  {Arno Pro} %
\setromanfont[Mapping=tex-text, Numbers=OldStyle, Ligatures={Common}]{Arno Pro}
%Set fonts for Mac Specific (Comment out on Windows XP)
%\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Helvetica Neue} 
%\setmonofont[Scale=MatchLowercase]{Consolas}

% gæti breytt leturgerðinni á myndum/töflum með því að taka út 'sf' hér fyrir neðan
\RequirePackage[labelfont={sf,bf,small}, textfont={sf,small}, justification=RaggedRight, margin=0pt, figurewithin=chapter, tablewithin=chapter]{caption} % gæti haft frekar figurewithin=section
%\renewcommand\thesubfigure{\Alph{subfigure}} %just for aesthetics use upper case for sub figures 
\usepackage[labelfont=bf,list=true]{subcaption}

\captionsetup[table]{position=top}
\captionsetup[subtable]{textfont=sf,aboveskip=3pt,belowskip=9pt}
\captionsetup[figure]{position=bottom}
\captionsetup[subfigure]{textfont=sf}


%Vertical layout of float pages : http://www.tex.ac.uk/cgi-bin/texfaq2html?label=floatpages+vertposfp
%By default, LaTeX vertically centres the floats on a float page; the present author is not alone in not liking this arrangement. Unfortunately, the control of the positioning is “buried” in LaTeX-internal commands, so some care is needed to change the layout.
\makeatletter
\setlength{\@fptop}{0pt}
\makeatother
%Surprisingly, you may find this setting leaves your floats too high on the page. One can justify a value of 5pt (in place of 0pt) — it’s roughly the difference between \topskip and the height of normal (10pt) text.
%Note that this is a “global” setting (best established in a class file, or at worst in the document preamble); making the change for a single float page is likely (at the least) to be rather tricky.



\usepackage{enumitem}

% some definitions
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\advisoraffiliation#1{\gdef\@advisoraffiliation{#1}}
\def\department#1{\gdef\@department{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitycountry#1{\gdef\@universitycountry{#1}}
\def\printer#1{\gdef\@printer{#1}}
\def\ISBN#1{\gdef\@ISBN{#1}}
\def\committeeA#1{\gdef\@committeeA{#1}}
\def\committeeaffiliationA#1{\gdef\@committeeaffiliationA{#1}}
\def\committeeB#1{\gdef\@committeeB{#1}}
\def\committeeaffiliationB#1{\gdef\@committeeaffiliationB{#1}}
\def\opponentA#1{\gdef\@opponentA{#1}}
\def\opponentaffiliationA#1{\gdef\@opponentaffiliationA{#1}}
\def\opponentB#1{\gdef\@opponentB{#1}}
\def\opponentaffiliationB#1{\gdef\@opponentaffiliationB{#1}}


\renewcommand{\maketitle}{ 

        \pagestyle{fancy}
	\pagenumbering{roman}
	\thispagestyle{empty}

	\vspace{12pt} \begin{center}
	\normalsize Dissertation for the degree of doctor of philosophy\\ \vspace{12pt}
	\Huge \textcolor{themecolor}{\sc{\@title}}  \\ \vspace{24pt}
	\Large \@author \\ 
        {\vspace*{\fill} { \includegraphics[width=0.5\columnwidth]{frontmatter/HI-logo_transparent2-black-EN} 
        \par} \vspace*{\fill}}

	\normalsize
	\@department\\
	\@faculty\\
        \@universitycity, \@degreemonth\ \@degreeyear
	\end{center} 

	\newpage \lhead{} \rhead{} 
	\cfoot{\thepage}
}

% You might also consider licensing your work under Creative Commons (NOTE: this is non-traditional, but a good idea). See: http://creativecommons.org/weblog/entry/12824 for other PhD students who release their work under creative commons.

\newcommand{\copyrightpage}{
	\newpage \thispagestyle{empty} 
	\noindent A dissertation presented to the \@university\ \@department\ in candidacy for the degree of doctor of philosophy.\\ 

	\vspace*{\fill}

	\noindent {\bf Doctoral committee} \\
	\noindent \@advisor\\
	\noindent \@advisoraffiliation \\
	\\
	\noindent \@committeeA\\
	\noindent \@committeeaffiliationA \\
	\\
	\noindent \@committeeB\\
	\noindent \@committeeaffiliationB \\

	\vspace*{\fill}

	\noindent{\bf Opponents} \\
	\noindent \@opponentA\\
	\noindent \@opponentaffiliationA\\
	\\
	\noindent \@opponentB \\
	\noindent \@opponentaffiliationB \\

	\vspace*{\fill} 

	\noindent \@title \\
	\noindent \copyright\ \@degreeyear\ \@author\\
	\noindent Printed in \@universitycountry\ by \@printer \\
	\noindent ISBN \@ISBN
	\newpage \rm
}

\newcommand{\abstractpage}{
	\chapter*{Abstract}
	\input{frontmatter/abstract}
	\cleardoublepage
	\chapter*{Ágrip}
	\input{frontmatter/abstract_is}
	\cleardoublepage
}

\newcommand{\dedicationpage}{
	\newpage \thispagestyle{empty} \vspace*{\fill}
	\noindent {\sc \input{frontmatter/dedication}}
	\vspace*{\fill} %\emptypage \newpage \rm
	\cleardoublepage
}

% the list of authors
\newcommand{\authorlist}{
	\newpage
	\thispagestyle{plain} 
	\chapter*{Author List}
	\noindent \input{frontmatter/authorlist}
	\newpage \rm
}

% the acknowledgments page
\newcommand{\acknowledgments}{
	\chapter*{Acknowledgments}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} 

	\cleardoublepage % setting up for the mainmatter
	\setcounter{page}{1}
	\pagenumbering{arabic}
	\normalsize
}
	
% An environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}}%
	
%Be more forgiving, and stretch word spacing out more so that words don't run out into the margins..
%\emergencystretch=1.5em
